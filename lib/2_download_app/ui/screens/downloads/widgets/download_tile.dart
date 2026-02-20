import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final res = controller.ressource;
        final percent = (controller.progress * 100).toStringAsFixed(2);
        final downloadedMb = controller.downloadedSizeMb;

        // Decide subtitle and trailing based on status
        String? subtitle;
        Widget trailing;

        switch (controller.status) {
          case DownloadStatus.notDownloaded:
            subtitle = null;
            trailing = IconButton(
              onPressed: controller.startDownload,
              icon: const Icon(Icons.download_sharp),
            );
            break;

          case DownloadStatus.downloading:
            subtitle = '$percent% completed - $downloadedMb of ${res.size} MB';
            trailing = const Icon(Icons.downloading);
            break;

          case DownloadStatus.downloaded:
            subtitle = '100% completed - ${res.size} of ${res.size} MB';
            trailing = const Icon(Icons.folder);
            break;
        }

        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(res.name),
            subtitle: subtitle == null ? null : Text(subtitle),
            trailing: trailing,
          ),
        );
      },
    );

    // TODO
  }
}
