
class ArticlesListData {
  ArticlesListData({
      String? status, 
      num? totalResults, 
      List<Articles>? articles,}){
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
}

  ArticlesListData.fromJson(dynamic json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['articles'] != null) {
      _articles = [];
      json['articles'].forEach((v) {
        _articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? _status;
  num? _totalResults;
  List<Articles>? _articles;
ArticlesListData copyWith({  String? status,
  num? totalResults,
  List<Articles>? articles,
}) => ArticlesListData(  status: status ?? _status,
  totalResults: totalResults ?? _totalResults,
  articles: articles ?? _articles,
);
  String? get status => _status;
  num? get totalResults => _totalResults;
  List<Articles>? get articles => _articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalResults'] = _totalResults;
    if (_articles != null) {
      map['articles'] = _articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"abc-news","name":"ABC News"}
/// author : "MATTHEW PERRONE AP health writer"
/// title : "FDA approves another generic abortion pill, prompting outrage from conservatives"
/// description : "Federal health officials have approved another generic version of the abortion pill, prompting outrage from some abortion opponents aligned with President Donald Trump"
/// url : "https://abcnews.go.com/Business/wireStory/fda-approves-generic-abortion-pill-prompting-outrage-conservatives-126162430"
/// urlToImage : "https://i.abcnewsfe.com/a/ff4aca2d-ee8b-4a10-a174-74a622911e6d/wirestory_7eb833cb867bc0f2fbf3c7af2ffe4bc3_16x9.jpg?w=1600"
/// publishedAt : "2025-10-03T02:29:49Z"
/// content : "WASHINGTON -- WASHINGTON (AP) Federal officials have approved another generic version of the abortion pill mifepristone, a regulatory formality that quickly triggered pushback from anti-abortion grou… [+3925 chars]"

class Articles {
  Articles({
      Source? source, 
      String? author, 
      String? title, 
      String? description, 
      String? url, 
      String? urlToImage, 
      String? publishedAt, 
      String? content,}){
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
}

  Articles.fromJson(dynamic json) {
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'] as String?;
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;
Articles copyWith({  Source? source,
  String? author,
  String? title,
  String? description,
  String? url,
  String? urlToImage,
  String? publishedAt,
  String? content,
}) => Articles(  source: source ?? _source,
  author: author ?? _author,
  title: title ?? _title,
  description: description ?? _description,
  url: url ?? _url,
  urlToImage: urlToImage ?? _urlToImage,
  publishedAt: publishedAt ?? _publishedAt,
  content: content ?? _content,
);
  Source? get source => _source;
  String? get author => _author;
  String? get title => _title;
  String? get description => _description;
  String? get url => _url;
  String? get urlToImage => _urlToImage;
  String? get publishedAt => _publishedAt;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
    map['author'] = _author;
    map['title'] = _title;
    map['description'] = _description;
    map['url'] = _url;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = _publishedAt;
    map['content'] = _content;
    return map;
  }

}

/// id : "abc-news"
/// name : "ABC News"

class Source {
  Source({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Source.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
Source copyWith({  String? id,
  String? name,
}) => Source(  id: id ?? _id,
  name: name ?? _name,
);
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}