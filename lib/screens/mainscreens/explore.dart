import 'package:envymusic/widgets/category_tiles.dart';
import 'package:flutter/material.dart';

import '../../widgets/search_bar.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  Future<void> _refresh() {
    return Future.delayed(Duration(milliseconds: 2400));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(fontFamily: 'Jost'),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) {
        //             return Settings();
        //           }),
        //         );
        //       },
        //       icon: const Icon(Icons.settings))
        // ],
        titleTextStyle: const TextStyle(fontSize: 25, color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white, fontFamily: 'Jost'),
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text('Search', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 20),
                        TextFormField(
                          showCursor: true,
                          readOnly: true,
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(),
                            );
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            hintText: 'Artist, Song or Album...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.search_rounded),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('Moods & Genres' + " 😄",
                            style: TextStyle(fontSize: 20)),
                        SizedBox(height: 20)
                      ]),
                ),
                Column(
                  children: [
                    CategoryTiles(
                        category1: "Happy",
                        first: Colors.yellow.shade800,
                        category2: "Chill",
                        second: Colors.teal.shade400),
                    CategoryTiles(
                        category1: "Badass",
                        first: Colors.redAccent,
                        category2: "Guitar",
                        second: Colors.purpleAccent),
                    CategoryTiles(
                        category1: "Ominous",
                        first: Colors.pinkAccent,
                        category2: "EDM",
                        second: Colors.orangeAccent),
                    CategoryTiles(
                        category1: "Energetic",
                        first: Colors.lime.shade600,
                        category2: "Sad",
                        second: Colors.lightGreenAccent.shade700),
                    CategoryTiles(
                        category1: "Workout",
                        first: Colors.lightBlueAccent,
                        category2: "Motivational",
                        second: Colors.indigoAccent),
                    CategoryTiles(
                        category1: "Gaming",
                        first: Colors.greenAccent.shade700,
                        category2: "Inpirational",
                        second: Colors.deepPurpleAccent),
                    CategoryTiles(
                        category1: "Beats",
                        first: Colors.deepOrangeAccent,
                        category2: "Beat Drops",
                        second: Colors.cyanAccent.shade700),
                    CategoryTiles(
                        category1: "Rock",
                        first: Colors.blueAccent,
                        category2: "Metal",
                        second: Colors.amberAccent.shade400),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
