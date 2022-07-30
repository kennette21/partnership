// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RatingsRecord> _$ratingsRecordSerializer =
    new _$RatingsRecordSerializer();

class _$RatingsRecordSerializer implements StructuredSerializer<RatingsRecord> {
  @override
  final Iterable<Type> types = const [RatingsRecord, _$RatingsRecord];
  @override
  final String wireName = 'RatingsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RatingsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.skill;
    if (value != null) {
      result
        ..add('skill')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.project;
    if (value != null) {
      result
        ..add('project')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  RatingsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RatingsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'skill':
          result.skill = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'project':
          result.project = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$RatingsRecord extends RatingsRecord {
  @override
  final DocumentReference<Object?>? skill;
  @override
  final DocumentReference<Object?>? user;
  @override
  final int? value;
  @override
  final DocumentReference<Object?>? project;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RatingsRecord([void Function(RatingsRecordBuilder)? updates]) =>
      (new RatingsRecordBuilder()..update(updates))._build();

  _$RatingsRecord._(
      {this.skill, this.user, this.value, this.project, this.ffRef})
      : super._();

  @override
  RatingsRecord rebuild(void Function(RatingsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RatingsRecordBuilder toBuilder() => new RatingsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RatingsRecord &&
        skill == other.skill &&
        user == other.user &&
        value == other.value &&
        project == other.project &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, skill.hashCode), user.hashCode), value.hashCode),
            project.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RatingsRecord')
          ..add('skill', skill)
          ..add('user', user)
          ..add('value', value)
          ..add('project', project)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RatingsRecordBuilder
    implements Builder<RatingsRecord, RatingsRecordBuilder> {
  _$RatingsRecord? _$v;

  DocumentReference<Object?>? _skill;
  DocumentReference<Object?>? get skill => _$this._skill;
  set skill(DocumentReference<Object?>? skill) => _$this._skill = skill;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  DocumentReference<Object?>? _project;
  DocumentReference<Object?>? get project => _$this._project;
  set project(DocumentReference<Object?>? project) => _$this._project = project;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RatingsRecordBuilder() {
    RatingsRecord._initializeBuilder(this);
  }

  RatingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skill = $v.skill;
      _user = $v.user;
      _value = $v.value;
      _project = $v.project;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RatingsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RatingsRecord;
  }

  @override
  void update(void Function(RatingsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RatingsRecord build() => _build();

  _$RatingsRecord _build() {
    final _$result = _$v ??
        new _$RatingsRecord._(
            skill: skill,
            user: user,
            value: value,
            project: project,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
