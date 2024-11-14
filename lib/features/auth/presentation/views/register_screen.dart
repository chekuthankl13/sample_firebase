import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_firebase/core/utils/utils.dart';
import 'package:sample_firebase/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sample_firebase/features/auth/presentation/widgets/auth_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailCntr = TextEditingController();
  TextEditingController pswCntr = TextEditingController();
  TextEditingController psw2Cntr = TextEditingController();

  @override
  void dispose() {
    emailCntr.dispose();
    pswCntr.dispose();
    psw2Cntr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/png.png",
              height: sH(context) / 2,
            ),
            spaceHeight(30),
            txtfield(
                ic: Icons.email_outlined,
                txt: "jhon@example.com",
                cntr: emailCntr),
            spaceHeight(30),
            txtfield(
                ic: Icons.lock,
                txt: "password",
                cntr: pswCntr,
                isPsw: true,
                obsure: true,
                suffix: null),
            spaceHeight(30),
            txtfield(
                ic: Icons.lock,
                txt: "confirm password",
                cntr: psw2Cntr,
                isPsw: true,
                obsure: true,
                suffix: null),
            spaceHeight(50),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  errorToast(context, msg: state.error.error);
                }
                if (state is AuthRegister) {
                  errorToast(context, msg: "successfully Registered !!");
                  navigatorKey.currentState!.pop();
                  errorToast(context, msg: "please Login  to access the app!!");

                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return btn(context,
                      child: loading(clr: Colors.white), onpressed: () {});
                }

                return btn(context, child: const Text("REGISTER"),
                    onpressed: () {
                  if (emailCntr.text.isEmpty) {
                    errorToast(context, msg: "please enter the email field !");
                  } else if (pswCntr.text.isEmpty || psw2Cntr.text.isEmpty) {
                    errorToast(context,
                        msg: "please enter the password field !");
                  }else if(pswCntr.text != psw2Cntr.text){
                    errorToast(context,
                        msg: "password mismatch !!");
                  }
                  
                   else {
                    context
                        .read<AuthCubit>()
                        .register(email: emailCntr.text, password: pswCntr.text);
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
