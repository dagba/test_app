// GENERATED CODE - DO NOT MODIFY BY HAND

part of Task;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Task> _$taskSerializer = new _$TaskSerializer();

class _$TaskSerializer implements StructuredSerializer<Task> {
  @override
  final Iterable<Type> types = const [Task, _$Task];
  @override
  final String wireName = 'Task';

  @override
  Iterable<Object> serialize(Serializers serializers, Task object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'complete_time',
      serializers.serialize(object.completeTime,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Task deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'complete_time':
          result.completeTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$Task extends Task {
  @override
  final String id;
  @override
  final String body;
  @override
  final DateTime completeTime;

  factory _$Task([void Function(TaskBuilder) updates]) =>
      (new TaskBuilder()..update(updates)).build();

  _$Task._({this.id, this.body, this.completeTime}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Task', 'id');
    }
    if (body == null) {
      throw new BuiltValueNullFieldError('Task', 'body');
    }
    if (completeTime == null) {
      throw new BuiltValueNullFieldError('Task', 'completeTime');
    }
  }

  @override
  Task rebuild(void Function(TaskBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskBuilder toBuilder() => new TaskBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Task &&
        id == other.id &&
        body == other.body &&
        completeTime == other.completeTime;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), body.hashCode), completeTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Task')
          ..add('id', id)
          ..add('body', body)
          ..add('completeTime', completeTime))
        .toString();
  }
}

class TaskBuilder implements Builder<Task, TaskBuilder> {
  _$Task _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  DateTime _completeTime;
  DateTime get completeTime => _$this._completeTime;
  set completeTime(DateTime completeTime) =>
      _$this._completeTime = completeTime;

  TaskBuilder();

  TaskBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _body = _$v.body;
      _completeTime = _$v.completeTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Task other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Task;
  }

  @override
  void update(void Function(TaskBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Task build() {
    final _$result =
        _$v ?? new _$Task._(id: id, body: body, completeTime: completeTime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
