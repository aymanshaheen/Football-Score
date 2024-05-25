import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/container_button.dart';
import 'package:Goal/src/core/widgets/textfield_container.dart';
import 'package:Goal/src/features/auth/presentation/cubit/credential/credential_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/common.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Don't worry! Just fill in your email we will send you a link to rest your password.",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(.6),
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldContainer(
                prefixIcon: Icons.email,
                controller: _emailController,
                hintText: "Email",
              ),
              const SizedBox(
                height: 30,
              ),
              ContainerButton(
                title: "Send Password Rest Email",
                onTap: () {
                  _submitForgotPasswordEmail();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Text(
                    'Remember the account information? ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.login, (route) => false);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.green),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForgotPasswordEmail() {
    if (_emailController.text.isEmpty) {
      toast("Enter your email");
      return;
    }

    BlocProvider.of<CredentialCubit>(context)
        .forgotPassword(email: _emailController.text)
        .then((value) {
      toast("Email has been sent please check your mail.");
    });
  }
}
