// import 'dart:io';
// // import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';

// //import 'RecordController.dart';
// import 'package:get/get_core/get_core.dart';
// import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

// import 'package:get/get_instance/get_instance.dart';
// import 'package:record/record.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_sound/flutter_sound.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/foundation.dart';

// import 'record2.dart';
// import 'record3.dart';

// class Record extends StatefulWidget {
//   @override
//   State<Record> createState() => _RecordState();
// }

// class _RecordState extends State<Record> {
//   bool showPlayer = false;
//   String? audioPath;
//   String _fileName = 'Recording_';
//   String _fileExtension = '.wav';
//   String _directoryPath = 'D:/prooject flutter/assets';
//   RecordController _recordController = Get.put(RecordController());
//   final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();

//   @override
//   void initState() {
//     showPlayer = false;
//     String _fileName = 'Recording_';
//     String _fileExtension = '.wav';
//     String _directoryPath = 'D:/prooject flutter/assets';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: showPlayer
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: AudioPlayer(
//                     source: audioPath!,
//                     onDelete: () {
//                       setState(() => showPlayer = false);
//                     },
//                   ),
//                 )
//               : AudioRecorder(
//                   onStop: (path) {
//                     // // path='D:/prooject flutter/assets';
//                     // /////////////////////////
//                     //
//                     // void _createFile() async {
//                     //   var _completeFileName = await generateFileName();
//                     //   File(_directoryPath + '/' + _completeFileName)
//                     //       .create(recursive: true)
//                     //       .then((File file) async {
//                     //     //write to file
//                     //     Uint8List bytes = await file.readAsBytes();
//                     //     file.writeAsBytes(bytes);
//                     //     print(file.path);
//                     //     // _flutterFFmpeg.execute("ffmpeg -i $file outputFile.wav").then((rc) => print("FFmpeg process exited with rc $rc"));
//                     //
//                     //   });
//                     // }
//                     //
//                     // void _createDirectory() async {
//                     //   bool isDirectoryCreated = await Directory(_directoryPath).exists();
//                     //   if (!isDirectoryCreated) {
//                     //     Directory(_directoryPath).create()
//                     //     // The created directory is returned as a Future.
//                     //         .then((Directory directory) {
//                     //       print(directory.path);
//                     //     });
//                     //   }
//                     //
//                     // }

//                     // void _writeFileToStorage() async {
//                     //   // _createDirectory();
//                     //   // _createFile();
//                     //   _flutterFFmpeg.execute("ffmpeg -i $path outputFile.wav").then((rc) => print("FFmpeg process exited with rc $rc"));
//                     //
//                     // }
//                     /////////////////////////////////

//                     if (kDebugMode) print('Recorded file path: $path');
//                     // multi(path);
//                     // _writeFileToStorage();

//                     // FFmpegKit.execute('-i $path output.wav').then((session) async {
//                     //   final returnCode = await session.getReturnCode();
//                     //
//                     //   if (true) {
//                     //     print("sucessssssssssssssssssssssssssssssssssss");
//                     //     // SUCCESS
//                     //
//                     //   }
//                     //   else if (false){
//                     //   print("NOTTTsucessssssssssssssssssssssssssssssssssss");}
//                     //
//                     //
//                     // });
//                     _recordController.multipartProdecudre();

//                     setState(() {

//                       audioPath = path;
//                       showPlayer = true;
//                     });
//                   },
//                 ),
//         ),
//       ),
//     );
//   }

//   generateFileName() {}
// }
