import 'package:flutter/material.dart';

import '../../data/modal/NewsData.dart';
import '../../utils/stream/data_stream.dart';
import '../../utils/stream/dataevent.dart';
import 'newsdetailscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  DataStream streamData = DataStream();

  @override
  void initState() {
    _tabController = TabController(length: 13, vsync: this);
    streamData.eventSink.add(GetDataEvent(type: "all", context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            color: Colors.white,
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: TabBar(
              onTap: (value) async {
                if (value == 1) {
                  streamData.eventSink
                      .add(GetDataEvent(type: "national", context: context));
                } else if (value == 2) {
                  streamData.eventSink
                      .add(GetDataEvent(type: "business", context: context));
                } else if (value == 3) {
                  streamData.eventSink
                      .add(GetDataEvent(type: "sport", context: context));
                } else if (value == 4) {
                  streamData.eventSink
                      .add(GetDataEvent(type: "world", context: context));
                } else if (value == 5) {
                  streamData.eventSink
                      .add(GetDataEvent(type: "politics", context: context));
                } else if (value == 6) {
                  streamData.eventSink
                      .add(GetDataEvent(type: "technology", context: context));
                } else if (value == 7) {
                  streamData.eventSink
                      .add(GetDataEvent(type: "startup", context: context));
                } else if (value == 8) {
                  streamData.eventSink.add(
                      GetDataEvent(type: "entertainment", context: context));
                } else if (value == 9) {
                  streamData.eventSink.add(
                      GetDataEvent(type: "miscellaneous", context: context));
                } else if (value == 10) {
                  streamData.eventSink
                      .add(GetDataEvent(type: "hatke", context: context));
                } else if (value == 11) {
                  streamData.eventSink
                      .add(GetDataEvent(type: "science", context: context));
                } else if (value == 12) {
                  streamData.eventSink
                      .add(GetDataEvent(type: "automobile", context: context));
                } else {
                  streamData.eventSink
                      .add(GetDataEvent(type: "all", context: context));
                }
              },
              tabs: const [
                Tab(
                  text: "all",
                ),
                Tab(
                  text: "national",
                ),
                Tab(
                  text: "business",
                ),
                Tab(
                  text: "sport",
                ),
                Tab(
                  text: "world",
                ),
                Tab(
                  text: "politics",
                ),
                Tab(
                  text: "technology",
                ),
                Tab(
                  text: "startup",
                ),
                Tab(
                  text: "entertainment",
                ),
                Tab(
                  text: "miscellaneous",
                ),
                Tab(
                  text: "hatke",
                ),
                Tab(
                  text: "science",
                ),
                Tab(
                  text: "automobile",
                ),
              ],
              unselectedLabelColor: const Color(0xff7657DE),
              labelColor: Colors.white,
              indicatorColor: const Color(0xFF828282),
              controller: _tabController,
              indicator: BoxDecoration(
                  color: const Color(0xff7657DE),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8)),
              isScrollable: true,
            ),
          ),
          const Divider(
            color: Colors.redAccent,
            height: 5,
            thickness: 3,
          ),
          Expanded(
              child: StreamBuilder(
                  stream: streamData.stream,
                  builder: (context, snapshot) {
                    debugPrint("data 1   ===>   ${snapshot.data}");
                    if (snapshot.hasData) {
                      debugPrint(
                          "data   ===>   ${snapshot.data!.newslist.length}");
                      if (snapshot.data!.newslist.isNotEmpty) {
                        return TabBarView(
                          controller: _tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(13, (index) {
                            return ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount: snapshot.data!.newslist.length,
                                itemBuilder: (context, index) {
                                  NewsData data =
                                      snapshot.data!.newslist[index];
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  NewsDetailScreen(
                                                      size: size, data: data),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade100
                                                .withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0),
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    bottomLeft:
                                                        Radius.circular(10.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 8,
                                                blurRadius: 10,
                                                offset: Offset(10,
                                                    10), // changes position of shadow
                                              ),
                                              BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                                spreadRadius: 8,
                                                blurRadius: 10,
                                                offset: Offset(-10,
                                                    -10), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 10),
                                          // color: Colors.white,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: size.height * 0.1,
                                                width: size.height * 0.1,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                      data.imgurl,
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                  child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data.title,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  Text(
                                                    data.author,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  Text(
                                                    data.time,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      (index ==
                                              snapshot.data!.newslist.length -
                                                  1)
                                          ? Container()
                                          : Divider()
                                    ],
                                  );
                                });
                          }),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Something happen"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
          // Expanded(
          //   child: Obx(
          //       () => controller.isloading.value
          //         ? const Center(
          //       child: CircularProgressIndicator(
          //         color: Color(0xff7657DE),
          //       ),
          //     )
          //         : controller.newsdatalist.isNotEmpty
          //         ? TabBarView(
          //       controller: _tabController,
          //       physics: const NeverScrollableScrollPhysics(),
          //       children: List.generate(
          //         13,
          //             (index) =>
          //             ListView.builder(
          //               padding: EdgeInsets.zero,
          //               itemCount: controller.newsdatalist.length,
          //               shrinkWrap: true,
          //               itemBuilder: (context, i) {
          //                 NewsData data = controller.newsdatalist[i];
          //                 return Column(
          //                   children: [
          //                     Container(
          //                       width: double.infinity,
          //                       padding: const EdgeInsets.symmetric(
          //                           vertical: 8, horizontal: 10),
          //                       color: Colors.white,
          //                       child: Row(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Container(
          //                             height: size.height * 0.1,
          //                             width: size.height * 0.1,
          //                             decoration: BoxDecoration(
          //                               borderRadius: BorderRadius.circular(10),
          //                               color: Colors.amber,
          //                               image: DecorationImage(
          //                                 image: NetworkImage(data.imgurl,),
          //                                 fit: BoxFit.fill
          //                               )
          //                             ),
          //                           ),
          //                           const SizedBox(width: 10,),
          //                           Expanded(child: Column(
          //                             mainAxisAlignment: MainAxisAlignment.start,
          //                             crossAxisAlignment: CrossAxisAlignment.start,
          //                             children: [
          //                               Text(data.title, style: const TextStyle(
          //                                   color: Colors.black,
          //                                   overflow: TextOverflow
          //                                       .ellipsis),
          //                               ),
          //                               Text(data.author, style: const TextStyle(
          //                                   color: Colors.black,
          //                                   overflow: TextOverflow
          //                                       .ellipsis),
          //                               ),
          //                               Text(data.time, style: const TextStyle(
          //                                   color: Colors.black,
          //                                   overflow: TextOverflow
          //                                       .ellipsis),
          //                               ),
          //                             ],
          //                           ))
          //                         ],
          //                       ),
          //                     ),
          //                     (i != controller.newsdatalist.length - 1)
          //                     ? Container(
          //                       height: 1,
          //                       width: double.infinity,
          //                       margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          //                       color: Colors.black,
          //                     )
          //                         : Container()
          //                   ],
          //                 );
          //               },
          //             ),),)
          //         : const Center(
          //       child: Text("Something went wrong"),
          //     ),
          //   )
          // ),
        ],
      ),
    );
  }
}
