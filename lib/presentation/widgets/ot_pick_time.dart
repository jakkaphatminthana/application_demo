import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../resources/font.dart';

class PickerTime extends ConsumerStatefulWidget {
  const PickerTime({
    super.key,
    required this.icon,
    required this.title,
    required this.timeValue,
    required this.onSelect,
  });

  final IconData icon;
  final String title;
  final TimeOfDay timeValue;
  final ValueSetter<TimeOfDay> onSelect;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PickerDateState();
}

class _PickerDateState extends ConsumerState<PickerTime> {
  //TODO : Function Time Picker
  void _presentTimePicker({
    required TimeOfDay starterTime,
    required ValueSetter<TimeOfDay> onSelect,
  }) {
    showTimePicker(
      context: context,
      initialTime: starterTime,
      builder: (context, childWidget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: childWidget!,
        );
      },
    ).then((pickerTime) {
      if (pickerTime == null) return;
      onSelect(pickerTime); //อัปเดตค่า
    });
  }

//===========================================================================================================================
  @override
  Widget build(BuildContext context) {
    final hour = widget.timeValue.hour.toString().padLeft(2, '0');
    final minute = widget.timeValue.minute.toString().padLeft(2, '0');

    return GestureDetector(
      onTap: () => _presentTimePicker(
        starterTime: widget.timeValue,
        onSelect: widget.onSelect,
      ),
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

            //TODO : Continer Pick
            Container(
              width: MediaQuery.of(context).size.width,
              height: 52,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
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
                  Expanded(
                    child: Text(
                      '$hour:$minute',
                      style: textBodyMedium,
                    ),
                  ),
                  Icon(
                    widget.icon,
                    color: const Color(0xFF8B8E95),
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
