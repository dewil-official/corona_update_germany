import 'package:corona_update_germany/globals/rss_sources.dart';
import 'package:corona_update_germany/util/rss_handler.dart';
import 'package:webfeed/domain/rss_content.dart';

class NewsHandler {
  static Future<List<NewsArticle>> getNews() async {
    List<NewsArticle> tagesschauNews =
        await RssHandler.getUrlArticles(RssSources.tagesschau.url);
    List<NewsArticle> rkiNews =
        await RssHandler.getUrlArticles(RssSources.rkiCovid.url);
    tagesschauNews = tagesschauNews.map((item) {
      item.copyWith(url: "${item.url}.html");
    }).toList();
    return tagesschauNews;
  }
}

class NewsArticle {
  final String title;
  final String description;
  final String source;
  final String url;
  final RssContent content;
  final DateTime timestamp;

  NewsArticle(
      {this.title,
      this.description,
      this.source,
      this.url,
      this.content,
      this.timestamp});

  NewsArticle copyWith(
      {String title,
      String description,
      String source,
      String url,
      RssContent content,
      DateTime timestamp}) {
    return NewsArticle(
      title: title ?? this.title,
      description: description ?? this.description,
      source: source ?? this.source,
      url: url ?? this.url,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
