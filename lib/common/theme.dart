import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

_ThemeApp? _appTheme;

// ignore: library_private_types_in_public_api
_ThemeApp get theme {
  _appTheme ??= _ThemeApp();
  return _appTheme!;
}

void updateTheme() {
  _appTheme = _ThemeApp();
}

class _ThemeApp {
  // * COLORS
  Color transparent = Colors.transparent;
  Color white = const Color(0xffFFFFFF);
  //
  Color black = const Color(0xff222831);
  Color gray4 = const Color(0xff687080);
  Color gray2 = const Color(0xffC7CEDA);
  Color blue = const Color(0xff0D5DD6);
  Color stroke = const Color(0xffDEE6F2);
  Color input = const Color(0xffF9FBFF);
  Color red = const Color(0xffF50000);
  Color snow = const Color(0xffF0F3F9);
  Color gray1 = const Color(0xffF0F3F9);

  // * FILTER COLOR
  ColorFilter whiteFilter = const ColorFilter.mode(
    Color(0xffFFFFFF),
    BlendMode.srcIn,
  );

  //
  Color blueAlice = const Color(0xffF0F3F9);
  Color black2 = const Color(0xff000000);
  Color gray3 = const Color(0xff9FA6B3);
  Color gray5 = const Color(0xffC3C3C3);
  Color gray6 = const Color(0xff9FA6B2);
  Color gray7 = const Color(0xff2D3438);
  Color gray8 = const Color(0xffDEE6F2);
  Color blue2 = const Color(0xff657AF9);
  Color blue3 = const Color(0xff706EF8);
  Color blue4 = const Color(0xff687080);
  Color blue5 = const Color(0xffF9FBFF);
  Color blue6 = const Color(0xff09C8C8);
  Color blue7 = const Color(0xffE6ECF0);
  Color red2 = const Color(0xffCF1616);
  Color yellow1 = const Color(0xff958D30);
  Color yellow2 = const Color(0xffFCFBEF);
  Color yellow3 = const Color(0xffEBE8C5);

  // * LINEAR GRADIENT
  LinearGradient prmGradient = const LinearGradient(
    colors: [Color(0xffE05368), Color(0xffA752D2), Color(0xff657AF9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // * FONT FAMILY
  String fontInt = 'Inter';
  String fontUnb = 'Unbounded';

  // * TEXT STYLE
  TextStyle textStyle = const TextStyle(
    decoration: TextDecoration.none,
    overflow: TextOverflow.ellipsis,
    fontStyle: FontStyle.normal,
    color: Color(0xff222831),
    fontFamily: "Inter",
  );

  // * APPBAR-STYLE
  AppBar get appbar => AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      );



  LinearGradient mainGrd = const LinearGradient(
    colors: [Color(0xffE05368), Color(0xffA752D2), Color(0xff657AF9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  LinearGradient swMainGrd = LinearGradient(
    colors: [
      const Color(0xffE05368).withOpacity(0.1),
      const Color(0xffA752D2).withOpacity(0.1),
      const Color(0xff657AF9).withOpacity(0.1),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  List<Color> blueGrd = [const Color(0xff4F9CF6), const Color(0xff0D5DD6)];
}
