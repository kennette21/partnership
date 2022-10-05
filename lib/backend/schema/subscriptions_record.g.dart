// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubscriptionsRecord> _$subscriptionsRecordSerializer =
    new _$SubscriptionsRecordSerializer();

class _$SubscriptionsRecordSerializer
    implements StructuredSerializer<SubscriptionsRecord> {
  @override
  final Iterable<Type> types = const [
    SubscriptionsRecord,
    _$SubscriptionsRecord
  ];
  @override
  final String wireName = 'SubscriptionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SubscriptionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.follower;
    if (value != null) {
      result
        ..add('follower')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
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
  SubscriptionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubscriptionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'follower':
          result.follower = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
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

class _$SubscriptionsRecord extends SubscriptionsRecord {
  @override
  final DocumentReference<Object?>? follower;
  @override
  final DocumentReference<Object?>? founder;
  @override
  final DocumentReference<Object?>? project;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SubscriptionsRecord(
          [void Function(SubscriptionsRecordBuilder)? updates]) =>
      (new SubscriptionsRecordBuilder()..update(updates))._build();

  _$SubscriptionsRecord._(
      {this.follower, this.founder, this.project, this.ffRef})
      : super._();

  @override
  SubscriptionsRecord rebuild(
          void Function(SubscriptionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionsRecordBuilder toBuilder() =>
      new SubscriptionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionsRecord &&
        follower == other.follower &&
        founder == other.founder &&
        project == other.project &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, follower.hashCode), founder.hashCode), project.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionsRecord')
          ..add('follower', follower)
          ..add('founder', founder)
          ..add('project', project)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SubscriptionsRecordBuilder
    implements Builder<SubscriptionsRecord, SubscriptionsRecordBuilder> {
  _$SubscriptionsRecord? _$v;

  DocumentReference<Object?>? _follower;
  DocumentReference<Object?>? get follower => _$this._follower;
  set follower(DocumentReference<Object?>? follower) =>
      _$this._follower = follower;

  DocumentReference<Object?>? _founder;
  DocumentReference<Object?>? get founder => _$this._founder;
  set founder(DocumentReference<Object?>? founder) => _$this._founder = founder;

  DocumentReference<Object?>? _project;
  DocumentReference<Object?>? get project => _$this._project;
  set project(DocumentReference<Object?>? project) => _$this._project = project;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SubscriptionsRecordBuilder() {
    SubscriptionsRecord._initializeBuilder(this);
  }

  SubscriptionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _follower = $v.follower;
      _founder = $v.founder;
      _project = $v.project;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionsRecord;
  }

  @override
  void update(void Function(SubscriptionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionsRecord build() => _build();

  _$SubscriptionsRecord _build() {
    final _$result = _$v ??
        new _$SubscriptionsRecord._(
            follower: follower,
            founder: founder,
            project: project,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
