// To parse this JSON data, do
//
//     final noteCommentsResponseModel = noteCommentsResponseModelFromJson(jsonString);

import 'dart:convert';

NoteCommentsResponseModel noteCommentsResponseModelFromJson(String str) =>
    NoteCommentsResponseModel.fromJson(json.decode(str));

String noteCommentsResponseModelToJson(NoteCommentsResponseModel data) =>
    json.encode(data.toJson());

class NoteCommentsResponseModel {
  NoteCommentsResponseModel({
    this.comments,
  });

  List<Comment>? comments;

  factory NoteCommentsResponseModel.fromJson(Map<String, dynamic> json) =>
      NoteCommentsResponseModel(
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    this.comments,
    this.commentUserName,
    this.commentUserProfileImage,
    this.commentUserDesignation,
  });

  String? comments;
  String? commentUserName;
  String? commentUserProfileImage;
  String? commentUserDesignation;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comments: json["comments"],
        commentUserName: json["commentUserName"],
        commentUserProfileImage: json["commentUserProfileImage"],
        commentUserDesignation: json["commentUserDesignation"],
      );

  Map<String, dynamic> toJson() => {
        "comments": comments,
        "commentUserName": commentUserName,
        "commentUserProfileImage": commentUserProfileImage,
        "commentUserDesignation": commentUserDesignation,
      };
}
