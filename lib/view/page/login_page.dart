import 'package:app/const/image_const.dart';
import 'package:app/controller/account_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/divider_atom.dart';
import 'package:app/view/atom/language_atom.dart';
import 'package:app/view/atom/scaffold_atom.dart';
import 'package:app/view/atom/scroll_expanded_atom.dart';
import 'package:app/view/atom/text_field_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tecEmail = TextEditingController();
  final _tecPassword = TextEditingController();
  final _controller = Get.put(AccountController());

  @override
  void initState() {
    super.initState();
    _controller.validate(_tecEmail.text, _tecPassword.text);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ScaffoldAtom(
      body: ScrollExpandedAtom(
        padding: REdgeInsets.all(20),
        child: Obx(() {
          return Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: LanguageAtom(),
              ),
              SizedBox(height: 16.r),
              Expanded(
                child: SvgPicture.asset(
                  ImageConst.logo,
                  width: 150.r,
                  height: 150.r,
                ),
              ),
              SizedBox(height: 16.r),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  s.welcome,
                  style: TextStyleAtom.bold20Primary,
                ),
              ),
              SizedBox(height: 18.r),
              TextFieldAtom(
                controller: _tecEmail,
                title: s.email,
                hintText: s.email_hint,
                error: _controller.errorEmail.value,
                onChanged: (_) => _controller.validate(_tecEmail.text, _tecPassword.text),
              ),
              SizedBox(height: 12.r),
              TextFieldAtom(
                controller: _tecPassword,
                title: s.password,
                hintText: s.password_hint,
                withObscure: true,
                error: _controller.errorPassword.value,
                onChanged: (_) => _controller.validate(_tecEmail.text, _tecPassword.text),
              ),
              SizedBox(height: 4.r),
              Align(
                alignment: Alignment.centerRight,
                child: ButtonAtom.link(
                  label: s.forgot_password,
                  onTap: () {},
                ),
              ),
              SizedBox(height: 18.r),
              ButtonAtom.primary(
                width: double.infinity,
                label: s.login,
                onTap:
                    _controller.isNext.value ? () => _controller.loginEmail(_tecEmail.text, _tecPassword.text) : null,
              ),
              SizedBox(height: 16.r),
              Row(
                children: [
                  const Expanded(child: DividerAtom()),
                  SizedBox(width: 10.r),
                  Text(
                    s.or_login_with,
                    style: TextStyleAtom.regular12BodyText,
                  ),
                  SizedBox(width: 10.r),
                  const Expanded(child: DividerAtom()),
                ],
              ),
              SizedBox(height: 18.r),
              ButtonAtom.secondary(
                width: 60.r,
                height: 60.r,
                icon: IconsaxOutline.finger_scan,
                onTap: () => _controller.loginBiometric(),
              ),
              SizedBox(height: 18.r),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    s.no_account,
                    style: TextStyleAtom.regular14,
                  ),
                  SizedBox(width: 4.r),
                  ButtonAtom.link(
                    label: s.sign_up_now,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
