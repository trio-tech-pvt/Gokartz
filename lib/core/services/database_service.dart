import 'package:calkitna_mobile_app/core/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/chat_model/converstion.dart';
import '../models/chat_model/message.dart';
class DatabaseService {
  final _db = FirebaseFirestore.instance;
  static final DatabaseService _singleton = DatabaseService._internal();
  final firebaseDb = FirebaseDatabase.instance.reference().child('chat_system');

  factory DatabaseService() {
    return _singleton;
  }

  DatabaseService._internal();

  /// Register app user
  registerAppUser(AppUser user) async {
    debugPrint("User @Id => ${user.id}");
    try {
      await _db
          .collection('app_user')
          .doc(user.id)
          .set(user.toJson())
          .then(( value) => debugPrint('user registered successfully'));
    } catch (e, s) {
      debugPrint('Exception @DatabaseService/registerAppUser');
      debugPrint(s.toString());
      return false;
    }
  }

  /// Get User from database using this funciton
  Future<AppUser> getAppUser(id) async {
    //Todo: Rename getUsers -> getUser
    debugPrint('@getAppUser: id: $id');
    try {
      final snapshot = await _db.collection('app_user').doc(id).get();
      debugPrint('Client Data: ${snapshot.data()}');
      return AppUser.fromJson(snapshot.data()!, snapshot.id);
    } catch (e, s) {
      debugPrint('Exception @DatabaseService/getAppUser');
      debugPrint(s.toString());
      return AppUser();
    }
  }
  // This will get all Projects created by current user
  Future<List<AppUser>> getAllUser() async {
    List<AppUser> user = [];
    try {
      final snapshot = (await _db
          .collection('app_user')
          .get()) ;
      if(snapshot.docs.length>0){
        for(int i=0;i<snapshot.docs.length;i++){
          user.add(AppUser.fromJson(snapshot.docs[i].data(), snapshot.docs[i].id));
        }
      }
    } catch (e) {
      print('Error @getRequests => $e');
    }
    return user;
  }
  ///
  /// Get messages as stream
  getMessagesStream(Conversation conversation) {
    print('@getMessagesStream');
    Stream stream;
    try {
      stream = firebaseDb
          .child('messages')
          .child('${conversation.senderId}_${conversation.receiverId}')
          .onChildAdded;
      return stream;
    } catch (e) {
      print('Exception @getMessagesStream: $e');
    }
  }
  ///
  /// Get conversation as stream
  getConversationStream() {
    print('@getConversationStream');
    Stream stream;
    try {
      stream = firebaseDb.child('conversations').onChildAdded;
      return stream;
    } catch (e) {
      print('Exception @getConversationStream: $e');
    }
  }

  ///
  /// update conversation in database
  updateConversation(Conversation conversation) {
    print('@updateConversation');
    try {
      firebaseDb
          .child('conversations')
          .child('${conversation.senderId}_${conversation.receiverId}')
          .set(conversation.toJson())
          .then((value) => print('updateConversation Successfully !!!'));
    } catch (e) {
      print('Exception @updateConversationFirebaseDb: $e');
    }
  }

  ///
  /// Send message to database
  sendMessage(Message message, Conversation conversation) {
    print('@sendMessage');
    print('sender id >>>>>>>>>>>>>>>>${conversation.senderId}_ receiver id >>>>>>>>>>>>>>>>${conversation.receiverId}');
    try {
      firebaseDb
          .child('messages')
          .child('${conversation.senderId}_${conversation.receiverId}')
          .push()
          .set(message.toJson())
          .then((value) => print('Message sent successfull!!!'));
    } catch (e) {
      print('Exception @sendMessageFirebaseDb: $e');
    }
  }
  updateClientFcm(token, id) async {
    await _db.collection("app_user").doc(id).update({'fcmToken': token}).then(
        (value) => debugPrint('fcm updated successfully'));
  }
}
