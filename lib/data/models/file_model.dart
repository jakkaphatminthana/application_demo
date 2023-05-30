import 'package:file_picker/file_picker.dart';

class FileDocument {
  String name;
  double size;
  PlatformFile file;

  FileDocument({
    required this.name,
    required this.size,
    required this.file,
  });
}
