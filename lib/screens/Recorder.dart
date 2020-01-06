import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/android_encoder.dart';
import 'package:flutter_sound/ios_quality.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:intl/date_symbol_data_local.dart';
import 'package:miakaraoke/models/SoundRecording.dart';
import 'package:miakaraoke/models/ThemeModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:miakaraoke/models/RecordingModel.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:toast/toast.dart';

class RecorderScreen extends StatefulWidget {
  @override
  _RecorderScreenState createState() => _RecorderScreenState();
}

const List<String> menus = <String>[
  'Chia sẽ',
  'Xóa',
];

double height = 0;
double width = 0;

class _RecorderScreenState extends State<RecorderScreen> {
  ThemeChanger themeChanger;
  RecordingModel rm;
  bool _isRecording = false;
  String _path;
  int _selectedRec = -1;
  DateTime currentBackPressTime;

  StreamSubscription _recorderSubscription;
  StreamSubscription _playerSubscription;
  FlutterSound flutterSound;

  String _recorderTxt = '00:00';

  double sliderCurrentPosition = 0.0;
  double maxDuration = 1.0;

  @override
  void initState() {
    super.initState();
    flutterSound = new FlutterSound();
    flutterSound.setSubscriptionDuration(0.01);
    flutterSound.setDbPeakLevelUpdate(0.8);
    flutterSound.setDbLevelEnabled(true);
    initializeDateFormatting();
  }

  @override
  void deactivate() {
    super.deactivate();
    if (flutterSound.isRecording) stopRecorder();
    if (flutterSound.isPlaying) stopPlayer();
  }

  void startRecorder() async {
    if (flutterSound.isPlaying) {
      stopPlayer();
    }

    String formattedDate =
        DateFormat('kk-mm-ss_dd-MM-yy').format(DateTime.now());

    try {
      String path = await flutterSound.startRecorder(
          "Android/data/com.varmyapp.miakaraoke/files/KaraRecording/" +
              formattedDate +
              ".recx",
          bitRate: 256000,
          sampleRate: 48000,
          numChannels: 2,
          androidEncoder: AndroidEncoder.AAC,
          iosQuality: IosQuality.MAX);
      print('startRecorder: $path');

      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        DateTime date = new DateTime.fromMillisecondsSinceEpoch(
            e.currentPosition.toInt(),
            isUtc: true);
        String txt = DateFormat('mm:ss', 'en_GB').format(date);

        this.setState(() {
          this._recorderTxt = txt.substring(0, 5);
        });
      });

