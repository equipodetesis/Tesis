
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SubirFoto{

  Future<String> tomarFoto(name,context) async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Cambiando Foto"),
            content:Container(
                height: 250,
                width: 500,
                child: Center(child: CircularProgressIndicator(),)),
          );
        }
    );
    final StorageReference ref = FirebaseStorage.instance.ref().child('${user.email}/${name}_profilePicture.jpg');
    final StorageUploadTask uploadTask = ref.putFile(image);
    final String downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL().then((onValue){
      Navigator.pop(context);
      return onValue;
    });
    return downloadUrl;
  }
  Future<String> galeryFoto(name,context) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Cambiando Foto"),
            content:Container(
                height: 250,
                width: 500,
                child: Center(child: CircularProgressIndicator(),)),
          );
        }
    );
    final StorageReference ref = FirebaseStorage.instance.ref().child('${user.email}/${name}_profilePicture.jpg');
    final StorageUploadTask uploadTask = ref.putFile(image);
    final String downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL().then((onValue){
      Navigator.pop(context);
      return onValue;
    });
    return downloadUrl;
  }
}