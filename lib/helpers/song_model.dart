class SongModel {
  String songImage;
  String songName;
  String artistName;
  String songUrl;
  SongModel({
    required this.songImage,
    required this.songName,
    required this.artistName,
    required this.songUrl,
  });

  Map<String, dynamic> toJson() => {
        'songImage': songImage,
        'songName': songName,
        'artistName': artistName,
        'songUrl': songUrl,
      };
  SongModel.fromSnapshot(snapshot)
      : songImage = snapshot.data()['songImage'],
        songName = snapshot.data()['songName'],
        artistName = snapshot.data()['artistName'],
        songUrl = snapshot.data()['songUrl'];
}
