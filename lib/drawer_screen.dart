import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_screen.dart';

class DrawerScreenPage extends StatefulWidget {
  final Map userData;
  const DrawerScreenPage({required this.userData, Key? key}) : super(key: key);

  @override
  State<DrawerScreenPage> createState() => _DrawerScreenPageState();
}

class _DrawerScreenPageState extends State<DrawerScreenPage> {
  var userData;

  @override
  void didChangeDependencies() async {
    userData = widget.userData;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var auditorUserName = userData["auditorUser"]["auditorUserName"] ?? "";
    var email = userData["auditorUser"]['auditorUserEmail'] ?? "";
    var userNameInitial = "";
    if (auditorUserName != null && auditorUserName.toString().trim() != "") {
      userNameInitial = auditorUserName.toString().substring(0, 1);
    }
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        child: Drawer(
          width: 0.8 * size.width,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                // height: 65,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 141, 158, 255),
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(1.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: Center(
                              child: Text(
                                userNameInitial,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          auditorUserName,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 30, 30, 30),
                              fontSize: 18),
                        ),
                        Text(
                          email,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 30, 30, 30),
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                title: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Help and Support',
                    style: TextStyle(color: Color.fromARGB(255, 0, 37, 65)),
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(
                    Icons.help_outline,
                    color: Color.fromARGB(255, 0, 37, 65),
                  ),
                ),
                onTap: () async {
                  var url = 'https://www.googleplaystore.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 80, 0),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Rate the App',
                    style: TextStyle(color: Color.fromARGB(255, 0, 37, 65)),
                  ),
                ),
                leading: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(
                    Icons.star_rate_outlined,
                    color: Color.fromARGB(255, 0, 37, 65),
                  ),
                ),
                onTap: () async {
                  var url = 'https://play.google.com/store/games';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: const Text(
                    'Feedback',
                    // style: drawerEntryTextStyle,
                    style: TextStyle(color: Color.fromARGB(255, 0, 37, 65)),
                  ),
                ),
                leading: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(
                    Icons.thumb_up_off_alt,
                    color: Color.fromARGB(255, 0, 37, 65),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Share the App',
                    // style: drawerEntryTextStyle,
                    style: TextStyle(color: Color.fromARGB(255, 0, 37, 65)),
                  ),
                ),
                leading: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(
                    Icons.share,
                    color: Color.fromARGB(255, 0, 37, 65),
                  ),
                ),
                onTap: () {
                  Share.share('com.salesjinni.bigbuzz');
                },
              ),
              const Divider(
                thickness: 1,
                // indent: 16,
                // endIndent: 12,
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'About App',
                    // style: drawerEntryTextStyle,
                    style: TextStyle(color: Color.fromARGB(255, 0, 37, 65)),
                  ),
                ),
                leading: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(
                    Icons.list_alt_sharp,
                    color: Color.fromARGB(255, 0, 37, 65),
                  ),
                ),
                onTap: () async {
                  var url = 'https://www.googleplaystore.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Text(
                    'Logout',
                    // style: drawerEntryTextStyle,
                    style: TextStyle(color: Color.fromARGB(255, 0, 37, 65)),
                  ),
                ),
                leading: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(Icons.logout_rounded,
                      color: Color.fromARGB(255, 0, 37, 65)),
                ),
                onTap: () async {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.remove('_email');
                  // Navigator.pop(context);
                  // todo: pushPopUntil Apply here
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (c) => const LoginPage()));
                },
              ),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
