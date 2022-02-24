class FavoriteList {
  final String? name;
  FavoriteList({this.name});
  factory FavoriteList.fromJson(Map<String, String> json){
    return (
      FavoriteList(
        name: json["name"]
      )
    );
  }
}
