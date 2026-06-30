import 'package:flutter/material.dart';

class AuthToggleCard extends StatelessWidget {
  const AuthToggleCard({
    super.key,
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final bool selected;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isLight = theme.brightness == Brightness.light;
    final background = selected ? colors.primary.withValues(alpha: 0.12) : (isLight ? const Color(0xFFF8F8FB) : const Color(0xFF0F1C20));
    final border = selected ? colors.primary : (isLight ? const Color(0xFFE2F5F5) : const Color(0xFF1D3635));
    final textColor = selected ? colors.primary : (isLight ? const Color(0xFF004A43) : Colors.white70);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                          Row(
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selected ? colors.primary : Colors.transparent,
                                  border: Border.all(color: border, width: 1.6),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Wrap the text in Expanded to prevent it from pushing past 129.0px width
                              Expanded(
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1, // Optional: keeps it on one line
                                  overflow: TextOverflow.ellipsis, // Optional: fades or adds dots if tight
                                ),
                              ),
                            ],
                          ),
              const SizedBox(height: 12),
              Text(
                subtitle,
                style: TextStyle(
                  color: isLight ? const Color(0xFF5C7F79) : Colors.white60,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
