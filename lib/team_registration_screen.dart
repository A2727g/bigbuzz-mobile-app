import 'dart:convert';

import 'package:camera_camera/camera_camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bigbuzz/drawer_screen.dart';
import 'dart:io';
import 'package:bigbuzz/view_lead.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeamRegistrationPage extends StatefulWidget {
  final int campaignId;
  const TeamRegistrationPage({required this.campaignId, Key? key})
      : super(key: key);
  @override
  TeamRegistrationPageState createState() => TeamRegistrationPageState();
}

class TeamRegistrationPageState extends State<TeamRegistrationPage> {
  TextEditingController _date = TextEditingController();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1991),
      lastDate: DateTime(2050),
    );
  }

  File imageFile1 =
      File('/data/user/0/app.acceso.tickets/cache/CAP6338104701464370266.jpg');
  bool showImage1 = false;
  File imageFile2 =
      File('/data/user/0/app.acceso.tickets/cache/CAP6338104701464370267.jpg');
  bool showImage2 = false;
  File imageFile3 =
      File('/data/user/0/app.acceso.tickets/cache/CAP6338104701464370268.jpg');
  bool showImage3 = false;
  File imageFile4 =
      File('/data/user/0/app.acceso.tickets/cache/CAP6338104701464370269.jpg');
  bool showImage4 = false;
  String? itemValue;
  String? billMaterialValue;
  String? causeValue;
  String? rectificationValue;
  String? descValue;
  var userData;
  myDropDeco(String hintText) => DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ));
  final _formKey = GlobalKey<FormState>();

  Future<void> getUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var token = sharedPreferences.getString('token');
    userData = json.decode(
        ascii.decode(base64.decode(base64.normalize(token!.split(".")[1]))));
    setState(() {});
  }

  @override
  void didChangeDependencies() async {
    await getUserData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: DrawerScreenPage(userData: userData),
        appBar: AppBar(
          iconTheme: Theme.of(context)
              .iconTheme
              .copyWith(color: const Color.fromARGB(255, 0, 37, 65)),
          backgroundColor: Colors.white,
          elevation: 2,
          title: const Text(
            'Team Registration Form',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color.fromRGBO(0, 37, 65, 1.0)),
          ),
        ),
        body: Form(
          key: _formKey,
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus!.unfocus();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      child: Center(
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: 'Your answer',
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              labelText: 'BUSINESS / INDIVIDUAL NAME',
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(131, 145, 161, 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            validator: (value) {
                              // var validate;
                              if (value!.isEmpty) {
                                return ('Enter your Business/ Individual Name');
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      child: Center(
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: 'Your answer',
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              labelText: 'OWNER NAME',
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(131, 145, 161, 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ('Enter your Owner Name');
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      child: Center(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: 'Your answer',
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              labelText: 'OWNER CONTACT NO.',
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(131, 145, 161, 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            validator: (value) {
                              if (value!.isEmpty || value.length > 9) {
                                return 'Enter Number only 10 digit';
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      child: Center(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: 'Your answer',
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              labelText: 'OWNER AADHAAR NO.',
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(131, 145, 161, 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(12)
                            ],
                            validator: (value) {
                              if (value!.isEmpty || value.length > 11) {
                                return 'Enter Number Only';
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      child: Center(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: 'Choose',
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              labelText: 'Email ID',
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(131, 145, 161, 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            validator: (value) {
                              // var validate;
                              if (value!.isEmpty) {
                                return ('Enter your Email');
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      // height: 56,
                      child: Center(
                        child: TextFormField(
                            controller: _date,
                            onTap: () async {
                              context:
                              context;
                              DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1991),
                                lastDate: DateTime(2090),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: Color.fromARGB(
                                            255, 106, 74, 182), // <-- SEE HERE
                                        onPrimary: Colors.white, // <-- SEE HERE
                                        onSurface: Colors.black, // <-- SEE HERE
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                            // primary: Colors.deepPurpleAccent, // button text color
                                            ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickeddate != null) {
                                setState(() {
                                  _date.text = DateFormat("dd-MM-yyy")
                                      .format(pickeddate);
                                });
                              }
                            },
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  context;
                                  DateTime? pickeddate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1991),
                                    lastDate: DateTime(2090),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary: Color.fromARGB(255, 106,
                                                74, 182), // <-- SEE HERE
                                            onPrimary:
                                                Colors.white, // <-- SEE HERE
                                            onSurface:
                                                Colors.black, // <-- SEE HERE
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                                // primary: Colors.deepPurpleAccent, // button text color
                                                ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                  if (pickeddate != null) {
                                    setState(() {
                                      _date.text = DateFormat("dd-MM-yyy")
                                          .format(pickeddate);
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.grey,
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: 'DD - MM - YY',
                              hintStyle: const TextStyle(fontSize: 10),
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              labelText: 'COMPANY REGISTRATION DATE / DOB',
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(131, 145, 161, 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ('Enter your Registration Date');
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      child: Center(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: 'Your answer',
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              labelText: 'GST NO. / PAN NO.',
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(131, 145, 161, 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100)
                            ],
                            validator: (value) {
                              // var validate;
                              if (value!.isEmpty) {
                                return ('Enter GST No./ PAN No.');
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      child: Center(
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: 'Your answer',
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              labelText: 'CITY',
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(131, 145, 161, 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100)
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ('Enter your City');
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'PHOTO ID OF OWNER                                                                                                     '
                        '(AADHAR CARD OF DRIVING LICENCE-FRONT'
                        ' & BACK OF ANY OF THE DIRECTION OR PROPRIETOR OR PARTNER',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 400,
                        height: 200,
                        child: SizedBox.expand(
                          child: DottedBorder(
                            color: const Color.fromARGB(122, 133, 150, 164),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            strokeWidth: 1,
                            dashPattern: const [10, 8],
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  children: [
                                    if (showImage1)
                                      Image.file(
                                        imageFile1,
                                        scale: 0.8,
                                        height: 140,
                                        width: 280,
                                        fit: BoxFit.cover,
                                      ),
                                    if (!showImage1)
                                      const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 48,
                                        color: Color.fromRGBO(133, 150, 164, 1),
                                      ),
                                    if (!showImage1)
                                      TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    Colors.grey[200]!),
                                          ),
                                          child: const Text(
                                            textAlign: TextAlign.center,
                                            "Take a photo or upload",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  108, 74, 182, 1),
                                            ),
                                          ),
                                          onPressed: () async {
                                            var returnFile =
                                                await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            CameraCamera(
                                                              onFile: (file) {
                                                                Navigator.pop(
                                                                    context,
                                                                    file);
                                                              },
                                                            )));
                                            setState(() {
                                              imageFile1 = returnFile;
                                              showImage1 = true;
                                            });
                                          }),
                                    if (!showImage1)
                                      const SizedBox(
                                        width: 250,
                                        child: FittedBox(
                                          child: Text(
                                            "file extensions supported, pdf, doc, docx, jpeg, jpg, png",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black45),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          'AADHAR PHOTO                                                                                                                  '
                          '(FRONT & BACK PHOTO OF AADHAR)                                                                                                   '
                          'ADD FILE',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 400,
                        height: 200,
                        child: SizedBox.expand(
                          child: DottedBorder(
                            color: const Color.fromARGB(122, 133, 150, 164),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            strokeWidth: 1,
                            dashPattern: const [10, 8],
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  children: [
                                    if (showImage2)
                                      Image.file(
                                        imageFile2,
                                        scale: 0.8,
                                        height: 140,
                                        width: 280,
                                        fit: BoxFit.cover,
                                      ),
                                    if (!showImage2)
                                      const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 48,
                                        color: Color.fromRGBO(133, 150, 164, 1),
                                      ),
                                    if (!showImage2)
                                      TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    Colors.grey[200]!),
                                          ),
                                          child: const Text(
                                            textAlign: TextAlign.center,
                                            "Take a photo or upload",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  108, 74, 182, 1),
                                            ),
                                          ),
                                          onPressed: () async {
                                            var returnFile =
                                                await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            CameraCamera(
                                                              onFile: (file) {
                                                                Navigator.pop(
                                                                    context,
                                                                    file);
                                                              },
                                                            )));
                                            setState(() {
                                              imageFile2 = returnFile;
                                              showImage2 = true;
                                            });
                                          }),
                                    if (!showImage2)
                                      const SizedBox(
                                        width: 250,
                                        child: FittedBox(
                                          child: Text(
                                            "file extensions supported, pdf, doc, docx, jpeg, jpg, png",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black45),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'GST CERTIFICATE OF COMPANY',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 400,
                        height: 200,
                        child: SizedBox.expand(
                          child: DottedBorder(
                            color: const Color.fromARGB(122, 133, 150, 164),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            strokeWidth: 1,
                            dashPattern: const [10, 8],
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  children: [
                                    if (showImage3)
                                      Image.file(
                                        imageFile3,
                                        scale: 0.8,
                                        height: 140,
                                        width: 280,
                                        fit: BoxFit.cover,
                                      ),
                                    if (!showImage3)
                                      const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 48,
                                        color: Color.fromRGBO(133, 150, 164, 1),
                                      ),
                                    if (!showImage3)
                                      TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    Colors.grey[200]!),
                                          ),
                                          child: const Text(
                                            textAlign: TextAlign.center,
                                            "Take a photo or upload",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  108, 74, 182, 1),
                                            ),
                                          ),
                                          onPressed: () async {
                                            var returnFile =
                                                await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            CameraCamera(
                                                              onFile: (file) {
                                                                Navigator.pop(
                                                                    context,
                                                                    file);
                                                              },
                                                            )));
                                            setState(() {
                                              imageFile3 = returnFile;
                                              showImage3 = true;
                                            });
                                          }),
                                    if (!showImage3)
                                      const SizedBox(
                                        width: 250,
                                        child: FittedBox(
                                          child: Text(
                                            "file extensions supported, pdf, doc, docx, jpeg, jpg, png",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black45),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'CANCELLED CHEQUE',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                          Text('(COMPANY NAME SHOULD BE DISPLAYED),')
                        ]),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 400,
                        height: 200,
                        child: SizedBox.expand(
                          child: DottedBorder(
                            color: const Color.fromARGB(122, 133, 150, 164),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            strokeWidth: 1,
                            dashPattern: const [10, 8],
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  children: [
                                    if (showImage4)
                                      Image.file(
                                        imageFile4,
                                        scale: 0.8,
                                        height: 140,
                                        width: 280,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    if (!showImage4)
                                      const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 48,
                                        color: Color.fromRGBO(133, 150, 164, 1),
                                      ),
                                    if (!showImage4)
                                      TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    Colors.grey[200]!),
                                          ),
                                          child: const Text(
                                            textAlign: TextAlign.center,
                                            "Take a photo or upload",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  108, 74, 182, 1),
                                            ),
                                          ),
                                          onPressed: () async {
                                            var returnFile =
                                                await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            CameraCamera(
                                                              onFile: (file) {
                                                                Navigator.pop(
                                                                    context,
                                                                    file);
                                                              },
                                                            )));
                                            setState(() {
                                              imageFile4 = returnFile;
                                              showImage4 = true;
                                            });
                                          }),
                                    if (!showImage4)
                                      const SizedBox(
                                        width: 250,
                                        child: FittedBox(
                                          child: Text(
                                            "file extensions supported, pdf, doc, docx, jpeg, jpg, png",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black45),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      child: Center(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: 'Your answer',
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              labelText: 'BENEFICIARY NAME',
                              labelStyle: const TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            validator: (value) {
                              // var validate;
                              if (value!.isEmpty) {
                                return ('Enter Beneficiary Name');
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      child: Center(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: 'Your answer',
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                              labelText: 'BENEFICIARY ACCOUNT NO.',
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(131, 145, 161, 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(0, 37, 65, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ('Enter Beneficiary Account No.');
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 44,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 10.0,
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ElevatedButton(
              onPressed: () async {
                final isValidForm = _formKey.currentState!.validate();
                if (isValidForm) {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          const Center(child: CircularProgressIndicator()));
                  await Future.delayed(
                      const Duration(seconds: 2),
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                // Teamregistration()
                                ViewLeadScreen(campaignId: widget.campaignId),
                          )));
                } else {
                  Fluttertoast.showToast(
                      msg: 'Value should not empty',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.black,
                      fontSize: 15);
                }
              },
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  minimumSize: const Size(double.maxFinite, 52),
                  backgroundColor: const Color.fromRGBO(108, 74, 182, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Submit", style: TextStyle(fontSize: 16)),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
