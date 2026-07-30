import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBox() async {
    try {
      var date = await apiService.get(
        endpoint:
            'volumes?q=subject:programming&key=AIzaSyAeijT38HZXJ1E-pdujo1FUoZ10RO8aXNY',
      );

      List<BookModel> books = [];
      for (var item in date['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturesBox() {
    // TODO: implement fetchFeaturesBox
    throw UnimplementedError();
  }
}
