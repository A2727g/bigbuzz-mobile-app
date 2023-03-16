import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bigbuzz/constants.dart';
import 'package:bigbuzz/drawer_screen.dart';
import 'package:bigbuzz/team_registration_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_feedback_screen.dart';
import 'package:http/http.dart' as http;
import 'bottom_sheet.dart';

// state full class
class ViewLeadScreen extends StatefulWidget {
  final int campaignId;
  const ViewLeadScreen({required this.campaignId, Key? key}) : super(key: key);

  @override
  State<ViewLeadScreen> createState() => _ViewLeadScreenState();
}

class _ViewLeadScreenState extends State<ViewLeadScreen> {
  bool isLoading = false;
  List ticketList = [];
  var userData;
  // FilterParams filterParams = FilterParams.initial();

  @override
  void initState() {
    super.initState();
  }

  Future<void> getUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var token = sharedPreferences.getString('token');
    userData = json.decode(
        ascii.decode(base64.decode(base64.normalize(token!.split(".")[1]))));
    print(userData);
    setState(() {});
    print(token);
  }

  Future<void> fetchLeadData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var token = sharedPreferences.getString('token');

    Map<String, String> headers = {"Authorization": token!};

    Uri url = Uri.parse("https://api.bigbuzzapp.com/survey/getLead");

    var response = await http.post(url,
        body: {
          "campaign_id": widget.campaignId.toString(),
        },
        headers: headers);

    print(json.decode(response.body));
    var responseBody = json.decode(response.body);

    if (responseBody['meta']['code'] == 200) {
      var data = responseBody['data'];
      ticketList = data;
    } else {
      ticketList = [];
    }
  }

  @override
  void didChangeDependencies() async {
    setLoader(true);
    // TODO: implement didChangeDependencies
    await getUserData();
    await fetchLeadData();
    setLoader(false);
    super.didChangeDependencies();
  }

  void setLoader(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: isLoading
          ? Container()
          : DrawerScreenPage(
              userData: userData,
            ),
      appBar: AppBar(
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: const Color.fromARGB(255, 0, 37, 65)),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 4,
        title: const Text(
          'View lead',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(0, 37, 65, 1.0)),
        ),
      ),
      body: isLoading
          ? Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              ),
            )
          : ticketList.isNotEmpty
              ? ListView.builder(
                  itemCount: ticketList.length, //No. of tickets
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (ticketList[index]['feedback'] != null) {
                          _showModalBottomSheet(
                              context, ticketList[index]['feedback']);
                        }
                      },
                      child: Column(
                        children: [
                          TicketCard(
                            status1: '${ticketList[index]['status']}',
                            status2: '${ticketList[index]['status']}',
                            ticketCategory:
                                '${ticketList[index]['ticketCategory']} ',
                            ticketName: '${ticketList[index]['tittle']}',
                            createdAt: ticketList[index]['created_at'],
                            updatedAt: ticketList[index]['updated_at'],
                            campaignId: widget.campaignId,
                          ),
                          if (index == ticketList.length - 1)
                            const SizedBox(
                              height: 160,
                            )
                        ],
                      ),
                    );
                  })
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 280,
                          child: Image.asset('assets/image/empty.png')),
                      const Text(
                        'Oops!'
                        'Lead not Found!',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
    );
  }

  _showModalBottomSheet(BuildContext context, String? feedBack) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        // controller: DraggableScrollableController(),
        expand: false,
        initialChildSize: 0.3,
        maxChildSize: 0.31,
        minChildSize: 0.01,
        builder: (context, scrollController) => SingleChildScrollView(
          child: BottomFeedbackPage(feedBack: feedBack ?? ""),
        ),
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  const TicketCard(
      {super.key,
      this.ticketName,
      this.ticketCategory,
      this.status1,
      this.status2,
      this.dateTime,
      required this.campaignId,
      this.createdAt,
      this.updatedAt});
  final String? ticketName;
  final String? ticketCategory;
  final String? status1;
  final String? status2;
  final String? dateTime;
  final int campaignId;
  final String? updatedAt;
  final String? createdAt;

  static const Map<String, Color> statusColorMap = {
    'open': ColorConstants.openStatus,
    'approved': ColorConstants.expediteStatus2,
    'pending': ColorConstants.pendingStatus,
    'rejected': ColorConstants.rejectedStatus,
  };

  static const Map<String, Color> ticketColorMap = {
    'e': ColorConstants.eTicketName,
    'a': ColorConstants.aTicketName,
    'w': ColorConstants.wTicketName,
    'c': ColorConstants.aTicketName,
  };
  static const Map<String, Color> status2ColorMap = {
    'expedite': ColorConstants.expediteStatus2,
  };
  static const Map<String, Color> statusTextColorMap = {
    'expedite': ColorConstants.expediteStatusText,
  };
  static const Map<String, Color> status1ColorMap = {
    'open': ColorConstants.openStatus1,
    'approved': ColorConstants.approvedStatus,
    'pending': ColorConstants.pendingStatus1,
    'rejected': ColorConstants.inProcessStatus1,
  };

  @override
  Widget build(BuildContext context) {
    var date;

    if (updatedAt != null) {
      var value = updatedAt.toString().split('T')[0];
      date = DateTime(int.parse(value.split('-')[0]),
          int.parse(value.split('-')[2]), int.parse(value.split('-')[1]));
    }

    if (updatedAt == null && createdAt != null) {
      var value = createdAt.toString().split('T')[0];

      date = DateTime(int.parse(value.split('-')[0]),
          int.parse(value.split('-')[2]), int.parse(value.split('-')[1]));
    }
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(
                      maxHeight: 44,
                      maxWidth: 44,
                    ),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey, width: 1),
                        color: ticketColorMap[ticketName![0].toLowerCase()]
                            ?.withOpacity(0.7)),
                    child: Text(
                      ticketName != null && ticketName != ""
                          ? ticketName.toString().substring(0, 1)
                          : "",
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticketName ?? '',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Updated:',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          Text(
                            date != null
                                ?
                                // dateTime??''.
                                DateFormat("  dd/MMM/yyyy").format(date)
                                : "",
                            textAlign: TextAlign.left,
                            style: textTheme.labelLarge!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            decoration: BoxDecoration(
                                border: const Border(),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                color: statusColorMap[status1!.toLowerCase()]),
                            child: Text(
                              '$status1',
                              style: textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 8,
                                  color:
                                      status1ColorMap[status1!.toLowerCase()]),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          if (status2!.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              decoration: BoxDecoration(
                                border: const Border(),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                color: status2ColorMap[status2!.toLowerCase()]
                                    ?.withOpacity(0.5),
                              ),
                            )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  status1 == 'REJECTED'
                      ? const Divider(
                          color: Colors.black12,
                          height: 2,
                          thickness: 1,
                        )
                      : const SizedBox.shrink(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        status1 == 'REJECTED'
                            ? const Text(
                                'Photo click for a shop to a vender...... ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(91, 96, 101, 1)),
                              )
                            : const SizedBox.shrink(),
                        Row(children: [
                          status1 == 'REJECTED'
                              ? IconButton(
                                  icon: const Icon(Icons.navigate_next,
                                      color: Color.fromRGBO(91, 96, 101, 1)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeamRegistrationPage(
                                                  campaignId: campaignId)),
                                    );
                                  },
                                )
                              : SizedBox.shrink()
                        ]),
                      ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
