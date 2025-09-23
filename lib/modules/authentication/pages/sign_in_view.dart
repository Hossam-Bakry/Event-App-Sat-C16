import 'package:event_app_c16_sat/core/routes/page_routes_name.dart';
import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/core/widgets/custom_button_widget.dart';
import 'package:event_app_c16_sat/core/widgets/custom_text_form_filed.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              hintText: "Email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.emailIcn.image(width: 24),
              ),
            ),
            SizedBox(height: 16),
            CustomTextFormFiled(
              hintText: "Password",
              isPassword: true,
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
                Navigator.of(context).pushNamedAndRemoveUntil(
                  PageRoutesName.layout,
                  (route) => false,
                );
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
    );
  }
}
