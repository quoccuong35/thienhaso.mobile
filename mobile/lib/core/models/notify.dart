class Notify {
  late final int id;
  late final String title;
  late final String content;
  late final String senderName;
  late final String sentDate;
  late final bool? isReceived;
  late final bool? isViewed;

  Notify.fromJson(Map<String, dynamic> json) {
    id = json['Id'] ?? "";
    title = json['Title'] ?? "";
    content = json['Content'] ?? "";
    senderName = json['SenderName'] ?? "";
    sentDate = json['SentDate'] ?? "";
    isReceived = json['IsReceived'] ?? "";
    isViewed = json['IsViewed'] ?? "";
  }
}
