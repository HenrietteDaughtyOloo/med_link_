import 'package:flutter/material.dart';
import 'widgets/auth_button.dart';
import 'widgets/auth_field.dart';
import 'widgets/auth_footer.dart';
import 'widgets/auth_image_banner.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isLight = theme.brightness == Brightness.light;

    return Scaffold(
      backgroundColor: isLight
          ? const Color(0xFFF4F9F9)
          : const Color(0xFF071816),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isLight ? const Color(0xFF004A43) : Colors.white,
        ),
        title: Text(
          'Create account',
          style: TextStyle(
            color: isLight ? const Color(0xFF004A43) : Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthImageBanner(),
              const SizedBox(height: 26),
              Text(
                'Create your secure account',
                style: TextStyle(
                  color: isLight ? const Color(0xFF004A43) : Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Fast setup for patients and providers with enterprise-grade encryption.',
                style: TextStyle(
                  color: isLight ? const Color(0xFF3F4947) : Colors.white70,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),
              const AuthField(label: 'Full name', hint: 'Jane Doe'),
              const SizedBox(height: 16),
              const AuthField(
                label: 'Email address',
                hint: 'jane.doe@email.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const AuthField(
                label: 'Phone number',
                hint: '+254 700 000 008',
                keyboardType: TextInputType.phone,
                prefixText: '+254 ',
              ),
              const SizedBox(height: 16),
              const AuthField(
                label: 'Password',
                hint: '••••••••',
                obscureText: true,
              ),
              const SizedBox(height: 26),
              AuthButton(
                label: 'Create Account',
                onPressed: () {},
                backgroundColor: colors.primary,
                foregroundColor: colors.onPrimary,
              ),
              const SizedBox(height: 22),
              AuthFooter(
                text: 'Already have an account? ',
                actionText: 'Sign in',
                // onActionTap: () => Navigator.of(context).pop(),
                onActionTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                textColor: isLight ? const Color(0xFF3F4947) : Colors.white70,
                actionColor: colors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
