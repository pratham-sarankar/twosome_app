import 'package:flutter_test/flutter_test.dart';
import 'package:twosome_app/features/dots/domain/entities/dot.dart';

void main() {
  group(
    'Dot Entity',
    () {
      test(
        'should create a valid Dot instancel',
        () {
          const dot = Dot(
            id: '1',
            profession: 'Software Engineer',
            personality: 'Kind and Caring',
            imageUrl: 'https://www.example.com/image.jpg',
          );
          expect(dot.id, '1');
          expect(dot.profession, 'Software Engineer');
          expect(dot.personality, 'Kind and Caring');
          expect(dot.imageUrl, 'https://www.example.com/image.jpg');
        },
      );

      test(
        'should return true when two Dot entities are equal',
        () {
          const dot1 = Dot(
            id: '1',
            profession: 'Software Engineer',
            personality: 'Kind and Caring',
            imageUrl: 'https://www.example.com/image.jpg',
          );
          const dot2 = Dot(
            id: '1',
            profession: 'Software Engineer',
            personality: 'Kind and Caring',
            imageUrl: 'https://www.example.com/image.jpg',
          );
          expect(dot1, dot2);
        },
      );
    },
  );
}
