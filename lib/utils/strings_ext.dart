/// @author: Aman Bindlish on 20/5/20
/// @github: https://github.com/amanbindlish
///
extension StringExt on String {
  String capitalizeFirstLetter() {
    return substring(0, 1).toUpperCase() + substring(0, length);
  }

  String filterEmpty() {
    return this ?? "";
  }
}
