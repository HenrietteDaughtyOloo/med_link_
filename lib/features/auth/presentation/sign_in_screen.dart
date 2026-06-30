import 'package:flutter/material.dart';
import 'sign_up_screen.dart';
import 'widgets/auth_field.dart';
import 'widgets/auth_image_banner.dart';
import 'widgets/auth_toggle_card.dart';
import 'widgets/pin_code_row.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool phoneSelected = true;

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
          'Welcome Back',
          style: TextStyle(
            color: isLight ? const Color(0xFF004A43) : Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthImageBanner(),
              const SizedBox(height: 26),
              Text(
                'How would you like to log in?',
                style: TextStyle(
                  color: isLight ? const Color(0xFF004A43) : Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose your preferred access method for quick entry.',
                style: TextStyle(
                  color: isLight ? const Color(0xFF3F4947) : Colors.white54,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  AuthToggleCard(
                    selected: phoneSelected,
                    title: 'Phone number',
                    subtitle: 'The number you signed up with',
                    onTap: () => setState(() => phoneSelected = true),
                  ),
                  AuthToggleCard(
                    selected: !phoneSelected,
                    title: 'Username',
                    subtitle: 'Your unique MedLink handle',
                    onTap: () => setState(() => phoneSelected = false),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              AuthField(
                label: phoneSelected ? 'Phone number' : 'Username',
                hint: phoneSelected
                    ? 'Enter your phone number'
                    : 'Enter your username',
                keyboardType: phoneSelected
                    ? TextInputType.phone
                    : TextInputType.text,
                prefixText: phoneSelected ? '+254 ' : null,
              ),
              const SizedBox(height: 24),
              const Text(
                'PIN',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              const SizedBox(height: 10),
              const PinCodeRow(),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot PIN?',
                    style: TextStyle(
                      color: colors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: colors.onPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const SignUpScreen()),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: isLight
                            ? const Color(0xFF3F4947)
                            : Colors.white70,
                      ),
                      children: [
                        TextSpan(
                          text: 'Create account',
                          style: TextStyle(
                            color: colors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.headset_mic_rounded, color: colors.primary),
                  label: Text(
                    'I need Help',
                    style: TextStyle(
                      color: colors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: colors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
