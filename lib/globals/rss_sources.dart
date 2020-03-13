class RssSources {
  static final RssSource tagesschau = RssSource(
      name: "Tagesschau.de",
      url: "https://www.tagesschau.de/xml/rss2",
      needsFilter: true);
  static final RssSource rkiCovid = RssSource(
      name: "Robert Koch Intitut - Covid-19",
      url:
          "https://www.rki.de/SiteGlobals/Functions/RSSFeed/RSSGenerator_nCoV.xml",
      needsFilter: false);
}

class RssSource {
  final String name;
  final String url;
  // Whether the source is already corona-only or not.
  final bool needsFilter;

  RssSource({this.name, this.url, this.needsFilter});
}
