import 'package:flutter/material.dart';
import 'package:bigbuzz/question_screen.dart';
import 'package:bigbuzz/view_lead.dart';

class BottomScreenPage extends StatelessWidget {
  final String? campaignStatus;
  final Future<void> Function() fetchCampaignData;
  final int? campaignId;
  final Map userData;
  const BottomScreenPage(
      {required this.fetchCampaignData,
      this.campaignStatus,
      this.campaignId,
      required this.userData,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -12,
              child: Container(
                width: 88,
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              )),
          Container(
            height: 190,
            padding: const EdgeInsets.all(12),
            constraints: const BoxConstraints(maxHeight: double.infinity),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Start Lead",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 37, 65),
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: (const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 133, 150, 164),
                      )),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                if (campaignId != null)
                  Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color.fromARGB(255, 108, 74, 182),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewLeadScreen(
                                        campaignId: campaignId!,
                                      )));
                        },
                        child: const Text(
                          "View Lead",
                          style: TextStyle(
                              color: Color.fromARGB(255, 91, 105, 122)),
                        ),
                      ),
                    ],
                  ),
                // const SizedBox(
                //   height: 20,
                // ),
                if (campaignStatus != null &&
                    campaignStatus == 'Active' &&
                    campaignId != null)
                  Row(
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        color: Color.fromARGB(255, 108, 74, 182),
                      ),
                      TextButton(
                        onPressed: () {
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuestionScreenPage(
                                          campaignId: campaignId!,
                                          userData: userData,
                                          fetchCampaignData: fetchCampaignData,
                                        )));
                          }
                        },
                        clipBehavior: Clip.hardEdge,
                        child: const Text(
                          "Add Lead",
                          style: TextStyle(
                              color: Color.fromARGB(255, 91, 105, 122)),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ]);
  }
}
