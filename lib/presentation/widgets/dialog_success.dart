import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final VoidCallback onPressed;

  const SuccessDialog({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('บันทึกสำเร็จ'),
      content: const Text('การบันทึกข้อมูลเสร็จสมบูรณ์'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPressed();
          },
          child: const Text('ยืนยัน'),
        ),
      ],
    );
  }
}
