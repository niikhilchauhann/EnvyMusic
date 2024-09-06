import 'package:flutter/material.dart';

class AlbumPage extends StatefulWidget {
  final dynamic album;
  const AlbumPage({super.key, this.album});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  double imageOpacity = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
            SliverAppBar(
              toolbarHeight: 70,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              ),
              title: Text(
                widget.album.albumName,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.favorite_border_rounded),
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Opacity(
                    opacity: imageOpacity.clamp(0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 5,
                              blurRadius: 15,
                              offset: Offset(0, 0),
                              color: Colors.white),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Image.network(
                          widget.album.albumImage,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.album.albumName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.play_arrow_rounded)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.shuffle_rounded)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                              "Perfectly blended with your favourite ingredients have it with a pair of headphones and you are good to go."),
                        ]),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
