// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/core/networks/api_errors.dart';
import 'package:yummy/core/networks/api_exceptions.dart';
import 'package:yummy/features/auth/components/custom_auth_button.dart';
import 'package:yummy/features/auth/data/auth_repo.dart';
import 'package:yummy/features/auth/view/signup_view.dart';
import 'package:yummy/root.dart';
import 'package:yummy/shared/custom_snakbar.dart';
import 'package:yummy/shared/custom_text.dart';
import 'package:yummy/shared/custom_textForm.dart';
import 'package:yummy/shared/yummy_logo.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AuthRepo authRepo = AuthRepo();
  bool isLoading = false;
  
  Future<void> login() async {
    setState(() {
      isLoading = true;
    });
    try {
      await authRepo.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(customSnakbar("Log in successfully", Colors.green));
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => RootView()),
      );
    } catch (e) {
      String errorMessage;

      if (e is ApiErrors) {
        errorMessage = e.message;
      } else if (e is DioException) {
        errorMessage = ApiExceptions.handleError(e).message;
      } else {
        errorMessage = e.toString();
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(customSnakbar(errorMessage, Colors.redAccent));

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,

        body: Column(
          children: [
            Gap(140),
            Center(child: YummyLogo()),
            Gap(5),

            CustomText(
              text: 'Welcome , Descover Delicious Foods',
              size: 15,
              color: Colors.grey[200],
            ),

            Gap(150),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 50,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextform(
                            controller: emailController,
                            hintText: 'Email',
                            isPassword: false,
                            obscureText: false,
                            prefixIcon: Icons.email,
                          ),

                          Gap(20),

                          CustomTextform(
                            controller: passwordController,
                            hintText: 'Password',
                            isPassword: true,
                            obscureText: true,
                            prefixIcon: Icons.lock,
                          ),

                          Gap(30),

                          isLoading
                              ? CupertinoActivityIndicator()
                              : CustomAuthButton(
                                  text: 'Login',
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      login();
                                    }
                                  },
                                ),
                          Gap(15),

                          RichText(
                            text: TextSpan(
                              text: "You don't have an account? ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => SignupView(),
                                        ),
                                      );
                                    },

                                  text: "Go Signup",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
