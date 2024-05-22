class Users {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Users({required this.albumId, required this.title, required this.url, required this.thumbnailUrl, required this.id});

  factory Users.fromJson(Map<String, dynamic> usersjson)=> Users(
    id: usersjson["id"],
    albumId: usersjson["albumId"],
    title: usersjson["title"],
    url: usersjson["url"],
    thumbnailUrl: usersjson["thumbnailUrl"],
  );
}

