import 'package:flutter/cupertino.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchAtom extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;

  const SwitchAtom({
    super.key,
    this.value = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.r,
      child: Transform.scale(
        alignment: Alignment.centerRight,
        scale: 0.75.r,
        child: CupertinoSwitch(
          activeTrackColor: ColorAtom.primary,
          inactiveTrackColor: ColorAtom.disabled,
          thumbColor: ColorAtom.white,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
