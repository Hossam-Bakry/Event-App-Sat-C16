import 'package:event_app_c16_sat/core/routes/page_routes_name.dart';
import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/core/utils/firebase_auth_service.dart';
import 'package:event_app_c16_sat/core/widgets/custom_button_widget.dart';
import 'package:event_app_c16_sat/core/widgets/custom_text_form_filed.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Assets.images.appLogo.image(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                SizedBox(height: 24),
                CustomTextFormFiled(
                  controller: nameController,
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "please enter your name";
                    }
                    return null;
                  },
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.personIcn.image(width: 24),
                  ),
                ),
                SizedBox(height: 16),
                CustomTextFormFiled(
                  controller: emailController,
                  hintText: "Email",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "please enter your name";
                    }
                    final RegExp regex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!regex.hasMatch(value)) {
                      return "please enter a valid email";
                    }

                    return null;
                  },
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.emailIcn.image(width: 24),
                  ),
                ),
                SizedBox(height: 16),
                CustomTextFormFiled(
                  controller: passwordController,
                  hintText: "Password",
                  isPassword: true,
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "please enter your name";
                    }
                    final RegExp regex = RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
                    );
                    if (!regex.hasMatch(value)) {
                      return "please enter a valid email";
                    }

                    return null;
                  },
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.passwordIcn.image(width: 24),
                  ),
                ),
                SizedBox(height: 16),
                CustomTextFormFiled(
                  controller: confirmPasswordController,
                  hintText: "Re Password",
                  isPassword: true,
                  maxLines: 1,
                  validator: (p0) {
                    if (p0 == null || p0.trim().isEmpty) {
                      return "please enter your name";
                    }
                    if (p0 != passwordController.text) {
                      return "passwords do not match";
                    }
                    return null;
                  },
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.passwordIcn.image(width: 24),
                  ),
                ),
                SizedBox(height: 24),
                CustomButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      EasyLoading.show();
                      FirebaseAuthService.createAccount(
                        emailController.text,
                        passwordController.text,
                      ).then((value) {
                        if ((value)) {
                          EasyLoading.dismiss();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            PageRoutesName.layout,
                            (route) => false,
                          );
                        }
                      });
                    }
                  },
                  buttonText: "Create Account",
                ),
                SizedBox(height: 24),
                Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account ?",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Bounceable(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: ColorPallete.primaryColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPallete.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
