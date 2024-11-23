

import '../entities/Movies.dart';

abstract class MovieRepository{
  Future<List<Movie>> getTrendingMovies(); //get
  Future<List<Movie>> searchMovies(String query); //post
  Future<List<Movie>> getPopularMovies(); // get
}