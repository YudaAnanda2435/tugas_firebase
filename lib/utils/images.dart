class Images {
  static String get banner => 'banner'.png;
  static String get state => 'state'.jpg;
}

extension on String {
  String get jpg => 'assets/images/$this.jpg';
  String get png => 'assets/images/$this.png';
}
