import '../models/treino_model.dart';
import '../models/treino_semanal_model.dart';

/// DataSource local de treinos (simulação de API)
class TreinoLocalDataSource {
  /// Simula busca de treino do dia na API
  /// Se [data] for fornecida, retorna o treino para aquele dia específico
  /// Caso contrário, usa DateTime.now()
  Future<TreinoModel> getTreinoDoDia({DateTime? data}) async {
    // Simula delay de rede
    await Future.delayed(const Duration(seconds: 1));

    // Determina qual treino baseado no dia da semana
    final dataReferencia = data ?? DateTime.now();
    final diaSemana = dataReferencia.weekday;

    // Treino A: Peito, Ombro e Tríceps (Segunda=1, Quinta=4)
    final treinoA = {
      'data': DateTime.now().toIso8601String(),
      'titulo': 'Peito, Ombro e Tríceps + Cardio 30min',
      'tipo': 'FORCA',
      'exercicios': [
        {
          'nome': 'Supino Inclinado com Barra',
          'series': 3,
          'repeticoes': '10-12',
          'urlVideo': 'https://example.com/supino-inclinado-barra',
        },
        {
          'nome':
              'Crucifixo Inclinado + Supino Inclinado com Halteres (Bi-set)',
          'series': 3,
          'repeticoes': '8-12',
          'urlVideo': 'https://example.com/crucifixo-supino-inclinado',
        },
        {
          'nome': 'Crossover na Polia Baixa',
          'series': 3,
          'repeticoes': '10-12',
          'urlVideo': 'https://example.com/crossover-polia-baixa',
        },
        {
          'nome': 'Crucifixo Máquina',
          'series': 3,
          'repeticoes': '10-12',
          'urlVideo': 'https://example.com/crucifixo-maquina',
        },
        {
          'nome':
              'Desenvolvimento com Halteres Sentado + Elevação Lateral (Bi-set)',
          'series': 4,
          'repeticoes': '8-12',
          'urlVideo': 'https://example.com/desenvolvimento-elevacao',
        },
        {
          'nome': 'Tríceps Testa na Polia + Tríceps com Corda (Bi-set)',
          'series': 3,
          'repeticoes': '8-12',
          'urlVideo': 'https://example.com/triceps-testa-corda',
        },
        {
          'nome': 'Cardio',
          'series': 1,
          'repeticoes': '30 min',
          'urlVideo': 'https://example.com/cardio',
        },
      ],
    };

    // Treino B: Costas e Bíceps (Terça=2, Sexta=5)
    final treinoB = {
      'data': DateTime.now().toIso8601String(),
      'titulo': 'Costas e Bíceps + Cardio 30min',
      'tipo': 'FORCA',
      'exercicios': [
        {
          'nome': 'Barra Fixa',
          'series': 3,
          'repeticoes': 'até a falha',
          'urlVideo': 'https://example.com/barra-fixa',
        },
        {
          'nome':
              'Puxada Aberta Barra Reta + Puxada Fechada Barra Reta (Bi-set)',
          'series': 3,
          'repeticoes': '8-12',
          'urlVideo': 'https://example.com/puxada-aberta-fechada',
        },
        {
          'nome': 'Remada Baixa Triângulo',
          'series': 3,
          'repeticoes': '10-12',
          'urlVideo': 'https://example.com/remada-baixa-triangulo',
        },
        {
          'nome': 'Remada Curvada com Halteres',
          'series': 3,
          'repeticoes': '10-12',
          'urlVideo': 'https://example.com/remada-curvada-halteres',
        },
        {
          'nome': 'Pull Down',
          'series': 3,
          'repeticoes': '10-12',
          'urlVideo': 'https://example.com/pull-down',
        },
        {
          'nome': 'Crucifixo Inverso',
          'series': 3,
          'repeticoes': '10-12',
          'urlVideo': 'https://example.com/crucifixo-inverso',
        },
        {
          'nome':
              'Rosca Direta na Polia (Barra Reta) + Martelo com Halteres (Bi-set)',
          'series': 3,
          'repeticoes': '8-12',
          'urlVideo': 'https://example.com/rosca-martelo',
        },
        {
          'nome': 'Cardio',
          'series': 1,
          'repeticoes': '30 min',
          'urlVideo': 'https://example.com/cardio',
        },
      ],
    };

    // Treino C: Perna Completo (Quarta=3, Sábado=6)
    final treinoC = {
      'data': DateTime.now().toIso8601String(),
      'titulo': 'Perna Completo + Cardio 30min',
      'tipo': 'FORCA',
      'exercicios': [
        {
          'nome': 'Abdução de Quadril Máquina',
          'series': 3,
          'repeticoes': '10-12',
          'urlVideo': 'https://example.com/abducao-quadril',
        },
        {
          'nome': 'Agachamento Hack',
          'series': 3,
          'repeticoes': '10-12',
          'urlVideo': 'https://example.com/agachamento-hack',
        },
        {
          'nome': 'Cadeira Extensora',
          'series': 3,
          'repeticoes': '10-12',
          'urlVideo': 'https://example.com/cadeira-extensora',
        },
        {
          'nome': 'Leg Press 45 + Afundo (Bi-set)',
          'series': 3,
          'repeticoes': '8-12',
          'urlVideo': 'https://example.com/legpress-afundo',
        },
        {
          'nome': 'Mesa Flexora + Stiff com Halteres (Bi-set)',
          'series': 3,
          'repeticoes': '8-12',
          'urlVideo': 'https://example.com/mesa-flexora-stiff',
        },
        {
          'nome': 'Panturrilha',
          'series': 3,
          'repeticoes': '15-20',
          'urlVideo': 'https://example.com/panturrilha',
        },
        {
          'nome': 'Cardio',
          'series': 1,
          'repeticoes': '30 min',
          'urlVideo': 'https://example.com/cardio',
        },
      ],
    };

    // Treino de descanso (Domingo=7)
    final descanso = {
      'data': DateTime.now().toIso8601String(),
      'titulo': 'Dia de Descanso',
      'tipo': 'DESCANSO',
      'exercicios': <Map<String, dynamic>>[],
    };

    // Seleciona o treino baseado no dia da semana
    final Map<String, dynamic> mockJson;
    switch (diaSemana) {
      case 1: // Segunda
      case 4: // Quinta
        mockJson = treinoA;
        break;
      case 2: // Terça
      case 5: // Sexta
        mockJson = treinoB;
        break;
      case 3: // Quarta
      case 6: // Sábado
        mockJson = treinoC;
        break;
      case 7: // Domingo
      default:
        mockJson = descanso;
    }

    return TreinoModel.fromJson(mockJson);
  }

