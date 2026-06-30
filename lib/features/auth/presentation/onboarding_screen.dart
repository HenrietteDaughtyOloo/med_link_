import 'package:flutter/material.dart';

import 'sign_in_screen.dart';
import '../../../widgets/dot_background.dart';
import '../../../widgets/footer_card.dart';
import '../../../widgets/hero_card.dart';
import '../../../widgets/header.dart';
import '../../../widgets/secure_card.dart';
import '../../../widgets/status_card.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heroSize = size.width * .72;
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isLight
                    ? const [Color(0xFFF4F9F9), Color(0xFFE2F5F5)]
                    : const [Color(0xFF071816), Color(0xFF12302D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          const Positioned.fill(child: DotBackground()),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SplashHeader(),
                    const SizedBox(height: 18),
                    HeroCard(size: heroSize),
                    const SizedBox(height: 20),
                    SecureCard(
                      onContinue: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const SignInScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: const [
                        Expanded(
                          child: StatusCard(
                            icon: Icons.verified_user,
                            label: 'Verified',
                            subtitle: 'Access',
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: StatusCard(
                            icon: Icons.speed,
                            label: 'Server',
                            subtitle: 'Optimized',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    const FooterCard(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
