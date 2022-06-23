import 'package:flutter/material.dart';

class ProgressBarAnimationStore extends ValueNotifier {
  ProgressBarAnimationStore() : super(0.25);

  get progressBar => value;

  void navigateNextPage() {
    if (value >= 1) {
      value = 1;
    } else {
      value += 0.25;
    }
  }

  void navigateLastPage() {
    if (value <= 0.25) {
      value = 0.25;
    } else {
      value -= 0.25;
    }
  }
}
