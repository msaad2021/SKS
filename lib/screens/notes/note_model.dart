// To parse this JSON data, do
//
//     final notesListResponseModel = notesListResponseModelFromJson(jsonString);

import 'dart:convert';

NotesListResponseModel notesListResponseModelFromJson(String str) =>
    NotesListResponseModel.fromJson(json.decode(str));

String notesListResponseModelToJson(NotesListResponseModel data) =>
    json.encode(data.toJson());

class NotesListResponseModel {
  NotesListResponseModel({
    this.notesdata,
  });

  List<Note>? notesdata;

  factory NotesListResponseModel.fromJson(Map<String, dynamic> json) =>
      NotesListResponseModel(
        notesdata:
            List<Note>.from(json["notesdata"].map((x) => Note.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notesdata": List<dynamic>.from(notesdata!.map((x) => x.toJson())),
      };
}

class Note {
  Note({
    this.noteId,
    this.notes,
    this.noteUserName,
    this.noteUserProfileImage,
    this.noteUserDesignation,
  });

  int? noteId;
  String? notes;
  String? noteUserName;
  String? noteUserProfileImage;
  String? noteUserDesignation;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        noteId: json["noteId"],
        notes: json["notes"],
        noteUserName: json["noteUserName"],
        noteUserProfileImage: json["noteUserProfileImage"],
        noteUserDesignation: json["noteUserDesignation"],
      );

  Map<String, dynamic> toJson() => {
        "noteId": noteId,
        "notes": notes,
        "noteUserName": noteUserName,
        "noteUserProfileImage": noteUserProfileImage,
        "noteUserDesignation": noteUserDesignation,
      };
}
