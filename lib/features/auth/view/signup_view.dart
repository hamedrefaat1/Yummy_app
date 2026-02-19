// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/core/networks/api_errors.dart';
import 'package:yummy/features/auth/components/custom_auth_button.dart';
import 'package:yummy/features/auth/data/auth_repo.dart';
import 'package:yummy/features/auth/view/login_view.dart';
import 'package:yummy/shared/custom_snakbar.dart';
import 'package:yummy/shared/custom_text.dart';
import 'package:yummy/shared/custom_textForm.dart';
import 'package:yummy/shared/yummy_logo.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();
  void signup() async {
    setState(() {
      isLoading = true;
    });
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      try {
        await authRepo.signUp(
          nameController.text.trim(),
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(customSnakbar("SignUp in successfully", Colors.green));
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (c) => LoginView()),
        );
      } catch (e) {
        String errorMessage = "Register Error";
        if (e is ApiErrors) {
          errorMessage = e.message;
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnakbar("Passwords do not match", AppColors.primary),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,

        body: Column(
          children: [
            Gap(100),
            Center(child: YummyLogo()),

            CustomText(
              text: "Welcom to Yummy Foods. ",
              size: 15,
              color: Colors.grey[200],
              wight: FontWeight.w400,
            ),

            Gap(60),
            //  Spacer(),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 40,
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextform(
                            controller: nameController,
                            isPassword: false,
                            hintText: "Name",
                            obscureText: false,
                            prefixIcon: Icons.person,
                          ),
                          Gap(20),
                          CustomTextform(
                            controller: emailController,
                            isPassword: false,
                            hintText: "Email",
                            obscureText: false,
                            prefixIcon: Icons.email,
                          ),
                          Gap(20),
                          CustomTextform(
                            controller: passwordController,
                            isPassword: true,
                            hintText: "Password",
                            obscureText: true,
                            prefixIcon: Icons.lock,
                          ),
                          Gap(20),
                          CustomTextform(
                            controller: confirmPasswordController,
                            isPassword: true,
                            hintText: "Confirm Password",
                            obscureText: true,
                            prefixIcon: Icons.lock,
                          ),

                          Gap(30),

                          CustomAuthButton(
                            text: 'Sign Up',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                 signup();
                              }
                            },
                          ),
                          Gap(15),

                          RichText(
                            text: TextSpan(
                              text: "Do you already have an account? ",
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
                                          builder: (_) => LoginView(),
                                        ),
                                      );
                                    },
                                  text: "Go Login",
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
