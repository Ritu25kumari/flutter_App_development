import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class PostModel{
  final String imageUrl;
  final String Title;
  final String Description;
  bool isliked;
  PostModel(this.imageUrl,this.Title,this.Description,this.isliked);
}
class GridImage extends StatefulWidget {
 //  final TextEditingController _title= TextEditingController();
 // final TextEditingController _Description = TextEditingController();
  @override
  GridImageState createState() => GridImageState();
}

class GridImageState extends State<GridImage> {
  void _showImagePicker(BuildContext context){
    File? posts;
Future _getImageCamera() async {
  final pickedfile = await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedfile != null) {
      setState(() {
        posts = File(pickedfile!.path);
      });
    }
  }
Future _getImageGallery() async {
  final pickedfile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (posts != null) {
    setState(() {
      posts = File(pickedfile!.path);
    });
  }
}
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 500,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Add Images in PostModel',style: TextStyle(color: Colors.grey),),
                SizedBox(height: 100,),
                Column(
                  children: [
                     Container(
                       child: posts != null ? Image.file(
                            posts!, width: 250, height: 250, fit: BoxFit.cover,) :
                          Container(height: 100, width: 100, color: Colors.grey,),
                     ),
                    ListTile(
                      leading:Icon(Icons.camera_alt_outlined) ,
                      onTap:(){
                        _getImageCamera();
                      },
                    ),
                    ListTile(
                      leading:Icon(Icons.photo_album_outlined) ,
                      onTap:(){
                        _getImageGallery();
                      },
                    ),

                  ],
                ),
                // TextField()(
                //   controller: _title,
                //   decoration: InputDecoration(
                //     labelText: 'title'
                //   ),
                // ),
                // TextField(
                //   controller: _Description,
                //   decoration: InputDecoration(
                //     labelText: 'Description'
                //   ),
                // ),
                ElevatedButton(
                  child: const Text('Add',style: TextStyle(color: Colors.black,),),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );

  }
  final List<PostModel> posts = [
    PostModel('https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg','Post1101','flutter developer....',false),
    PostModel('https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg','Post1102','flutter developer....',false),
    PostModel('https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg','Post1103','flutter developer....',false),
    PostModel('https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg','Post1104','flutter developer....',false),
  ];
  void liked(int index){
    setState(() {
      posts[index].isliked=!posts[index].isliked;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Image Grid View',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(icon: Icon(Icons.add),
          onPressed: (){
            _showImagePicker(context);
          },)
        ],
        // InkWell(child: Icon(Icons.add,color: Colors.black,weight: 20,),
        // onTap: ()=>{ _showImagePicker()
        // },)
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4
        ),
            itemCount: posts.length,
            itemBuilder: (ctx, index){
          return Stack(
            children: [Container(
              child: Column(
                children: [
                  Image(image: NetworkImage(
                    posts[index].imageUrl
                  ),
                  ),
                  Text(posts[index].Title),
                  Text(posts[index].Description)
                ],
              ),
            ),
            Positioned(
                left: 140,
                child: IconButton(
                  icon:Icon(
                  posts[index].isliked ? Icons.favorite : Icons.favorite_border,
                  color: posts[index].isliked ? Colors.red : Colors.white,
                  size: 25.0,
                ),
                  onPressed: (){liked(index);},

            ))]
          );
            }),
      ),
    );
  }
}

