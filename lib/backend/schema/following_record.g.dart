// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FollowingRecord> _$followingRecordSerializer =
    new _$FollowingRecordSerializer();

class _$FollowingRecordSerializer
    implements StructuredSerializer<FollowingRecord> {
  @override
  final Iterable<Type> types = const [FollowingRecord, _$FollowingRecord];
  @override
  final String wireName = 'FollowingRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FollowingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.founder;
    if (value != null) {
      result
        ..add('founder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  FollowingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FollowingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'founder':
          result.founder = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$FollowingRecord extends FollowingRecord {
  @override
  final DocumentReference<Object?>? founder;
  @override
  final DocumentReference<Object?>? project;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FollowingRecord([void Function(FollowingRecordBuilder)? updates]) =>
      (new FollowingRecordBuilder()..update(updates))._build();

  _$FollowingRecord._({this.founder, this.project, this.ffRef}) : super._();

  @override
  FollowingRecord rebuild(void Function(FollowingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FollowingRecordBuilder toBuilder() =>
      new FollowingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FollowingRecord &&
        founder == other.founder &&
        project == other.project &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, founder.hashCode), project.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FollowingRecord')
          ..add('founder', founder)
          ..add('project', project)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FollowingRecordBuilder
    implements Builder<FollowingRecord, FollowingRecordBuilder> {
  _$FollowingRecord? _$v;

  DocumentReference<Object?>? _founder;
  DocumentReference<Object?>? get founder => _$this._founder;
  set founder(DocumentReference<Object?>? founder) => _$this._founder = founder;

  DocumentReference<Object?>? _project;
  DocumentReference<Object?>? get project => _$this._project;
  set project(DocumentReference<Object?>? project) => _$this._project = project;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FollowingRecordBuilder() {
    FollowingRecord._initializeBuilder(this);
  }

  FollowingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _founder = $v.founder;
      _project = $v.project;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FollowingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FollowingRecord;
  }

  @override
  void update(void Function(FollowingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FollowingRecord build() => _build();

  _$FollowingRecord _build() {
    final _$result = _$v ??
        new _$FollowingRecord._(
            founder: founder, project: project, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
