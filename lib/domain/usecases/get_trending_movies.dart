import '../entities/Movies.dart';
import '../repositories/Repository.dart';

// All the business  logic is here for retrieving the movie data
class GetTrendingMovies{
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<List<Movie>> call() async {
    return repository.getTrendingMovies();
  }
}