// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/material.dart';
//
// class Caller extends StatefulWidget {
//   const Caller({Key? key}) : super(key: key);
//
//   @override
//   _CallerState createState() => _CallerState();
// }
//
// class _CallerState extends State<Caller> {
//   AgoraClient client = AgoraClient(
//       agoraConnectionData: AgoraConnectionData(
//           appId: ('6b00efdd9cb4439c9d2db3490580ac2c'), channelName: 'test'),
//       enabledPermission: [Permission.camera, Permission.microphone]);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(children: [
//       AgoraVideoViewer(
//         client: client,
//       ),
//       AgoraVideoButtons(client: client)
//     ]));
//   }
// }
