// KindaCode.com
// main.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

String str = '';
String _resparsing = '';
int kolmovesw = 0;
int kolmovesb = 0;
int curpos = 0;
int curmove = 1;
int finpos = 0;
double ocenkaw = 0.00;
double ocenkab = 0.00;
String tmpgetstr = '';
String tmpsearch = '';
String tmpstr = '';
int tmppos = 0;
String UTCDate = '';
String UTCTime = '';
String Event = '';
String White = '';
String Black = '';
String WhiteElo = '';
String BlackElo = '';
String WhiteRatingDiff = '';
String BlackRatingDiff = '';
String TimeControl = '';
String tmps = '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This will be displayed on the screen
  String? _content;
  String? _resparsing;

  // Find the Documents path
  Future<String> _getDirPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  // This function is triggered when the "Read" button is pressed
  Future<void> _readData() async {
    final dirPath = await _getDirPath();
    final myFile = File('$dirPath/data.txt');
    final data = await myFile.readAsString(encoding: utf8);
    setState(() {
      _content = data;
    });
  }

  // TextField controller
  final _textController = TextEditingController();
  // This function is triggered when the "Write" buttion is pressed
  Future<void> _writeData() async {
    final dirPath = await _getDirPath();

    final myFile = File('$dirPath/data.txt');
    // If data.txt doesn't exist, it will be created automatically

    await myFile.writeAsString(_textController.text);
    _textController.clear();
  }

  Future<void> _getmoves() async {
    _textController.text =
        "1. e4 { [%eval 0.36] [%clk 0:03:00] } 1... e5 { [%eval 0.35] [%clk 0:03:00] } 2. Nf3 { [%eval 0.29] [%clk 0:02:59] } 2... Nc6 { [%eval 0.32] [%clk 0:02:58] } 3. Bb5 { [%eval 0.34] [%clk 0:02:58] } 3... a6 { [%eval 0.37] [%clk 0:02:56] } 4. Bxc6 { [%eval 0.0] [%clk 0:02:58] } 4... dxc6 { [%eval 0.0] [%clk 0:02:55] } 5. Nc3 { [%eval 0.0] [%clk 0:02:58] } 5... f6 { [%eval 0.0] [%clk 0:02:51] } 6. d4 { [%eval 0.0] [%clk 0:02:56] } 6... exd4 { [%eval 0.0] [%clk 0:02:49] } 7. Qxd4 { [%eval 0.0] [%clk 0:02:56] } 7... Qxd4 { [%eval 0.0] [%clk 0:02:47] } 8. Nxd4 { [%eval 0.04] [%clk 0:02:56] } 8... Bd7 { [%eval 0.04] [%clk 0:02:46] } 9. Be3 { [%eval 0.0] [%clk 0:02:55] } 9... O-O-O { [%eval 0.13] [%clk 0:02:44] } 10. O-O-O { [%eval -0.21] [%clk 0:02:54] } 10... Ne7 { [%eval -0.35] [%clk 0:02:42] } 11. f3 { [%eval -0.28] [%clk 0:02:53] } 11... Ng6 { [%eval -0.25] [%clk 0:02:40] } 12. Rd2 { [%eval -0.34] [%clk 0:02:44] } 12... Bb4 { [%eval -0.29] [%clk 0:02:38] } 13. a3 { [%eval -1.26] [%clk 0:02:43] } 13... Bxc3 { [%eval -1.32] [%clk 0:02:35] } 14. bxc3 { [%eval -1.16] [%clk 0:02:43] } 14... Rhe8 { [%eval -0.4] [%clk 0:02:33] } 15. Rhd1 { [%eval -0.8] [%clk 0:02:30] } 15... c5 { [%eval -0.6] [%clk 0:02:29] } 16. Nb3 { [%eval -0.43] [%clk 0:02:24] } 16... b6 { [%eval -0.53] [%clk 0:02:27] } 17. f4 { [%eval -2.67] [%clk 0:02:15] } 17... Rxe4 { [%eval -2.77] [%clk 0:02:22] } 18. Rd3 { [%eval -4.19] [%clk 0:02:08] } 18... Ree8 { [%eval -3.81] [%clk 0:02:19] } 19. c4 { [%eval -3.87] [%clk 0:02:07] } 19... Bc6 { [%eval -3.43] [%clk 0:02:12] } 20. Rxd8+ { [%eval -3.49] [%clk 0:02:05] } 20... Rxd8 { [%eval -3.35] [%clk 0:02:11] } 21. Rxd8+ { [%eval -3.52] [%clk 0:02:05] } 21... Kxd8 { [%eval -3.67] [%clk 0:02:09] } 22. g3 { [%eval -3.48] [%clk 0:02:02] } 22... Ne7 { [%eval -3.39] [%clk 0:02:08] } 23. Kd2 { [%eval -3.55] [%clk 0:01:53] } 23... Nf5 { [%eval -3.82] [%clk 0:02:05] } 24. Bf2 { [%eval -4.27] [%clk 0:01:53] } 24... Nd6 { [%eval -4.29] [%clk 0:02:03] } 25. Kc3 { [%eval -5.84] [%clk 0:01:42] } 25... Ne4+ { [%eval -5.85] [%clk 0:02:01] } 0-1";
    setState(() {});
  }

  String _nullattrib() {
    UTCDate = '';
    UTCTime = '';
    Event = '';
    White = '';
    Black = '';
    WhiteElo = '';
    BlackElo = '';
    WhiteRatingDiff = '';
    BlackRatingDiff = '';
    TimeControl = '';
    return '';
  }

  Future<void> _parsingstring() async {
    String str = _content ?? '';
    List<String> strItog = [];
    List<String> strComms = [];
    for (String i in LineSplitter().convert(str)) {
      strComms.add(i);
    }
    int n = 0;
    while (n < strComms.length) {
      tmps = _chkrekvizit(strComms[n], '[Event ', '"');
      if (tmps.length > 0) {
        _nullattrib();
        Event = tmps;
      }
      tmps = _chkrekvizit(strComms[n], '[UTCDate ', '"');
      if (tmps.length > 0) {
        UTCDate = tmps;
      }
      tmps = _chkrekvizit(strComms[n], '[UTCTime ', '"');
      if (tmps.length > 0) {
        UTCTime = tmps;
      }
      tmps = _chkrekvizit(strComms[n], '[White ', '"');
      if (tmps.length > 0) {
        White = tmps;
      }
      tmps = _chkrekvizit(strComms[n], '[Black ', '"');
      if (tmps.length > 0) {
        Black = tmps;
      }
      tmps = _chkrekvizit(strComms[n], '[WhiteElo ', '"');
      if (tmps.length > 0) {
        WhiteElo = tmps;
      }
      tmps = _chkrekvizit(strComms[n], '[BlackElo ', '"');
      if (tmps.length > 0) {
        BlackElo = tmps;
      }
      tmps = _chkrekvizit(strComms[n], '[WhiteRatingDiff ', '"');
      if (tmps.length > 0) {
        WhiteRatingDiff = tmps;
      }
      tmps = _chkrekvizit(strComms[n], '[BlackRatingDiff ', '"');
      if (tmps.length > 0) {
        BlackRatingDiff = tmps;
      }
      tmps = _chkrekvizit(strComms[n], '[TimeControl ', '"');
      if (tmps.length > 0) {
        TimeControl = tmps;
      }

      if (strComms[n].substring(0, 3) == '1. ') {
        curmove = 0;
        while (strComms[n].length > 0) {
          curmove = curmove + 1;
          tmpsearch = curmove.toString() + '. ';
          curpos = strComms[n].indexOf(tmpsearch);
          if (curpos < 0) {
            strComms[n] = '';
          } else {
            tmpsearch = '%eval ';
            curpos = strComms[n].indexOf(tmpsearch);
            if (curpos > -1) {
              strComms[n] = strComms[n].substring(curpos + tmpsearch.length);
              kolmovesw = kolmovesw + 1;
              tmppos = strComms[n].indexOf(']');
              if (tmppos < 0) {
                strComms[n] = '';
              } else {
                ocenkaw =
                    ocenkaw + double.parse(strComms[n].substring(0, tmppos));
                strComms[n] = strComms[n].substring(tmppos + 1);
              }

              curpos = strComms[n].indexOf(tmpsearch);
              if (curpos > -1) {
                strComms[n] = strComms[n].substring(curpos + tmpsearch.length);
                kolmovesb = kolmovesb + 1;
                tmppos = strComms[n].indexOf(']');
                if (tmppos < 0) {
                  strComms[n] = '';
                } else {
                  ocenkab =
                      ocenkab + double.parse(strComms[n].substring(0, tmppos));
                  strComms[n] = strComms[n].substring(tmppos + 1);
                }
              }
            }
          }
        }

        ocenkaw = ocenkaw / kolmovesw;
        ocenkab = ocenkab / kolmovesb;
        _resparsing = 'Moves: ' +
            kolmovesw.toString() +
            '/' +
            kolmovesb.toString() +
            'Оценка белых: ' +
            ocenkaw.toString() +
            '; ' +
            'Оценка черных: ' +
            ocenkab.toString() +
            '.';
        strItog.add(_resparsing ?? '');
      }
      n = n + 1;
    }
    n = 0;
    tmpstr = '';
    while (n < strItog.length) {
      tmpstr = tmpstr + strItog[n] + '\n';
      n = n + 1;
    }
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/my_file.txt');
    await file.writeAsString(tmpstr);
  }

  String _chkrekvizit(String StrLook, String searchstr, String searchchar) {
    String tmpretu = '';
    tmppos = StrLook.indexOf(searchstr);
    if (tmppos > -1) {
      tmpstr = StrLook.substring(tmppos + 1);
      tmppos = tmpstr.indexOf(searchchar);
      tmpretu = tmpstr.substring(tmppos);
    }
    return tmpretu;
  }

  String _chkrekv(String searchstr, String searchchar) {
    String tmpretu = '';
    tmpsearch = searchstr;
    tmpgetstr = str.substring(curpos, tmpsearch.length);
    if (tmpsearch == tmpgetstr) {
      curpos = curpos + tmpsearch.length + 1;
      tmpstr = str.substring(curpos);
      tmppos = tmpstr.indexOf(searchchar);
      tmpretu = str.substring(curpos, tmppos);
      curpos = curpos + tmppos;
    }
    return tmpretu;
  }

  Future<void> _parsingstr() async {
    String str = _content ?? '';
    //int lenstr = str.length;
    curpos = 0;

    while (curpos < str.length) {
      str = str.substring(curpos);
      curpos = 0;
      tmps = _chkrekv('[Event ', '"');
      if (tmps.length > 0) {
        _nullattrib();
        Event = tmps;
      }
      tmps = _chkrekv('[UTCDate ', '"');
      if (tmps.length > 0) {
        UTCDate = tmps;
      }
      tmps = _chkrekv('[UTCTime ', '"');
      if (tmps.length > 0) {
        UTCTime = tmps;
      }
      tmps = _chkrekv('[White ', '"');
      if (tmps.length > 0) {
        White = tmps;
      }
      tmps = _chkrekv('[Black ', '"');
      if (tmps.length > 0) {
        Black = tmps;
      }
      tmps = _chkrekv('[WhiteElo ', '"');
      if (tmps.length > 0) {
        WhiteElo = tmps;
      }
      tmps = _chkrekv('[BlackElo ', '"');
      if (tmps.length > 0) {
        BlackElo = tmps;
      }
      tmps = _chkrekv('[WhiteRatingDiff ', '"');
      if (tmps.length > 0) {
        WhiteRatingDiff = tmps;
      }
      tmps = _chkrekv('[BlackRatingDiff ', '"');
      if (tmps.length > 0) {
        BlackRatingDiff = tmps;
      }
      tmps = _chkrekv('[TimeControl ', '"');
      if (tmps.length > 0) {
        TimeControl = tmps;
      }

      tmpsearch = curmove.toString() + '. ';
      tmpgetstr = str.substring(curpos, tmpsearch.length);
      finpos = str.indexOf('-');
      while (curpos < finpos) {
        if (tmpsearch == tmpgetstr) {
          curpos = curpos + tmpsearch.length;
          tmpsearch = '%eval ';
          while ((curpos < finpos) && (tmpsearch != tmpgetstr)) {
            tmpgetstr = str.substring(curpos, tmpsearch.length);
            curpos = curpos + 1;
          }
          if (curpos < finpos) {
            curpos = curpos + tmpsearch.length;
            tmpstr = str.substring(curpos);
            kolmovesw = kolmovesw + 1;
            ocenkaw = ocenkaw +
                double.parse(str.substring(curpos, tmpstr.indexOf(']')));
            curpos = curpos + tmpstr.indexOf(']');

            while ((curpos < finpos) && (tmpsearch != tmpgetstr)) {
              tmpgetstr = str.substring(curpos, tmpsearch.length);
              curpos = curpos + 1;
            }
            if (curpos < finpos) {
              curpos = curpos + tmpsearch.length;
              tmpstr = str.substring(curpos);
              ocenkab = ocenkab +
                  double.parse(str.substring(curpos, tmpstr.indexOf(']')));
              kolmovesb = kolmovesb + 1;
              curpos = curpos + tmpstr.indexOf(']');
            }
          }
          curmove = curmove + 1;
        }
        curpos = curpos + 1;
      }
    }
    ocenkaw = ocenkaw / kolmovesw;
    ocenkab = ocenkab / kolmovesb;
    _resparsing = 'Moves: ' +
        kolmovesw.toString() +
        '/' +
        kolmovesb.toString() +
        'Оценка белых: ' +
        ocenkaw.toString() +
        '; ' +
        'Оценка черных: ' +
        ocenkab.toString() +
        '.';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(labelText: 'Enter your name'),
              ),
              ElevatedButton(
                onPressed: _writeData,
                child: const Text('Save to file'),
              ),
              const SizedBox(
                height: 150,
              ),
              Text(_content ?? 'Press the button to load your name',
                  softWrap: true,
                  style: const TextStyle(fontSize: 24, color: Colors.pink)),
              ElevatedButton(
                onPressed: _readData,
                child: const Text('Read my name from the file'),
              ),
              ElevatedButton(
                onPressed: _getmoves,
                child: const Text('Load moves'),
              ),
              Text(_resparsing ?? 'Results of parsing',
                  softWrap: true,
                  style: const TextStyle(fontSize: 24, color: Colors.pink)),
              ElevatedButton(
                onPressed: _parsingstr,
                child: const Text('Begin parsing!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
