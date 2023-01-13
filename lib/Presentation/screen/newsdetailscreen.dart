import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/modal/NewsData.dart';

class NewsDetailScreen extends StatelessWidget {
  final Size size;
  final NewsData data;
  const NewsDetailScreen({
    Key? key,
    required this.size,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border:
                        Border.all(color: const Color(0xff7657DE), width: 1),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 30,
                    color: Color(0xff7657DE),
                  ),
                ),
              ),
              const Divider(
                color: Colors.redAccent,
                height: 5,
                thickness: 3,
              ),
              Text(
                data.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: size.height * 0.3,
                width: size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(data.imgurl, fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.content,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.034,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${data.date},${data.time}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  if (!await launchUrl(
                    Uri.parse(data.readmoreurl),
                  )) throw 'Could not launch ${data.readmoreurl}';
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Text(
                    'Read More',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: size.width * 0.025,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
