import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppbarHeight,
          child: Column(
            children: [
              // LOGO, TITLE, SUBTITLE
              LoginHeader(dark: dark),

              // FORM
              const LoginForm(),

              // DIVIDER
              FormDivider(
                dividerText: TTexts.orSignInWith.capitalize!,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // FOOTER
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
