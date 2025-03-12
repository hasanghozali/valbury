import 'package:app/const/value_const.dart';
import 'package:app/controller/account_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/util/biometric_util.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/image_atom.dart';
import 'package:app/view/atom/scaffold_atom.dart';
import 'package:app/view/atom/switch_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:app/view/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  AccountController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ScaffoldAtom(
      title: '',
      body: SafeArea(
        top: false,
        child: Padding(
          padding: REdgeInsets.all(20),
          child: Obx(() {
            final account = controller.account.value;
            return Column(
              children: [
                ImageAtom(
                  width: 80.r,
                  height: 80.r,
                  borderRadius: BorderRadius.circular(40.r),
                  url: account?.avatar ?? '',
                ),
                SizedBox(height: 16.r),
                Text(
                  account?.name ?? ValueConst.defaultValue,
                  style: TextStyleAtom.bold20,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.r),
                Text(
                  account?.email ?? ValueConst.defaultValue,
                  style: TextStyleAtom.semiBold14Primary,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60.r),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        s.biometric,
                        style: TextStyleAtom.bold20,
                      ),
                    ),
                    SwitchAtom(
                      value: account?.isBiometric ?? false,
                      onChanged: (value) async {
                        if (value == true) {
                          final validate = await BiometricUtil.validate();
                          controller.activeBiometric(validate);
                        } else {
                          controller.activeBiometric(false);
                        }
                      },
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(height: 12.r),
                ButtonAtom.primary(
                  width: double.infinity,
                  label: s.logout,
                  onTap: () {
                    controller.logOut();
                    Get.offAll(() => const LoginPage());
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
