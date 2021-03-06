library task;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task.g.dart';

abstract class Task implements Built<Task, TaskBuilder> {
  static Serializer<Task> get serializer => _$taskSerializer;

  @BuiltValueField(wireName: 'body')
  String get body;
  @BuiltValueField(wireName: 'complete_time')
  @nullable
  DateTime get completeTime;

  Task._();

  factory Task([updates(TaskBuilder b)]) = _$Task;
}
