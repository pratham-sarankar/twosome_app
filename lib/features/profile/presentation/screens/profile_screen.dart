import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:twosome_app/config/routes/routes.dart';
import 'package:twosome_app/core/presentation/widgets/snackbar_helper.dart';
import 'package:twosome_app/features/auth/domain/use_cases/sign_out.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:twosome_app/features/profile/presentation/widgets/signout_confirmation_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthError) {
        SnackBarHelper.showError(context, state.message);
      }
      if (state is Unauthenticated) {
        context.go(Routes.login);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Me"),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            Text(
              "Profile",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Card(
              elevation: 0,
              margin: EdgeInsets.only(top: 10),
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withAlpha(150),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    title: Text("You"),
                    leading: Icon(IconlyLight.profile),
                    horizontalTitleGap: 10,
                    trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 0,
              margin: EdgeInsets.only(top: 10),
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withAlpha(150),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    title: Text("Account"),
                    subtitle: Text("developer.pratham@gmail.com"),
                    horizontalTitleGap: 10,
                    trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  ),
                  const Divider(height: 0, thickness: 1),
                  ListTile(
                    onTap: () {},
                    title: Text("About"),
                    subtitle: Text("V2.5.4"),
                    horizontalTitleGap: 10,
                    trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  ),
                  const Divider(height: 0, thickness: 1),
                  ListTile(
                    onTap: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) {
                          return SignoutConfirmationDialog();
                        },
                      );
                      if (context.mounted && result == true) {
                        context.read<AuthBloc>().add(SignOutEvent());
                      }
                    },
                    title: Center(child: Text("Sign Out")),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
