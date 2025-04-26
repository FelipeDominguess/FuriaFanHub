import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String text;
  final String userId;
  final String userName;
  final String? userPhotoUrl;
  final DateTime timestamp;
  final String roomId;
  
  MessageModel({
    required this.id,
    required this.text,
    required this.userId,
    required this.userName,
    this.userPhotoUrl,
    required this.timestamp,
    required this.roomId,
  });
  
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      text: json['text'],
      userId: json['userId'],
      userName: json['userName'],
      userPhotoUrl: json['userPhotoUrl'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      roomId: json['roomId'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'userId': userId,
      'userName': userName,
      'userPhotoUrl': userPhotoUrl,
      'timestamp': timestamp,
      'roomId': roomId,
    };
  }
}
