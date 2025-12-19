import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Barra de resumo de macros
class MacroSummaryBar extends StatelessWidget {
  final double proteina;
  final double carboidrato;
  final double gordura;

  const MacroSummaryBar({
    super.key,
    required this.proteina,
    required this.carboidrato,
    required this.gordura,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMacroColumn('Proteína', proteina, Colors.red.shade400),
          _buildMacroColumn('Carboidrato', carboidrato, Colors.orange.shade400),
          _buildMacroColumn('Gordura', gordura, Colors.yellow.shade700),
        ],
      ),
    );
  }

  Widget _buildMacroColumn(String label, double value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.textSilver, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          '${value.toStringAsFixed(1)}g',
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
