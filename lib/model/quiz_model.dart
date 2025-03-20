// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizModel {
  String quistionText;
  List<Options> options;
  QuizModel({
    required this.quistionText,
    required this.options,
  });

  QuizModel copyWith({
    String? quistionText,
    List<Options>? options,
  }) {
    return QuizModel(
      quistionText: quistionText ?? this.quistionText,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questionText': quistionText,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      quistionText: map['questionText'] as String,
      options: List<Options>.from((map['options'] as List<dynamic>).map<Options>((x) => Options.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuizModel(quistionText: $quistionText, options: $options)';

  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.quistionText == quistionText &&
      listEquals(other.options, options);
  }

  @override
  int get hashCode => quistionText.hashCode ^ options.hashCode;
}

class Options {
  String answerText;
  bool isCorrect;
  Options({
    required this.answerText,
    required this.isCorrect,
  });

  Options copyWith({
    String? answerText,
    bool? isCorrect,
  }) {
    return Options(
      answerText: answerText ?? this.answerText,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'answerText': answerText,
      'isCorrcet': isCorrect,
    };
  }

  factory Options.fromMap(Map<String, dynamic> map) {
    return Options(
      answerText: map['answerText'] as String,
      isCorrect: map['isCorrcet'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Options.fromJson(String source) => Options.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Options(answerText: $answerText, isCorrect: $isCorrect)';

  @override
  bool operator ==(covariant Options other) {
    if (identical(this, other)) return true;
  
    return 
      other.answerText == answerText &&
      other.isCorrect == isCorrect;
  }

  @override
  int get hashCode => answerText.hashCode ^ isCorrect.hashCode;
}
