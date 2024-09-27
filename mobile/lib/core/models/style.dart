class Style {
  late final String? foreColor;
  late final String? bgColor;
  late final bool? bold;
  late final bool? italic;
  late final double? fontSize;
  late final String? fontName;

  Style.fromJson(Map<String, dynamic> json) {
    foreColor = json['foreColor'];
    bgColor = json['bgColor'];
    italic = json['italic'];
    bold = json['bold'];
    fontSize = json['fontSize'] * 1.0 ?? 0;
    fontName = json['fontName'];
  }
}
