import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/container_injector.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/utils/app_constants.dart';
import 'package:Goal/src/core/utils/app_pref.dart';
import 'package:Goal/src/core/widgets/common.dart';
import 'package:Goal/src/core/widgets/container_button.dart';
import 'package:Goal/src/core/widgets/textfield_container.dart';
import 'package:Goal/src/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:Goal/src/features/auth/presentation/cubit/credential/credential_cubit.dart';
import 'package:Goal/src/features/soccer/presentation/screens/soccer_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AppPreferences? appPreferences;

@override
  void initState() {
        appPreferences = sl<AppPreferences>();

    super.initState();
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        builder: (context, credentialState) {
          if (credentialState is CredentialLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  appPreferences?.saveData(
                    key: 'token', value: authState.uid);
                AppConstants.token = authState.uid;
                  return const SoccerLayout();
                } else {
                  return _bodyWidget();
                }
              },
            );
          }

          return _bodyWidget();
        },
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }

          if (credentialState is CredentialFailure) {
            toast("wrong email please check");
            //toast
            //alertDialog
            ///SnackBar
          }
        },
      ),
    );
  }

  Widget _bodyWidget() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: AppColors.green,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldContainer(
              prefixIcon: Icons.email,
              controller: _emailController,
              hintText: "Email",
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldContainer(
              prefixIcon: Icons.email,
              controller: _passwordController,
              hintText: "Password",
              isObscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  //Navigate
                  Navigator.pushNamed(context, Routes.foreget);
                },
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ContainerButton(
              onTap: () {
                _submitLogin();
              },
              title: "Login",
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                const Text(
                  "don't have an Account",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.signUp, (routes) => false);
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                //Submit Google Login
                BlocProvider.of<CredentialCubit>(context).googleAuthSubmit();
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: const Offset(1.0, 1.0),
                        spreadRadius: 1,
                        blurRadius: 1,
                      )
                    ]),
                child: const Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitLogin() {
    if (_emailController.text.isEmpty) {
      toast("Enter Your Email");
      return;
    }

    if (_passwordController.text.isEmpty) {
      toast("Enter Your Password");
      return;
    }

    BlocProvider.of<CredentialCubit>(context).signInSubmit(
        email: _emailController.text, password: _passwordController.text);
  }
}
