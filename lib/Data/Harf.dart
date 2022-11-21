import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Harf {
  String harf = "";
  String durum = "empty";
  Color? color = Colors.transparent;
  double angle = 0.0;
  Harf(String harf, String durum, Color color, double angle) {
    this.harf = harf;
    this.durum = durum;
    this.color = color;
    this.angle = angle;
  }
}

class KeyboardLetter {
  String harf = "";

  Color? color = Colors.transparent;
  KeyboardLetter(String harf, Color color) {
    this.harf = harf;
    this.color = color;
  }
}
