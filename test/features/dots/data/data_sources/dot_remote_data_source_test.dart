import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/features/dots/data/data_sources/dot_remote_data_source.dart';
import 'package:twosome_app/features/dots/data/models/dot_model.dart';

import 'dot_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FirebaseFirestore>()])
@GenerateNiceMocks([MockSpec<CollectionReference>()])
@GenerateNiceMocks([MockSpec<QuerySnapshot>()])
@GenerateNiceMocks([MockSpec<QueryDocumentSnapshot>()])
void main() {
  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;
  late DotRemoteDataSourceImpl dataSource;

  setUp(
    () {
      mockFirebaseFirestore = MockFirebaseFirestore();
      mockCollectionReference = MockCollectionReference();
      mockQuerySnapshot = MockQuerySnapshot();
      dataSource = DotRemoteDataSourceImpl(mockFirebaseFirestore);
    },
  );

  final tDotModel = [
    const DotModel(
      id: '1',
      profession: 'Software Engineer',
      personality: 'Kind and Caring',
      imageUrl: 'https://www.example.com/image.jpg',
    ),
    const DotModel(
      id: '2',
      profession: 'Doctor',
      personality: 'Smart and Intelligent',
      imageUrl: 'https://www.example.com/image.jpg',
    ),
  ];
  // MockQueryDocumentSnapshot
  final mockQDS = [
    MockQueryDocumentSnapshot<Map<String, dynamic>>(),
    MockQueryDocumentSnapshot<Map<String, dynamic>>(),
  ];
  // MockQueryDocumentSnapshotData1
  final mockQDSData1 = {
    'profession': 'Software Engineer',
    'personality': 'Kind and Caring',
    'imageUrl': 'https://www.example.com/image.jpg',
  };
  // MockQueryDocumentSnapshotData2
  final mockQDSData2 = {
    'profession': 'Doctor',
    'personality': 'Smart and Intelligent',
    'imageUrl': 'https://www.example.com/image.jpg',
  };

  // Stub the mockQDS, id, and data() methods.
  // Since the DocumentSnapshot class allows access using [] operators,
  // we also need to override the operator methods.
  when(mockQDS[0].id).thenReturn('1');
  when(mockQDS[0].data()).thenReturn(mockQDSData1);
  when(mockQDS[0][captureAny]).thenAnswer((invocation) {
    final key = invocation.positionalArguments[0];
    return mockQDSData1[key];
  });
  when(mockQDS[1].id).thenReturn('2');
  when(mockQDS[1].data()).thenReturn(mockQDSData2);
  when(mockQDS[1][captureAny]).thenAnswer((invocation) {
    final key = invocation.positionalArguments[0];
    return mockQDSData2[key];
  });

  test(
    'should get list of DotModels from firestore',
    () async {
      // arrange
      when(mockFirebaseFirestore.collection('dots'))
          .thenReturn(mockCollectionReference);
      when(mockCollectionReference.get())
          .thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn(mockQDS);

      // act
      final result = await dataSource.getDots();

      // assert
      expect(result, tDotModel);
    },
  );

  test(
    'should return empty list if there are no dots',
    () async {
      // arrange
      when(mockFirebaseFirestore.collection('dots'))
          .thenReturn(mockCollectionReference);
      when(mockCollectionReference.get())
          .thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([]);
      // act
      final result = await dataSource.getDots();
      // assert
      expect(result, []);
    },
  );

  test(
    'should throw exception when there is an error',
    () async {
      // arrange
      when(mockFirebaseFirestore.collection('dot'))
          .thenThrow(ServerFailure('Firestore error'));
      // act
      final result = dataSource.getDots();
      // assert
      expect(() => result, throwsA(isA<ServerFailure>()));
    },
  );
}
