import 'package:flutter/material.dart';

class KeypadViewModel {
  KeypadViewModel({
    this.price = 0,
    this.note = "",
    // required this.account,
  });

  double price;
  String note;
  // AccountViewModel account;
}

class KeypadInputViewModel {
  KeypadInputViewModel({required this.child, required this.type, this.value});

  Widget child;
  KeypadType type;
  int? value;
}

enum KeypadType { value, dot, del }
