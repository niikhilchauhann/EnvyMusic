import 'package:flutter/material.dart';

import '../screens/coming_soon.dart';

class CategoryTiles extends StatelessWidget {
  final String category1;
  final String category2;
  final Color first;
  final Color second;
  CategoryTiles(
      {required this.category1,
      required this.first,
      required this.category2,
      required this.second});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ComingSoon();
                  },
                ),
              );
            },
            child: Container(
              child: Center(
                  child: Text(
                "${category1}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              )),
              decoration: BoxDecoration(
                  color: first,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 60,
              width: MediaQuery.of(context).size.width / 2.25,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ComingSoon();
                  },
                ),
              );
            },
            child: Container(
              child: Center(
                  child: Text(
                "${category2}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              )),
              decoration: BoxDecoration(
                  color: second,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 60,
              width: MediaQuery.of(context).size.width / 2.25,
            ),
          ),
        ),
      ],
    );
  }
}
