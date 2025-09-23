import 'package:event_app_c16_sat/core/routes/page_routes_name.dart';
import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/core/widgets/custom_button_widget.dart';
import 'package:event_app_c16_sat/core/widgets/custom_text_form_filed.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
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
              hintText: "Name",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.personIcn.image(width: 24),
              ),
            ),
            SizedBox(height: 16),
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
            SizedBox(height: 16),
            CustomTextFormFiled(
              hintText: "Re Password",
              isPassword: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.passwordIcn.image(width: 24),
              ),
            ),
            SizedBox(height: 24),
            CustomButtonWidget(onPressed: () {}, buttonText: "Create Account"),
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
    );
  }
}
