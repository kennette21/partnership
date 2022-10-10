// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streams_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StreamsRecord> _$streamsRecordSerializer =
    new _$StreamsRecordSerializer();

class _$StreamsRecordSerializer implements StructuredSerializer<StreamsRecord> {
  @override
  final Iterable<Type> types = const [StreamsRecord, _$StreamsRecord];
  @override
  final String wireName = 'StreamsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StreamsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.isLive;
    if (value != null) {
      result
        ..add('is_live')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.playbackName;
    if (value != null) {
      result
        ..add('playback_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.playbackUrl;
    if (value != null) {
      result
        ..add('playback_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
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
  StreamsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StreamsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'is_live':
          result.isLive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'playback_name':
          result.playbackName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'playback_url':
          result.playbackUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
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

class _$StreamsRecord extends StreamsRecord {
  @override
  final bool? isLive;
  @override
  final String? playbackName;
  @override
  final String? playbackUrl;
  @override
  final DateTime? timestamp;
  @override
  final String? uid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StreamsRecord([void Function(StreamsRecordBuilder)? updates]) =>
      (new StreamsRecordBuilder()..update(updates))._build();

  _$StreamsRecord._(
      {this.isLive,
      this.playbackName,
      this.playbackUrl,
      this.timestamp,
      this.uid,
      this.ffRef})
      : super._();

  @override
  StreamsRecord rebuild(void Function(StreamsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamsRecordBuilder toBuilder() => new StreamsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamsRecord &&
        isLive == other.isLive &&
        playbackName == other.playbackName &&
        playbackUrl == other.playbackUrl &&
        timestamp == other.timestamp &&
        uid == other.uid &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, isLive.hashCode), playbackName.hashCode),
                    playbackUrl.hashCode),
                timestamp.hashCode),
            uid.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StreamsRecord')
          ..add('isLive', isLive)
          ..add('playbackName', playbackName)
          ..add('playbackUrl', playbackUrl)
          ..add('timestamp', timestamp)
          ..add('uid', uid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StreamsRecordBuilder
    implements Builder<StreamsRecord, StreamsRecordBuilder> {
  _$StreamsRecord? _$v;

  bool? _isLive;
  bool? get isLive => _$this._isLive;
  set isLive(bool? isLive) => _$this._isLive = isLive;

  String? _playbackName;
  String? get playbackName => _$this._playbackName;
  set playbackName(String? playbackName) => _$this._playbackName = playbackName;

  String? _playbackUrl;
  String? get playbackUrl => _$this._playbackUrl;
  set playbackUrl(String? playbackUrl) => _$this._playbackUrl = playbackUrl;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StreamsRecordBuilder() {
    StreamsRecord._initializeBuilder(this);
  }

  StreamsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLive = $v.isLive;
      _playbackName = $v.playbackName;
      _playbackUrl = $v.playbackUrl;
      _timestamp = $v.timestamp;
      _uid = $v.uid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StreamsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StreamsRecord;
  }

  @override
  void update(void Function(StreamsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StreamsRecord build() => _build();

  _$StreamsRecord _build() {
    final _$result = _$v ??
        new _$StreamsRecord._(
            isLive: isLive,
            playbackName: playbackName,
            playbackUrl: playbackUrl,
            timestamp: timestamp,
            uid: uid,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
