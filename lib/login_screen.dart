import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:bigbuzz/utils/light_custom_bar.dart;
import 'constants.dart';

// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'cards_screen_model.dart';
// import 'card_screeen_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController admin_email = TextEditingController();
  final TextEditingController user_password = TextEditingController();
  // late String email;
  // late String password;
  var isObscured;
  bool visible = true;
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  @override
  void initState() {
    super.initState();
    isObscured = true;
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    width: 0.65 * size.width,
                    child: const FittedBox(
                      child: Text(
                        'login to continue',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 36,
                            color: Color.fromARGB(255, 0, 37, 65)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const SizedBox(
                    height: 72,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autofocus: true,
                    // autocorrect: true,
                    // keyboardType: TextInputType.number,
                    controller: admin_email,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Enter your email",
                      hintStyle: const TextStyle(fontSize: 12),
                      fillColor: Colors.black54,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color:
                                Color.fromARGB(255, 0, 37, 65)), //<-- SEE HERE
                      ),
                      labelText: "email",
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(131, 145, 161, 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 37, 65),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      isDense: true,
                      prefixIconConstraints:
                          BoxConstraints(minWidth: 40, minHeight: 0),
                      // border: InputBorder.none,
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(200)],
                    validator: validateEmail,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: isObscured,
                    // keyboardType: TextInputType.number,
                    controller: user_password,
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: const TextStyle(fontSize: 12),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        // filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(
                                  255, 0, 37, 65)), //<-- SEE HERE
                        ),
                        labelText: "password",
                        labelStyle: const TextStyle(
                            color: Color.fromRGBO(131, 145, 161, 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 37, 65),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        isDense: true,
                        suffixIcon: IconButton(
                            padding: EdgeInsetsDirectional.only(end: 12.0),
                            // myIcon is a 48px-wide widget.
                            icon: isObscured
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Color.fromARGB(255, 141, 114, 225),
                                  ),
                            onPressed: () {
                              setState(() {
                                isObscured = !isObscured;
                              });
                            })),
                    inputFormatters: [LengthLimitingTextInputFormatter(30)],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  // Container(
                  //   // padding: const EdgeInsets.only(left: 8),
                  //   alignment: Alignment.bottomRight,
                  //   // height: 28,
                  //   // child: TextButton(
                  //   //   onPressed: () {},
                  //   //   child: const Text(
                  //   //     "forget password?",
                  //   //     style: TextStyle(
                  //   //         color: Color.fromARGB(255, 141, 114, 225)),
                  //   //   ),
                  //   // ),
                  // ),
                  const SizedBox(
                    height: 144,
                  ),
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        // if (user_password.text.isEmpty ||
                        //     admin_email.text.isEmpty) {
                        //   Fluttertoast.showToast(
                        //     msg: "Entries should not be empty",
                        //     backgroundColor: Colors.grey[100],
                        //     textColor: Colors.red[800],
                        //   );
                        //   // return;
                        // } else {

                        // }

                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          logPrint.w('bigbuzzzzzzzzzz');
                          var response = await login(
                              admin_email.text.toString(),
                              user_password.text.toString());
                          var responseBody = json.decode(response.body);
                          // lightCustomBar();

                          if (responseBody['meta']['message'] != "") {
                            Fluttertoast.showToast(
                              msg: responseBody['meta']['message'],
                              backgroundColor: Colors.grey[100],
                              textColor: Colors.red[800],
                            );
                          }

                          if (responseBody['meta']['code'] == 200) {
                            final SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setString(
                                '_email', admin_email.text);

                            showDialog(
                                context: context,
                                builder: (context) => const Center(
                                    child: CircularProgressIndicator()));
                            await Future.delayed(const Duration(seconds: 2),
                                () => Navigator.of(context).pop());

                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  // Teamregistration()
                                  const CardScreenPage(),
                            ));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: admin_email.text.isEmpty ||
                                  user_password.text.isEmpty
                              ? Color.fromARGB(255, 177, 156, 227)
                              : Color.fromARGB(255, 108, 74, 182),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<http.Response> login(String admin_email, user_password) async {
    logPrint.w('yyyyyigbuzzzzzzzzzzz');

    var response = await http.post(
        Uri.parse('https://api.bigbuzzapp.com/login/loginAppUser'),
        body: {
          'email': admin_email,
          'password': user_password,
        });
    logPrint.w(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      var token = data['token'];
      // NEW CHANGES
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', token);
      //
      print('Login successfully');
    } else {
      print('failed');
    }
    return response;
  }
}
