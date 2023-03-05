import 'package:appgain_flutter_task/api.dart';
import 'package:appgain_flutter_task/my_text_widget.dart';
import 'package:flutter/material.dart';

class AllLinksScreen extends StatefulWidget {
  const AllLinksScreen({super.key});

  @override
  State<AllLinksScreen> createState() => _AllLinksScreenState();
}

class _AllLinksScreenState extends State<AllLinksScreen> {
  bool isLoaded = false;
  var linksData;

  @override
  void initState() {
    super.initState();
    ApiServices().getAllLinks().then((data) {
      setState(() {
        linksData = data;
        isLoaded = true;
      });
      print(data);
    });
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All links"),
      ),
      body: isLoaded
          ? ListView.separated(
              itemCount: linksData.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextWidget(
                          text: linksData[index]["shortLink"],
                          size: 15,
                          isTitle: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: MyTextWidget(
                              text: linksData[index]["destinationUrl"],
                              size: 12),
                        )
                      ]),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
