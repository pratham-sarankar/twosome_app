import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twosome_app/features/dots/domain/entities/dot.dart';

class DotModel extends Dot {
  const DotModel({
    required super.id,
    required super.profession,
    required super.personality,
    required super.imageUrl,
  });

  factory DotModel.fromSnapshot(DocumentSnapshot snapshot) {
    return DotModel(
      id: snapshot.id,
      profession: snapshot['profession'],
      personality: snapshot['personality'],
      imageUrl: snapshot['imageUrl'],
    );
  }
}
