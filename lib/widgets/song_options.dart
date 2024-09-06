import 'package:flutter/material.dart';

Future<dynamic> SongOptions(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    barrierColor: Colors.black87,
    isDismissible: true,
    backgroundColor: Color.fromARGB(255, 20, 20, 20),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Icon(
            Icons.horizontal_rule_rounded,
            size: 24,
            color: Colors.white,
          )),
          ListTile(
              onTap: () {},
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.favorite),
              title: Text('Add to Favourites',
                  style: TextStyle(fontFamily: 'Jost'))),
          ListTile(
              onTap: () {},
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.queue_music_rounded),
              title:
                  Text('Add to queue', style: TextStyle(fontFamily: 'Jost'))),
          ListTile(
              onTap: () {},
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.download_rounded),
              title: Text('Download', style: TextStyle(fontFamily: 'Jost'))),
          ListTile(
              onTap: () {},
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.not_interested_rounded),
              title:
                  Text('Not Interested', style: TextStyle(fontFamily: 'Jost'))),
          ListTile(
              onTap: () {},
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.playlist_add_rounded),
              title: Text('Add to playlist',
                  style: TextStyle(fontFamily: 'Jost'))),
          ListTile(
              onTap: () {},
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.person_search_rounded),
              title: Text('More from this Artist',
                  style: TextStyle(fontFamily: 'Jost'))),
          ListTile(
              onTap: () {},
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.share_rounded),
              title: Text('Share', style: TextStyle(fontFamily: 'Jost')))
        ],
      ),
    ),
  );
}
