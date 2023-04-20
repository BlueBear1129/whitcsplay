// ignore_for_file: non_constant_identifier_names

// This is a data model that creates question objects from a csv file.

import 'package:json_annotation/json_annotation.dart';
import 'package:nanoid/nanoid.dart';
import 'dart:convert';
import 'package:deep_pick/deep_pick.dart';

@JsonSerializable()
class QuizTemplate {
  String? id; //
  String? Question; // Question Prompt
  Map<String, bool>? AnswerOptions; // Answers Options to Questions

  QuizTemplate(this.Question, this.AnswerOptions) {
    id = nanoid(3); // Assign id to Question
  }

  bool verify(String _id) {
    // Verfies Quiz authenticity

    if (id == _id) {
      return true;
    }

    return false; // worst case.
  }

  QuizTemplate.fromJson(dynamic json, int idx) {
    id = nanoid(3); // init id.

    Question = pick(json, idx, 'prompt').asStringOrNull(); // init Question.

    AnswerOptions = pick(json, idx, 'options').asMapOrNull(); // init Options.
  }
}
