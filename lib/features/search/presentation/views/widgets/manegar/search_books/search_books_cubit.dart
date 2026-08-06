import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/models/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  final SearchRepo searchRepo;
  Future<void> fetchSearchBooks({required String bookName}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBooks(bookName: bookName);
    result.fold(
      (Failure) {
        emit(SearchBooksFailure(Failure.errMessage));
      },
      (books) {
        emit(SearchBooksSuccess(books));
      },
    );
  }
}
