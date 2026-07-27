// import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_Search_text_filed.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_book_list_view.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 30),
          CustomTextField(),
          SizedBox(height: 16),
          Text('Search Result', style: Styles.textStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchBookListView()),
        ],
      ),
    );
  }
}
