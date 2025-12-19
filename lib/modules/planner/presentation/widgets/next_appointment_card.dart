import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Card de próxima consulta
class NextAppointmentCard extends StatelessWidget {
  final String dataHora;
  final VoidCallback? onRemarcar;

  const NextAppointmentCard({
    super.key,
    required this.dataHora,
    this.onRemarcar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calendar_today,
              color: AppColors.primaryBlue,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Próxima Consulta',
                  style: TextStyle(color: AppColors.textSilver, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  dataHora,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onRemarcar,
            child: const Text(
              'Remarcar',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
