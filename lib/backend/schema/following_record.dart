import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'following_record.g.dart';

abstract class FollowingRecord
    implements Built<FollowingRecord, FollowingRecordBuilder> {
  static Serializer<FollowingRecord> get serializer =>
      _$followingRecordSerializer;

  DocumentReference? get founder;

  DocumentReference? get project;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(FollowingRecordBuilder builder) => builder;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('following')
          : FirebaseFirestore.instance.collectionGroup('following');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('following').doc();

  static Stream<FollowingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FollowingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FollowingRecord._();
  factory FollowingRecord([void Function(FollowingRecordBuilder) updates]) =
      _$FollowingRecord;

  static FollowingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFollowingRecordData({
  DocumentReference? founder,
  DocumentReference? project,
}) {
  final firestoreData = serializers.toFirestore(
    FollowingRecord.serializer,
    FollowingRecord(
      (f) => f
        ..founder = founder
        ..project = project,
    ),
  );

  return firestoreData;
}
