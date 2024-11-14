import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_firebase/core/utils/utils.dart';
import 'package:sample_firebase/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sample_firebase/features/auth/presentation/cubit/obscure_cubit.dart';
import 'package:sample_firebase/features/auth/presentation/views/register_screen.dart';
import 'package:sample_firebase/features/auth/presentation/widgets/auth_widget.dart';
import 'package:sample_firebase/features/home/presentation/views/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCntr = TextEditingController();
  TextEditingController pswCntr = TextEditingController();

  @override
  void dispose() {
    emailCntr.dispose();
    pswCntr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("New User ? "),
            GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(MaterialPageRoute(
                      builder: (_) => const RegisterScreen()));
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.green),
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/png.png",
              height: sH(context) / 2,
            ),
            spaceHeight(20),
            txtfield(
                ic: Icons.email_outlined,
                txt: "jhon@example.com",
                cntr: emailCntr),
            spaceHeight(30),
            BlocBuilder<ObscureCubit, int>(
              builder: (context, state) {
                return txtfield(
                  ic: Icons.lock,
                  txt: "******",
                  cntr: pswCntr,
                  isPsw: true,
                  obsure: state == 0 ? true : false,
                  suffix: IconButton(
                    onPressed: () {
                      context.read<ObscureCubit>().update(state == 0 ? 1 : 0);
                    },
                    icon: Icon(state == 0
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined),
                  ),
                );
              },
            ),
            spaceHeight(50),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  errorToast(context, msg: state.error.error);
                }
                if (state is AuthLogin) {
                  errorToast(context, msg: "successfully logged in !!");
                  navigatorKey.currentState!.pushReplacement(
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return btn(context,
                      child: loading(clr: Colors.white), onpressed: () {});
                }

                return btn(context, child: const Text("LOGIN"), onpressed: () {
                  if (emailCntr.text.isEmpty) {
                    errorToast(context, msg: "please enter the email field !");
                  } else if (pswCntr.text.isEmpty) {
                    errorToast(context,
                        msg: "please enter the password field !");
                  } else {
                    context
                        .read<AuthCubit>()
                        .login(email: emailCntr.text, password: pswCntr.text);
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
