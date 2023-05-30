import 'package:bigbuzz/bottom_sheet.dart';
import 'package:bigbuzz/videoplay_screen.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard(
      {super.key,
      this.img,
      this.ticketCampaignTitle,
      this.ticketCategory,
      this.location,
      this.startDate,
      this.endDate,
      this.compaignStatus,
      this.campaignId,
      this.campaignDescription,
      this.campaignIntroVideoUrl,
      required this.userData,
      this.compaignDuration,
      required this.fetchCampaignData});
  final Future<void> Function() fetchCampaignData;
  final String? ticketCampaignTitle;
  final String? img;
  final String? ticketCategory;
  final String? location;
  final String? startDate;
  final String? endDate;
  final String? compaignStatus;
  final int? campaignId;
  final String? campaignDescription;
  final String? campaignIntroVideoUrl;
  final dynamic compaignDuration;
  final Map userData;

  String removeHtmlTags(String? description) {
    if (description != null) {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
      return description!.replaceAll(exp, '');
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage('assets/image/freecharge (1).jpg'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ticketCampaignTitle ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        // HtmlWidget(
                        //   ticketCategory ?? "",

                        //   textStyle: const TextStyle(
                        //       color: Color.fromARGB(255, 133, 150, 164),
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w400),
                        // ),
                        Text(
                          removeHtmlTags(ticketCategory),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 133, 150, 164),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Divider(
                  color: Colors.black12,
                  height: 2,
                  thickness: 1,
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            "Start Date",
                            textAlign: TextAlign.left,
                            style: textTheme.labelLarge!.copyWith(
                                color: const Color.fromARGB(255, 115, 119, 123),
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            '$startDate',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 37, 65),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            "End Date",
                            textAlign: TextAlign.left,
                            style: textTheme.labelLarge!.copyWith(
                                color: const Color.fromARGB(255, 115, 119, 123),
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            '$endDate',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 37, 65),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            "Location",
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.labelLarge!.copyWith(
                                color: const Color.fromARGB(255, 115, 119, 123),
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            "$location",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 37, 65),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPlayScreen(
                                          campaignDescription:
                                              campaignDescription ?? "",
                                          campaignIntroVideoUrl:
                                              campaignIntroVideoUrl ?? "",
                                          startDate: startDate ?? "",
                                          campaignTitle:
                                              ticketCampaignTitle ?? "",
                                          videoDuration: compaignDuration,
                                        )),
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 108, 74, 182)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              child: const Center(
                                  child: Text(
                                "Intro",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 108, 74, 182)),
                              )),
                            ),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () => _showModalBottomSheet(
                                context,
                                compaignStatus,
                                campaignId,
                                userData,
                                fetchCampaignData),
                            child: Container(
                              height: 40,
                              width: 140,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Color.fromARGB(255, 108, 74, 182)),
                              child: const Center(
                                  child: Text(
                                "Start",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_showModalBottomSheet(
  BuildContext context,
  String? campaignStatus,
  int? campaignId,
  Map userData,
  Future<void> Function() fetchCampaignData,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      ),
    ),
    builder: (context) => BottomScreenPage(
      campaignStatus: campaignStatus,
      campaignId: campaignId,
      userData: userData,
      fetchCampaignData: fetchCampaignData,
    ),
  );
}
