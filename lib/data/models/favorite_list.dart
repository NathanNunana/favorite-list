class FavoriteList {
  final String? name;
  final String? desc;
  final String? avatar;
  FavoriteList({this.name, this.avatar, this.desc});
  factory FavoriteList.fromJson(Map<String, dynamic> json){
    return (
      FavoriteList(
        name: json["name"],
        avatar: json["avatar"],
        desc: json["desc"]
      )
    );
  }
}
