import 'package:flutter/material.dart';

class DoctorListItem extends StatelessWidget {
  const DoctorListItem({super.key, required this.name, required this.specialty, required this.distance, required this.rating});

  final String name;
  final String specialty;
  final String distance;
  final double rating;

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: isLight ? Colors.white : const Color(0xFF12302D), borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: isLight ? const Color.fromRGBO(1,100,91,0.06) : Colors.black26, blurRadius: 8, offset: const Offset(0,6))]),
      child: Row(
        children: [
          Container(height: 64, width: 64, decoration: BoxDecoration(color: const Color(0xFF12302D), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.person, color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: TextStyle(fontWeight: FontWeight.w800)), const SizedBox(height: 4), Text('$specialty • $distance away', style: TextStyle(color: const Color(0xFF3F4947)))])),
          const SizedBox(width: 8),
          Column(children: [Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text('(${(rating * 100).toInt()} reviews)', style: const TextStyle(color: Color(0xFF3F4947)))])
        ],
      ),
    );
  }
}
