import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.text,
    required this.actionText,
    required this.onActionTap,
    this.textColor,
    this.actionColor,
  });

  final String text;
  final String actionText;
  final VoidCallback onActionTap;
  final Color? textColor;
  final Color? actionColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onActionTap,
        child: RichText(
          text: TextSpan(
            text: text,
            style: TextStyle(color: textColor),
            children: [
              TextSpan(
                text: actionText,
                style: TextStyle(color: actionColor, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
