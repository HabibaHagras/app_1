// import 'dart:async';
// import 'dart:core';
// import 'dart:core';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//  import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:record/record.dart';

// import 'Record.dart';

// class AudioRecorder extends StatefulWidget {
//   final void Function(String path) onStop;

//   const AudioRecorder({Key? key, required this.onStop}) : super(key: key);

//   @override
//   State<AudioRecorder> createState() => _AudioRecorderState();
// }

// class _AudioRecorderState extends State<AudioRecorder> {
//   bool _isRecording = false;
//   bool _isPaused = false;
//   int _recordDuration = 0;
//   Timer? _timer;
//   Timer? _ampTimer;
//   final _audioRecorder = Record();
//   Amplitude? _amplitude;
//   // var recorder = _audioRecorder("file_path", audioFormat: AudioFormat.AAC); // or AudioFormat.WAV
//   // await recorder.initialized;
//   String _fileName = 'Recording_';
//   String _fileExtension = '.wav';
//   String _directoryPath = 'D:/prooject flutter/assets';
  

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _ampTimer?.cancel();
//     _audioRecorder.dispose();
//     super.dispose();
//   }

//   Future<void> _start() async {
//     try {
//       if (await _audioRecorder.hasPermission()) {

//         // We don't do anything with this but printing
//         final isSupported = await _audioRecorder.isEncoderSupported(
//           AudioEncoder.wav,
//         );
//         // Path:
//         // 'E:\flutter/myFile.m4a';
//         // // path:
//         // // 'E:/flutter/myFile.m4a';

//         if (kDebugMode) {
//           print('${AudioEncoder.wav.name} supported: $isSupported');
//         }

//         // final devs = await _audioRecorder.listInputDevices();

//         await _audioRecorder.start( );

//         bool isRecording = await _audioRecorder.isRecording();
//         setState(() {
//           _isRecording = isRecording;
//           _recordDuration = 0;
//         });

//         _startTimer();
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     Future.delayed(Duration(seconds: 5)).then((value) => _stop());
//   }

//   Future<String?> _stop() async {
//     _timer?.cancel();
//     _ampTimer?.cancel();
//     final path = await _audioRecorder.stop();

//     widget.onStop(path!);


//     setState(() => _isRecording = false);

//   }

//   Future<void> _pause() async {
//     _timer?.cancel();
//     _ampTimer?.cancel();
//     await _audioRecorder.pause();

//     setState(() => _isPaused = true);
//   }

//   Future<void> _resume() async {
//     _startTimer();
//     await _audioRecorder.resume();

//     setState(() => _isPaused = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 _buildRecordStopControl(),
//                 const SizedBox(width: 20),
//                 _buildPauseResumeControl(),
//                 const SizedBox(width: 20),
//                 _buildText(),
//               ],
//             ),
//             if (_amplitude != null) ...[
//               const SizedBox(height: 40),
//               Text('Current: ${_amplitude?.current ?? 0.0}'),
//               Text('Max: ${_amplitude?.max ?? 0.0}'),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRecordStopControl() {
//     late Icon icon;
//     late Color color;

//     if (_isRecording || _isPaused) {
//       icon = const Icon(Icons.stop, color: Colors.red, size: 30);
//       color = Colors.red.withOpacity(0.1);
//     } else {
//       final theme = Theme.of(context);
//       icon = Icon(Icons.mic, color: theme.primaryColor, size: 30);
//       color = theme.primaryColor.withOpacity(0.1);
//     }

//     return ClipOval(
//       child: Material(
//         color: color,
//         child: InkWell(
//           child: SizedBox(width: 56, height: 56, child: icon),
//           onTap: () {
//             _isRecording ? _stop() : _start();
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildPauseResumeControl() {
//     if (!_isRecording && !_isPaused) {
//       return const SizedBox.shrink();
//     }

//     late Icon icon;
//     late Color color;

//     if (!_isPaused) {
//       icon = const Icon(Icons.pause, color: Colors.red, size: 30);
//       color = Colors.red.withOpacity(0.1);
//     } else {
//       final theme = Theme.of(context);
//       icon = const Icon(Icons.play_arrow, color: Colors.red, size: 30);
//       color = theme.primaryColor.withOpacity(0.1);
//     }

//     return ClipOval(
//       child: Material(
//         color: color,
//         child: InkWell(
//           child: SizedBox(width: 56, height: 56, child: icon),
//           onTap: () {
//             _isPaused ? _resume() : _pause();
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildText() {
//     if (_isRecording || _isPaused) {
//       return _buildTimer();
//     }

//     return const Text("Waiting to record");
//   }

//   Widget _buildTimer() {
//     final String minutes = _formatNumber(_recordDuration ~/ 60);
//     final String seconds = _formatNumber(_recordDuration % 60);

//     return Text(
//       '$minutes : $seconds',
//       style: const TextStyle(color: Colors.red),
//     );
//   }

//   String _formatNumber(int number) {
//     String numberStr = number.toString();
//     if (number < 10) {
//       numberStr = '0$numberStr';
//     }

//     return numberStr;
//   }

//   void _startTimer() {
//     _timer?.cancel();
//     _ampTimer?.cancel();

//     _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
//       setState(() => _recordDuration++);
//     });

//     _ampTimer =
//         Timer.periodic(const Duration(milliseconds: 200), (Timer t) async {
//       _amplitude = await _audioRecorder.getAmplitude();
//       setState(() {});
//     });
//   }
// }
