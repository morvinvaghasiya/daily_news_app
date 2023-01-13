import 'dart:async';

import '../../data/service/apiservice.dart';
import 'dataevent.dart';
import 'datastate.dart';
import '../../data/modal/NewsData.dart';
import 'dart:developer' as developer;

class DataStream {
  List<NewsData> newslist = [];
  final StreamController<DataEvent> _controller =
      StreamController<DataEvent>.broadcast();

  StreamSink<DataEvent> get eventSink => _controller.sink;

  Stream<DataEvent> get eventStream => _controller.stream;

  final StreamController<DataState> _stateController =
      StreamController<DataState>();
  StreamSink<DataState> get sink => _stateController.sink;

  Stream<DataState> get stream => _stateController.stream;

  dispose() {
    _controller.close();
  }

  getdata(GetDataEvent event) async {
    newslist.clear();
    sink.add(GetDataState(newslist: newslist));
    List<NewsData> dummylist =
        await Apiservice().getResponce(event.type, event.context) ?? [];
    newslist.addAll(dummylist);
    sink.add(GetDataState(newslist: newslist));
  }

  DataStream() {
    eventStream.listen((DataEvent event) {
      if (event is GetDataEvent) {
        getdata(event);
      } else {
        developer.log("No Implementation Found !");
      }
    });
  }
}
