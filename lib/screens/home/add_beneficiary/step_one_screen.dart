// import 'package:flutter/material.dart';
// import 'package:unitey_app/constant/color_manger.dart';
// import 'package:unitey_app/screens/home/add_beneficiary/sd.dart';
//
// class StepOneScreen extends StatefulWidget {
//   const StepOneScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StepOneScreen> createState() => _StepOneScreenState();
// }
//
// class _StepOneScreenState extends State<StepOneScreen> {
//   ProgressTimeline? screenProgress;
//
//   List<SingleState> allStages = [
//     SingleState(stateTitle: "Personal Info"),
//     SingleState(stateTitle: "Bank Details"),
//     SingleState(stateTitle: "Confirmation"),
//   ];
//
//   @override
//   void initState() {
//     screenProgress =  ProgressTimeline(
//       connectorLength: 150,
//       connectorColor: ColorManager.primary,
//       states: allStages,
//       checkedIcon:Icon(Icons.play_circle_fill_rounded),
//       currentIcon: Icon(Icons.play_circle_fill_rounded),
//       iconSize: 20,
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Testing"),
//       ),
//       body: Center(
//         child: Column(
// //          crossAxisAlignment: CrossAxisAlignment.center,
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 0.0),
//               child: screenProgress,
//             ),
//             SizedBox(
//               height: 90,
//             ),
//             FlatButton(
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Text(
//                   "Goto Next Stage",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               color: Colors.green,
//               shape: new RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(20.0)),
//               onPressed: () {
//                 screenProgress!.gotoNextStage();
//               },
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             FlatButton(
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Text(
//                   "Goto Previous Stage",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               color: Colors.green,
//               shape: new RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(20.0)),
//               onPressed: () {
//                 screenProgress!.gotoPreviousStage();
//               },
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             FlatButton(
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Text(
//                   "Fail Current Stage",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               color: Colors.green,
//               shape: new RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(20.0)),
//               onPressed: () {
//                 screenProgress!.failCurrentStage();
//               },
//             )
//           ],
//         ),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }