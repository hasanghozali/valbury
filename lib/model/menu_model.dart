import 'package:flutter/material.dart';

class MenuModel {
  String? code;
  IconData? icon;
  IconData? iconActive;
  String? iconAsset;
  String? iconAssetActive;
  String label;
  Widget? child;

  MenuModel({
    this.code,
    this.icon,
    this.iconActive,
    this.iconAsset,
    this.iconAssetActive,
    required this.label,
    this.child,
  });
}
