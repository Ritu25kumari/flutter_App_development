import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageSelectionScreen extends StatefulWidget {
  @override
  _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
}

class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
  List<SelectedImage> selectedImages = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Choose from Gallery'),
                    onTap: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        _handleSelectedImage(
                          File(image.path),
                          titleController.text,
                          descriptionController.text,
                        );
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(labelText: 'Description'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleSelectedImage(
      File imageFile, String title, String description) {
    if (title.isEmpty || description.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
                'Please fill in both title and description before selecting an image.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        selectedImages.add(
          SelectedImage(
            imageFile: imageFile,
            title: title,
            description: description,
          ),
        );
      });
      titleController.clear();
      descriptionController.clear();
    }
  }

  void _toggleLikeState(SelectedImage image) {
    setState(() {
      image.isLiked = !image.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Selection'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showImagePickerBottomSheet(context);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: selectedImages.map((image) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3 - 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12.0)),
                          child: Image.file(
                            image.imageFile,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 100.0,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            image.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: image.isLiked ? Colors.deepPurple[600] : null,
                          ),
                          onPressed: () {
                            _toggleLikeState(image);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(image.title),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(image.description),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}

class SelectedImage {
  final File imageFile;
  final String title;
  final String description;
  bool isLiked;

  SelectedImage({
    required this.imageFile,
    required this.title,
    required this.description,
    this.isLiked = false,
  });
}

