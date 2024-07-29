import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double _dpMdSize = 48.0;
const double _dpRegSize = 40.0;
const double _xlSize = 24.0;
const double _lgSize = 20.0;
const double _mdSize = 18.0;
const double _regSize = 16.0;
const double _smSize = 14.0;
const double _xsSize = 12.0;

const FontWeight _light = FontWeight.w200;
const FontWeight _semiLight = FontWeight.w300;
const FontWeight _regular = FontWeight.w400;
const FontWeight _medium = FontWeight.w500;
const FontWeight _bold = FontWeight.w600;

typedef TextStyleFunction = TextStyle Function({
  required double fontSize,
  required FontWeight fontWeight,
});

TextStyle lexendDecaTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.lexendDeca(
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle interTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle assistantTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.assistant(
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

class AppTextStyles {
  AppTextStyles._();

  static final Heading heading = Heading._();
  static final Body body = Body._();
  static final Display display = Display._();
}

//Main
class Heading {
  Heading._();

  final Xl xl = Xl._(lexendDecaTextStyle);
  final Lg lg = Lg._(lexendDecaTextStyle);
  final Md md = Md._(lexendDecaTextStyle);
  final Sm sm = Sm._(lexendDecaTextStyle);

  final H2 h2 = H2._(lexendDecaTextStyle);
  final H4 h4 = H4._(lexendDecaTextStyle);
}

class Body {
  Body._();

  final B1 b1 = B1._(interTextStyle);
  final B2 b2 = B2._(interTextStyle);
  final B4 b4 = B4._(assistantTextStyle);

  final Md md = Md._(interTextStyle);
}

class Display {
  Display._();

  final D3 d3 = D3._(lexendDecaTextStyle);
  final D4 d4 = D4._(lexendDecaTextStyle);

  final Baht baht = Baht._(interTextStyle);
  final Baht2 baht2 = Baht2._(interTextStyle);
}

//Sub
class Xl {
  Xl._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _xlSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _xlSize, fontWeight: _bold),
        semiLight = appTextStyle(fontSize: _xlSize, fontWeight: _semiLight),
        light = appTextStyle(fontSize: _xlSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle bold;
  final TextStyle semiLight;
  final TextStyle light;
}

class Lg {
  Lg._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _lgSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _lgSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _lgSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle bold;
  final TextStyle light;
}

class Md {
  Md._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _regSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _regSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _regSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle bold;
  final TextStyle light;
}

class Sm {
  Sm._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _smSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _smSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _smSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle bold;
  final TextStyle light;
}

class B1 {
  B1._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _regSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _regSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _regSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle bold;
  final TextStyle light;
}

class B2 {
  B2._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _smSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _smSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _smSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle bold;
  final TextStyle light;
}

class B4 {
  B4._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _xsSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _xsSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _xsSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle bold;
  final TextStyle light;
}

class D3 {
  D3._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _dpMdSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _dpMdSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _dpMdSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle bold;
  final TextStyle light;
}

class D4 {
  D4._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _dpRegSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _dpRegSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _dpRegSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle bold;
  final TextStyle light;
}

class H2 {
  H2._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _xlSize, fontWeight: _regular),
        medium = appTextStyle(fontSize: _xlSize, fontWeight: _medium),
        bold = appTextStyle(fontSize: _xlSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _xlSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle medium;
  final TextStyle bold;
  final TextStyle light;
}

class H4 {
  H4._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _mdSize, fontWeight: _regular),
        medium = appTextStyle(fontSize: _mdSize, fontWeight: _medium),
        bold = appTextStyle(fontSize: _mdSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _mdSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle medium;
  final TextStyle bold;
  final TextStyle light;
}

class Baht {
  Baht._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _dpMdSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _dpMdSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _dpMdSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle bold;
  final TextStyle light;
}

class Baht2 {
  Baht2._(TextStyleFunction appTextStyle)
      : regular = appTextStyle(fontSize: _dpRegSize, fontWeight: _regular),
        medium = appTextStyle(fontSize: _dpRegSize, fontWeight: _regular),
        bold = appTextStyle(fontSize: _dpRegSize, fontWeight: _bold),
        light = appTextStyle(fontSize: _dpRegSize, fontWeight: _light);

  final TextStyle regular;
  final TextStyle medium;
  final TextStyle bold;
  final TextStyle light;
}
