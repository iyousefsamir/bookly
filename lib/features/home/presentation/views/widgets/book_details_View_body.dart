import 'package:bookly_app/core/utils/styles.dart';
// import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetialsViewBody extends StatelessWidget {
  const BookDetialsViewBody({super.key});

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
                  DetailsBooksSection(),
                  const SizedBox(height: 12),
                  const BookRating(mainAxisAlignment: MainAxisAlignment.center),
                  const SizedBox(height: 35),
                  BooksAction(),
                  Expanded(child: const SizedBox(height: 35)),
                  SilmilarBooksSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DetailsBooksSection extends StatelessWidget {
  const DetailsBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .21),
          child: const CustomBookImage(),
        ),
        const SizedBox(height: 33),
        Text('The Jungle Book', style: Styles.textstyle30),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class SilmilarBooksSection extends StatelessWidget {
  const SilmilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            'You can also like',
            style: Styles.textstyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 10),
        SimilarBooksListView(),
      ],
    );
  }
}
