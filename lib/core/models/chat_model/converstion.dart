import 'package:flutter/foundation.dart';

import '../../enums/message_type.dart';
import 'message.dart';

class Conversation {
  String? id;
  String? senderId;
  String? senderName;
  String? receiverName;
  String? senderImageUrl;
  String? receiverImageUrl;
  String? receiverId;
  String? createdAt;
  bool? isReadByArtist;
  bool? isReadByClient;
  String? updatedAt;
  Message? lastMessage;
  MessageType? type;
  DateTime? updateTime;
  String? senderFcmToken;
  String? receiverFcmToken;
  bool? isArchived;

  Conversation(
      {this.id,
        this.senderId,
        this.receiverId,
        this.createdAt,
        this.isReadByArtist = false,
        this.isReadByClient = false,
        this.updatedAt,
        this.lastMessage,
        this.type,
        this.senderName,
        this.receiverName,
        this.senderImageUrl,
        this.receiverImageUrl,
        this.updateTime,
        this.senderFcmToken,
        this.receiverFcmToken,
        this.isArchived = false});

  Conversation.fromJson(json) {
    this.senderId = json['senderId'];
    this.receiverId = json['receiverId'];
    this.createdAt = json['createdAt'];
    this.isReadByArtist = json['isReadByArtist'];
    this.isReadByClient = json['isReadByClient'];
    this.updatedAt = json['updatedAt'];
    this.type = _getMessageType(json['type']);
    this.senderName = json['senderName'];
    this.receiverName = json['receiverName'];
    this.senderImageUrl = json['senderImageUrl'];
    this.receiverImageUrl = json['receiverImageUrl'];
    this.lastMessage = Message.fromJson(json['lastMessage']);
    this.updateTime = DateTime.parse(json['updatedAt']);
    this.senderFcmToken = json['senderFcmToken'];
    this.receiverFcmToken = json['receiverFcmToken'];
    this.isArchived = json['isArchived'] ?? false;
  }

  toJson() {
    return {
      'senderId': this.senderId,
      'receiverId': this.receiverId,
      'createdAt': this.createdAt,
      'isReadByArtist': this.isReadByArtist,
      'isReadByClient': this.isReadByClient,
      'updatedAt': this.updatedAt,
      'senderName': this.senderName,
      'receiverName': this.receiverName,
      'senderImageUrl': this.senderImageUrl,
      'receiverImageUrl': this.receiverImageUrl,
      'type': describeEnum(this.type ?? MessageType.text),
      'lastMessage': this.lastMessage!.toJson(),
      'senderFcmToken': this.senderFcmToken,
      'receiverFcmToken': this.receiverFcmToken,
      'isArchived': this.isArchived
    };
  }

  _getMessageType(type) {
    if (type == 'text')
      return MessageType.text;
    else if (type == 'file')
      return MessageType.file;
    else if (type == 'image') return MessageType.image;
  }
}
