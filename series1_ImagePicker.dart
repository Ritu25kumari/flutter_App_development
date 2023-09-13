import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerApp extends StatefulWidget{
  @override
  _ImagePickerAppState createState()=> _ImagePickerAppState();
}
class _ImagePickerAppState extends State<ImagePickerApp> {

  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null){
      final croppedImage = await ImageCropper().cropImage(
          sourcePath: image!.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
            CropAspectRatioPreset.ratio7x5
          ],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Theme.of(context).colorScheme.primary,
                toolbarWidgetColor: Theme.of(context).colorScheme.onPrimary,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
                cropFrameColor: Theme.of(context).colorScheme.primary,
                cropGridColor: Colors.red,
                showCropGrid: false
            ),
          ]
      );

      if (croppedImage != null) {
        final imageTemporary = File(image.path);
        setState(() {
          _image = File(croppedImage.path);
          _image = imageTemporary;
        });
      }
    }
      return;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Image Picker&Cropper',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
          child: Column(children: [
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                  height: 300,
                  width: 300,
                  child: _image != null ? Image.file(
                    _image!, width: 250, height: 250, fit: BoxFit.cover,) :
                  Image.network(
                      'https://www.technogrips.com/laravel_code/public/blogimages/1585603242.png')),
            ),
            SizedBox(width: 10,),
            CustomButton(
                title: 'Select From Camera',
                icon: Icons.camera_alt_outlined,
                onClick: () {
                  getImage(ImageSource.camera);
                }
            ),
            SizedBox(width: 10,),
            CustomButton(
                title: 'Select From Gallery',
                icon: Icons.image_outlined,
                onClick: () {
                  getImage(ImageSource.gallery);
                }
            ),
          ],)
      ),
    );
  }

  Widget CustomButton({
    required String title,
    required IconData icon,
    required VoidCallback onClick,
  }) {
    return Container(
      width: 300,
      child: ElevatedButton(child: Row(children: [
        Icon(icon),
        SizedBox(width: 10,),
        Text(title),

      ],),
          onPressed: onClick
      ),
    );
  }
}

