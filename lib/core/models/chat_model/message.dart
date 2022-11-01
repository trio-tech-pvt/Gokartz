import 'package:flutter/foundation.dart';
import '../../enums/message_type.dart';

class Message {
  String? senderId;
  String? receiverId;
  String? message;
  String? createdAt;
  String? formattedTime;
  MessageType? type;

  Message({
    this.senderId,
    this.receiverId,
    this.message,
    this.createdAt,
    this.type = MessageType.text,
    this.formattedTime,
  });

  Message.fromJson(json) {
    this.senderId = json['senderId'];
    this.message = json['message'];
    this.createdAt = json['createdAt'];
    this.formattedTime = json['formattedTime'];
    this.type = _getMessageType(json['type']);
    print(this.message);
  }

  toJson() {
    return {
      'senderId': this.senderId,
      'message': this.message,
      'createdAt': this.createdAt,
      'formattedTime': this.formattedTime,
      'type': describeEnum(this.type ?? MessageType.text),
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
