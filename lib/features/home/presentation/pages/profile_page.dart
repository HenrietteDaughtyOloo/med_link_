import 'package:flutter/material.dart';

import '../widgets/profile_header.dart';
import '../widgets/withdrawal_notice.dart';
import '../widgets/savings_card.dart';
import '../widgets/invite_card.dart';
import '../widgets/settings_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final bg = isLight ? const Color(0xFFF4F9F9) : const Color(0xFF071816);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              ProfileHeader(),
              SizedBox(height: 12),
              WithdrawalNotice(),
              SizedBox(height: 16),
              SavingsCard(),
              SizedBox(height: 14),
              InviteCard(),
              SizedBox(height: 18),
              SettingsList(),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
