// import 'package:bookly_app/core/utils/assets.dart';
// import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
//import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';
import 'featured_books_list_view.dart';

class HomeVeiwBody extends StatelessWidget {
  const HomeVeiwBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(height: 50),
          Text('Best Seller', style: Styles.titleMeduim),
          SizedBox(height: 15),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}
