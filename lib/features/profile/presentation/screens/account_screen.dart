import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:twosome_app/config/routes/routes.dart';
import 'package:twosome_app/core/presentation/widgets/snackbar_helper.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_state.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
        print("Auth State: $state");
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
                  if (state is Authenticated)
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(CupertinoIcons.mail),
                          title: Text('Email'),
                          subtitle: Text(state.user.email),
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
                    onPressed: () {
                      context.read<AuthBloc>().add(DeleteUserEvent());
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
