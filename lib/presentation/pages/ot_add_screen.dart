import 'dart:io';

import 'package:application_demo/data/models/data_model.dart';
import 'package:application_demo/data/models/file_model.dart';
import 'package:application_demo/domain/data_provider.dart';
import 'package:application_demo/presentation/widgets/dialog_success.dart';
import 'package:application_demo/resources/font.dart';
import 'package:application_demo/utils/file_size.dart';
import 'package:application_demo/utils/time_calculate.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class AddOtScreen extends ConsumerStatefulWidget {
  const AddOtScreen({super.key});

  @override
  ConsumerState<AddOtScreen> createState() => _AddOtScreenState();
}

class _AddOtScreenState extends ConsumerState<AddOtScreen> {
  late DateTime _startDate;
  late DateTime _endDate;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  final _descriptionController = TextEditingController();
  late List<File> _selectedImages;
  FileDocument? _filePicked;

  //Format date
  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  //TODO 1: Function Date Picker
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

  //TODO 2: Function Time Picker
  void _presentTimePicker({
    required TimeOfDay starterTime,
    required ValueSetter<TimeOfDay> onSelect,
  }) {
    showTimePicker(
      context: context,
      initialTime: starterTime,
    ).then((pickerTime) {
      if (pickerTime == null) return;
      onSelect(pickerTime); //อัปเดตค่า
    });
  }

  //TODO 3.1: Pick Images
  void _pickImage() async {
    List<XFile>? resultList = [];
    try {
      resultList = await ImagePicker().pickMultiImage();
    } catch (e) {
      throw Exception('ImagePicker Error: $e');
    }

    //Save file to List
    List<File> files = resultList.map((image) => File(image.path)).toList();
    for (final file in files) {
      setState(() {
        _selectedImages.add(file);
      });
    }
  }

