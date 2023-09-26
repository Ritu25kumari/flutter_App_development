import 'package:flutter/material.dart';
import 'dart:ui';
class Location {
  final String address;
  final String state;
  final Color color;
  Location({
    required this.address,
    required this.state,
    required this.color,
  });
}
class LocationSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Location> locations = [
      Location(
        address: "Sector 59",
        state: "Mohali",
        color: Colors.orangeAccent
      ),
      Location(
        address: "Ludhiana",
        state: "Punjab",
        color: Colors.green
      ),
      Location(
        address: "Hanumangarh",
        state: "Rajsthan",
        color: Colors.brown
      ),
    ];
    return Container(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: locations[index].color,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 12.0,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${locations[index].address},\n",
                        ),
                        TextSpan(
                          text: locations[index].state,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 15.0,
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}