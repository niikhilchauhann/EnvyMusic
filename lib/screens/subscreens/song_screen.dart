import 'package:envymusic/widgets/player.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

class SongPage extends StatefulWidget {
  final String songImage;
  final String songName;
  final String artistName;
  final String? songLyrics;
  final String songUrl;

  const SongPage(
      {super.key,
      required this.songName,
      required this.songImage,
      required this.artistName,
      this.songLyrics,
      required this.songUrl});
  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  late AudioPlayer _audioPlayer;
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse(widget.songUrl),
            tag: MediaItem(
              id: "",
              album: widget.artistName,
              title: widget.songName,
              artUri: Uri.parse(widget.songImage),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.08,
            centerTitle: true,
            title: Column(
              children: [
                Text(
                  "Now Playing:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 12,
                      color: Colors.white70,
                      height: 1),
                ),
                Text(
                  widget.songName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 18,
                      color: Colors.white,
                      height: 1.3),
                ),
              ],
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded)),
            backgroundColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.86,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 12,
                                  offset: Offset(0, 0),
                                  color: Colors.white),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.network(
                              widget.songImage,
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height / 3,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          widget.songName,
                          style: const TextStyle(
                            fontFamily: 'Jost',
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.artistName,
                          style: const TextStyle(
                            fontFamily: 'Josefin_Sans',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<PositionData>(
                          stream: _positionDataStream,
                          builder: (context, snapshot) {
                            final positionData = snapshot.data;
                            return SeekBar(
                              duration: positionData?.duration ?? Duration.zero,
                              position: positionData?.position ?? Duration.zero,
                              bufferedPosition:
                                  positionData?.bufferedPosition ??
                                      Duration.zero,
                              onChangeEnd: _audioPlayer.seek,
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        Player(_audioPlayer)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// class BottomSheet extends StatelessWidget {
//   const BottomSheet({
//     Key? key,
//     required this.widget,
//   }) : super(key: key);

//   final SongPage widget;

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.09,
//       minChildSize: 0.09,
//       builder: (BuildContext context, ScrollController scrollController) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: ListView.builder(
//             physics: ClampingScrollPhysics(),
//             controller: scrollController,
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                         width: 40,
//                         child: Divider(color: Colors.black, thickness: 4)),
//                     SizedBox(height: 12),
//                     Text("LYRICS",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'Jost',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16)),
//                     SizedBox(height: 12),
//                     Divider(color: Colors.black, thickness: 1),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 25, vertical: 20),
//                       child: Text(
//                         widget.songLyrics,
//                         style: TextStyle(
//                             color: Colors.redAccent,
//                             fontFamily: 'HKGrotesk',
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25,
//                             height: 1.6),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
}
