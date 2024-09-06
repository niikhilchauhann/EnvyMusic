import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../screens/subscreens/album_screen.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer(this._audioPlayer, {Key? key}) : super(key: key);

  final AudioPlayer _audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 75,
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, _, __) => AlbumPage(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: "image",
                        child: CircleAvatar(
                          backgroundImage: AssetImage("widget.song.image"),
                          radius: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("widget.song.name",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Text("widget.song.singer",
                              style: TextStyle(
                                color: Colors.white54,
                              ))
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Play/pause/restart
                      StreamBuilder<PlayerState>(
                        stream: _audioPlayer.playerStateStream,
                        builder: (_, snapshot) {
                          final playerState = snapshot.data;
                          return _playPauseButton(playerState);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// A button that plays or pauses the audio.
  ///
  /// If the audio is playing, a pause button is shown.
  /// If the audio has finished playing, a restart button is shown.
  /// If the audio is paused, or not started yet, a play button is shown.
  /// If the audio is loading, a progress indicator is shown.
  Widget _playPauseButton(PlayerState? playerState) {
    final processingState = playerState?.processingState;
    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      return Container(
        margin: EdgeInsets.all(8.0),
        width: 30,
        height: 30,
        child: CircularProgressIndicator(),
      );
    } else if (_audioPlayer.playing != true) {
      return IconButton(
        icon: Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
        iconSize: 30,
        onPressed: _audioPlayer.play,
      );
    } else if (processingState != ProcessingState.completed) {
      return IconButton(
        icon: Icon(
          Icons.pause,
          color: Colors.white,
        ),
        iconSize: 30,
        onPressed: _audioPlayer.pause,
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.replay,
          color: Colors.white,
        ),
        iconSize: 30,
        onPressed: () => _audioPlayer.seek(Duration.zero,
            index: _audioPlayer.effectiveIndices?.first),
      );
    }
  }
}
