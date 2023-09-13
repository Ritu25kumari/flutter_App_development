import 'package:flutter/material.dart';
class PostModel{
  final String imageUrl;
  final String Title;
  final String Description;
  bool isliked;
  PostModel(this.imageUrl,this.Title,this.Description,this.isliked);

}
class gridImage extends StatefulWidget {

  @override
  gridImageState createState() => gridImageState();
}

class gridImageState extends State<gridImage> {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Image Grid View',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            InkWell(child: Icon(Icons.add,color: Colors.black,weight: 20,),
            onTap: ()=>{
            },)
          ],
        ),
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
