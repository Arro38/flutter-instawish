import 'package:flutter/material.dart';
import 'package:instawish/lib/router.dart';
import 'package:instawish/screens/MyLayout.dart';

void main() {
  runApp(
    MaterialApp.router(
      // use MyLayout as a wrapper for all routes
      builder: (context, child) => MyLayout(childWidget: child!),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    ),
  );
}
