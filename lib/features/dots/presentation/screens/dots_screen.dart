import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:twosome_app/config/routes/routes.dart';
import 'package:twosome_app/core/presentation/widgets/snackbar_helper.dart';
import 'package:twosome_app/features/dots/presentation/bloc/dots_bloc.dart';
import 'package:twosome_app/features/dots/presentation/bloc/dots_event.dart';
import 'package:twosome_app/features/dots/presentation/bloc/dots_state.dart';
import 'package:twosome_app/features/dots/presentation/widgets/dot_card.dart';

class DotsScreen extends StatefulWidget {
  const DotsScreen({super.key});

  @override
  State<DotsScreen> createState() => _DotsScreenState();
}

class _DotsScreenState extends State<DotsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DotsBloc>().add(LoadDots());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover"),
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.grey.shade900,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size(0, 35),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CupertinoSearchTextField(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              prefixIcon: const Icon(IconlyLight.search),
              prefixInsets: EdgeInsets.only(left: 10),
              suffixInsets: EdgeInsets.only(right: 10),
              style: GoogleFonts.poppins(),
              placeholder: "Search for a Dot",
            ),
          ),
        ),
      ),
      body: BlocConsumer<DotsBloc, DotsState>(listener: (context, state) {
        if (state.status == DotsStatus.failure) {
          SnackBarHelper.showError(context, state.error!);
        }
      }, builder: (context, state) {
        if (state.status == DotsStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          childAspectRatio: 9 / 11,
          children: [
            for (final dot in state.dots)
              DotCard(
                dot: dot,
                onPressed: () {
                  context.push(
                    Routes.chat,
                    extra: dot,
                  );
                },
              ),
          ],
        );
      }),
    );
  }
}
