import 'package:chat_app/constants.dart';

class Message {
  final String text;
  final String id;

  Message(this.text, this.id);
  factory Message.fromjson(jsonData){
    return Message(jsonData[kMessage] , jsonData[kId]);
  }
}