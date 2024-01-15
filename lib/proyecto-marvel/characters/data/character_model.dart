// ignore_for_file: constant_identifier_names

class CharacterModel {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceUri;
  Comics comics;
  Comics series;
  Stories stories;
  Comics events;
  List<Url> urls;

  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        modified: json["modified"] ?? '',
        thumbnail: Thumbnail.fromJson(
          json["thumbnail"] ?? '',
        ),
        resourceUri: json["resourceURI"] ?? '',
        comics: Comics.fromJson(
          json["comics"] ?? '',
        ),
        series: Comics.fromJson(
          json["series"] ?? '',
        ),
        stories: Stories.fromJson(
          json["stories"] ?? '',
        ),
        events: Comics.fromJson(
          json["events"] ?? '',
        ),
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail.toJson(),
        "resourceURI": resourceUri,
        "comics": comics.toJson(),
        "series": series.toJson(),
        "stories": stories.toJson(),
        "events": events.toJson(),
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
      };
}

class Comics {
  int available;
  String collectionUri;
  List<ComicsItem> items;
  int returned;

  Comics({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"] ?? '',
        collectionUri: json["collectionURI"] ?? '',
        items: List<ComicsItem>.from(
            json["items"].map((x) => ComicsItem.fromJson(x))),
        returned: json["returned"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
      };
}

class ComicsItem {
  String resourceUri;
  String name;

  ComicsItem({
    required this.resourceUri,
    required this.name,
  });

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"] ?? '',
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Stories {
  int available;
  String collectionUri;
  List<StoriesItem> items;
  int returned;

  Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"] ?? '',
        collectionUri: json["collectionURI"] ?? '',
        items: List<StoriesItem>.from(
          json["items"].map(
            (x) => StoriesItem.fromJson(x),
          ),
        ),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
      };
}

class StoriesItem {
  String resourceUri;
  String name;
  Type type;

  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"] ?? '',
        name: json["name"] ?? '',
        type: Type.COVER,
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": typeValues.reverse[type],
      };
}

enum Type { COVER, INTERIOR_STORY }

final typeValues =
    EnumValues({"cover": Type.COVER, "interiorStory": Type.INTERIOR_STORY});

class Thumbnail {
  String path;
  String extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };
}

class Url {
  String type;
  String url;

  Url({
    required this.type,
    required this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"] ?? '',
        url: json["url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
