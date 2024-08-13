import 'package:flutter/cupertino.dart';

pop(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}

push(Widget widget, BuildContext context) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          child,
    ),
  );
}

// *

pushRemove(Widget widget, BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          child,
    ),
    (route) => false,
  );
}


cupPush(Widget widget, BuildContext context) {
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (BuildContext context) => widget,
    ),
  );
}


cupRemoved(Widget widget, BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    CupertinoPageRoute(
      builder: (BuildContext context) => widget,
    ),
    (route) => false,
  );
}
