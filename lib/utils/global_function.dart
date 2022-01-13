




import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

Future<FilePickerResult?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowedExtensions: ['pdf', 'docx', 'png', 'jpg'],
  );
  return result;
}