  //TODO 3.2 Remove Image
  void _removeImage({required int index}) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  //TODO 4: Function Select File
  void _onSelectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result == null) return;

    PlatformFile file = result.files.first;
    final fileSize = double.parse('${file.size}');

    setState(() {
      _filePicked = FileDocument(
        name: file.name,
        size: fileSize,
        file: file,
      );
    });
  }

  //TODO 5: Check Time Difference
  bool _checkTimeEnd({
    required TimeOfDay pickedTime,
    required bool isStartTime,
  }) {
    final datetimeEnd = DateTime(
      _endDate.year,
      _endDate.month,
      _endDate.day,
      (isStartTime) ? _endTime.hour : pickedTime.hour,
      (isStartTime) ? _endTime.minute : pickedTime.minute,
    );

    final datetimeStart = DateTime(
      _startDate.year,
      _startDate.month,
      _startDate.day,
      (isStartTime) ? pickedTime.hour : _startTime.hour,
      (isStartTime) ? pickedTime.minute : _startTime.minute,
    );
    Duration duration = datetimeEnd.difference(datetimeStart);
    if (duration > Duration.zero) {
      return true;
    } else {
      Fluttertoast.showToast(
        msg: 'โปรดเลือกเวลาให้ถูกต้อง',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    }
  }

  //TODO 6: Function Submit Form
  void _onSubmit() {
    if (_descriptionController.text.isEmpty ||
        _selectedImages.isEmpty ||
        _filePicked == null) {
      Fluttertoast.showToast(
        msg: 'โปรดกรอกข้อมูลให้ครบถ้วน',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      print('_startDate: $_startDate');
      print('_endDate: $_endDate');
      print('_startTime: $_startTime');
      print('_endTime: $_endTime');
      print('description: ${_descriptionController.text}');
      print('_selectedImages: $_selectedImages');
      print('_filePicked: ${_filePicked!.file}');

      //add data
      ref.read(dataProvider.notifier).addState(DataModel(
            startDate: _startDate,
            endDate: _endDate,
            startTime: _startTime,
            endTime: _endTime,
            description: _descriptionController.text,
            images: _selectedImages,
            file: _filePicked!,
          ));

      //Dialog rePage
      showDialog(
        context: context,
        builder: (BuildContext context) => SuccessDialog(
          onRefreshPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AddOtScreen()),
            );
          },
        ),
      );
    }
  }

  //----------------------------------------------------------------------------------------------------------------------------

  //TODO 1: Widget Select Calendar
  Widget selectDate({
    required IconData icon,
    required String title,
    required DateTime dateValue,
    required ValueSetter<DateTime> onSelect,
    required DateTime firstDay,
  }) {
    String formattedDate = formatDateTime(dateValue);

    return GestureDetector(
      onTap: () => _presentDatePicker(firstDate: firstDay, onSelect: onSelect),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 82,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: textTitleSmall),
            const SizedBox(height: 8),
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
                  Icon(icon, color: const Color(0xFF8B8E95), size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //TODO 2: Widget Select Time
  Widget selectTime({
    required IconData icon,
    required String title,
    required TimeOfDay timeValue,
    required ValueSetter<TimeOfDay> onSelect,
  }) {
    final hour = timeValue.hour.toString().padLeft(2, '0');
    final minute = timeValue.minute.toString().padLeft(2, '0');

    return GestureDetector(
      onTap: () => _presentTimePicker(
        starterTime: timeValue,
        onSelect: onSelect,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 82,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: textTitleSmall),
            const SizedBox(height: 8),
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
                    icon,
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

  //TODO 3.1: Widget select Image
  Widget selectImage() {
    return GestureDetector(
      onTap: () => _pickImage(),
      child: DottedBorder(
        color: const Color(0xFFDEDEDE),
        strokeWidth: 1,
        dashPattern: const [3, 3],
        borderType: BorderType.RRect,
        radius: const Radius.circular(14),
        child: SizedBox(
          width: 106,
          height: 106,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_outlined,
                color: Theme.of(context).primaryColor,
                size: 26,
              ),
              const SizedBox(height: 8),
              Text('เพิ่มรูป', style: textDescription2),
            ],
          ),
        ),
      ),
    );
  }

  //TODO 3.2: Widget Image
  Widget selectedImage({required File imageFile, required int index}) {
    return Container(
      width: 106,
      height: 106,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          //Image
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
              width: 106,
              height: 106,
            ),
          ),

          //Close Icon
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => _removeImage(index: index),
              icon: const Icon(
                Icons.cancel_rounded,
                color: Color(0xFFFD6262),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //TODO 4: Widget selected file
  Widget selectedFile({
    required FileDocument file,
  }) {
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
        padding: const EdgeInsets.fromLTRB(24, 0, 16, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Icon Document
            SvgPicture.asset(
              'assets/svg/document.svg',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),

            //Title file
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
            //Icon Cancle File
            IconButton(
              onPressed: () {},
              icon: IconButton(
                onPressed: () {
                  setState(() {
                    _filePicked = null;
                  });
                },
                icon: const Icon(
                  Icons.cancel_rounded,
                  color: Color(0xFFFD6262),
                  size: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _endDate = DateTime.now();
    _startTime = TimeOfDay.now();
    _endTime = TimeOfDay(
      hour: TimeOfDay.now().hour + 1,
      minute: TimeOfDay.now().minute,
    );
    _selectedImages = [];
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  //==========================================================================================================================
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("ยื่นขอ OT", style: textAppbar),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TODO 1.1: Start DatePick
                    selectDate(
                      icon: Icons.calendar_today_outlined,
                      title: 'วันที่เริ่มต้น',
                      firstDay: DateTime(DateTime.now().year),
                      dateValue: _startDate,
                      onSelect: (pickedDate) {
                        setState(() {
                          _startDate = pickedDate;
                        });
                      },
                    ),

                    //TODO 1.2: Start TimePick
                    selectTime(
                      icon: Icons.access_time_outlined,
                      title: 'เวลาเริ่มต้น',
                      timeValue: _startTime,
                      onSelect: (pickedTime) {
                        bool check = _checkTimeEnd(
                            pickedTime: pickedTime, isStartTime: true);
                        if (check) {
                          setState(() {
                            _startTime = pickedTime;
                          });
                        }
                        return;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TODO 2.1: End DatePick
                    selectDate(
                      icon: Icons.calendar_today_outlined,
                      title: 'วันที่สิ้นสุด',
                      firstDay: DateTime.now(),
                      dateValue: _endDate,
                      onSelect: (pickedDate) {
                        setState(() {
                          _endDate = pickedDate;
                        });
                      },
                    ),

                    //TODO 2.2: End TimePick
                    selectTime(
                      icon: Icons.access_time_outlined,
                      title: 'เวลาสิ้นสุด',
                      timeValue: _endTime,
                      onSelect: (pickedTime) {
                        bool check = _checkTimeEnd(
                          pickedTime: pickedTime,
                          isStartTime: false,
                        );
                        if (check) {
                          setState(() {
                            _endTime = pickedTime;
                          });
                          return;
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                //TODO 3: Description
                Text('เหตุผลการทำ OT', style: textTitleSmall),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFDEDEDE)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: 'กรอกคำอธิบาย',
                      hintStyle: textTitleSmall,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                //TODO 4: Image Picker
                Text('รูปภาพ', style: textTitleSmall),
                const SizedBox(height: 8),

                Container(
                  width: double.infinity,
                  height: 106,
                  padding: const EdgeInsets.all(2),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    //เมื่อเพิ่มรูปจนถึง 3 รูป = + 1 len
                    itemCount: (_selectedImages.length < 3)
                        ? 3
                        : (_selectedImages.length >= 3)
                            ? _selectedImages.length + 1
                            : _selectedImages.length,
                    itemBuilder: (context, index) {
                      //กรณีที่เลือกรูปภาพ
                      if (index < _selectedImages.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 1),
                          child: selectedImage(
                            imageFile: _selectedImages[index],
                            index: index,
                          ),
                        );
                        //กรณียังไม่ได้เลือกรูปภาพ
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 1),
                          child: selectImage(),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),

                //TODO 5: File Picker
                Text('ไฟล์แนบ', style: textTitleSmall),
                const SizedBox(height: 8),
                (_filePicked == null)
                    ? OutlinedButton.icon(
                        onPressed: () => _onSelectFile(),
                        icon: SvgPicture.asset(
                          'assets/svg/upload.svg',
                          color: Theme.of(context).primaryColor,
                          width: 20,
                          height: 20,
                        ),
                        label: Text(
                          "อัปโหลดไฟล์",
                          style:
                              textButton(color: Theme.of(context).primaryColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 52),
                          side: BorderSide(
                            width: 1,
                            color: Theme.of(context).primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      )
                    : selectedFile(file: _filePicked!),
                const SizedBox(height: 16),

                //TODO 6: Calculate time
                Text('จำนวนชั่วโมงค่าล่วงเวลา', style: textTitleSmall),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F8F9),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      calculateDuration(
                        startDate: _startDate,
                        endDate: _endDate,
                        startTime: _startTime,
                        endTime: _endTime,
                      ),
                      style: textButton(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                //TODO 7: Button Submit
                ElevatedButton(
                  onPressed: () => _onSubmit(),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 52),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'ยื่นคำขอ',
                    style: textButton(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
