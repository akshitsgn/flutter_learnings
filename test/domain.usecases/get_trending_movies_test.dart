
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newapp/domain/entities/Movies.dart';
import 'package:newapp/domain/repositories/Repository.dart';
import 'package:newapp/domain/usecases/get_trending_movies.dart';
import 'get_trending_movies_test.mocks.dart';

// class MockMovieRepository extends Mock implements MovieRepository{}
@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main() {
   late GetTrendingMovies usecase;
   late MockMovieRepository mockMovieRepository;

   setUp(() {
     mockMovieRepository = MockMovieRepository();
     usecase = GetTrendingMovies(mockMovieRepository);
   });

   final tMoviesList = [
     Movie(id: 1, title: "Test Movie 1", overview: "Desc 1", posterPath: "/image1"),
     Movie(id: 2, title: "Test Movie 2", overview: "Desc 2", posterPath: "/image2"),
   ];

   test('should get trending movies from the repository', () async {
     // arrange
     when(mockMovieRepository.getTrendingMovies())
         .thenAnswer((_)  async =>  tMoviesList);
     // act
     final result = await usecase();

     expect(result, tMoviesList);
     verify(mockMovieRepository.getTrendingMovies());
     verifyNoMoreInteractions(mockMovieRepository);
   });
}