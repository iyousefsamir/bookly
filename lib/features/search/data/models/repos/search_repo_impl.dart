import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
// import 'package:bookly_app/features/home/data/models/book_model/repos/home_repo.dart';
import 'package:bookly_app/features/search/data/models/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String bookName,
  }) async {
    try {
      print('Search: $bookName');
      var data = await apiService.get(
        endpoint:
            'volumes?filter=free-ebooks&q=$bookName&key=AIzaSyAeijT38HZXJ1E-pdujo1FUoZ10RO8aXNY',
      );
      print(data);

      List<BookModel> books = [];

      if (data['items'] != null) {
        for (var item in data['items']) {
          try {
            books.add(BookModel.fromJson(item));
          } on Exception {
            continue;
          }
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
