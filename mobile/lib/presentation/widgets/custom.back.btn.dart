import 'package:flutter/material.dart';

import '../../app/constants/app.colors.dart';

class CustomBackButton extends StatelessWidget {
  final String route;
  const CustomBackButton({
    Key? key,
    required this.route,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColors.white,
      icon: const Icon(
        Icons.arrow_circle_left_outlined,
        size: 36.0,
      ),
      onPressed: () => Navigator.of(context).pushNamed(route),
    );
  }
}

class CustomBackPop extends StatelessWidget {
  const CustomBackPop({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColors.white,
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_circle_left_outlined,
        size: 36.0,
      ),
    );
  }
}
