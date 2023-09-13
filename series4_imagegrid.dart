import 'package:flutter/material.dart';
class PostImage extends StatefulWidget {
  @override
  _PostImageState createState() => _PostImageState();
}
class _PostImageState extends State<PostImage> {
  final List<PostModel> posts = [
    PostModel(
      id: '1101',
      title: 'Post 1101',
      description: 'Flutter app developer.....',
      imagepath: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsd_QS_xiCmFm1sY5d77ifP0i0e98MF7qRlDphOGge5umZeos53t3XEfn4U7BVttd9Rok&usqp=CAU'),
    ),
    PostModel(
      id: '1102',
      title: 'post 1102',
      description: 'Flutter app developer.....',
      imagepath: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsd_QS_xiCmFm1sY5d77ifP0i0e98MF7qRlDphOGge5umZeos53t3XEfn4U7BVttd9Rok&usqp=CAU'),
    ),
    PostModel(
      id: '1103',
      title: 'Post 1103',
      description: 'Flutter app developer.....',
      imagepath: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsd_QS_xiCmFm1sY5d77ifP0i0e98MF7qRlDphOGge5umZeos53t3XEfn4U7BVttd9Rok&usqp=CAU'),
    ),
    PostModel(
      id: '1104',
      title: 'Post 1104',
      description: 'Flutter app developer.....',
      imagepath: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsd_QS_xiCmFm1sY5d77ifP0i0e98MF7qRlDphOGge5umZeos53t3XEfn4U7BVttd9Rok&usqp=CAU'),
    ),
    PostModel(
      id: '1101',
      title: 'Post 1101',
      description: 'Flutter app developer.....',
      imagepath: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsd_QS_xiCmFm1sY5d77ifP0i0e98MF7qRlDphOGge5umZeos53t3XEfn4U7BVttd9Rok&usqp=CAU'),
    ),
    PostModel(
      title: 'Post 1101',
      description: 'Flutter app developer.....',
      id: '1101',
      imagepath: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsd_QS_xiCmFm1sY5d77ifP0i0e98MF7qRlDphOGge5umZeos53t3XEfn4U7BVttd9Rok&usqp=CAU'),
    ),
    PostModel(
      id: '1101',
      title: 'Post 1101',
      description: 'Flutter app developer.....',
      imagepath: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsd_QS_xiCmFm1sY5d77ifP0i0e98MF7qRlDphOGge5umZeos53t3XEfn4U7BVttd9Rok&usqp=CAU'),
    ),
    PostModel(
      id: '1101',
      title: 'Post 1101',
      description: 'Flutter app developer.....',
      imagepath: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsd_QS_xiCmFm1sY5d77ifP0i0e98MF7qRlDphOGge5umZeos53t3XEfn4U7BVttd9Rok&usqp=CAU'),
    ),
    PostModel(
      id: '1101',
      title: 'Post 1101',
      description: 'Flutter app developer.....',
      imagepath: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsd_QS_xiCmFm1sY5d77ifP0i0e98MF7qRlDphOGge5umZeos53t3XEfn4U7BVttd9Rok&usqp=CAU'),
    ),
    PostModel(
      id: '1101',
      title: 'Post 1101',
      description: 'Flutter app developer.....',
      imagepath: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsd_QS_xiCmFm1sY5d77ifP0i0e98MF7qRlDphOGge5umZeos53t3XEfn4U7BVttd9Rok&usqp=CAU'),
    ),
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Vibe Talk',style: TextStyle(color: Colors.black),),
              InkWell(
                child: const Icon(Icons.add,color: Colors.black,),
                onTap:() {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                             height: 300,
                      child: Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           mainAxisSize: MainAxisSize.min,
                           children: <Widget>[
                            const Text('Add postmodel',style: TextStyle(color: Colors.teal),),
                            const SizedBox(height: 100,),
                            ElevatedButton(
                                child: const Text('Add',style: TextStyle(color: Colors.teal),),
                                onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                       ),
                      );
                     },
                   );
                  },
                )
            ],
          )),
        ),
        body: ListView(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: posts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return buildPostCard(posts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget buildPostCard(PostModel post) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: post.imagepath,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.description),
          ),
          IconButton(
            icon: Icon(
              post.isLiked ? Icons.favorite : Icons.favorite_border,
              color: post.isLiked ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                post.isLiked = !post.isLiked;
              });
            },
          ),
        ],
      ),
    );
  }
}
class PostModel
{
  final String id;
  final ImageProvider<Object> imagepath;
  final String title;
  final String description;
  bool isLiked;
  PostModel({
    required this.id,
    required this.imagepath,
    required this.title,
    required this.description,
    this.isLiked = false,
  });
}