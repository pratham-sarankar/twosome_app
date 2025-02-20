import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:twosome_app/config/routes/routes.dart';
import 'package:twosome_app/core/presentation/widgets/snackbar_helper.dart';
import 'package:twosome_app/features/auth/domain/entities/user.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:twosome_app/features/profile/presentation/widgets/deletion_confirmation_dialog.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(GetCurrentUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final scaffoldBgColor = theme.scaffoldBackgroundColor;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (kDebugMode) {
          print("Auth State: $state");
        }
        if (state is Authenticated) {
          user = state.user;
        }
        if (state is AuthError) {
          SnackBarHelper.showError(context, state.message);
        }
        if (state is Unauthenticated) {
          context.go(Routes.login);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Account"),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  if (user != null)
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(CupertinoIcons.mail),
                          title: Text('Email'),
                          subtitle: Text(user!.email),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                        ),
                      ],
                    ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) => DeletionConfirmationDialog(),
                      );
                      if (context.mounted && result == true) {
                        context.read<AuthBloc>().add(DeleteUserEvent());
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.delete),
                        const SizedBox(width: 10),
                        Text("Delete Account"),
                      ],
                    ),
                  ),
                ],
              ),
              if (state is AuthLoading)
                Center(
                  child: Container(
                    padding: EdgeInsets.all(size.width * 0.08),
                    decoration: BoxDecoration(
                      color: scaffoldBgColor.withAlpha(200),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(primaryColor),
                      strokeWidth: 3,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
//
