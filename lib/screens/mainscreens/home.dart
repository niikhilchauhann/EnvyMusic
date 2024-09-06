import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envymusic/screens/subscreens/song_screen.dart';
import 'package:envymusic/helpers/song_model.dart';
import 'package:envymusic/widgets/category_tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../../widgets/search_bar.dart';
import '../../widgets/song_options.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _getQuickPicksList = [];
  List _getYouMightAlsoLike = [];
  List _getYouMightAlsoLikeA = [];
  List _getYouMightAlsoLikeB = [];
  List _getMadeForYou = [];
  List _getPopularArtists = [];
  List _getAllTimeHits = [];
  List _getCharts = [];
  List _getNewReleases = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getQuickPicksList();
    getYouMightAlsoLike();
    getYouMightAlsoLikeA();
    getYouMightAlsoLikeB();
    getMadeForYou();
    getPopularArtists();
    getAllTimeHits();
    getCharts();
    getNewReleases();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return OnBackPress();
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: 120,
              backgroundColor: Colors.transparent,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello there,"),
                  Text(
                    "User!",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Jost',
                        color: Colors.cyanAccent),
                  ),
                ],
              ),
              titleTextStyle:
                  TextStyle(fontSize: 24, fontFamily: 'Jost', height: 1.1),
              actions: [
                IconButton(
                  icon: Icon(Icons.search_rounded),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: DefaultTextStyle(
                style: TextStyle(fontFamily: 'Jost'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Quick Picks

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        'Quick Picks',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _getQuickPicksList.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: (() => Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SongPage(
                                      songName:
                                          _getQuickPicksList[index].songName,
                                      songImage:
                                          _getQuickPicksList[index].songImage,
                                      artistName:
                                          _getQuickPicksList[index].artistName,
                                      songUrl:
                                          _getQuickPicksList[index].songUrl);
                                }))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 3),
                              child: SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      child: FadeInImage(
                                        placeholder: AssetImage(
                                          "lib/assets/image/music_album2.png",
                                        ),
                                        image: NetworkImage(
                                            _getQuickPicksList[index]
                                                .songImage),
                                        height: 160,
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text(_getQuickPicksList[index].songName,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                        SizedBox(height: 2),
                                        Text(
                                          _getQuickPicksList[index].artistName,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Josefin_Sans'),
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    //You Might Also Like

                    const SizedBox(height: 40),
                    Center(
                      child: const Text(
                        'You Might Also Like',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider(
                        scrollDirection: Axis.horizontal,
                        slideTransform: CubeTransform(),
                        slideIndicator: CircularWaveSlideIndicator(
                            currentIndicatorColor: Colors.white,
                            indicatorBackgroundColor: Colors.white38,
                            indicatorRadius: 5),
                        unlimitedMode: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) {
                                          return SongPage(
                                              songName:
                                                  _getYouMightAlsoLike[index]
                                                      .songName,
                                              songImage:
                                                  _getYouMightAlsoLike[index]
                                                      .songImage,
                                              artistName:
                                                  _getYouMightAlsoLike[index]
                                                      .artistName,
                                              songUrl:
                                                  _getYouMightAlsoLike[index]
                                                      .songUrl);
                                        }),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15.0),
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
                                                image: NetworkImage(
                                                    _getYouMightAlsoLike[index]
                                                        .songImage),
                                                height: 58,
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _getYouMightAlsoLike[index]
                                                      .songName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  _getYouMightAlsoLike[index]
                                                      .artistName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Josefin_Sans'),
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
                              }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) {
                                          return SongPage(
                                              songName:
                                                  _getYouMightAlsoLikeA[index]
                                                      .songName,
                                              songImage:
                                                  _getYouMightAlsoLikeA[index]
                                                      .songImage,
                                              artistName:
                                                  _getYouMightAlsoLikeA[index]
                                                      .artistName,
                                              songUrl:
                                                  _getYouMightAlsoLikeA[index]
                                                      .songUrl);
                                        }),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
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
                                                image: NetworkImage(
                                                    _getYouMightAlsoLikeA[index]
                                                        .songImage),
                                                height: 58,
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _getYouMightAlsoLikeA[index]
                                                      .songName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  _getYouMightAlsoLikeA[index]
                                                      .artistName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Josefin_Sans'),
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
                              }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) {
                                          return SongPage(
                                              songName:
                                                  _getYouMightAlsoLikeB[index]
                                                      .songName,
                                              songImage:
                                                  _getYouMightAlsoLikeB[index]
                                                      .songImage,
                                              artistName:
                                                  _getYouMightAlsoLikeB[index]
                                                      .artistName,
                                              songUrl:
                                                  _getYouMightAlsoLikeB[index]
                                                      .songUrl);
                                        }),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
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
                                                image: NetworkImage(
                                                    _getYouMightAlsoLikeB[index]
                                                        .songImage),
                                                height: 58,
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _getYouMightAlsoLikeB[index]
                                                      .songName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  _getYouMightAlsoLikeB[index]
                                                      .artistName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Josefin_Sans'),
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
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Made For You
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        'Made For You',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 16),

                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _getMadeForYou.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SongPage(
                                        songName:
                                            _getMadeForYou[index].songName,
                                        songImage:
                                            _getMadeForYou[index].songImage,
                                        artistName:
                                            _getMadeForYou[index].artistName,
                                        songUrl: _getMadeForYou[index].songUrl);
                                  },
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 3),
                              child: SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      child: FadeInImage(
                                        placeholder: AssetImage(
                                            "lib/assets/image/music_album2.png"),
                                        image: NetworkImage(
                                            _getMadeForYou[index].songImage),
                                        height: 160,
                                      ),
                                    ),
                                    
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text(_getMadeForYou[index].songName,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                        SizedBox(height: 2),
                                        Text(
                                          _getMadeForYou[index].artistName,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Josefin_Sans'),
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    // Popular Artists
                    const SizedBox(height: 40),
                    const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text('Popular Artists',
                            style: TextStyle(fontSize: 20))),
                    const SizedBox(height: 16),

                    SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _getPopularArtists.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 46,
                                  backgroundImage: NetworkImage(
                                      _getPopularArtists[index].songImage),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 94,
                                  child: Center(
                                    child: Text(
                                      _getPopularArtists[index].artistName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Josefin_Sans',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),

                    //Grid for Genres(Same as in explore but less)
                    const SizedBox(height: 40),
                    Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: const Text('Genres',
                            style: TextStyle(fontSize: 20))),
                    const SizedBox(height: 16),

                    Column(children: [
                      CategoryTiles(
                        category1: "Chill",
                        first: Colors.redAccent,
                        category2: "Workout",
                        second: Colors.cyanAccent.shade700,
                      ),
                      CategoryTiles(
                        category1: "Happy",
                        first: Colors.blueAccent,
                        category2: "Badass",
                        second: Colors.pinkAccent,
                      ),
                      CategoryTiles(
                        category1: "Sad",
                        first: Colors.tealAccent.shade700,
                        category2: "Gaming",
                        second: Colors.orangeAccent,
                      )
                    ]),
                    //All Time Hits

                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        'All Time Hits',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 16),

                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _getAllTimeHits.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SongPage(
                                      songImage:
                                          _getAllTimeHits[index].songImage,
                                      songName: _getAllTimeHits[index].songName,
                                      artistName:
                                          _getAllTimeHits[index].artistName,
                                      songUrl: _getAllTimeHits[index].songUrl,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 3),
                              child: SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      child: FadeInImage(
                                        placeholder: AssetImage(
                                            "lib/assets/image/music_album2.png"),
                                        image: NetworkImage(
                                            _getAllTimeHits[index].songImage),
                                        height: 160,
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text(_getAllTimeHits[index].songName,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                        SizedBox(height: 2),
                                        Text(
                                          _getAllTimeHits[index].artistName,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Josefin_Sans'),
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    //Charts

                    const SizedBox(height: 40),
                    const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text('Charts', style: TextStyle(fontSize: 20))),
                    const SizedBox(height: 16),

                    SizedBox(
                      height: 145,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _getCharts.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      NetworkImage(_getCharts[index].songImage),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 94,
                                  child: Center(
                                    child: Text(
                                      _getCharts[index].artistName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Josefin_Sans',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),

                    //New Releases

                    const SizedBox(height: 40),
                    Center(
                        child: const Text('New Releases',
                            style: TextStyle(fontSize: 20))),
                    const SizedBox(height: 16),

                    Container(
                      height: 360,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ListView.builder(
                          itemCount: 4,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SongPage(
                                          songImage:
                                              _getNewReleases[index].songImage,
                                          songName:
                                              _getNewReleases[index].songName,
                                          artistName:
                                              _getNewReleases[index].artistName,
                                          songUrl:
                                              _getNewReleases[index].songUrl),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          child: FadeInImage(
                                            placeholder: AssetImage(
                                              "lib/assets/image/music_album2.png",
                                            ),
                                            image: NetworkImage(
                                                _getNewReleases[index]
                                                    .songImage),
                                            height: 58,
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _getNewReleases[index].songName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              _getNewReleases[index].artistName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  fontFamily: 'Josefin_Sans'),
                                            )
                                          ],
                                        )
                                      ],
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
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getQuickPicksList() async {
    var data = await FirebaseFirestore.instance.collection("QuickPicks").get();
    setState(() {
      _getQuickPicksList =
          List.from(data.docs.map((doc) => SongModel.fromSnapshot(doc)));
    });
  }

  Future getYouMightAlsoLike() async {
    var data =
        await FirebaseFirestore.instance.collection("YouMightAlsoLike").get();
    setState(() {
      _getYouMightAlsoLike =
          List.from(data.docs.map((doc) => SongModel.fromSnapshot(doc)));
    });
  }

  Future getYouMightAlsoLikeA() async {
    var data =
        await FirebaseFirestore.instance.collection("YouMightAlsoLikeA").get();
    setState(() {
      _getYouMightAlsoLikeA =
          List.from(data.docs.map((doc) => SongModel.fromSnapshot(doc)));
    });
  }

  Future getYouMightAlsoLikeB() async {
    var data =
        await FirebaseFirestore.instance.collection("YouMightAlsoLikeB").get();
    setState(() {
      _getYouMightAlsoLikeB =
          List.from(data.docs.map((doc) => SongModel.fromSnapshot(doc)));
    });
  }

  Future getMadeForYou() async {
    var data = await FirebaseFirestore.instance.collection("MadeForYou").get();
    setState(() {
      _getMadeForYou =
          List.from(data.docs.map((doc) => SongModel.fromSnapshot(doc)));
    });
  }

  Future getPopularArtists() async {
    var data =
        await FirebaseFirestore.instance.collection("PopularArtists").get();
    setState(() {
      _getPopularArtists =
          List.from(data.docs.map((doc) => SongModel.fromSnapshot(doc)));
    });
  }

  Future getAllTimeHits() async {
    var data = await FirebaseFirestore.instance.collection("AllTimeHits").get();
    setState(() {
      _getAllTimeHits =
          List.from(data.docs.map((doc) => SongModel.fromSnapshot(doc)));
    });
  }

  Future getCharts() async {
    var data = await FirebaseFirestore.instance.collection("Charts").get();
    setState(() {
      _getCharts =
          List.from(data.docs.map((doc) => SongModel.fromSnapshot(doc)));
    });
  }

  Future getNewReleases() async {
    var data = await FirebaseFirestore.instance.collection("NewReleases").get();
    setState(() {
      _getNewReleases =
          List.from(data.docs.map((doc) => SongModel.fromSnapshot(doc)));
    });
  }
}

class OnBackPress extends StatelessWidget {
  const OnBackPress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'Do you really want to exit?',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Jost',
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: (() => Future.delayed(
                const Duration(milliseconds: 200),
                () {
                  SystemChannels.platform.invokeMethod(
                    'SystemNavigator.pop',
                  );
                },
              )),
          child: Text(
            'Yes',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Jost',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'No',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Jost',
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
