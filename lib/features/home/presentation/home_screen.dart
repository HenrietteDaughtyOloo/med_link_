import 'package:flutter/material.dart';
import 'widgets/home_header.dart';
import 'widgets/service_chips.dart';
import 'widgets/appointment_card.dart';
import 'widgets/doctor_list_item.dart';
 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final bg = isLight ? const Color(0xFFF4F9F9) : const Color(0xFF071816);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HomeHeader(),
              SizedBox(height: 16),
              ServiceChips(),
              SizedBox(height: 18),
              AppointmentCard(),
              SizedBox(height: 18),
              DoctorListItem(name: 'Dr. Robert Fox', specialty: 'Cardiologist', distance: '1.2 km', rating: 4.8),
              SizedBox(height: 12),
              DoctorListItem(name: 'Dr. Esther Howard', specialty: 'Pediatrician', distance: '2.5 km', rating: 4.9),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
