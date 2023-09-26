import 'package:flutter/material.dart';

class Grocerystore1 extends StatelessWidget {
  const Grocerystore1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Grocerystore2();
  }
}

class Grocerystore2 extends StatefulWidget {
  const Grocerystore2({Key? key});

  @override
  State<Grocerystore2> createState() => _Grocerystore2State();
}

class _Grocerystore2State extends State<Grocerystore2> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(clipBehavior: Clip.none, children: [
        Positioned(
            child: Opacity(
             opacity: 0.3,
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://easydrawings.net/wp-content/uploads/2020/05/draw-a-washing-machine.jpg'))),
          ),
        )),
        SingleChildScrollView(
            child: Container(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              SizedBox(
                height: kToolbarHeight,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Welcome Back,\n",
                                  style: TextStyle(fontSize: 30)),
                              TextSpan(
                                  text: "Hypeteq!",
                                  style: TextStyle(fontSize: 30)),
                            ],
                          ),
                        ),
                        // Image.asset(
                        //   "assets/images/user.png",
                        //   height: 80,
                        //   width: 80,
                        // )
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://static.vecteezy.com/system/resources/previews/000/439/863/original/vector-users-icon.jpg'),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 200.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "New Locations",
                          style: TextStyle(
                            color: Color.fromRGBO(19, 22, 33, 1),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  )
                  )
            ]))),
      ]),
    );
  }
}
