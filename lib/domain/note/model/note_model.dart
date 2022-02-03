import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_ignite/core/core.dart';

class NoteModel {
  final String id;
  final String title;
  final String text;
  final Color background;
  final DateTime data;
  final String important;
  NoteModel({
    required this.id,
    required this.title,
    required this.text,
    required this.background,
    required this.data,
    required this.important,
  });

  NoteModel copyWith({
    String? id,
    String? title,
    String? text,
    Color? background,
    DateTime? data,
    String? important,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      text: text ?? this.text,
      background: background ?? this.background,
      data: data ?? this.data,
      important: important ?? this.important,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'text': text,
      'background': background.value,
      'data': data.millisecondsSinceEpoch,
      'important': important,
    };
  }

  String dataString() => DateFormat('dd/MM/yyyy').format(data);

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      background: Color(map['background']),
      data: DateTime.fromMillisecondsSinceEpoch(map['data']),
      important: map['important'] ?? '',
    );
  }

  factory NoteModel.init() {
    return NoteModel(
      id: '',
      title: '',
      text: '',
      background: AppTheme.colors.colorsPicker.first,
      data: DateTime.now(),
      important: "Média importancia",
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NoteModel(id: $id, title: $title, text: $text, background: $background, data: $data, important: $important)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteModel &&
        other.id == id &&
        other.title == title &&
        other.text == text &&
        other.background == background &&
        other.data == data &&
        other.important == important;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        text.hashCode ^
        background.hashCode ^
        data.hashCode ^
        important.hashCode;
  }
}
