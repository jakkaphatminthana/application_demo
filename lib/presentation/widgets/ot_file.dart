import 'package:application_demo/data/models/file_model.dart';
import 'package:application_demo/domain/ot_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/font.dart';
import '../../utils/file_size.dart';

class FileSelected extends ConsumerWidget {
  const FileSelected({
    super.key,
    required this.file,
  });

  final FileDocument file;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFDEDEDE),
          width: 1,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 8, 16, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO : Icon Document
            SvgPicture.asset(
              'assets/svg/document.svg',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),

            //TODO : Name file
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(file.name, style: textTitleMedium),
                  Text(getFileSize(file.size), style: textBody2),
                ],
              ),
            ),
            //TODO : Cancle File
            IconButton(
              onPressed: () {
                ref.read(filePickProvider.notifier).state = null;
              },
              icon: const Icon(
                Icons.cancel_rounded,
                color: Color(0xFFFD6262),
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
