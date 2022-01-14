




import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';


class getFile{
  Future<File> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['png', 'jpg'],
    );
    File file = File(result!.files.single.path ?? "");
    return file;
  }
}