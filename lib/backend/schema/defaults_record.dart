import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'defaults_record.g.dart';

abstract class DefaultsRecord
    implements Built<DefaultsRecord, DefaultsRecordBuilder> {
  static Serializer<DefaultsRecord> get serializer =>
      _$defaultsRecordSerializer;

  String? get type;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DefaultsRecordBuilder builder) => builder
    ..type = ''
    ..value = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('defaults');

  static Stream<DefaultsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DefaultsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DefaultsRecord._();
  factory DefaultsRecord([void Function(DefaultsRecordBuilder) updates]) =
      _$DefaultsRecord;

  static DefaultsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDefaultsRecordData({
  String? type,
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    DefaultsRecord.serializer,
    DefaultsRecord(
      (d) => d
        ..type = type
        ..value = value,
    ),
  );

  return firestoreData;
}
