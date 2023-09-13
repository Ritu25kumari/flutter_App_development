import 'package:flutter/material.dart';
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool liked = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: IconButton(
            icon: Icon(liked ?Icons.favorite: Icons.favorite_border,
                color: liked ? Colors.red :Colors.grey ),
            onPressed: () => _pressed(),
          ),

        ),

      ],
    );
  }
}

class GridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Image Grid'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4
        ),
        children: [
          Image.network('https://i.pinimg.com/originals/3d/a0/97/3da097bfde49aef8e7b0aa00b7ac3ae1.png'),
          Image.network('https://i.pinimg.com/originals/3d/a0/97/3da097bfde49aef8e7b0aa00b7ac3ae1.png'),
          Image.network('https://i.pinimg.com/originals/3d/a0/97/3da097bfde49aef8e7b0aa00b7ac3ae1.png'),
          Image.network('https://i.pinimg.com/originals/3d/a0/97/3da097bfde49aef8e7b0aa00b7ac3ae1.png'),
          Image.network('https://i.pinimg.com/originals/3d/a0/97/3da097bfde49aef8e7b0aa00b7ac3ae1.png'),
          Image.network('https://i.pinimg.com/originals/3d/a0/97/3da097bfde49aef8e7b0aa00b7ac3ae1.png')
        ],
      ),
    );
  }
}


