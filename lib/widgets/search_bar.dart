import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envymusic/widgets/song_options.dart';
import 'package:flutter/material.dart';

import '../screens/subscreens/song_screen.dart';

class CustomSearchDelegate extends SearchDelegate {
  CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("DatabaseSongs");
  @override
  String get searchFieldLabel => 'Search any song, album, or artist';
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_rounded));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              showResults(context);
            },
            icon: Icon(Icons.search_rounded)),
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: Icon(Icons.clear_rounded))
      ];
  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ListView(
              children: [
                ...snapshot.data!.docs
                    .where((QueryDocumentSnapshot<Object?> element) =>
                        element['songName']
                            .toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                    .map(
                  (data) {
                    final String songName = data.get('songName');
                    final String artistName = data.get('artistName');
                    final String songImage = data.get('songImage');
                    final String songUrl = data.get('songUrl');

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongPage(
                                songImage: songImage,
                                songName: songName,
                                artistName: artistName,
                                songUrl: songUrl),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  child: FadeInImage(
                                    placeholder: AssetImage(
                                      "lib/assets/image/music_album2.png",
                                    ),
                                    image: NetworkImage(songImage),
                                    height: 58,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      songName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      artistName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: 'Josefin_Sans'),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              SongOptions(context);
                            },
                            icon: Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ListView(
              children: [
                ...snapshot.data!.docs.map(
                  (data) {
                    final String songName = data.get('songName');
                    final String artistName = data.get('artistName');
                    final String songImage = data.get('songImage');
                    final String songUrl = data.get('songUrl');

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongPage(
                                songImage: songImage,
                                songName: songName,
                                artistName: artistName,
                                songUrl: songUrl),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  child: FadeInImage(
                                    placeholder: AssetImage(
                                      "lib/assets/image/music_album2.png",
                                    ),
                                    image: NetworkImage(songImage),
                                    height: 58,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      songName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      artistName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: 'Josefin_Sans'),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              SongOptions(context);
                            },
                            icon: Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        }
      },
    );
    // return ListView.builder(
    //   itemCount: suggestions.length,
    //   itemBuilder: (context, index) {
    //     final suggestion = suggestions[index];

    //     return ListTile(
    //       title: Text(
    //         suggestion,
    //         style:
    //             TextStyle(fontFamily: 'HKGrotesk', fontWeight: FontWeight.bold),
    //       ),
    //       onTap: () {
    //         query = suggestion;
    //       },
    //     );
    //   },
    // );
  }
}
