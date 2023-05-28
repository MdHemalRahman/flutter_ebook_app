class LastReadingLocation {
  final String bookId;
  final int chapterIndex;
  final double position;

  LastReadingLocation({
    required this.bookId,
    required this.chapterIndex,
    required this.position,
  });

  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'chapterIndex': chapterIndex,
      'position': position,
    };
  }

  factory LastReadingLocation.fromJson(Map<String, dynamic> json) {
    return LastReadingLocation(
      bookId: json['bookId'],
      chapterIndex: json['chapterIndex'],
      position: json['position'],
    );
  }
}
