import 'package:flutter/material.dart';

import 'responsive_app.dart';

class CircularTransition<T> extends PageRouteBuilder<T> {

  final Widget page;
  
  CircularTransition(
    {
      required this.page,
    }
  ) : super(

    pageBuilder: ( context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration( milliseconds: 1000 ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      var screenSize = MediaQuery.of(context).size;
      var centerCircleClipper = Offset(screenSize.width / 2, ResponsiveApp.dHeight( 600.0 ) );

      double beginRadius = 0.0;
      double endRadius = screenSize.height * 1.2;

      var radiusTween = Tween( begin: beginRadius, end: endRadius);
      var radiusTweenAnimation = animation.drive(radiusTween);

      return ClipPath(
        clipper: CircleTransitionClipper(center: centerCircleClipper, radius: radiusTweenAnimation.value ),
        child: child
      );

    }

  );

}

class CircleTransitionClipper extends CustomClipper<Path> {

  final Offset center;
  final double radius;

  CircleTransitionClipper({required this.center, required this.radius});

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;



}