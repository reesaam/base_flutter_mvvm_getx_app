enum APIMethods { get, post, put, patch, download, delete }

extension OnAPIMethods on APIMethods {
  String get getName => name.toUpperCase();
}
