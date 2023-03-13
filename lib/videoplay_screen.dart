import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:http/http.dart' as http;

class VideoPlayScreen extends StatefulWidget {
  final String campaignDescription;
  final String campaignIntroVideoUrl;
  final String startDate;
  final String campaignTitle;
  final dynamic videoDuration;

  VideoPlayScreen(
      {required this.campaignDescription,
      required this.campaignIntroVideoUrl,
      required this.startDate,
      required this.campaignTitle,
      required this.videoDuration,
      Key? key})
      : super(key: key);
  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  var text = lorem(paragraphs: 1, words: 200);

  Uri? _url;

  String? thumbailData;

  String? thumbnailUrl;

  bool isValidYouTubeUrl(String url) {
    RegExp regex =
        RegExp(r'^https?:\/\/(?:www\.)?youtube\.com\/watch\?v=[\w-]{11}$');
    return regex.hasMatch(url);
  }

  @override
  void initState() {
    if (isValidYouTubeUrl(widget.campaignIntroVideoUrl)) {
      thumbailData = widget.campaignIntroVideoUrl.split('=')[1];
      thumbnailUrl = 'https://img.youtube.com/vi/$thumbailData/hqdefault.jpg';
      print('./////////////////////// $thumbailData');
      _url = Uri.parse(widget.campaignIntroVideoUrl);
    } else {
      thumbnailUrl = "https://img.youtube.com/vi/a3ICNMQW7Ok/hqdefault.jpg";

      _url = Uri.parse("https://www.youtube.com/watch?v=a3ICNMQW7Ok");
    }
    super.initState();
  }

  // Future<void> fetchThumbnail() async {
  //   String url = 'https://img.youtube.com/vi/$thumbailData/default.jpg';
  //   print(url);
  //   Uri uri = Uri.parse(url);
  //   var response = await http.get(uri);
  //   print(response.body);
  //   var responseBody = json.decode(response.body);

  //   print(responseBody);
  // }

  // @override
  // void didChangeDependencies() async {
  //   if (thumbailData != null) {
  //     await fetchThumbnail();
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(BuildContext context) async {
      if (_url != null && !await launchUrl(_url!)) {
        throw 'Could not launch $_url';
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Freecharge",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 13),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 0, 37, 65),
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: thumbnailUrl != null
                    ? Image.network(
                        thumbnailUrl!,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        fit: BoxFit.contain,
                        "assets/image/2.jpg",
                      ),
              ),
              IconButton(
                  onPressed: () => _launchUrl(context),
                  icon: Icon(
                    Icons.play_circle,
                    size: 60,
                    color: Color.fromRGBO(209, 214, 217, 0.67),
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: Color.fromARGB(255, 133, 150, 164),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.startDate,
                    style: TextStyle(
                      color: Color.fromARGB(255, 133, 150, 164),
                    ),
                  ),
                  Spacer(),
                  Text(
                    widget.videoDuration.toString(),
                    style: TextStyle(
                      color: Color.fromARGB(255, 133, 150, 164),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.campaignTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    HtmlWidget(widget.campaignDescription),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
