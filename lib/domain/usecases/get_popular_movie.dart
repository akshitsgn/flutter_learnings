

import '../entities/Movies.dart';
import '../repositories/Repository.dart';

class GetPopularMovies{
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<Movie>> call() async {
    return repository.getPopularMovies();
  }
}