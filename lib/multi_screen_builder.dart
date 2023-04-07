library muilt_screen_builder;

import 'package:flutter/material.dart';

class MultiScreenBuilder extends StatelessWidget {
  const MultiScreenBuilder({
    required this.mobileBuilder,
    required this.tabletBuilder,
    required this.desktopBuilder,
    Key? key,
  }) : super(key: key);

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  )? mobileBuilder;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  )? tabletBuilder;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  )? desktopBuilder;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktopBuilder == null
              ? const Text("not compatible for Desktop")
              : desktopBuilder!(context, constraints);
        } else if (constraints.maxWidth >= 600) {
          return tabletBuilder == null
              ? const Text("not compatible for table")
              : tabletBuilder!(context, constraints);
        } else {
          return mobileBuilder == null
              ? const Text("not compatible for mobile")
              : mobileBuilder!(context, constraints);
        }
      },
    );
  }
}
