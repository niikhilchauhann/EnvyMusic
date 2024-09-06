import 'package:envymusic/screens/coming_soon.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Library',
          style: TextStyle(fontFamily: 'Jost'),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute<void>(builder: (BuildContext context) {
        //           return Settings();
        //         }));
        //       },
        //       icon: const Icon(Icons.settings))
        // ],
        titleTextStyle: const TextStyle(fontSize: 25, color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: DefaultTextStyle(
        style: TextStyle(fontFamily: 'Jost', color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              ListTile(
                onTap: () {
                  showAboutDialog(
                    context: context,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Upcoming Features:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "Animes\nOffline Compatibility\nNFT Avatars\nSign-up Feature\nMiniPlayer\nNew UI\nMore Songs & Albums\nSong Downloader\nPlaylists\nApp Optimizations",
                      )
                    ],
                    applicationIcon: Image.asset(
                      "lib/assets/image/splash.png",
                      height: 120,
                    ),
                  );
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                leading: Icon(
                  Icons.update_rounded,
                  size: 24,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                ),
                title: Text(
                  'Upcoming Features',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost'),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ComingSoon();
                  }));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                leading: Icon(
                  Icons.download_done_rounded,
                  size: 24,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                ),
                title: Text(
                  'On this Device',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost'),
                ),
              ),
              ListTile(
                onTap: () {
                  showContactMe(context);
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                leading: Icon(
                  Icons.contacts_rounded,
                  size: 24,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                ),
                title: Text(
                  'Contact Us',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost'),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ComingSoon();
                      },
                    ),
                  );
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                leading: Icon(
                  Icons.favorite_rounded,
                  size: 24,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                ),
                title: Text(
                  'Favourites',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost'),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ComingSoon();
                  }));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                leading: Icon(
                  Icons.queue_music_rounded,
                  size: 24,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                ),
                title: Text(
                  'Playlists',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost'),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ComingSoon();
                  }));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                leading: Icon(
                  Icons.album_rounded,
                  size: 24,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                ),
                title: Text(
                  'Albums',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost'),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ComingSoon();
                  }));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                leading: Icon(
                  Icons.music_note_rounded,
                  size: 24,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                ),
                title: Text(
                  'Songs',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost'),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ComingSoon();
                  }));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                leading: Icon(
                  Icons.supervisor_account_rounded,
                  size: 24,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                ),
                title: Text(
                  'Artists',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showContactMe(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black87,
      isDismissible: true,
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Container(
              width: double.infinity,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16),
                  Text(
                    "Contact Us:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Email: isedenlive@gmail.com\nInstagram: @niikhilchauhann\nContact: +91 9810942673",
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'Jost',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ));
}
