import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:envymusic/screens/subscreens/settings_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class OnThisDevice extends StatefulWidget {
  @override
  State<OnThisDevice> createState() => _OnThisDeviceState();
}

class _OnThisDeviceState extends State<OnThisDevice> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer _player = AudioPlayer();
  List<SongModel> songs = [];
  String currentSongTitle = '';
  int currentIndex = 0;

  Stream<DurationState> get _durationStateStream =>
      Rx.combineLatest2<Duration, Duration?, DurationState>(
          _player.positionStream,
          _player.durationStream,
          (position, duration) => DurationState(
              position: position, total: duration ?? Duration.zero));
  @override
  void initState() {
    super.initState();
    requestStoragePermission();
    _player.currentIndexStream.listen((index) {
      if (index != null) {
        _updateCurrentPlayingSongDetails(index);
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On this Device',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 22,
              color: Colors.white,
            )),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute<void>(
        //             builder: (BuildContext context) {
        //               return const Settings();
        //             },
        //           ),
        //         );
        //       },
        //       icon: const Icon(Icons.settings_rounded))
        // ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: FutureBuilder<List<SongModel>>(
        future: _audioQuery.querySongs(
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true,
        ),
        builder: (context, item) {
          if (item.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (item.data!.isEmpty) {
            return const Center(
              child: Text("No Songs Found"),
            );
          }
          songs.clear();
          songs = item.data!;
          return ListView.builder(
              itemCount: item.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  height: 80,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          offset: Offset(0, 0),
                          color: Colors.white),
                    ],
                  ),
                  child: ListTile(
                    textColor: Colors.white,
                    title: Text(
                      item.data![index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    subtitle: Text(
                      "By " + item.data![index].artist.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.more_vert, color: Colors.white),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              barrierColor: Colors.black87,
                              isDismissible: true,
                              backgroundColor: Color.fromARGB(255, 85, 85, 85),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25))),
                              builder: (context) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Center(
                                              child: Icon(
                                            Icons.horizontal_rule_rounded,
                                            size: 44,
                                            color: Colors.white,
                                          )),
                                          ListTile(
                                              onTap: () {},
                                              iconColor: Colors.white,
                                              textColor: Colors.white,
                                              leading: Icon(
                                                  Icons.playlist_add_rounded),
                                              title: Text('Add to playlist',
                                                  style: TextStyle(
                                                      fontFamily: 'Jost'))),
                                          ListTile(
                                              onTap: () {},
                                              iconColor: Colors.white,
                                              textColor: Colors.white,
                                              leading: Icon(
                                                  Icons.queue_music_rounded),
                                              title: Text('Add to queue',
                                                  style: TextStyle(
                                                      fontFamily: 'Jost'))),
                                          ListTile(
                                              onTap: () {},
                                              iconColor: Colors.white,
                                              textColor: Colors.white,
                                              leading: Icon(Icons.edit_rounded),
                                              title: Text('Rename',
                                                  style: TextStyle(
                                                      fontFamily: 'Jost'))),
                                          ListTile(
                                              onTap: () {},
                                              iconColor: Colors.white,
                                              textColor: Colors.white,
                                              leading:
                                                  Icon(Icons.delete_rounded),
                                              title: Text('Delete from Device',
                                                  style: TextStyle(
                                                      fontFamily: 'Jost'))),
                                          ListTile(
                                              onTap: () {},
                                              iconColor: Colors.white,
                                              textColor: Colors.white,
                                              leading:
                                                  Icon(Icons.share_rounded),
                                              title: Text('Share',
                                                  style: TextStyle(
                                                      fontFamily: 'Jost')))
                                        ]),
                                  ));
                        }),
                    leading: QueryArtworkWidget(
                      id: item.data![index].id,
                      type: ArtworkType.AUDIO,
                    ),
                    onTap: () async {
                      toast(context, item.data![index].title);

                      // Try to load audio from a source and catch any errors.
                      await _player.setAudioSource(createPlaylist(item.data!),
                          initialIndex: index);
                      await _player.play();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Scaffold(
                          backgroundColor: Color.fromRGBO(15, 15, 15, 1),
                          body: SingleChildScrollView(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                  top: 56.0, right: 20.0, left: 20.0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(15, 15, 15, 1)),
                              child: Column(
                                children: <Widget>[
                                  //exit button and the song title
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        child: InkWell(
                                          //hides the player view
                                          child: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: getDecoration(
                                                BoxShape.circle,
                                                const Offset(2, 2),
                                                2.0,
                                                0.0),
                                            child: const Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          currentSongTitle,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        flex: 5,
                                      ),
                                    ],
                                  ),

                                  //artwork container
                                  Container(
                                    width: 300,
                                    height: 300,
                                    decoration: getDecoration(BoxShape.circle,
                                        const Offset(2, 2), 2.0, 0.0),
                                    margin: const EdgeInsets.only(
                                        top: 30, bottom: 30),
                                    child: QueryArtworkWidget(
                                      id: songs[currentIndex].id,
                                      type: ArtworkType.AUDIO,
                                      artworkBorder:
                                          BorderRadius.circular(200.0),
                                    ),
                                  ),

                                  //slider , position and duration widgets
                                  Column(
                                    children: [
                                      //slider bar container
                                      Container(
                                        padding: EdgeInsets.zero,
                                        margin:
                                            const EdgeInsets.only(bottom: 4.0),
                                        decoration: getRectDecoration(
                                            BorderRadius.circular(20.0),
                                            const Offset(2, 2),
                                            2.0,
                                            0.0),

                                        //slider bar duration state stream
                                        child: StreamBuilder<DurationState>(
                                          stream: _durationStateStream,
                                          builder: (context, snapshot) {
                                            final durationState = snapshot.data;
                                            final progress =
                                                durationState?.position ??
                                                    Duration.zero;
                                            final total =
                                                durationState?.total ??
                                                    Duration.zero;

                                            return ProgressBar(
                                              progress: progress,
                                              total: total,
                                              barHeight: 20.0,
                                              baseBarColor:
                                                  Color.fromRGBO(15, 15, 15, 1),
                                              progressBarColor:
                                                  const Color(0xEE9E9E9E),
                                              thumbColor:
                                                  Colors.white60.withBlue(99),
                                              timeLabelTextStyle:
                                                  const TextStyle(
                                                fontSize: 0,
                                              ),
                                              onSeek: (duration) {
                                                _player.seek(duration);
                                              },
                                            );
                                          },
                                        ),
                                      ),

                                      //position /progress and total text
                                      StreamBuilder<DurationState>(
                                        stream: _durationStateStream,
                                        builder: (context, snapshot) {
                                          final durationState = snapshot.data;
                                          final progress =
                                              durationState?.position ??
                                                  Duration.zero;
                                          final total = durationState?.total ??
                                              Duration.zero;

                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  progress
                                                      .toString()
                                                      .split(".")[0],
                                                  style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  total
                                                      .toString()
                                                      .split(".")[0],
                                                  style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),

                                  //prev, play/pause & seek next control buttons
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        //skip to previous
                                        Flexible(
                                          child: InkWell(
                                            onTap: () {
                                              if (_player.hasPrevious) {
                                                _player.seekToPrevious();
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              decoration: getDecoration(
                                                  BoxShape.circle,
                                                  const Offset(2, 2),
                                                  2.0,
                                                  0.0),
                                              child: const Icon(
                                                Icons.skip_previous,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ),
                                        ),

                                        //play pause
                                        Flexible(
                                          child: InkWell(
                                            onTap: () {
                                              if (_player.playing) {
                                                _player.pause();
                                              } else {
                                                if (_player.currentIndex !=
                                                    null) {
                                                  _player.play();
                                                }
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              margin: const EdgeInsets.only(
                                                  right: 20.0, left: 20.0),
                                              decoration: getDecoration(
                                                  BoxShape.circle,
                                                  const Offset(2, 2),
                                                  2.0,
                                                  0.0),
                                              child: StreamBuilder<bool>(
                                                stream: _player.playingStream,
                                                builder: (context, snapshot) {
                                                  bool? playingState =
                                                      snapshot.data;
                                                  if (playingState != null &&
                                                      playingState) {
                                                    return const Icon(
                                                      Icons.pause_rounded,
                                                      size: 30,
                                                      color: Colors.white70,
                                                    );
                                                  }
                                                  return const Icon(
                                                    Icons.play_arrow_rounded,
                                                    size: 30,
                                                    color: Colors.white70,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),

                                        //skip to next
                                        Flexible(
                                          child: InkWell(
                                            onTap: () {
                                              if (_player.hasNext) {
                                                _player.seekToNext();
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              decoration: getDecoration(
                                                  BoxShape.circle,
                                                  const Offset(2, 2),
                                                  2.0,
                                                  0.0),
                                              child: const Icon(
                                                Icons.skip_next,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //go to playlist, shuffle , repeat all and repeat one control buttons
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        //go to playlist btn
                                        Flexible(
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              decoration: getDecoration(
                                                  BoxShape.circle,
                                                  const Offset(2, 2),
                                                  2.0,
                                                  0.0),
                                              child: const Icon(
                                                Icons.list_alt,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ),
                                        ),

                                        //shuffle playlist
                                        Flexible(
                                          child: InkWell(
                                            onTap: () {
                                              _player
                                                  .setShuffleModeEnabled(true);
                                              toast(
                                                  context, "Shuffling enabled");
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              margin: const EdgeInsets.only(
                                                  right: 30.0, left: 30.0),
                                              decoration: getDecoration(
                                                  BoxShape.circle,
                                                  const Offset(2, 2),
                                                  2.0,
                                                  0.0),
                                              child: const Icon(
                                                Icons.shuffle,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ),
                                        ),

                                        //repeat mode
                                        Flexible(
                                          child: InkWell(
                                            onTap: () {
                                              _player.loopMode == LoopMode.one
                                                  ? _player
                                                      .setLoopMode(LoopMode.all)
                                                  : _player.setLoopMode(
                                                      LoopMode.one);
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              decoration: getDecoration(
                                                  BoxShape.circle,
                                                  const Offset(2, 2),
                                                  2.0,
                                                  0.0),
                                              child: StreamBuilder<LoopMode>(
                                                stream: _player.loopModeStream,
                                                builder: (context, snapshot) {
                                                  final loopMode =
                                                      snapshot.data;
                                                  if (LoopMode.one ==
                                                      loopMode) {
                                                    return const Icon(
                                                      Icons.repeat_one,
                                                      color: Colors.white70,
                                                    );
                                                  }
                                                  return const Icon(
                                                    Icons.repeat,
                                                    color: Colors.white70,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
                    },
                  ),
                );
              });
        },
      ),
    );
  }

  //define a toast method
  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Now Playing: " + text),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    ));
  }

  void requestStoragePermission() async {
    //only if the platform is not web, coz web have no permissions
    if (!kIsWeb) {
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _audioQuery.permissionsRequest();
      }

      //ensure build method is called
      setState(() {});
    }
  }

  //create playlist
  ConcatenatingAudioSource createPlaylist(List<SongModel> songs) {
    List<AudioSource> sources = [];
    for (var song in songs) {
      sources.add(AudioSource.uri(Uri.parse(song.uri!)));
    }
    return ConcatenatingAudioSource(children: sources);
  }

  //update playing song details
  void _updateCurrentPlayingSongDetails(int index) {
    setState(() {
      if (songs.isNotEmpty) {
        currentSongTitle = songs[index].title;
        currentIndex = index;
      }
    });
  }

  BoxDecoration getDecoration(
      BoxShape shape, Offset offset, double blurRadius, double spreadRadius) {
    return BoxDecoration(
      color: Color.fromRGBO(15, 15, 15, 1),
      shape: shape,
      boxShadow: [
        BoxShadow(
          offset: -offset,
          color: Colors.white24,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        ),
        BoxShadow(
          offset: offset,
          color: Colors.black,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        )
      ],
    );
  }

  BoxDecoration getRectDecoration(BorderRadius borderRadius, Offset offset,
      double blurRadius, double spreadRadius) {
    return BoxDecoration(
      borderRadius: borderRadius,
      color: Color.fromRGBO(15, 15, 15, 1),
      boxShadow: [
        BoxShadow(
          offset: -offset,
          color: Colors.white24,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        ),
        BoxShadow(
          offset: offset,
          color: Colors.black,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        )
      ],
    );
  }
}

//duration class
class DurationState {
  DurationState({this.position = Duration.zero, this.total = Duration.zero});
  Duration position, total;
}
