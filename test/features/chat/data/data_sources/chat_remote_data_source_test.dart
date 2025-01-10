import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:twosome_app/features/chat/data/data_sources/chat_remote_data_source.dart';
import 'package:twosome_app/features/chat/data/models/chat_message_model.dart';

import 'chat_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<FirebaseFirestore>(),
  MockSpec<CollectionReference>(),
  MockSpec<DocumentReference>(),
  MockSpec<Query>(),
  MockSpec<QuerySnapshot>(),
  MockSpec<QueryDocumentSnapshot>(),
])
void main() {
  late ChatRemoteDataSource dataSource;
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentReference;
  late MockQuery<Map<String, dynamic>> mockQuery;
  late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;
  late MockQueryDocumentSnapshot<Map<String, dynamic>>
      mockQueryDocumentSnapshot;

  setUp(
    () {
      mockFirestore = MockFirebaseFirestore();
      mockCollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();
      mockQuery = MockQuery();
      mockQuerySnapshot = MockQuerySnapshot();
      mockQueryDocumentSnapshot = MockQueryDocumentSnapshot();

      when(mockFirestore.collection(any)).thenReturn(mockCollectionReference);
      when(mockCollectionReference.doc(any)).thenReturn(mockDocumentReference);
      when(mockDocumentReference.collection(any))
          .thenReturn(mockCollectionReference);
      when(mockCollectionReference.orderBy(any,
              descending: anyNamed('descending')))
          .thenReturn(mockQuery);
      when(mockQuery.limit(any)).thenReturn(mockQuery);
      when(mockQuery.startAfterDocument(any)).thenReturn(mockQuery);
      when(mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);

      dataSource = ChatRemoteDataSourceImpl(mockFirestore);
    },
  );

  final tMessagesData = _getTMessagesData();
  final tMessagesDocumentSnapshots = tMessagesData.map((data) {
    final doc = MockQueryDocumentSnapshot<Map<String, dynamic>>();
    when(doc[captureAny])
        .thenAnswer((invocation) => data[invocation.positionalArguments[0]]);
    when(doc.data()).thenReturn(data);
    return doc;
  }).toList();
  final tChatMessages = tMessagesDocumentSnapshots
      .map((doc) => ChatMessageModel.fromSnapshot(doc))
      .toList();

  group(
    'getMessages',
    () {
      test(
        'should return a list of ChatMessageModel when the call to Firestore is successful',
        () async {
          // arrange
          when(mockQuerySnapshot.docs).thenReturn(tMessagesDocumentSnapshots);
          // act
          final int limit = 10;
          final result = await dataSource.getMessages(
            'conversationId',
            limit: limit,
          );
          // assert
          expect(result, tChatMessages);
          expect(result.length, 10);
        },
      );
    },
  );
}

List<Map<String, dynamic>> _getTMessagesData() {
  final tMessages = <Map<String, dynamic>>[];
  for (var i = 0; i < 50; i++) {
    final data = {
      'id': '$i',
      'message': 'message $i',
      'senderId': 'senderId $i',
      'timestamp': Timestamp.now(),
    };
    tMessages.add(data);
  }
  return tMessages;
}
