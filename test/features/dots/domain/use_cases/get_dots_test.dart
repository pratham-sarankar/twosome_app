import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/usecases/usecase.dart';
import 'package:twosome_app/features/dots/domain/entities/dot.dart';
import 'package:twosome_app/features/dots/domain/repositories/dot_repositories.dart';
import 'package:twosome_app/features/dots/domain/use_cases/get_dots.dart';

import 'get_dots_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DotRepository>()])
void main() {
  late GetDots usecase;
  late MockDotRepository mockDotRepository;

  setUp(() {
    mockDotRepository = MockDotRepository();
    usecase = GetDots(mockDotRepository);
  });

  final tDots = [
    const Dot(
      id: '1',
      profession: 'Software Engineer',
      personality: 'Kind and Caring',
      imageUrl: 'https://www.example.com/image.jpg',
    ),
    const Dot(
      id: '2',
      profession: 'Doctor',
      personality: 'Smart and Intelligent',
      imageUrl: 'https://www.example.com/image.jpg',
    ),
  ];

  group(
    'GetDots UseCase',
    () {
      test(
        'should get list of dots from the repository',
        () async {
          // arrange
          when(mockDotRepository.getDots())
              .thenAnswer((_) async => Right(tDots));
          // act
          final result = await usecase(NoParams());
          // assert
          expect(result, Right(tDots));
          verify(mockDotRepository.getDots());
          verifyNoMoreInteractions(mockDotRepository);
        },
      );
      test(
        'should return failure when repository returns a Left',
        () async {
          // arrange
          when(mockDotRepository.getDots())
              .thenAnswer((_) async => Left(ServerFailure('')));
          // act
          final result = await usecase(NoParams());
          // assert
          expect(result, Left(ServerFailure('')));
          verify(mockDotRepository.getDots());
          verifyNoMoreInteractions(mockDotRepository);
        },
      );
      test(
        'should return an empty list if repository has no dots',
        () async {
          // arrange
          final emptyList = <Dot>[];
          when(mockDotRepository.getDots())
              .thenAnswer((_) async => Right(emptyList));
          // act
          final result = await usecase(NoParams());
          // assert
          expect(result, Right(emptyList));
          verify(mockDotRepository.getDots());
          verifyNoMoreInteractions(mockDotRepository);
        },
      );
    },
  );
}
