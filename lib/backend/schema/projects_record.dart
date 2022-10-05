import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'projects_record.g.dart';

abstract class ProjectsRecord
    implements Built<ProjectsRecord, ProjectsRecordBuilder> {
  static Serializer<ProjectsRecord> get serializer =>
      _$projectsRecordSerializer;

  String? get description;

  String? get title;

  DocumentReference? get founder;

  BuiltList<String>? get keywords;

  String? get stream;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProjectsRecordBuilder builder) => builder
    ..description = ''
    ..title = ''
    ..keywords = ListBuilder()
    ..stream = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projects');

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ProjectsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProjectsRecord(
        (c) => c
          ..description = snapshot.data['description']
          ..title = snapshot.data['title']
          ..founder = safeGet(() => toRef(snapshot.data['founder']))
          ..keywords = safeGet(() => ListBuilder(snapshot.data['keywords']))
          ..stream = snapshot.data['stream']
          ..ffRef = ProjectsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProjectsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'projects',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ProjectsRecord._();
  factory ProjectsRecord([void Function(ProjectsRecordBuilder) updates]) =
      _$ProjectsRecord;

  static ProjectsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProjectsRecordData({
  String? description,
  String? title,
  DocumentReference? founder,
  String? stream,
}) {
  final firestoreData = serializers.toFirestore(
    ProjectsRecord.serializer,
    ProjectsRecord(
      (p) => p
        ..description = description
        ..title = title
        ..founder = founder
        ..keywords = null
        ..stream = stream,
    ),
  );

  return firestoreData;
}
