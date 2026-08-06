// import 'package:bookly_app/features/search/presentation/views/widgets/managar/cubit/search_books_cubit.dart';
// import 'package:bookly_app/features/search/presentation/views/widgets/manegar/cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/manegar/search_books/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: BuildOutlineInputBorder(),
        focusedBorder: BuildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            if (controller.text.trim().isEmpty) return;

            context.read<SearchBooksCubit>().fetchSearchBooks(
              bookName: controller.text,
            );
          },
          icon: Opacity(
            opacity: .8,
            child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 22),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder BuildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
