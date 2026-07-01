import 'package:flutter/material.dart';
import 'service_chip.dart';

class ServiceChips extends StatefulWidget {
  const ServiceChips({super.key});

  @override
  State<ServiceChips> createState() => _ServiceChipsState();
}

class _ServiceChipsState extends State<ServiceChips> {
  String _selected = 'Pharmacy';

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services',
          style: TextStyle(
            color: isLight ? const Color(0xFF3F4947) : Colors.white70,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ServiceChip(
                label: 'Doctor',
                icon: Icons.medical_services,
                selected: _selected == 'Doctor',
                onTap: () => setState(() => _selected = 'Doctor'),
              ),
              const SizedBox(width: 12),
              ServiceChip(
                label: 'Pharmacy',
                icon: Icons.local_pharmacy,
                selected: _selected == 'Pharmacy',
                onTap: () => setState(() => _selected = 'Pharmacy'),
              ),
              const SizedBox(width: 12),
              ServiceChip(
                label: 'Lab',
                icon: Icons.science,
                selected: _selected == 'Lab',
                onTap: () => setState(() => _selected = 'Lab'),
              ),
              const SizedBox(width: 12),
              ServiceChip(
                label: 'Telemed',
                icon: Icons.phone_in_talk,
                selected: _selected == 'Telemed',
                onTap: () => setState(() => _selected = 'Telemed'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
