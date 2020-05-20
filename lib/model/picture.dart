/// @author: Aman Bindlish on 20/5/20
/// @github: https://github.com/amanbindlish
class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture(this.large, this.medium, this.thumbnail);

  Picture.fromJson(Map<String, dynamic> json)
      : large = json["large"],
        medium = json["medium"],
        thumbnail = json["thumbnail"];
}
