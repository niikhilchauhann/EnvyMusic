import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Settings'),
          leading: IconButton(
            icon: Icon((Icons.arrow_back_ios_new_rounded)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          titleTextStyle: const TextStyle(fontSize: 25, color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(height: 40),
            ListTile(
              onTap: () {},
              trailing: Icon(
                Icons.dark_mode_rounded,
                size: 28,
              ),
              title: Text(
                'Dark Mode',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(
                Icons.equalizer_rounded,
                size: 28,
              ),
              title: Text(
                'Equalizer',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(
                Icons.fast_forward_rounded,
                size: 28,
              ),
              title: Text(
                'Double-tap to seek',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(
                Icons.bluetooth_drive_rounded,
                size: 28,
              ),
              title: Text(
                'Allow external device to start playback',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(
                Icons.sd_storage_rounded,
                size: 28,
              ),
              title: Text(
                'Clear Cache or Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(
                Icons.data_saver_off_rounded,
                size: 28,
              ),
              title: Text(
                'Data Saver',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(
                Icons.timer_rounded,
                size: 28,
              ),
              title: Text(
                'Timer',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(
                Icons.settings_suggest_rounded,
                size: 28,
              ),
              title: Text(
                'Preferences',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
