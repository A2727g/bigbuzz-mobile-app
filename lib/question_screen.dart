import 'dart:convert';
import 'dart:io';
import 'package:bigbuzz/constants.dart';
import 'package:bigbuzz/models/answer_model.dart';
import 'package:bigbuzz/models/question_choice_model.dart';
import 'package:bigbuzz/models/question_data_model.dart';
import 'package:bigbuzz/models/questionnair_model.dart';
import 'package:bigbuzz/utils/prefill_text_editing_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:date_field/date_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

enum ValidateType {
  image,
  text,
  textarea,
  checkbox,
  radiobox,
  date,
}

File? imgFile;
final imgPicker = ImagePicker();

class QuestionScreenPage extends StatefulWidget {
  final Future<void> Function() fetchCampaignData;
  final int campaignId;
  final Map userData;

  const QuestionScreenPage(
      {required this.fetchCampaignData,
      required this.campaignId,
      required this.userData,
      super.key});
  @override
  State<QuestionScreenPage> createState() => _QuestionScreenPageState();
}

class _QuestionScreenPageState extends State<QuestionScreenPage> {
  final TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool validate = true;
  QuestionNairModel? questionnairData;
  List<AnswerModel> answersList = [];
  String? title;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void getCurrentPosition() async {
    //permissio
    LocationPermission permission = await Geolocator.checkPermission();
    // Position position = await Geolocator.getCurrentPosition
    //   (desiredAccuracy: LocationAccuracy.high);

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      logPrint.w('permission not given');
      LocationPermission asked = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      logPrint.w('la' + currentPosition.latitude.toString());
      logPrint.w('lo' + currentPosition.longitude.toString());
      // logPrint.w('aaaaaaaa');
    }
  }

  @override
  void initState() {
    print(widget.campaignId);
    setState(() {
      isLoading = true;
    });
    fetchQuestionData(campaignId: widget.campaignId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return isLoading
        ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
                strokeWidth: 2.5,
              ),
            ),
          )
        : Scaffold(
            // drawer: DrawerScreenPage(
            //   userData: widget.userData,
            // ),
            appBar: AppBar(
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
              backgroundColor: Colors.white,
              iconTheme: Theme.of(context)
                  .iconTheme
                  .copyWith(color: const Color.fromARGB(255, 0, 37, 65)),
              shadowColor: Colors.black,
              elevation: 2,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      questionnairData == null
                          ? ""
                          : questionnairData!.title ?? "",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 37, 65, 1.0)),
                    ),
                    // Text(
                    //   '10/1',
                    //   style: TextStyle(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w600,
                    //       color: Color.fromRGBO(0, 37, 65, 1.0)),
                    // )
                  ]),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (validate == false &&
                          (title == null || title!.trim() == ""))
                        Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              'Please provide an answer',
                              style: TextStyle(color: Colors.red),
                            )),
                      if (questionnairData != null &&
                          questionnairData!.questions.isNotEmpty)
                        Padding(
                            padding: EdgeInsets.only(left: 8.0, bottom: 12),
                            child: Text(
                              "1.Title",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            )),
                      if (questionnairData != null &&
                          questionnairData!.questions.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 15),
                          child: Center(
                            child: TextFormField(
                              // DEFAULT VALUE
                              keyboardType: TextInputType.text,
                              controller: _controller,
                              // PrefilTextEditingController.from(title ?? ""),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 12),
                                errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 37, 65, 1),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(14)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 37, 65, 1),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(14)),
                                filled: true,
                                hintText: 'Add Title',
                                hintStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(131, 145, 161, 1)),
                                fillColor: Colors.white,
                                border: const OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 37, 65, 1),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(14)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 37, 65, 1),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                              onSaved: (text) {
                                title = text;
                                // setState(() {});
                              },
                            ),
                          ),
                        ),
                      if (questionnairData != null &&
                          questionnairData!.questions.isNotEmpty)
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: questionnairData!.questions.length,
                            itemBuilder: (context, index) {
                              return _buildInputWidget(
                                questionData:
                                    questionnairData!.questions[index],
                                index: index + 2,
                              );
                            }),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
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
                    validate = true;
                    answersList.forEach((element) {
                      if (element.isFieldMandatory &&
                          !element.isDataValidated &&
                          !_formKey.currentState!.validate()) {
                        validate = false;
                        setState(() {});
                      }
                    });
                    print(validate);
                    if (validate) {
                      _formKey.currentState!.save();
                      await addLead();
                    }
                    // answersList.forEach((element) async {
                    //   if (element.imageFile != null) {
                    //     var responseBody =
                    //         await uploadFile(element.imageFile!);

                    //     print(responseBody);
                    //     if (responseBody != null &&
                    //         responseBody['data'].containsKey('file_url')) {
                    //       for (AnswerModel answer in answersList) {
                    //         if (answer.questionId == element.questionId) {
                    //           element.value =
                    //               responseBody['data']['file_url'];
                    //           if (answer.isFieldMandatory) {
                    //             answer.isDataValidated =
                    //                 answer.value != null && answer.value != ""
                    //                     ? true
                    //                     : false;
                    //             setState(() {});
                    //           }
                    //         }
                    //       }
                    //     }
                    //   }
                    // });

                    // validate = true;
                    // answersList.forEach((element) {
                    //   if (element.isFieldMandatory &&
                    //       !element.isDataValidated) {
                    //     validate = false;
                    //     setState(() {});
                    //   }
                    // });

                    // if (title == null || title == "") {
                    //   validate = false;
                    // }
                    // print(validate);
                    // if (validate) {
                    //   await addLead();
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      minimumSize: const Size(double.maxFinite, 52),
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Submit", style: TextStyle(fontSize: 20)),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget _buildInputWidget(
      {required QuestionDataModel questionData, required int index}) {
    var isDataNotValid = false;
    for (AnswerModel element in answersList) {
      if (questionData.questionId == element.questionId &&
          element.isFieldMandatory &&
          !element.isDataValidated) {
        isDataNotValid = true;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (validate == false && isDataNotValid)
          Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                'Please provide an answer',
                style: TextStyle(color: Colors.red),
              )),
        Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 10),
            child: Text(
              "$index.${questionData.question ?? ""}",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )),
        // TEXT
        if (questionData.questionType == 'text')
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Center(
              child: TextFormField(
                // DEFAULT VALUE
                controller: PrefilTextEditingController.from(
                    getAnswerValue(questionData.questionId!) ?? ""),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                      borderRadius: BorderRadius.circular(14)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                      borderRadius: BorderRadius.circular(14)),
                  filled: true,
                  hintText: 'Your answer',
                  hintStyle: const TextStyle(
                      fontSize: 14, color: Color.fromRGBO(131, 145, 161, 1)),
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                      borderRadius: BorderRadius.circular(14)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                      borderRadius: BorderRadius.circular(14)),
                ),
                onChanged: (text) {
                  var index = getAnswerIndex(questionData.questionId!);
                  if (index != null) {
                    answersList[index].value = text;

                    // validate
                    if (answersList[index].isFieldMandatory) {
                      answersList[index].isDataValidated =
                          answersList[index].value != null &&
                                  answersList[index].value != ""
                              ? true
                              : false;
                    }
                  }
                },
              ),
            ),
          ),
        // RADIO - GROUP
        if (questionData.questionType == "radio-group" &&
            questionData.questionChoices != null)
          for (QuestionChoiceModel choice in questionData.questionChoices!)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  activeColor: Colors.deepPurple,
                  value: choice.choiceValue,
                  groupValue: answersList
                      .where((answer) =>
                          answer.questionId == questionData.questionId)
                      .toList()
                      .first
                      .value,
                  onChanged: (value) {
                    var index = answersList.indexWhere((answer) =>
                        answer.questionId == questionData.questionId);

                    if (index != -1) {
                      setState(() {
                        answersList[index].value = value;
                        if (answersList[index].isFieldMandatory) {
                          answersList[index].isDataValidated =
                              answersList[index].value != null &&
                                      answersList[index].value != ""
                                  ? true
                                  : false;
                        }
                      });
                    }
                  },
                ),
                Text(
                  choice.choiceText ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
        // DATE  default value
        if (questionData.questionType == "date")
          StatefulBuilder(builder: (context, changeState) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: DateTimeFormField(
                mode: DateTimeFieldPickerMode.date,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                      borderRadius: BorderRadius.circular(14)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                      borderRadius: BorderRadius.circular(14)),
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.date_range),
                  labelText: 'Select date',
                  labelStyle: const TextStyle(
                      fontSize: 14, color: Color.fromRGBO(131, 145, 161, 1)),
                ),
                firstDate: DateTime(1950),
                lastDate: DateTime(2099),
                initialDate: getDateTimeFromString(
                    getAnswerValue(questionData.questionId!)),
                onDateSelected: (DateTime value) {
                  var index = getAnswerIndex(questionData.questionId!);
                  print(index);
                  if (index != null) {
                    answersList[index].value = value.toString();
                    if (answersList[index].isFieldMandatory) {
                      answersList[index].isDataValidated =
                          answersList[index].value != null &&
                                  answersList[index].value != ""
                              ? true
                              : false;
                    }
                    setState(() {});
                  }
                },
              ),
            );
          }),
        // CHECKBOX
        if (questionData.questionType == "checkbox-group" &&
            questionData.questionChoices != null)
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: questionData.questionChoices!.length,
            itemBuilder: (context, index) {
              var choiceValue =
                  questionData.questionChoices![index].choiceValue;
              var answerValue = getAnswerValue(questionData.questionId!);
              var choiceText =
                  questionData.questionChoices![index].choiceText ?? "";
              return Row(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.grey,
                    ),
                    child: Checkbox(
                        activeColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        value: answerValue == null
                            ? false
                            : answerValue == choiceValue
                                ? true
                                : false,
                        onChanged: (_) {
                          var index = getAnswerIndex(questionData.questionId!);
                          if (index != null) {
                            setState(() {
                              answersList[index].value = choiceValue;
                              if (answersList[index].isFieldMandatory) {
                                answersList[index].isDataValidated =
                                    answersList[index].value != null &&
                                            answersList[index].value != ""
                                        ? true
                                        : false;

                                print('${answersList[index].isDataValidated}');
                              }
                            });
                          }
                        }),
                  ),
                  Text(
                    choiceText,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              );
            },
          ),
        // IMAGE
        if (questionData.questionType == "image")
          Container(
            alignment: Alignment.center,
            width: 400,
            height: 200,
            child: DottedBorder(
              color: const Color.fromARGB(122, 133, 150, 164),
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              strokeWidth: 1,
              dashPattern: const [10, 8],
              child: Container(
                margin: const EdgeInsets.all(24.0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    if (getAnswerValue(questionData.questionId!) != null)
                      Expanded(
                        child: Image.network(
                          answersList
                              .where((element) =>
                                  element.questionId == questionData.questionId)
                              .toList()
                              .first
                              .value!,
                          scale: 0.8,
                          height: 140,
                          width: 280,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (getAnswerValue(questionData.questionId!) == null)
                      const Icon(
                        Icons.camera_alt_outlined,
                        size: 48,
                        color: Color.fromRGBO(133, 150, 164, 1),
                      ),
                    if (getAnswerValue(questionData.questionId!) == null)
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.grey[200]!),
                        ),
                        child: const Text(
                          textAlign: TextAlign.center,
                          "Take a photo or upload",
                          style: TextStyle(
                            color: Color.fromRGBO(108, 74, 182, 1),
                          ),
                        ),
                        onPressed: () {
                          showOptionsDialog(context, questionData);
                          getCurrentPosition();
                        },
                        // async {
                        //   ImagePicker imagePicker = ImagePicker();
                        //
                        //   var index =
                        //       getAnswerIndex(questionData.questionId!);
                        //   try {
                        //     final image = await imagePicker.pickImage(
                        //         source: ImageSource.gallery);
                        //     if (image != null && index != null) {
                        //       setState(() {
                        //         answersList[index].value = image.path;
                        //         answersList[index].imageFile =
                        //             File(image.path);
                        //       });
                        //       var responseBody =
                        //           await uploadFile(File(image.path));
                        //
                        //       print(responseBody);
                        //       if (responseBody != null &&
                        //           responseBody['data']
                        //               .containsKey('file_url')) {
                        //         for (AnswerModel answer in answersList) {
                        //           if (answer.questionId ==
                        //               questionData.questionId) {
                        //             answer.value =
                        //                 responseBody['data']['file_url'];
                        //             if (answer.isFieldMandatory) {
                        //               answer.isDataValidated =
                        //                   answer.value != null &&
                        //                           answer.value != ""
                        //                       ? true
                        //                       : false;
                        //               setState(() {});
                        //             }
                        //           }
                        //         }
                        //       }
                        //     }
                        //   } catch (e, s) {
                        //     logPrint.w(e, 'get image ticket form page $e $s');
                        //   }
                        // }
                      ),
                    if (getAnswerValue(questionData.questionId!) == null)
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
                    if (getAnswerValue(questionData.questionId!) != null)
                      InkWell(
                        onTap: () {
                          var index = getAnswerIndex(questionData.questionId!);
                          if (index != null) {
                            setState(() {
                              answersList[index].value = null;
                              answersList[index].isDataValidated = false;
                              answersList[index].imageFile = null;
                            });
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 250,
                          alignment: Alignment.center,
                          child: Text(
                            "Remove Image",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        //TEXT AREA
        if (questionData.questionType == "textarea")
          Container(
            padding: const EdgeInsets.only(left: 8),
            alignment: Alignment.center,
            child: TextFormField(
              minLines: 2,
              maxLines: 8,
              controller: PrefilTextEditingController.from(answersList
                      .where((element) =>
                          element.questionId == questionData.questionId)
                      .toList()
                      .first
                      .value ??
                  ""),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                    borderRadius: BorderRadius.circular(14)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                    borderRadius: BorderRadius.circular(14)),
                filled: true,
                hintText: 'Your answer...',
                hintStyle: const TextStyle(
                    fontSize: 14, color: Color.fromRGBO(131, 145, 161, 1)),
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                    borderRadius: BorderRadius.circular(14)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 37, 65, 1), width: 1),
                    borderRadius: BorderRadius.circular(14)),
              ),
              onChanged: (text) {
                var index = answersList.indexWhere(
                    (answer) => answer.questionId == questionData.questionId);
                if (index != -1) {
                  answersList[index].value = text;
                  if (answersList[index].isFieldMandatory) {
                    answersList[index].isDataValidated =
                        answersList[index].value != null &&
                                answersList[index].value != ""
                            ? true
                            : false;

                    print('${answersList[index].isDataValidated}');
                  }
                }
              },
            ),
          ),
        SizedBox(
          height: questionData.questionType == "radio-group" ? 10 : 20,
        ),
      ],
    );
  }

  Future<void> fetchQuestionData({required int campaignId}) async {
    var token = await getToken();

    final Uri uri =
        Uri.parse('https://api.bigbuzzapp.com/question/getQuestionnaire');

    var requestBody = {"campaign_id": campaignId.toString()};
    var headers = <String, String>{
      "Authorization": token!,
    };
    print('request body : $requestBody headers : $headers');
    final response = await http.post(
      uri,
      body: requestBody,
      headers: headers,
    );

    var responseBody = jsonDecode(response.body);

    logPrint.w(response.body, '1111');

    // print(responseBody);

    if (responseBody['meta']['code'] == 200) {
      Map<String, dynamic> data = responseBody['data'];
      questionnairData = QuestionNairModel.fromJson(data);
    } else {
      questionnairData = null;
      if (questionnairData == null) {
        Navigator.of(context).pop();
        Fluttertoast.showToast(
            msg: 'No Data Found',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.black,
            fontSize: 15);
      }
    }
    logPrint.w(responseBody['data']);
    if (questionnairData != null) {
      questionnairData!.questions.forEach((element) {
        answersList.add(AnswerModel(
          questionId: element.questionId!,
          value: element.questionType == "image"
              ? element.defaultValue == ""
                  ? null
                  : element.defaultValue
              : element.defaultValue,
          isFieldMandatory: element.isRequired == 1 ? true : false,
          isDataValidated:
              element.defaultValue != null && element.defaultValue != ""
                  ? true
                  : false,
        ));
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  // Future<dynamic> uploadFile(File? imageFile) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final String? token = prefs.getString('token');
  //   var imagePath = imageFile!.path;
  //   var request = await http.MultipartRequest(
  //       'POST', Uri.parse('https://api.bigbuzzapp.com/file/upload'));

  //   request.headers.putIfAbsent('Authorization', () => token!);

  //   request.files.add(await http.MultipartFile.fromPath(
  //     'file',
  //     imagePath,
  //   ));

  //   var res = await request.send();
  //   var streamDecodedValue = await utf8.decodeStream(res.stream);
  //   var responseBody = jsonDecode(streamDecodedValue);
  //   print(responseBody);
  //   if (responseBody['meta']['code'] == 200) {
  //     return responseBody;
  //   }
  // }
  // Future<dynamic> uploadFile(File? imageFile) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final String? token = prefs.getString('token');
  //   if (token == null) {
  //     return null;
  //   }
  //   var imagePath = imageFile?.path;
  //   if (imagePath == null) {
  //     return null;
  //   }
  //   final dio = Dio();
  //   dio.options.headers['Authorization'] = token;

  //   FormData formData = FormData.fromMap({
  //     'file': await MultipartFile.fromFile(imagePath, filename: 'image.jpg'),
  //   });

  //   var response = await dio.post(
  //     'https://api.bigbuzzapp.com/file/upload',
  //     data: formData,
  //   );

  //   var responseBody = response.data;
  //   print(responseBody);
  //   if (responseBody['meta']['code'] == 200) {
  //     return responseBody;
  //   }
  // }

  Future<dynamic> uploadFile(File? imageFile) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token == null) {
      return null;
    }
    var imagePath = imageFile?.path;
    if (imagePath == null) {
      return null;
    }
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://api.bigbuzzapp.com/file/upload'));

    request.headers['Authorization'] = token;

    request.files.add(await http.MultipartFile.fromPath('file', imagePath,
        contentType: MediaType('image', 'jpg')));

    var res = await request.send();
    var streamDecodedValue = await utf8.decodeStream(res.stream);
    var responseBody = jsonDecode(streamDecodedValue);
    print(responseBody);
    if (responseBody['meta']['code'] == 200) {
      return responseBody;
    }
  }

  Future<void> addLead() async {
    try {
      var token = await getToken();

      final Uri uri = Uri.parse('https://api.bigbuzzapp.com/survey/addLead');

      List answers = [];

      answersList.forEach((element) {
        answers.add(
          {
            "campaign_id": widget.campaignId,
            "question_id": element.questionId,
            "answer": element.value
          },
        );
      });

      var headers = <String, String>{
        "Authorization": token!,
      };

      print('request body : $answers headers : $headers');

      var body = {"tittle": title, "answers": json.encode(answers)};

      print(body);
      final response = await http.post(
        uri,
        body: body,
        headers: headers,
      );

      print(response);
      var responseBody = jsonDecode(response.body);
      if (responseBody['meta']['code'] == 200) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        await widget.fetchCampaignData();
        Fluttertoast.showToast(
          msg: "Lead Added successfully",
          backgroundColor: Colors.grey[100],
          textColor: Colors.deepPurple[800],
        );
      }
      print(responseBody);
    } catch (e, s) {
      logPrint.w('$e $s');
    }
  }

  Future<String?> getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    return token;
  }

  dynamic getAnswerValue(int questionId) {
    dynamic value = answersList
        .where((element) => element.questionId == questionId)
        .toList()
        .first
        .value;

    return value;
  }

  int? getAnswerIndex(int questionId) {
    var index =
        answersList.indexWhere((answer) => answer.questionId == questionId);

    return index != -1 ? index : index;
  }

  DateTime getDateTimeFromString(String? date) {
    if (date != null && date != "") {
      return DateTime.now();
    }
    return DateTime.now();
  }

  /// ImagePicker Function

  Future<void> showOptionsDialog(
      BuildContext context, QuestionDataModel questionData) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Options"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Capture Image From Camera"),
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) =>
                              const Center(child: CircularProgressIndicator()));
                      openCamera(questionData);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Take Image From Gallery"),
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) =>
                              const Center(child: CircularProgressIndicator()));
                      openGallery(questionData);
                      getCurrentPosition();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void openCamera(QuestionDataModel questionData) async {
    ImagePicker imagePicker = ImagePicker();

    var index = getAnswerIndex(questionData.questionId!);
    try {
      final image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image != null && index != null) {
        answersList[index].value = image.path;
        answersList[index].imageFile = File(image.path);

        var responseBody = await uploadFile(File(image.path));

        print(responseBody);
        if (responseBody != null &&
            responseBody['data'].containsKey('file_url')) {
          for (AnswerModel answer in answersList) {
            if (answer.questionId == questionData.questionId) {
              answer.value = responseBody['data']['file_url'];
              if (answer.isFieldMandatory) {
                answer.isDataValidated =
                    answer.value != null && answer.value != "" ? true : false;
                setState(() {});
                Navigator.pop(context);
              }
            }
          }
        }
      }
    } catch (e, s) {
      logPrint.w(e, 'get image ticket form page $e $s');
    }
  }

  void openGallery(QuestionDataModel questionData) async {
    ImagePicker imagePicker = ImagePicker();
    var index = getAnswerIndex(questionData.questionId!);
    try {
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null && index != null) {
        answersList[index].value = image.path;
        answersList[index].imageFile = File(image.path);

        var responseBody = await uploadFile(File(image.path));

        print(responseBody);
        if (responseBody != null &&
            responseBody['data'].containsKey('file_url')) {
          for (AnswerModel answer in answersList) {
            if (answer.questionId == questionData.questionId) {
              answer.value = responseBody['data']['file_url'];
              if (answer.isFieldMandatory) {
                answer.isDataValidated =
                    answer.value != null && answer.value != "" ? true : false;
                setState(() {});
                Navigator.pop(context);
              }
            }
          }
        }
      }
    } catch (e, s) {
      logPrint.w(e, 'get image ticket form page $e $s');
    }
  }

  Widget displayImage() {
    if (imgFile == null) {
      return Text("No Image Selected!");
    } else {
      return Image.file(imgFile!, width: 350, height: 350);
    }
  }
}
