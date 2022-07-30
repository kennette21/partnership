import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ratings_record.g.dart';

abstract class RatingsRecord
    implements Built<RatingsRecord, RatingsRecordBuilder> {
  static Serializer<RatingsRecord> get serializer => _$ratingsRecordSerializer;

  DocumentReference? get skill;

  DocumentReference? get user;

  int? get value;

  DocumentReference? get project;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RatingsRecordBuilder builder) =>
      builder..value = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ratings');

  static Stream<RatingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RatingsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RatingsRecord._();
  factory RatingsRecord([void Function(RatingsRecordBuilder) updates]) =
      _$RatingsRecord;

  static RatingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRatingsRecordData({
  DocumentReference? skill,
  DocumentReference? user,
  int? value,
  DocumentReference? project,
}) {
  final firestoreData = serializers.toFirestore(
    RatingsRecord.serializer,
    RatingsRecord(
      (r) => r
        ..skill = skill
        ..user = user
        ..value = value
        ..project = project,
    ),
  );

  return firestoreData;
}
