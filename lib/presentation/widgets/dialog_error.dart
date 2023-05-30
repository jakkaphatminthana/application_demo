import 'package:application_demo/resources/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogErrorOT extends StatelessWidget {
  const DialogErrorOT({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 324,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              //TODO 1: Icon Alert
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF6F8F9),
                ),
                child: Center(
                  child: SvgPicture.asset('assets/svg/errorTime.svg'),
                ),
              ),
              const SizedBox(height: 16),

              FittedBox(child: Text('จำนวนชั่วโมงน้อยกว่ากำหนด', style: textH2Medium)),
              const SizedBox(height: 8),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  'ไม่สามารถขอค่าล่วงเวลาได้เนื่องจากมี จำนวนชั่วโมงน้อยกว่า 30 นาที',
                  style: textDescription1,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 52),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  'ตกลง',
                  style: textButton(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
