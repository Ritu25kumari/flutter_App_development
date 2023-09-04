import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImagePickerApp extends StatefulWidget{
  @override
  _ImagePickerAppState createState()=> _ImagePickerAppState();
}
class _ImagePickerAppState extends State<ImagePickerApp> {

  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null)
      return;

    final imageTemporary = File(image.path);

    setState(() {
      _image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Image Picker')),
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

