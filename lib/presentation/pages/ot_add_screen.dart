import 'dart:developer';
import 'dart:io';

import 'package:application_demo/data/models/file_model.dart';
import 'package:application_demo/domain/ot_form_provider.dart';
import 'package:application_demo/presentation/pages/nextpage.dart';
import 'package:application_demo/presentation/widgets/dialog_error.dart';
import 'package:application_demo/presentation/widgets/dialog_success.dart';
import 'package:application_demo/presentation/widgets/ot_file.dart';
import 'package:application_demo/presentation/widgets/ot_pick_date.dart';
import 'package:application_demo/presentation/widgets/ot_pick_time.dart';
import 'package:application_demo/presentation/widgets/show_data_dummy.dart';
import 'package:application_demo/resources/font.dart';
import 'package:application_demo/utils/time_calculate.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class AddOtScreen extends ConsumerStatefulWidget {
  const AddOtScreen({super.key});

  @override
  ConsumerState<AddOtScreen> createState() => _AddOtScreenState();
}

class _AddOtScreenState extends ConsumerState<AddOtScreen> {
  final _descriptionController = TextEditingController();
  late List<File> _selectedImages;

  //TODO 1.1: Function Pick Images
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

  //TODO 1.2 Fuction Remove Image
  void _removeImage({required int index}) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  //TODO 2: Function Select File
  void _onSelectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result == null) return;

    PlatformFile file = result.files.first;
    final fileSize = double.parse('${file.size}');

    //update value
    ref.read(filePickProvider.notifier).state =
        FileDocument(name: file.name, size: fileSize, pathFile: file.path!);
  }

  //TODO 3: Function Check Time Difference
  bool _checkTimeDifference({
    required DateTime startDate,
    required DateTime endDate,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
  }) {
    final datetimeEnd = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      endTime.hour,
      endTime.minute,
    );

    final datetimeStart = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      startDate.hour,
      startTime.minute,
    );

    //ถ้าเวลาต่ำกว่า 30 นาที
    Duration duration = datetimeEnd.difference(datetimeStart);
    if (duration >= const Duration(minutes: 30)) {
      return false;
    } else {
      return true;
    }
  }

  //TODO 4: Function Submit Form
  void _onSubmit() {
    final _filePick = ref.read(filePickProvider);
    final otForm = ref.read(otFormProvider);

    bool checkTime = _checkTimeDifference(
      startDate: otForm.startDate!,
      endDate: otForm.endDate!,
      startTime: otForm.startTime!,
      endTime: otForm.endTime!,
    );
    //TODO 4.1: Check IsEmpty
    if (_descriptionController.text.isEmpty ||
        _selectedImages.isEmpty ||
        _filePick == null) {
      Fluttertoast.showToast(
        msg: 'โปรดกรอกข้อมูลให้ครบถ้วน',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      //TODO 4.2: Check Time Difference
    } else if (checkTime) {
      showDialog(
        context: context,
        builder: (BuildContext conntext) => const OTDialogError(),
      );
    } else {
      //Add New data
      final newData = ref.read(otFormProvider).copyWith(
            description: _descriptionController.text,
            images: _selectedImages,
            file: _filePick,
          );
      ref.read(otFormNotifierProvider.notifier).addData(newData);

      //Dialog Successful
      showDialog(
        context: context,
        builder: (BuildContext context) => OTSuccessDialog(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const NextPageScreen(),
              ),
            );
          },
        ),
      );
    }
  }

  //----------------------------------------------------------------------------------------------------------------------------

  //TODO 1.1: Widget select Image
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

  //TODO 1.2: Widget Image
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

  @override
  void initState() {
    super.initState();
    _selectedImages = [];
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  //==========================================================================================================================
  @override
  Widget build(BuildContext context) {
    final filePick = ref.watch(filePickProvider);
    final otForm = ref.watch(otFormProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("ยื่นขอ OT", style: textAppbar),
          //Watch Data Provider
          actions: const [ShowDataDummy()],
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
                    PickerDate(
                      icon: Icons.calendar_today_outlined,
                      title: 'วันที่เริ่มต้น',
                      dateValue: otForm.startDate ?? DateTime.now(),
                      firstDay: DateTime(DateTime.now().year),
                      onSelect: (pickedDate) {
                        ref.read(otFormProvider.notifier).state = ref
                            .read(otFormProvider.notifier)
                            .state
                            .copyWith(startDate: pickedDate);
                      },
                    ),

                    //TODO 1.2: Start TimePick
                    PickerTime(
                      icon: Icons.access_time_outlined,
                      title: 'เวลาเริ่มต้น',
                      timeValue: otForm.startTime ?? TimeOfDay.now(),
                      onSelect: (pickedTime) {
                        ref.read(otFormProvider.notifier).state = ref
                            .read(otFormProvider.notifier)
                            .state
                            .copyWith(startTime: pickedTime);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // //TODO 2.1: End DatePick
                    PickerDate(
                      icon: Icons.calendar_today_outlined,
                      title: 'วันที่สิ้นสุด',
                      dateValue: otForm.endDate ?? DateTime.now(),
                      firstDay: otForm.startDate ?? DateTime.now(),
                      onSelect: (pickedDate) {
                        ref.read(otFormProvider.notifier).state = ref
                            .read(otFormProvider.notifier)
                            .state
                            .copyWith(endDate: pickedDate);
                      },
                    ),

                    // //TODO 2.2: End TimePick
                    PickerTime(
                      icon: Icons.access_time_outlined,
                      title: 'เวลาสิ้นสุด',
                      timeValue: otForm.endTime ?? TimeOfDay.now(),
                      onSelect: (pickedTime) {
                        ref.read(otFormProvider.notifier).state = ref
                            .read(otFormProvider.notifier)
                            .state
                            .copyWith(endTime: pickedTime);
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
                            horizontal: 8,
                            vertical: 1,
                          ),
                          child: selectedImage(
                            imageFile: _selectedImages[index],
                            index: index,
                          ),
                        );
                        //กรณียังไม่ได้เลือกรูปภาพ
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 1,
                          ),
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
                (filePick == null)
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
                    : FileSelected(file: filePick),
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
                        startDate: otForm.startDate!,
                        endDate: otForm.endDate!,
                        startTime: otForm.startTime!,
                        endTime: otForm.endTime!,
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
