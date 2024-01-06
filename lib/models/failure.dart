import 'dart:convert';

import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final dynamic data;

  const Failure({
    required this.message,
    this.data,
  });

  @override
  List<Object> get props => [message, data];

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data,
    };
  }

  factory Failure.fromMap(Map<String, dynamic> map) {
    return Failure(
      message: map['message'] ?? '',
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Failure.fromJson(String source) =>
      Failure.fromMap(json.decode(source));
}
