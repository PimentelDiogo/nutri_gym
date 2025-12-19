import '../models/treino_model.dart';

/// DataSource local de treinos (simulação de API)
class TreinoLocalDataSource {
  /// Simula busca de treino do dia na API
  Future<TreinoModel> getTreinoDoDia(DateTime data) async {
    // Simula delay de rede
    await Future.delayed(const Duration(seconds: 2));

    // Dados mock de um treino de Peito e Tríceps
    final mockJson = {
      'data': data.toIso8601String(),
      'titulo': 'Peito e Tríceps',
      'tipo': 'FORCA',
      'exercicios': [
        {
          'nome': 'Supino Reto',
          'series': 4,
          'repeticoes': 12,
          'urlVideo': 'https://example.com/supino-reto',
        },
        {
          'nome': 'Supino Inclinado',
          'series': 3,
          'repeticoes': 12,
          'urlVideo': 'https://example.com/supino-inclinado',
        },
        {
          'nome': 'Crucifixo',
          'series': 3,
          'repeticoes': 15,
          'urlVideo': 'https://example.com/crucifixo',
        },
        {
          'nome': 'Tríceps Testa',
          'series': 3,
          'repeticoes': 12,
          'urlVideo': 'https://example.com/triceps-testa',
        },
        {
          'nome': 'Tríceps Corda',
          'series': 3,
          'repeticoes': 15,
          'urlVideo': 'https://example.com/triceps-corda',
        },
      ],
    };

    return TreinoModel.fromJson(mockJson);
  }
}
