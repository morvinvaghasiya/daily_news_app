import '../../data/modal/NewsData.dart';

abstract class DataState {
  final List<NewsData> newslist;
  DataState({
    this.newslist = const [],
  });
}

class GetDataState extends DataState {
  @override
  final List<NewsData> newslist;
  GetDataState({
    required this.newslist,
  }) : super(newslist: newslist);
}
