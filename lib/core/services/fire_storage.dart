import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';import 'package:path/path.dart' as b;

import 'stoarage_service.dart';

class FireStorage implements StoarageService {
  final stoargeReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var fileReference =
        stoargeReference.child('$path/$fileName.$extensionName');
    await fileReference.putFile(file);
    var fileUrl = fileReference.getDownloadURL();
    return fileUrl;
  }
}
