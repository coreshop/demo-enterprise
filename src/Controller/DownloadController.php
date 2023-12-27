<?php

declare(strict_types=1);

/*
 * CoreShop GmbH
 *
 * This software is available under the CoreShop Commercial License (CCL).
 *
 * @copyright  Copyright (c) CoreShop GmbH (https://www.coreshop.org)
 * @license    https://www.coreshop.org/license CCL
 */

namespace App\Controller;

use CoreShop\Bundle\BatchMessengerBundle\Creator\ZipAssetJobCreator;
use CoreShop\Bundle\BatchMessengerBundle\Model\BatchStatus;
use CoreShop\Bundle\BatchMessengerBundle\Model\TaskInterface;
use CoreShop\Bundle\BatchMessengerBundle\Model\TaskItemInterface;
use CoreShop\Bundle\BatchMessengerBundle\Task\ZipAssetItemTask;
use CoreShop\Component\Resource\Repository\RepositoryInterface;
use League\Flysystem\FilesystemOperator;
use Pimcore\Controller\FrontendController;
use Pimcore\Model\Asset;
use Symfony\Component\HttpFoundation\HeaderUtils;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Translation\TranslatorInterface;

class DownloadController extends FrontendController
{
    public function __construct(
        protected TranslatorInterface $translator,
        protected RepositoryInterface $batchTaskRepository,
        protected FilesystemOperator $batchZipStorage,
    ) {
    }

    /**
     * Prepare mass download as zip archive.
     *
     * @Route("/{_locale}/batch-messenger", name="batch_messenger_mass_downloader", methods={"GET"})
     */
    public function downloadsAction()
    {
        $images = new Asset\Listing();
        $images->setCondition('type = "image"');

        $json = array_map(static fn(Asset $asset) => [
            'id' => $asset->getId(),
            'quality' => 'original',
        ], $images->getAssets());

        return $this->renderTemplate('batch_messenger/download.html.twig', [
            'files' => $json
        ]);
    }

    /**
     * Prepare mass download as zip archive.
     *
     * @Route("/api/prepare_download", name="coreshop_batch_messenger_prepare_download", methods={"GET"})
     */
    public function prepareMassDownloadAction(
        Request $request,
        ZipAssetJobCreator $zipAssetJobCreator,
    ): Response {
        $items = json_decode($request->get('items', ''), true);
        $allowedQualities = ['low', 'medium', 'original'];

        if (!$items) {
            throw new NotFoundHttpException('No downloadable items given');
        }

        $files = [];
        $assetCache = [];

        foreach ($items as $item) {
            if (array_key_exists($item['id'], $assetCache)) {
                $asset = $assetCache[$item['id']];
            } else {
                $asset = Asset::getById($item['id']);

                if (!$asset) {
                    continue;
                }

                $assetCache[$item['id']] = $asset;
            }

            if (!$asset instanceof Asset) {
                continue;
            }

            $quality = in_array($item['quality'], $allowedQualities, true) ? $item['quality'] : 'original';

            if ($asset instanceof Asset\Image && 'original' !== $quality) {
                $files[] = new ZipAssetItemTask(
                    $asset->getId(),
                    sprintf('asset_%s', $quality),
                    sprintf('%s/%s', $quality, $asset->getFilename()),
                );
            } else {
                $files[] = new ZipAssetItemTask(
                    $asset->getId(),
                    null,
                    sprintf('%s/%s', $quality, $asset->getFilename()),
                );
            }
        }

        $task = $zipAssetJobCreator->createTask(
            1,
            true,
            ...$files,
        );

        return $this->json([
            'success' => true,
            'task' => $task->getId(),
        ]);
    }

    /**
     * Check status of mass download task.
     *
     * @Route("/api/check_download", name="coreshop_batch_messenger_check_download", methods={"GET"})
     */
    public function checkMassDownloadAction(
        Request $request,
    ): Response {
        $taskId = $request->get('task');

        if (!$taskId) {
            throw new NotFoundHttpException('No task id given');
        }

        /**
         * @var TaskInterface $task
         */
        $task = $this->batchTaskRepository->find($taskId);

        if (!$task instanceof TaskInterface) {
            throw new NotFoundHttpException(sprintf('The task with id "%s" has not been found', $taskId));
        }

        $finishedItems = count(
            array_filter($task->getTaskItems(), static function (TaskItemInterface $taskItem) {
                return BatchStatus::FINISHED === $taskItem->getStatus();
            }),
        );

        return $this->json([
            'success' => true,
            'status' => $task->getStatus(),
            'progress' => $finishedItems / count($task->getTaskItems()),
        ]);
    }

    /**
     * Download zip.
     *
     * @Route("/api/download", name="coreshop_batch_messenger_download", methods={"GET"})
     */
    public function massDownloadAction(
        Request $request,
    ): Response {
        $taskId = $request->get('task');

        if (!$taskId) {
            throw new NotFoundHttpException('No task id given');
        }

        /**
         * @var TaskInterface $task
         */
        $task = $this->batchTaskRepository->find($taskId);

        if (!$task instanceof TaskInterface) {
            throw new NotFoundHttpException(sprintf('The task with id "%s" has not been found', $taskId));
        }

        $fileName = $task->getTaskDataEntry(ZipAssetItemTask::CONTEXT_ZIP_FILE_NAME);

        try {
            $fileStream = $this->batchZipStorage->readStream($fileName);
        } catch (\Exception $e) {
            throw new NotFoundHttpException('The file could not be downloaded');
        }

        $disposition = HeaderUtils::makeDisposition(
            HeaderUtils::DISPOSITION_ATTACHMENT,
            sprintf('%s.zip', uniqid('download-', true)),
        );

        return new StreamedResponse(
            static function () use ($fileStream) {
                fpassthru($fileStream);
            },
            Response::HTTP_OK,
            [
                'Content-Transfer-Encoding',
                'binary',
                'Content-Type' => 'application/x-zip',
                'Content-Disposition' => $disposition,
                'Content-Length' => fstat($fileStream)['size'],
            ],
        );
    }
}
