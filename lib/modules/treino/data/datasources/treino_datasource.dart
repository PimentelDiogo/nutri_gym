import '../models/treino_model.dart';
import '../models/treino_semanal_model.dart';

/// DataSource local de treinos (simulação de API)
class TreinoLocalDataSource {
  /// Simula busca de treino do dia na API
  Future<TreinoModel> getTreinoDoDia() async {
    // Simula delay de rede
    await Future.delayed(const Duration(seconds: 2));

    // Dados mock de um treino de Peito e Tríceps
    final mockJson = {
      'data': DateTime.now().toIso8601String(),
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

  /// Simula busca de treinos da semana
  Future<List<TreinoSemanalModel>> getTreinosSemana(DateTime dataInicio) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    final treinos = <Map<String, dynamic>>[
      {
        'diaSemana': 'Segunda',
        'data': dataInicio.toIso8601String(),
        'titulo': 'Peito e Tríceps',
        'tipo': 'FORCA',
        'concluido': false,
      },
      {
        'diaSemana': 'Terça',
        'data': dataInicio.add(const Duration(days: 1)).toIso8601String(),
        'titulo': 'Costas e Bíceps',
        'tipo': 'FORCA',
        'concluido': false,
      },
      {
        'diaSemana': 'Quarta',
        'data': dataInicio.add(const Duration(days: 2)).toIso8601String(),
        'titulo': 'Pernas',
        'tipo': 'FORCA',
        'concluido': false,
      },
      {
        'diaSemana': 'Quinta',
        'data': dataInicio.add(const Duration(days: 3)).toIso8601String(),
        'titulo': 'Ombros e Abdômen',
        'tipo': 'FORCA',
        'concluido': false,
      },
      {
        'diaSemana': 'Sexta',
        'data': dataInicio.add(const Duration(days: 4)).toIso8601String(),
        'titulo': 'Cardio HIIT',
        'tipo': 'AEROBICO',
        'concluido': false,
      },
      {
        'diaSemana': 'Sábado',
        'data': dataInicio.add(const Duration(days: 5)).toIso8601String(),
        'titulo': null,
        'tipo': null,
        'concluido': false,
      },
      {
        'diaSemana': 'Domingo',
        'data': dataInicio.add(const Duration(days: 6)).toIso8601String(),
        'titulo': null,
        'tipo': null,
        'concluido': false,
      },
    ];

    return treinos.map((json) => TreinoSemanalModel.fromJson(json)).toList();
  }
}
