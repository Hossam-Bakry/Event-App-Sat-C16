class EventData {
  String? eventID;
  final String title;
  final String description;
  final String categoryID;
  final String imageUrl;
  final DateTime? selectedDate;
  bool isFavorite;

  EventData({
    this.eventID,
    required this.title,
    required this.description,
    required this.categoryID,
    required this.imageUrl,
    required this.selectedDate,
    this.isFavorite = false,
  });

  factory EventData.fromFirestore(Map<String, dynamic> json) {
    return EventData(
      eventID: json["eventID"],
      title: json["title"],
      description: json["description"],
      categoryID: json["categoryID"],
      imageUrl: json["imageUrl"],
      selectedDate: DateTime.fromMillisecondsSinceEpoch(json["selectedDate"]),
      isFavorite: json["isFavorite"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "eventID": eventID,
      "title": title,
      "description": description,
      "categoryID": categoryID,
      "imageUrl": imageUrl,
      "selectedDate": selectedDate!.millisecondsSinceEpoch,
      "isFavorite": isFavorite,
    };
  }
}
