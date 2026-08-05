// import 'package:bookly_app/core/utils/styles.dart';
// import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
// import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/details_books_section.dart';
// import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetialsViewBody extends StatelessWidget {
  const BookDetialsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const CustomBookDetailsAppBar(),
                  DetailsBooksSection(bookModel: bookModel),
                  const SizedBox(height: 12),
                  const BookRating(mainAxisAlignment: MainAxisAlignment.center),
                  const SizedBox(height: 25),
                  BooksAction(bookModel: bookModel),
                  Expanded(child: const SizedBox(height: 35)),
                  SilmilarBooksSection(),
                  Expanded(child: const SizedBox(height: 25)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