      this.setState(() {
        this._isRecording = true;
        this._path = path;
      });
      await rm.addRecording(
          SoundRecording(name: 'GHI ÂM ' + formattedDate, path: path));
    } catch (err) {
      print('startRecorder error: $err');
    }
  }

  void stopRecorder() async {
    try {
      String result = await flutterSound.stopRecorder();
      print('stopRecorder: $result');

      if (_recorderSubscription != null) {
        _recorderSubscription.cancel();
        _recorderSubscription = null;
      }

      this.setState(() {
        this._isRecording = false;
      });
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  void startPlayer(String path) async {
    try {
      await flutterSound.startPlayer(path);
      await flutterSound.setVolume(1.0);
      print('startPlayer: $path');

      _playerSubscription = flutterSound.onPlayerStateChanged.listen((e) {
        if (e != null) {
          sliderCurrentPosition = e.currentPosition;
          maxDuration = e.duration;

          DateTime date = new DateTime.fromMillisecondsSinceEpoch(
              e.currentPosition.toInt(),
              isUtc: true);
          String txt = DateFormat('mm:ss', 'en_GB').format(date);
          this.setState(() {});
        }
      });
    } catch (err) {
      print('error: $err');
    }
  }

  void stopPlayer() async {
    try {
      String result = await flutterSound.stopPlayer();
      print('stopPlayer: $result');
      if (_playerSubscription != null) {
        _playerSubscription.cancel();
        _playerSubscription = null;
      }

      this.setState(() {});
    } catch (err) {
      print('error: $err');
    }
  }

  void seekToPlayer(int milliSecs) async {
    String result = await flutterSound.seekToPlayer(milliSecs);
    print('seekToPlayer: $result');
  }

  void delRecording(SoundRecording recording) async {
    if (flutterSound.isPlaying) stopPlayer();
    if (File(recording.path).existsSync()) {
      Directory dir = new Directory(recording.path);
      await dir.delete(recursive: true);
    }
    rm.delRecording(recording);
  }

  @override
  Widget build(BuildContext context) {
    themeChanger = Provider.of<ThemeChanger>(context);
    rm = Provider.of<RecordingModel>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return WillPopScope(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: <Widget>[
            Container(
              height: height * 0.15,
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        child: IconButton(
                          onPressed: () {
                            if (!this._isRecording) {
                              return this.startRecorder();
                            }
                            this.stopRecorder();
                          },
                          icon: Icon(
                            this._isRecording
                                ? Icons.fiber_manual_record
                                : Icons.mic,
                            color: this._isRecording
                                ? Colors.redAccent
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        this._recorderTxt,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Sans',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Add box decoration
              decoration: BoxDecoration(
                // Box decoration takes a gradient
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.lightBlue,
                    Colors.blue,
                    Colors.blueAccent,
                    Colors.blue,
                  ],
                ),
              ),
            ),
            Visibility(
              visible: flutterSound.isRecording,
              child: Center(
                child: Text(
                  'Đang ghi âm...',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Sans',
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !flutterSound.isRecording,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.15),
                child: ListView.builder(
                  itemCount: rm.recordings.length,
                  itemBuilder: (context, pos) {
                    return Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ListTile(
                        onTap: () async {
                          if (flutterSound.isPlaying && _selectedRec != pos) {
                            stopPlayer();
                          }
                          _selectedRec = pos;
                          this.setState(() {});
                        },
                        leading: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            if (flutterSound.isPlaying && _selectedRec != pos) {
                              stopPlayer();
                            }
                            _selectedRec = pos;
                            flutterSound.isPlaying
                                ? stopPlayer()
                                : startPlayer(rm.recordings[pos].path);
                          },
                          child: CircleAvatar(
                            child: Container(
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(
                                  (flutterSound.isPlaying &&
                                          _selectedRec == pos)
                                      ? Icons.stop
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                // Box decoration takes a gradient
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    themeChanger.accentColor,
                                    Color(0xFF1976D2),
                                    Color(0xFF42A5F5),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          rm.recordings[pos].name,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Sans',
                          ),
                        ),
                        subtitle: this._selectedRec != pos
                            ? null
                            : Container(
                                child: Slider(
                                  value: sliderCurrentPosition,
                                  min: 0.0,
                                  max: maxDuration,
                                  activeColor: Colors.blue,
                                  inactiveColor: Colors.blue,
                                  onChanged: (double value) async {
                                    await flutterSound
                                        .seekToPlayer(value.toInt());
                                  },
                                  divisions: 100,
                                ),
                              ),
                        trailing: PopupMenuButton<String>(
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                          ),
                          onSelected: (String choice) async {
                            if (choice == menus[0]) {
                              File val = File(rm.recordings[pos].path);
                              List<int> bytes = await val.readAsBytes();

                              await Share.files(
                                  'Karaoke Recording',
                                  {
                                    'Recording.m4a': Uint8List.fromList(bytes),
                                  },
                                  '*/*',
                                  text: 'Karaoke Recording.');
                            } else if (choice == menus[1]) {
                              delRecording(rm.recordings[pos]);
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return menus.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    choice,
                                    style: Theme.of(context).textTheme.display2,
                                  ),
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      onWillPop: () {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          Toast.show("Nhấn trở lại để thoát", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
          return Future.value(false);
        }

        if (flutterSound.isRecording) stopRecorder();
        if (flutterSound.isPlaying) stopPlayer();

        return Future.value(true);
      },
    );
  }
}
