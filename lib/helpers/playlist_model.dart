class PlaylistModel {
  String albumImage;
  String albumName;
  String numberOfSongs;
  PlaylistModel(
      {required this.albumImage,
      required this.albumName,
      required this.numberOfSongs});

  Map<String, dynamic> toJson() => {
        'albumImage': albumImage,
        'albumName': albumName,
        'numberOfSongs': numberOfSongs
      };
  PlaylistModel.fromSnapshot(snapshot)
      : albumImage = snapshot.data()['albumImage'],
        albumName = snapshot.data()['albumName'],
        numberOfSongs = snapshot.data()['numberOfSongs'];
}
