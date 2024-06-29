import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class Spacing extends StatelessWidget {
  Spacing({super.key, required this.amount});
  double amount;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Gap(amount),
    );
  }
}
