
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class SubirFoto{

  Future<String> tomarFoto(name) async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    final StorageReference ref = FirebaseStorage.instance.ref().child('${user.email}/${name}_profilePicture.jpg');
    final StorageUploadTask uploadTask = ref.putFile(image);
    final String downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> galeryFoto(name) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    final StorageReference ref = FirebaseStorage.instance.ref().child('${user.email}/${name}_profilePicture.jpg');
    final StorageUploadTask uploadTask = ref.putFile(image);
    final String downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    return downloadUrl;
  }
}