import 'dart:convert';
import 'dart:math';
import 'package:bigbuzz/utils/ticket_card.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'package:bigbuzz/bottom_sheet.dart';
import 'package:bigbuzz/videoplay_screen.dart';
import 'drawer_screen.dart';
import 'filter_widget.dart';
import 'models/filter_params_model.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class CardScreenPage extends StatefulWidget {
  const CardScreenPage({Key? key}) : super(key: key);

  @override
  State<CardScreenPage> createState() => _CardScreenPageState();
}

class _CardScreenPageState extends State<CardScreenPage> {
  List ticketList = [];
  var userData;
  bool isLoading = false;

  FilterParams? filterParams;

  Future<void> getUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();



    var token = sharedPreferences.getString('token');
    userData = json.decode(
        ascii.decode(base64.decode(base64.normalize(token!.split(".")[1]))));
    setState(() {});
    print(token);
  }

  String getDate(String? date) {
    if (date != null) {
      var value = date.toString().split('T').toList().first;
      var formattedDate = DateFormat('d MMM y', 'en_US')
          .format(DateTime(
              int.parse(value.toString().split('-')[0]),
              int.parse(value.toString().split('-')[1]),
              int.parse(value.toString().split('-')[2])))
          .toString();
      return formattedDate;
    }
    return '';
  }

  @override
  void didChangeDependencies() async {
    await fetchAndSetData();
    super.didChangeDependencies();
  }

  Future<void> fetchAndSetData() async {
    setLoader(true);
    await getUserData();
    await fetchStates();
    await fetchCampaign(null);
  }

  void setLoader(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  Future<dynamic> fetchStates() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var token = sharedPreferences.getString('token');

    var headers = {"Authorization": token!};

    var res = await http.post(
      Uri.parse("https://api.bigbuzzapp.com/state/getState"),
      headers: headers,
    );
    var responseBody = json.decode(res.body);
    print(responseBody);
    if (responseBody['meta']['code'] == 200) {
      List states = [];
      responseBody['data'].forEach((element) {
        states.add(element['state_name']);
      });
      filterParams = FilterParams.initial(status: states);
    }
    print(json.decode(res.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreenPage(userData: userData ?? {}),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: const Color.fromARGB(255, 0, 37, 65)),
        title: TextFormField(
          decoration: InputDecoration(
              hintText: "Search Campaign",
              hintStyle: TextStyle(
                  color: Color.fromARGB(255, 131, 145, 161),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
              border: InputBorder.none),
          // onChanged: ticketList,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => FilterWidget(
                          filterParams: filterParams,
                          filterData: fetchCampaign),
                    )).then((value) {
                  if (value != null) {
                    filterParams = value;

                    ///update orders on the basis of filters here
                  }
                });
              },
              icon: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Icon(
                  Icons.filter_alt_outlined,
                  color: Color.fromARGB(255, 0, 37, 65),
                ),
              )),
        ],
      ),
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: isLoading
            ? Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.deepPurple,
                  ),
                ),
              )
            : (ticketList.isNotEmpty)
                ? ListView.builder(
                    itemCount: ticketList.length, //No. of tickets
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          TicketCard(
                            img: '${ticketList[index]['img']}',
                            location: ticketList[index]['campaign_location'] ==
                                    null
                                ? ""
                                : '${ticketList[index]['campaign_location']}',
                            ticketCategory:
                                '${ticketList[index]['campaign_description']}',
                            ticketCampaignTitle:
                                '${ticketList[index]['campaign_title']}',
                            startDate:
                                getDate('${ticketList[index]['start_date']}'),
                            endDate:
                                getDate('${ticketList[index]['end_date']}'),
                            compaignStatus:
                                '${ticketList[index]['campaign_status']}',
                            campaignId: ticketList[index]["campaign_id"],
                            userData: userData,
                            campaignDescription:
                                ticketList[index]['campaign_description'] ?? "",
                            campaignIntroVideoUrl: ticketList[index]
                                    ['campaign_intro_video_url'] ??
                                "",
                            compaignDuration:
                                ticketList[index]['campaign_duration'] ?? "",
                            fetchCampaignData: fetchAndSetData,
                          ),
                          if (index == ticketList.length - 1)
                            const SizedBox(
                              height: 160,
                            )
                        ],
                      );
                    })
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 280,
                            child: Image.asset(
                                fit: BoxFit.cover, "assets/image/empty.png")),
                        Text(
                          'Oops!',
                          style: TextStyle(
                              color: Color.fromARGB(255, 131, 145, 161),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Campaign not found !",
                          style: TextStyle(
                              color: Color.fromARGB(255, 131, 145, 161),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }

  Future<dynamic> fetchCampaign(Map? filterData) async {

   logPrint.w(filterData);

    // logPrint.w(ticketList);


    var endPoint = "getCampaignByFos";

    setFilterParams(filterData);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var headers = <String, String>{
      "Authorization": token!,
    };

    var body = {};

    if (filterData != null && filterData.keys.length != 0) {
      if (filterData.containsKey('date')) {
        body.addAll({'start_date': filterData['date']});
      }
      if (filterData.containsKey('location')) {
        body.addAll({
          'location': json.encode(["${filterData['location']}"])
        });
      }
    }
    String url = "https://api.bigbuzzapp.com/campaign/$endPoint";
    print(url);
    logPrint.w(body);
    final response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    print(json.decode(response.body));

    // If the server did return a 200 OK response,
    // then parse the JSON.
    var responseBody = jsonDecode(response.body);
    print(responseBody);
    if (responseBody['meta']['code'] == 200) {
      ticketList.addAll(responseBody!['data']);
      setLoader(false);


      return jsonDecode(response.body);
    } else {
      print('//////////EMPTY');
      ticketList = [];
      setLoader(false);
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  setFilterParams(Map? filterData) {
    if (filterData != null) {
      filterParams = filterParams!.copyWith(
          fromDate: filterData['date'], selectedStatus: filterData['location']);
    }
  }
}
