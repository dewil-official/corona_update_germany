import 'package:corona_update_germany/util/news_handler.dart';
import 'package:webfeed/domain/rss_content.dart';
import 'package:webfeed/webfeed.dart';
import 'http_handler.dart';

class RssHandler {
  static Future<List<NewsArticle>> getUrlArticles(String url) async {
    String response = await HttpHandler.get(url);
    RssFeed rss = RssFeed.parse(response);
    List<NewsArticle> articles = [];
    for (RssItem item in rss.items) articles.add(getNewsArticleOfRssItem(item));
    return articles;
  }

  static getNewsArticleOfRssItem(RssItem item) {
    return NewsArticle(
      title: item.title ?? "",
      description: item.description ?? "",
      source: item.source is String ? item.source.value ?? "" : "",
      url: item.guid ?? "",
      content: item.content ?? RssContent("", []),
      timestamp: _getTimeStamp(item.pubDate) ?? DateTime.now(),
    );
  }
}

DateTime _getTimeStamp(String timestamp) {
  List<String> parts = timestamp.split(" ");
  var partsWithoutTimezone = parts.sublist(0, parts.length - 2);
  String newTimestamp = partsWithoutTimezone.join(" ");

  return DateTime.tryParse(newTimestamp);
}

String getAllProperties(RssFeed rss) {
  return """
  title: ${rss.title},
  author: ${rss.author},
  description: ${rss.description},
  copyright: ${rss.copyright},
  categories: ${rss.categories},
  cloud: ${rss.cloud},
  dc: ${rss.dc},
  docs: ${rss.docs},
  : ${rss.generator},
  : ${rss.image},
  items: [rss.items] not parsed,
  language: ${rss.language},
  lastBuildDate: ${rss.lastBuildDate},
  link: ${rss.link},
  managingEditor: ${rss.managingEditor},
  rating: ${rss.rating},
  skipDays: ${rss.skipDays},
  skipHours: ${rss.skipHours},
  ttl: ${rss.toString()},
  webMaster: ${rss.webMaster},
  """;
}

String getAllItemProperties(RssItem rssItem) {
  return """
  author: ${rssItem.author},
  categories: ${rssItem.categories},
  comments: ${rssItem.comments},
  content: ${rssItem.content},
  dc: ${rssItem.dc},
  description: ${rssItem.description},
  enclosure: ${rssItem.enclosure},
  guid: ${rssItem.guid},
  link: ${rssItem.link},
  media: ${rssItem.media},
  pubDate: ${rssItem.pubDate},
  source: ${rssItem.source},
  title: ${rssItem.title},
  """;
}
