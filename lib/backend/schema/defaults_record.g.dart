// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defaults_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DefaultsRecord> _$defaultsRecordSerializer =
    new _$DefaultsRecordSerializer();

class _$DefaultsRecordSerializer
    implements StructuredSerializer<DefaultsRecord> {
  @override
  final Iterable<Type> types = const [DefaultsRecord, _$DefaultsRecord];
  @override
  final String wireName = 'DefaultsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DefaultsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  DefaultsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DefaultsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$DefaultsRecord extends DefaultsRecord {
  @override
  final String? type;
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DefaultsRecord([void Function(DefaultsRecordBuilder)? updates]) =>
      (new DefaultsRecordBuilder()..update(updates))._build();

  _$DefaultsRecord._({this.type, this.value, this.ffRef}) : super._();

  @override
  DefaultsRecord rebuild(void Function(DefaultsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DefaultsRecordBuilder toBuilder() =>
      new DefaultsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DefaultsRecord &&
        type == other.type &&
        value == other.value &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, type.hashCode), value.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DefaultsRecord')
          ..add('type', type)
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DefaultsRecordBuilder
    implements Builder<DefaultsRecord, DefaultsRecordBuilder> {
  _$DefaultsRecord? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DefaultsRecordBuilder() {
    DefaultsRecord._initializeBuilder(this);
  }

  DefaultsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DefaultsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DefaultsRecord;
  }

  @override
  void update(void Function(DefaultsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DefaultsRecord build() => _build();

  _$DefaultsRecord _build() {
    final _$result =
        _$v ?? new _$DefaultsRecord._(type: type, value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
