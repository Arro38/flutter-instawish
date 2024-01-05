import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.filename,
    required this.border,
  });

  final String filename;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 3),
      decoration: border
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            )
          : null,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/$filename'),
        radius: 30,
      ),
    );
  }
}