  /// Simula busca de treinos da semana
  Future<List<TreinoSemanalModel>> getTreinosSemana(DateTime dataInicio) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    final treinos = <Map<String, dynamic>>[
      {
        'diaSemana': 'Segunda',
        'data': dataInicio.toIso8601String(),
        'titulo': 'Peito, Ombro e Tríceps + Cardio 30min',
        'tipo': 'FORCA',
        'concluido': false,
      },
      {
        'diaSemana': 'Terça',
        'data': dataInicio.add(const Duration(days: 1)).toIso8601String(),
        'titulo': 'Costas e Bíceps + Cardio 30min',
        'tipo': 'FORCA',
        'concluido': false,
      },
      {
        'diaSemana': 'Quarta',
        'data': dataInicio.add(const Duration(days: 2)).toIso8601String(),
        'titulo': 'Perna Completo + Cardio 30min',
        'tipo': 'FORCA',
        'concluido': false,
      },
      {
        'diaSemana': 'Quinta',
        'data': dataInicio.add(const Duration(days: 3)).toIso8601String(),
        'titulo': 'Peito, Ombro e Tríceps + Cardio 30min',
        'tipo': 'FORCA',
        'concluido': false,
      },
      {
        'diaSemana': 'Sexta',
        'data': dataInicio.add(const Duration(days: 4)).toIso8601String(),
        'titulo': 'Costas e Bíceps + Cardio 30min',
        'tipo': 'FORCA',
        'concluido': false,
      },
      {
        'diaSemana': 'Sábado',
        'data': dataInicio.add(const Duration(days: 5)).toIso8601String(),
        'titulo': 'Perna Completo + Cardio 30min',
        'tipo': 'FORCA',
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
