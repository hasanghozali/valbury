import 'package:app/controller/connection_controller.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/molecule/error_molecule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingAtom extends StatelessWidget {
  final RxBool isLoading;
  final RxnString errorMessage;
  final void Function() onRetry;
  final Widget child;

  const LoadingAtom({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.onRetry,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ConnectionController controller = Get.find();

    return Obx(() {
      if (isLoading.value) {
        return const Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: ColorAtom.primary),
              ],
            ),
          ),
        );
      }

      if (errorMessage.value != null) {
        if (controller.isInternetAvailable.value) {
          Future.microtask(() => onRetry.call());
        }

        return Expanded(
          child: ErrorMolecule(
            desc: errorMessage.value,
            onTap: onRetry,
          ),
        );
      }

      return child;
    });
  }
}
