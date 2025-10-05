import 'package:event_app_c16_sat/core/routes/page_routes_name.dart';
import 'package:event_app_c16_sat/core/services/snackbar_service.dart';
import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/core/utils/firebase_auth_service.dart';
import 'package:event_app_c16_sat/core/widgets/custom_button_widget.dart';
import 'package:event_app_c16_sat/core/widgets/custom_text_form_filed.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
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
                  controller: emailController,
                  hintText: "Email",
                  validator: (p0) {
                    if (p0 == null || p0.trim().isEmpty) {
                      return "please enter your name";
                    }
                    final RegExp regex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!regex.hasMatch(p0)) {
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
                  validator: (p0) {
                    if (p0 == null || p0.trim().isEmpty) {
                      return "please enter your name";
                    }
                    return null;
                  },
                  maxLines: 1,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.passwordIcn.image(width: 24),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(PageRoutesName.forgetPassword);
                    },
                    child: Text(
                      "Forgot Password",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: ColorPallete.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorPallete.primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                CustomButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      EasyLoading.show();
                      FirebaseAuthService.signIn(
                        emailController.text,
                        passwordController.text,
                      ).then((value) {
                        EasyLoading.dismiss();
                        if (value) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            PageRoutesName.layout,
                            (route) => false,
                          );
                          SnackBarService.showSuccessMessage(
                            "Login successfully",
                          );
                        }
                      });
                    }
                  },
                  buttonText: "Login",
                ),
                SizedBox(height: 24),
                Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t Have Account?",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Bounceable(
                      onTap: () {
                        Navigator.of(context).pushNamed(PageRoutesName.signUp);
                      },
                      child: Text(
                        "Create Account",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: ColorPallete.primaryColor,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    Text(
                      "OR",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: ColorPallete.primaryColor,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: ColorPallete.primaryColor,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
                SizedBox(height: 24),
                CustomButtonWidget(
                  onPressed: () {},
                  buttonText: "Login",
                  backgroundColor: Colors.transparent,
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.icons.googleIcn.image(width: 24),
                      Text(
                        "Login With Google",
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: ColorPallete.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
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
    );
  }
}
