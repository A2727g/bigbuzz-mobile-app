// import 'package:bigbuzz/question_screen.dart';
// import 'package:bigbuzz/team_registration_screen.dart';
// import 'package:bigbuzz/videoplay_screen.dart';
// import 'package:flutter/material.dart';

// import 'cards_screen_model.dart';

// class IntroDataScreen extends StatelessWidget {
//   const IntroDataScreen({Key? key}) : super(key: key);

//   final String? totalSales = "00";
//   final String? totalEarnings = "00";
//   final String? addedLeads = "00";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shadowColor: Colors.transparent,
//         bottomOpacity: 0.0,
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.transparent,
//         actions: [
//           TextButton(
//               onPressed: () {},
//               child: Text(
//                 "Help?",
//                 style: TextStyle(
//                     color: Color.fromRGBO(
//                       108,
//                       74,
//                       182,
//                       0.76,
//                     ),
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600),
//               ))
//         ],
//         titleSpacing: 1,
//         title: Text(
//           "Freecharge",
//           style: TextStyle(
//               color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600),
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: Color.fromARGB(255, 0, 37, 65),
//             )),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.all(16),
//                 child: Card(
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           // mainAxisAlignment:MainAxisAlignment.spaceAround,
//                           children: [
//                             CircleAvatar(
//                               backgroundImage:
//                                   AssetImage("assets/image/freecharge2.jpg"),
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Text(
//                               "Freecharge",
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 0, 37, 65),
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             Spacer(),
//                             TextButton(
//                               // style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
//                               onPressed: () {},
//                               child: Row(
//                                 // mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Reports",
//                                     style: TextStyle(
//                                         color:
//                                             Color.fromARGB(255, 168, 164, 164)),
//                                   ),
//                                   Icon(Icons.arrow_forward_ios,
//                                       size: 14,
//                                       color:
//                                           Color.fromARGB(255, 168, 164, 164)),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // SizedBox(
//                       //   height: 0,
//                       // ),

//                       Divider(),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 Text(
//                                   "$totalSales",
//                                   style: TextStyle(
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w600,
//                                       color: Color.fromARGB(255, 0, 37, 65)),
//                                 ),
//                                 Text(
//                                   "Total Sales",
//                                   style: TextStyle(
//                                     fontSize: 8,
//                                     fontWeight: FontWeight.w600,
//                                     color: Color.fromRGBO(108, 74, 182, 0.88),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   "$totalEarnings",
//                                   style: TextStyle(
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w600,
//                                       color: Color.fromARGB(255, 0, 37, 65)),
//                                 ),
//                                 Text(
//                                   "Total Earnings",
//                                   style: TextStyle(
//                                       color: Color.fromRGBO(108, 74, 182, 0.88),
//                                       fontSize: 8,
//                                       fontWeight: FontWeight.w600),
//                                 )
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   "$addedLeads",
//                                   style: TextStyle(
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w600,
//                                       color: Color.fromARGB(255, 0, 37, 65)),
//                                 ),
//                                 Text(
//                                   "Added Leads",
//                                   style: TextStyle(
//                                       color: Color.fromRGBO(108, 74, 182, 0.88),
//                                       fontSize: 8,
//                                       fontWeight: FontWeight.w600),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 36,
//                 ),
//                 Text(
//                   "Instruction",
//                   style: TextStyle(
//                       fontSize: 8,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromRGBO(108, 74, 182, 0.88)),
//                 ),
//               ],
//             ),
//             Stack(
//               children: [
//                 Divider(),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 18, top: 6),
//                   child: Container(
//                     height: 4,
//                     width: 80,
//                     color: Color.fromRGBO(108, 74, 182, 0.88),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               // color: Colors.red,
//               width: MediaQuery.of(context).size.width,
//               padding: EdgeInsets.all(16),
//               child: Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "How to work",
//                           style: TextStyle(
//                               fontSize: 12, fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "1) Watch training video",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "2) Share the link with your customer",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "3) Ask the customer to open the shared link of Freecharge  and complete the process",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "4)  You have to submit the lead claim form in the app and add a Screenshot (The Application number must be visible)",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "5) Your lead will be tracked within 5-10 days from the date you submitted ",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "6) Your earnings will be added after the verification of your lead",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                       ]),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               padding: EdgeInsets.all(16),
//               child: Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Work Condition",
//                           style: TextStyle(
//                               fontSize: 12, fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "1) Only new users (User must not be an existing customer of IDFC Bank)",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "2) Self-employed users must be 27 years & above, with an ITR of 5 lacs with the mandate",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "3) Salaried users must be 25 years & above, with a minimum income of INR 30,000 per month",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "4) Customers complete the process by tracking URL",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "5) Cybil Score must be 750+ with valid documents",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "6) If the process is not continued then it should be continued with the same link else tracking would be broken and the lead will be rejected ",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "7) Customer phone number must be linked with Aadhaar card",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "8) Video KYC will be mandatory for IDFC First Credit Card verification",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "9) Only one Credit Card should be disbursed on the same device.",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         ),
//                       ]),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//         decoration: const BoxDecoration(color: Colors.white, boxShadow: [
//           BoxShadow(
//             color: Colors.grey,
//             blurRadius: 4.0,
//           ),
//         ]),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(132, 48),
//                   shape: RoundedRectangleBorder(
//                       side: const BorderSide(
//                         color: Color.fromARGB(255, 106, 74, 182),
//                         width: 0,
//                         // style: BorderStyle.solid
//                       ),
//                       borderRadius: BorderRadius.circular(14)),
//                   backgroundColor: const Color.fromARGB(255, 106, 74, 182),
//                 ),
//                 onPressed: () async {
//                   showDialog(
//                       context: context,
//                       builder: (context) =>
//                           const Center(child: CircularProgressIndicator()));
//                   await Future.delayed(const Duration(seconds: 2));
//                   await Future.delayed(
//                       const Duration(seconds: 0), () => Navigator.pop(context));
//                   await Future.delayed(
//                       const Duration(seconds: 0),
//                       () => Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute<void>(
//                             builder: (BuildContext context) =>
//                                 VideoPlayScreen(),
//                           )));
//                 },
//                 child: const Text(
//                   "Share Link",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w900),
//                 )),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(132, 48),
//                   shape: RoundedRectangleBorder(
//                       side: const BorderSide(
//                         color: Color.fromARGB(255, 106, 74, 182),
//                         width: 0,
//                         // style: BorderStyle.solid
//                       ),
//                       borderRadius: BorderRadius.circular(14)),
//                   backgroundColor: const Color.fromARGB(255, 106, 74, 182),
//                 ),
//                 onPressed: () async {
//                   showDialog(
//                       context: context,
//                       builder: (context) =>
//                           const Center(child: CircularProgressIndicator()));
//                   await Future.delayed(const Duration(seconds: 2));
//                   await Future.delayed(
//                       const Duration(seconds: 0), () => Navigator.pop(context));
//                   await Future.delayed(
//                       const Duration(seconds: 0),
//                       () => Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute<void>(
//                             builder: (BuildContext context) =>
//                                 TeamRegistrationPage(),
//                           )));
//                 },
//                 child: const Text(
//                   "+Add Lead",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w900),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
