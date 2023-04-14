import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class HelperRepository {
  final FirebaseStorage _firebaseStorage;

  HelperRepository({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  Future<List<String>> uploadFiles() async {
    List<File>? images = await selectedFile();
    var imageUrls =
        await Future.wait(images!.map((image) => uploadFile(image)));
    print(imageUrls);
    return imageUrls;
  }

  Future<String> uploadFile(File _image) async {
    Reference storageReference =
        _firebaseStorage.ref().child('files/images/${_image.path}');
    var task = await storageReference.putFile(_image);
    String downloadUrl = await task.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadImage({
    required XFile pickedFile,
    required String oldFileUrl,
  }) async {
    try {
      String storagePath = "files/images/${pickedFile.name}";
      var ref = _firebaseStorage.ref().child(storagePath);
      var task = await ref.putFile(File(pickedFile.path));
      String downloadUrl = await task.ref.getDownloadURL();

      if (oldFileUrl.isNotEmpty) {
        await FirebaseStorage.instance.refFromURL(oldFileUrl).delete();
      }

      return downloadUrl;
    } on FirebaseException catch (error) {
      print(error);
      throw Exception();
    }
  }

  Future<bool> deleteImage({required String cvUrl}) async {
    try {
      String storagePath = "files/image/$cvUrl";
      _firebaseStorage.ref().child(storagePath).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<File>?> selectedFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      return null;
    }
  }
}

/*
Future<String> uploadImages(
      PlatformFile pickedFile,
      ) async {
    try {
      String storagePath = "files/image/${pickedFile.name}";
      var ref = FirebaseStorage.instance.ref().child(storagePath);
      var task = await ref.putFile(File(pickedFile.path!));
      String downloadUrl = await task.ref.getDownloadURL();
      return downloadUrl;
    } catch (error) {
      throw Exception();
    }
  }
 */
