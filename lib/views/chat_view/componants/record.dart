import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class Record extends StatefulWidget {
  Record({Key? key}) : super(key: key);

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  final recorder = FlutterSoundRecorder();

  Future record()  async {
    await recorder.startRecorder(toFile: 'voice');
  }

  Future stop()  async {
    await recorder.stopRecorder();
  }

  Future initRecorder()  async {
    final status= await Permission.microphone.request();

    if(status != PermissionStatus.granted){
      throw "Not permision";
    }
    await recorder.openRecorder();
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            if(recorder.isRecording){
              await stop();
            }else {
              await record();
            }
            setState(() {
              
            });
          },
          child: Icon(
            recorder.isRecording? Icons.stop : Icons.mic,
            size: 80,
          ),


        ),
      ),
    );
  }
}
