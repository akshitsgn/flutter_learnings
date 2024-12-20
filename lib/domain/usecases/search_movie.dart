

import '../entities/Movies.dart';
import '../repositories/Repository.dart';

class SearchMovies{
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<List<Movie>> call(String query) async {

    return await repository.searchMovies(query);
  }
}