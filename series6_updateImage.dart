import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';

class PostModel {
  final String imageUrl;
  final String title;
  final String description;
  bool isLiked;
  PostModel(this.imageUrl, this.title, this.description, {this.isLiked = false});
}
class UpdateImage extends StatefulWidget {
  const UpdateImage({Key? key}) : super(key: key);

  @override
  _UpdateImageState createState() => _UpdateImageState();
}
class _UpdateImageState extends State<UpdateImage> {
  final List<PostModel> posts = [];
  File? _selectedImage;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int? _editingIndex; // Track the index of the item being edited

  void _addPost(String imageUrl, String title, String description) {
    setState(() {
      posts.add(PostModel(imageUrl, title, description));
      _selectedImage = null;
    });
    Navigator.pop(context);
  }
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState1) {
            Future openGallery(ImageSource source) async {
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
                  setState1(() {
                    _selectedImage = File(croppedImage.path);
                  });
                }
              }
              return;
            }
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (_selectedImage != null)
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(_selectedImage!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    openGallery(ImageSource.gallery);
                                  },
                                  child: Text('Change Image'),
                                ),
                              ],
                            ),
                          )
                        else
                          ElevatedButton(
                            onPressed: () {
                              openGallery(ImageSource.gallery);
                            },
                            child: Text('Select Image'),
                          ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(
                            hintText: 'Enter Title',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            hintText: 'Enter Description',
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _editingIndex != null
                              ? _updatePost
                              : () {
                            if (_selectedImage != null &&
                                titleController.text.isNotEmpty &&
                                descriptionController.text.isNotEmpty) {
                              _addPost(
                                _selectedImage!.path,
                                titleController.text,
                                descriptionController.text,
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Please fill in all fields and select an image.'),
                                ),
                              );
                            }
                          },
                          child: Text(_editingIndex != null
                              ? 'Update'
                              : 'Add'),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        _selectedImage = null;
        titleController.clear();
        descriptionController.clear();
        _editingIndex = null; // Clear editing mode
      });
    });
  }
  void _showdeleteconfirmationdialouge(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure to delete the pic?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                _deletepost(index);
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
  void _deletepost(int index) {
    setState(() {
      posts.removeAt(index);
      _selectedImage = null;
    });
  }

  void _toggleLike(int index) {
    setState(() {
      posts[index].isLiked = !posts[index].isLiked;
    });
  }
  void _editPost(int index) {
    setState(() {
      _editingIndex = index;
      _selectedImage = File(posts[index].imageUrl);
      titleController.text = posts[index].title;
      descriptionController.text = posts[index].description;
    });
    _showBottomSheet();
  }
  void _updatePost() {
    if (_editingIndex != null) {
      setState(() {
        posts[_editingIndex!] = PostModel(
          _selectedImage!.path,
          titleController.text,
          descriptionController.text,
        );
        _selectedImage = null;
        titleController.clear();
        descriptionController.clear();
        _editingIndex = null;
      });
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Grid View Example',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: Icon(Icons.add,),
            onPressed: () {
              _showBottomSheet();
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Column(
                      children: [
                        Image(
                          image: FileImage(File(posts[index].imageUrl)),
                          height: 120,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        Text(posts[index].title),
                        Text(posts[index].description),
                      ],
                    ),
                    Positioned(
                      top: 120,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          _showdeleteconfirmationdialouge(index);
                        },
                        child: Icon(Icons.delete, color: Colors.black, size: 25.0,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          _toggleLike(index);
                        },
                        child: Icon(
                          posts[index].isLiked ? Icons.favorite : Icons.favorite_border,
                          color: posts[index].isLiked ? Colors.red : Colors.grey,
                          size: 25.0,
                        ),
                      ),
                    ),
                    // Add an edit icon for editing the post
                    Positioned(
                      top: 10,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          _editPost(index);
                        },
                        child: Icon(
                          Icons.edit, color: Colors.grey, size: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Create a separate StatefulWidget for the bottom sheet content
class BottomSheetContent extends StatefulWidget {
  final File? selectedImage;
  final VoidCallback onImageSelected;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final VoidCallback onAddPressed;
  final bool isEditing;

  BottomSheetContent({
    required this.selectedImage,
    required this.onImageSelected,
    required this.titleController,
    required this.descriptionController,
    required this.onAddPressed,
    required this.isEditing,
  });

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (widget.selectedImage != null)
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(widget.selectedImage!),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.onImageSelected();
                  },
                  child: Text('Change Image'),
                ),
              ],
            ),
          )
        else
          ElevatedButton(
            onPressed: () {
              widget.onImageSelected();
            },
            child: Text('Select Image'),
          ),
        SizedBox(height: 10),
        TextFormField(
          controller: widget.titleController,
          decoration: InputDecoration(
            hintText: 'Enter Title',
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: widget.descriptionController,
          decoration: InputDecoration(
            hintText: 'Enter Description',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: widget.isEditing
              ? widget.onAddPressed
              : () {},
          child: Text(widget.isEditing ? 'Update' : 'Add'),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

