import 'package:mobile/core/models/style.dart';

class ObjResult {
  late final String fieldId;
  late final String fieldCaption;
  late final String fieldValue;
  late final int orderIndex;
  late final Style? captionStyle;
  late final Style? valueStyle;

  ObjResult.fromJson(Map<String, dynamic> json) {
    fieldId = json['fieldId'] ?? "";
    fieldCaption = json['fieldCaption'] ?? "";
    fieldValue = json['fieldValue'] ?? "";
    orderIndex = json['orderIndex'] ?? 0;
    valueStyle =
        json['valueStyle'] != null ? Style.fromJson(json['valueStyle']) : null;
    captionStyle = json['captionStyle'] != null
        ? Style.fromJson(json['captionStyle'])
        : null;
  }
}
