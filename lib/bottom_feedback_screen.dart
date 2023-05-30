import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class BottomFeedbackPage extends StatelessWidget {
  final String feedBack;
  BottomFeedbackPage({required this.feedBack, Key? key}) : super(key: key);
  var text = lorem(paragraphs: 1, words: 50);
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Feedback",
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
              Column(
                children: [
                  Text(
                    feedBack,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 133, 150, 164)),
                  ),
                ],
              ),
            ]),
          ),
        ]);
  }
}
