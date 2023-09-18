import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class PostModel {
  final String imageUrl;
  final String title;
  final String description;
  bool isLiked;
  PostModel(this.imageUrl, this.title, this.description, {this.isLiked = false});
}

class EditImage extends StatefulWidget {
  @override
  _EditImageState createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  final List<PostModel> posts = [];
  File? _selectedImage;
  String title = '';
  String description = '';

  void _addPost(String imageUrl, String title, String description) {
    setState(() {
      posts.add(PostModel(imageUrl, title, description));
      _selectedImage = null;
    });
    Navigator.pop(context);
  }

  // Future<void> _openGallery() async {
  //   final picker = ImagePicker();
  //
  //   try {
  //     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  //     if (pickedImage != null) {
  //       setState(() {
  //         _selectedImage = File(pickedImage.path);
  //       });
  //     }
  //   } catch (e) {
  //     print("Error picking image: $e");
  //   }
  // }
  Future<void> _openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
    else{
      print('error picking image');
    }
  }
  void _showBottomSheet({ String? title,String? description}) {
    TextEditingController tempTitle = TextEditingController();
    TextEditingController tempDescription = TextEditingController();


    if(_selectedImage!=null && title!=null && description!=null)
      {
        tempTitle.text=title;
        tempDescription.text=description;
      }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
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
                      )
                    else
                      ElevatedButton(
                        onPressed: () {
                          _openGallery();
                        },
                        child: Text('Select Image'),
                      ),
                    SizedBox(height: 10),
                    TextFormField(
                    controller: tempTitle,
                      decoration: InputDecoration(
                        hintText: 'Enter Title',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                     controller: tempDescription,

                      decoration: InputDecoration(
                        hintText: 'Enter Description',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                          _addPost(
                              _selectedImage!.path, tempTitle.text, tempDescription.text);
                        // if (_selectedImage != null &&
                        //     tempTitle.isNotEmpty &&
                        //     tempDescription.isNotEmpty) {
                        //   _addPost(
                        //       _selectedImage!.path, tempTitle, tempDescription);
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text(
                        //           'Please fill in all fields and select an image.'),
                        //     ),
                        //   );
                        // }
                      },
                      child: Text('Add'),
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
        title = '';
        description = '';
      });
    });
  }
  void _showdeleteconfirmationdialouge() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                _deletepost();
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
  void _deletepost() {
    setState(() {
      final index =
      posts.indexWhere((post) => post.imageUrl == _selectedImage!.path);
      if (index >= 0) {
        posts.removeAt(index);
        _selectedImage = null;
      }
    });
  }
  void _showeditconfirmationdailouge(){
    showDialog(context: context,
        builder: (BuildContext context){
           return AlertDialog(
             title: Text('Confirm edit'),
             content: Text('Are You Sure?'),
             actions: <Widget>[
               TextButton(child: Text('yes'),
               onPressed: (){
                 Navigator.of(context).pop();
                 _editpost();
               },),
               TextButton(child: Text('No'),
               onPressed: (){
                 Navigator.of(context).pop();
               },)
             ],
           );
        });
  }
  void _editpost(){

    _deletepost();
  }

  void _toggleLike(int index) {
    setState(() {
      posts[index].isLiked = !posts[index].isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Grid PostModel',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
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
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,

                        ),
                        Text(posts[index].title),
                        Text(posts[index].description),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        _toggleLike(index);
                      },
                      child: Positioned(
                        left: 80,
                        child: Icon(
                              posts[index].isLiked ? Icons.favorite : Icons.favorite_border,
                              color: posts[index].isLiked ? Colors.red : Colors.white,
                              size: 20.0,
                              ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _selectedImage = File(posts[index].imageUrl);
                    _showdeleteconfirmationdialouge();
                  },
                  child:Positioned(
                  child: Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 20.0,
                  ),
                ),
                ),
                GestureDetector(
                  child: Positioned(
                    bottom: 120,
                    left:120,
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  onTap: (){
                    _selectedImage = File(posts[index].imageUrl);
                    _showBottomSheet(title: posts[index].title,description: posts[index].description);

                  },
                )
              ],

            ),
          );
        },
      ),
    );
  }
}