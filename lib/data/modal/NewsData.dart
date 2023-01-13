class NewsData {
  final String author;
  final String content;
  final String date;
  final String id;
  final String imgurl;
  final String readmoreurl;
  final String time;
  final String title;
  final String url;

  NewsData({
    required this.author,
    required this.content,
    required this.date,
    required this.id,
    required this.imgurl,
    required this.readmoreurl,
    required this.time,
    required this.title,
    required this.url,
});

  factory NewsData.fromJson(Map data) {
    return NewsData(
        author: data["author"],
        content: data["content"],
        date: data["date"],
        id: data["id"],
        imgurl: data["imageUrl"],
        readmoreurl: data["readMoreUrl"] ?? "",
        time: data["time"],
        title: data["title"],
        url: data["url"],
    );
  }
}

class NewsList {
  final List<NewsData> newslist;

  NewsList({
    required this.newslist,
  });

  factory NewsList.fromJson(Map data) {
    return NewsList(
        newslist: (data["data"] as List).map((e) => NewsData.fromJson(e)).toList(),
    );
  }
}