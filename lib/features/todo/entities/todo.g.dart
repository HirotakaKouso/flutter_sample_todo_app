// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$TodoImpl',
      json,
      ($checkedConvert) {
        final val = _$TodoImpl(
          todoId: $checkedConvert('todoId', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          completed: $checkedConvert('completed', (v) => v as bool? ?? false),
          createdAt: $checkedConvert(
              'createdAt',
              (v) =>
                  const DateTimeTimestampConverter().fromJson(v as Timestamp?)),
          updatedAt: $checkedConvert(
              'updatedAt',
              (v) =>
                  const DateTimeTimestampConverter().fromJson(v as Timestamp?)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'todoId': instance.todoId,
      'description': instance.description,
      'completed': instance.completed,
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'updatedAt':
          const DateTimeTimestampConverter().toJson(instance.updatedAt),
    };
