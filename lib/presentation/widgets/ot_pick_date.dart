import 'package:application_demo/domain/ot_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../resources/font.dart';

class PickerDate extends ConsumerStatefulWidget {
  const PickerDate({
    super.key,
    required this.icon,
    required this.title,
    required this.dateValue,
    required this.onSelect,
    required this.firstDay,
  });

  final IconData icon;
  final String title;
  final DateTime dateValue;
  final ValueSetter<DateTime> onSelect;
  final DateTime firstDay;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PickerDateState();
}

class _PickerDateState extends ConsumerState<PickerDate> {
  //TODO 1: Format date
  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  //TODO 2: Function Date Picker
  void _presentDatePicker({
    required ValueSetter<DateTime> onSelect,
    required DateTime firstDate,
  }) {
    //เลือกวันที่ได้ไม่เกินกี่วัน (3 วัน)
    DateTime lastDate = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 2);

    //เลือกวันที่ (เฉพาะปี 2023, ไม่เกินวันนี้)
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    ).then((pickerDate) {
      if (pickerDate == null) return;
      onSelect(pickerDate); //อัปเดตค่า
    });
  }

//====================================================================================================================================
  @override
  Widget build(BuildContext context) {
    String formattedDate = formatDateTime(widget.dateValue);

    return GestureDetector(
      onTap: () => _presentDatePicker(firstDate: widget.firstDay, onSelect: widget.onSelect),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 82,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TODO : Title
            Text(widget.title, style: textTitleSmall),
            const SizedBox(height: 8),

            //TODO : Container Pick
            Container(
              width: MediaQuery.of(context).size.width,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  width: 1,
                  color: const Color(0xFFDEDEDE),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(formattedDate, style: textBodyMedium),
                  Icon(widget.icon, color: const Color(0xFF8B8E95), size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
