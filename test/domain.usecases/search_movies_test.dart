




import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newapp/domain/entities/Movies.dart';
import 'package:newapp/domain/repositories/Repository.dart';
import 'package:newapp/domain/usecases/search_movie.dart';

import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });

  final tQuery = 'Inception';

  final tMoviesList = [
    Movie(id: 1, title: "Test Movie 1", overview: "Desc 1", posterPath: "/image1"),
    Movie(id: 2, title: "Test Movie 2", overview: "Desc 2", posterPath: "/image2"),
  ];

  test('should search movies from the repo', () async {
    // arrange
    when(mockMovieRepository.searchMovies(any))
        .thenAnswer((_)  async =>  tMoviesList);
    // act
    final result = await usecase(tQuery);

    expect(result, tMoviesList);
    verify(mockMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}