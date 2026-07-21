import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeVeiwBody extends StatelessWidget {
  const HomeVeiwBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [const CustomAppBar()]);
  }
}
