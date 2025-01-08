import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/features/dots/data/models/dot_model.dart';
import 'package:twosome_app/features/dots/domain/entities/dot.dart';

abstract class DotRemoteDataSource {
  Future<List<Dot>> getDots();
}

class DotRemoteDataSourceImpl implements DotRemoteDataSource {
  final FirebaseFirestore firestore;

  DotRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<DotModel>> getDots() async {
    try {
      final snapshot = await firestore.collection('dots').get();
      return snapshot.docs.map((doc) => DotModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw ServerFailure('Failed to fetch dots');
    }
  }
}
