import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sample_todo_app/core/converters/date_time_timestamp_converter.dart';
import 'package:flutter_sample_todo_app/core/extensions/date_extension.dart';
import 'package:flutter_sample_todo_app/core/repositories/firestore/document.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    required String todoId,
    required String description,
    @Default(false) bool completed,
    @DateTimeTimestampConverter() DateTime? createdAt,
    @DateTimeTimestampConverter() DateTime? updatedAt,
  }) = _Todo;

  const Todo._();

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  static String collectionPath(String userId) =>
      'sample/v1/developers/$userId/todos';

  static CollectionReference<SnapType> colRef(String userId) =>
      Document.colRef(collectionPath(userId));

  static String docPath(String userId, String id) =>
      '${collectionPath(userId)}/$id';

  static DocumentReference<SnapType> docRef(String userId, String id) =>
      Document.docRefWithDocPath(docPath(userId, id));

  Map<String, dynamic> get toCreateDoc => <String, dynamic>{
        'todoId': todoId,
        'description': description,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

  Map<String, dynamic> get toUpdateDoc => <String, dynamic>{
        'description': description,
        'updatedAt': FieldValue.serverTimestamp(),
      };

  String get dateLabel {
    final date = createdAt;
    if (date == null) {
      return '-';
    }
    return date.format(pattern: 'yyyy.M.d HH:mm');
  }
}
