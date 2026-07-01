import 'package:flutter/material.dart';
import '../widgets/screen_header.dart';
import '../widgets/featured_doctor_card.dart';
import '../widgets/doctor_booking_card.dart';
import 'booking_page.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFF4F9F9)
          : const Color(0xFF071816),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ScreenHeader(
              title: 'Schedule',
              subtitle: 'Your upcoming appointments',
              actionLabel: 'New booking',
              onActionTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const BookingPage())),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Featured specialists',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 240,
                      child: ListView(
                        padding: const EdgeInsets.only(left: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          FeaturedDoctorCard(
                            name: 'Dr. Sarah Jenkins',
                            specialty: 'Cardiologist',
                            availableLabel: 'Available Today',
                            onBook: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const BookingPage(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          FeaturedDoctorCard(
                            name: 'Dr. James Wilson',
                            specialty: 'Orthopedic Surgeon',
                            availableLabel: 'Available Today',
                            onBook: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const BookingPage(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      'All doctors',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    DoctorBookingCard(
                      name: 'Dr. Sarah Jenkins',
                      specialty: 'Cardiology consultation',
                      date: 'Thu 26',
                      time: '9:00 AM',
                      onBook: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const BookingPage()),
                      ),
                    ),
                    const SizedBox(height: 14),
                    DoctorBookingCard(
                      name: 'Dr. James Wilson',
                      specialty: 'Orthopedic follow-up',
                      date: 'Fri 27',
                      time: '11:15 AM',
                      onBook: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const BookingPage()),
                      ),
                    ),
                    const SizedBox(height: 14),
                    DoctorBookingCard(
                      name: 'Dr. Elena Rodriguez',
                      specialty: 'Dermatology review',
                      date: 'Mon 30',
                      time: '2:00 PM',
                      onBook: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const BookingPage()),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
