import 'package:flutter/material.dart';
import 'widgets/auth_field.dart';
import 'widgets/auth_image_banner.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isLight = theme.brightness == Brightness.light;

    return Scaffold(
      backgroundColor: isLight ? const Color(0xFFF4F9F9) : const Color(0xFF071816),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: isLight ? const Color(0xFF004A43) : Colors.white),
        title: Text(
          'Forgot Password',
          style: TextStyle(color: isLight ? const Color(0xFF004A43) : Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthImageBanner(),
              Text(
                'Reset your password',
                style: TextStyle(
                  color: isLight ? const Color(0xFF004A43) : Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Enter the email associated with your account and we\'ll send a reset link.',
                style: TextStyle(color: isLight ? const Color(0xFF3F4947) : Colors.white70),
              ),
              const SizedBox(height: 24),
              const AuthField(label: 'Email address', hint: 'you@company.com', keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 24),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: colors.primary),
                  child: Text('Send reset link', style: TextStyle(color: colors.onPrimary, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
