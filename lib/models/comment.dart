import 'dart:convert';

class Comment {
  final String userId;
  final String comment;
  Comment ({
    required this.userId,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'comment': comment,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      userId: map['userId'] ?? '',
      comment: map['comment']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));
}