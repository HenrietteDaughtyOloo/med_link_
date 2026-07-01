import 'package:flutter/material.dart';
import '../widgets/screen_header.dart';
import '../widgets/booking_doctor_card.dart';
import '../widgets/date_selector.dart';
import '../widgets/time_slot_section.dart';
import '../widgets/reason_input.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String selectedDate = 'Mon 23';
  String selectedMorning = '9:00 AM';
  String selectedAfternoon = '2:00 PM';
  final reasonController = TextEditingController();

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFF4F9F9)
          : const Color(0xFF071816),
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: ScreenHeader(
              title: 'Book Appointment',
              subtitle: 'Select a date and time for your visit',
              actionLabel: 'Dr. Profile',
              onActionTap: () {},
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  const BookingDoctorCard(
                    name: 'Dr. Robert Fox',
                    specialty: 'Cardiologist',
                    rating: 4.9,
                    reviewCount: 120,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xFF12302D),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).brightness == Brightness.light
                              ? const Color(0x1401645B)
                              : Colors.black26,
                          blurRadius: 16,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Select Date',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 14),
                        DateSelector(
                          dates: const [
                            'Mon 23',
                            'Tue 24',
                            'Wed 25',
                            'Thu 26',
                            'Fri 27',
                          ],
                          selectedDate: selectedDate,
                          onSelected: (value) =>
                              setState(() => selectedDate = value),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xFF12302D),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).brightness == Brightness.light
                              ? const Color(0x1401645B)
                              : Colors.black26,
                          blurRadius: 16,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Available Slots',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TimeSlotSection(
                          title: 'Morning',
                          slots: const ['9:00 AM', '10:30 AM', '11:15 AM'],
                          selectedSlot: selectedMorning,
                          onSlotSelected: (value) =>
                              setState(() => selectedMorning = value),
                        ),
                        const SizedBox(height: 18),
                        TimeSlotSection(
                          title: 'Afternoon',
                          slots: const ['2:00 PM', '3:30 PM', '4:45 PM'],
                          selectedSlot: selectedAfternoon,
                          onSlotSelected: (value) =>
                              setState(() => selectedAfternoon = value),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Reason for visit',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  ReasonInput(controller: reasonController),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            color: Theme.of(context).brightness == Brightness.light
                ? const Color(0xFFF4F9F9)
                : const Color(0xFF071816),
            child: SizedBox(
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : const Color(0xFF0C302B),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    builder: (_) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Appointment confirmed',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: colors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Your consultation with Dr. Robert Fox is booked for $selectedDate at $selectedAfternoon.',
                            style: TextStyle(
                              color: colors.onSurface.withValues(alpha: 0.8),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: const Text('Close'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('Confirm Booking'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
