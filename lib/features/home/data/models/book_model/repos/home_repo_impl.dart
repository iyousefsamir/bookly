import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBox() async {
    try {
      var date = await apiService.get(
        endpoint:
            'volumes?filter=free-ebooks&q=programming&key=AIzaSyAeijT38HZXJ1E-pdujo1FUoZ10RO8aXNY&Sorting=newest',
      );

      List<BookModel> books = [];
      for (var item in date['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturesBox() async {
    try {
      var date = await apiService.get(
        endpoint:
            'volumes?filter=free-ebooks&q=programming&key=AIzaSyAeijT38HZXJ1E-pdujo1FUoZ10RO8aXNY',
      );

      List<BookModel> books = [];
      for (var item in date['items']) {
        books.add(BookModel.fromJson(item));
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
