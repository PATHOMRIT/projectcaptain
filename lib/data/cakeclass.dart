import 'package:flutter/material.dart';
class InfoCake{
  String id_cake,image,title;
  List<String> component;
  List<String> infoCake;
  InfoCake({required this.id_cake,required this.image,required this.title,required this.component,required this.infoCake});
}

class Post {
  var user;
  var userImages;

  bool like = false;
  List<String> commmentUser = [];
  List<String> commentUserMessage = [];
  TextEditingController controller = TextEditingController();
  Post(var user, var userImages, List<String> commmentUser, List<String> commentUserMessage) {
    this.user = user;
    this.userImages = userImages;

    this.commmentUser = commmentUser;
    this.commentUserMessage = commentUserMessage;
  }
}
