import 'package:ecom/controllers/register_provider.dart';
import 'package:ecom/theme/app_color.dart';
import 'package:ecom/theme/app_font.dart';

import 'package:ecom/views/reset_password/reset_password_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  static const String routeName = "ResetPassword";
  static MaterialPage page() {
    return MaterialPage(
      child: ResetPassword(),
      name: routeName,
      key: const ValueKey(routeName),
    );
  }

  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.primary,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset('assets/auth/login_oval.svg'),
                ),
                _buildBackButton(context),
                _buildWelcomeText(context),
                ResetPasswordComponent(email: email),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 20.h,
      left: 10.w,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => context.pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildWelcomeText(BuildContext context) {
    return Positioned(
      top: 60.h,
      left: 20.w,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset Password',
              style: AppTypography.title.copyWith(color: Colors.white),
            ),
            5.verticalSpace,
            RichText(text: TextSpan(children: [..._buildTextSpan()]))
          ],
        ),
      ),
    );
  }

  List<TextSpan> _buildTextSpan() {
    String welcomeText =
        'Enter your email addreess and we will send you link to reset password';
    List<TextSpan> result = [];
    List<String> listOfText = welcomeText.split(' ');
    for (final element in listOfText) {
      if (element == 'Enter') {
        result.add(
          TextSpan(
            text: element,
            style: AppTypography.bodySmall.copyWith(color: Colors.white),
          ),
        );
      } else {
        result.add(
          TextSpan(
            text: ' $element',
            style: AppTypography.bodySmall.copyWith(color: Colors.white),
          ),
        );
      }
    }
    return result;
  }
}
