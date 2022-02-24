class FavoriteList {
  final String? name;
  final String? avatar;
  FavoriteList({this.name, this.avatar});
  factory FavoriteList.fromJson(Map<String, dynamic> json){
    return (
      FavoriteList(
        name: json["name"],
        avatar: json["avatar"]
      )
    );
  }
}
