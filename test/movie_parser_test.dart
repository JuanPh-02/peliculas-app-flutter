import 'package:flutter_test/flutter_test.dart';
import 'package:peliculas_prueba/models/models.dart';

void main() {
  test('Movie model parses JSON correctly', () {
    final movieJson = {
      "backdrop_path": "/avedvodAZUcwqevBfm8p4G2NziQ.jpg",
      "genres": [
        {"id": 18, "name": "Drama"},
        {"id": 80, "name": "Crimen"}
      ],
      "id": 278,
      "original_title": "The Shawshank Redemption",
      "overview":
          "Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      "popularity": 157.803,
      "poster_path": "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
      "release_date": "1994-09-23",
      "production_companies": [
        {
          "id": 97,
          "logo_path": "/7znWcbDd4PcJzJUlJxYqAlPPykp.png",
          "name": "Castle Rock Entertainment",
          "origin_country": "US"
        }
      ],
      "title": "The Shawshank Redemption",
      "vote_average": 8.706,
    };

    
    final movie = Movie.fromJson(movieJson);

    
    expect(movie.backdropPath, "/avedvodAZUcwqevBfm8p4G2NziQ.jpg");
    expect(movie.genres!.length, 2);
    expect(movie.genres![0].name, "Drama");
    expect(movie.genres![1].name, "Crimen");
    expect(movie.id, 278);
    expect(movie.originalTitle, "The Shawshank Redemption");
    expect(movie.overview.startsWith("Imprisoned in the 1940s"), true);
    expect(movie.popularity, 157.803);
    expect(movie.posterPath, "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg");
    expect(movie.releaseDate, "1994-09-23");
    expect(movie.studio, "Castle Rock Entertainment");
    expect(movie.voteAverage, 8.706);
  });
}
