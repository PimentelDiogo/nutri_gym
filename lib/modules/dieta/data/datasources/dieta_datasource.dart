import '../models/receita_model.dart';
import '../models/refeicao_model.dart';

/// DataSource local de dieta (simulação de API)
class DietaLocalDataSource {
  // Estado mutável para simular toggle de refeições
  final List<RefeicaoModel> _refeicoes = [];

  /// Simula busca do plano nutricional do dia
  Future<List<RefeicaoModel>> getPlanoDoDia() async {
    // Simula delay de rede
    await Future.delayed(const Duration(milliseconds: 1500));

    // Se já temos dados, retorna
    if (_refeicoes.isNotEmpty) {
      return _refeicoes;
    }

    // Dados mock do plano nutricional - Dieta Lucas Moreno
    final mockRefeicoes = [
      {
        'id': '1',
        'nome': 'Refeição 1 - Café da Manhã',
        'horario': '07:00',
        'realizado': false,
        'alimentos': [
          {
            'nome': 'Pão Francês',
            'calorias': 150.0,
            'proteina': 4.0,
            'carboidrato': 30.0,
            'gordura': 1.0,
            'quantidade': 1.0, // 1 unidade
          },
          {
            'nome': 'Ovo de Galinha',
            'calorias': 156.0,
            'proteina': 12.0,
            'carboidrato': 1.0,
            'gordura': 11.0,
            'quantidade': 2.0, // 2 unidades
          },
          {
            'nome': 'Queijo de Coalho',
            'calorias': 105.0,
            'proteina': 7.0,
            'carboidrato': 1.0,
            'gordura': 8.0,
            'quantidade': 30.0, // 30g
          },
        ],
      },
      {
        'id': '2',
        'nome': 'Refeição 2 - Almoço',
        'horario': '12:00',
        'realizado': false,
        'alimentos': [
          {
            'nome': 'Salada Crua',
            'calorias': 25.0,
            'proteina': 2.0,
            'carboidrato': 5.0,
            'gordura': 0.3,
            'quantidade': 150.0, // à vontade
          },
          {
            'nome': 'Legumes Cozidos (brócolis, cenoura, beterraba)',
            'calorias': 50.0,
            'proteina': 3.0,
            'carboidrato': 10.0,
            'gordura': 0.5,
            'quantidade': 120.0, // 120g
          },
          {
            'nome': 'Arroz Branco Cozido',
            'calorias': 104.0,
            'proteina': 2.0,
            'carboidrato': 23.0,
            'gordura': 0.2,
            'quantidade': 80.0, // 80g
          },
          {
            'nome': 'Feijão Cozido',
            'calorias': 96.0,
            'proteina': 6.0,
            'carboidrato': 17.0,
            'gordura': 0.5,
            'quantidade': 80.0, // 80g
          },
          {
            'nome': 'Filé de Frango, Carne Bovina ou Peixe',
            'calorias': 297.0,
            'proteina': 56.0,
            'carboidrato': 0.0,
            'gordura': 6.5,
            'quantidade': 180.0, // 180g
          },
        ],
      },
      {
        'id': '3',
        'nome': 'Refeição 3 - Lanche',
        'horario': '15:00',
        'realizado': false,
        'alimentos': [
          {
            'nome': 'Whey Protein',
            'calorias': 120.0,
            'proteina': 24.0,
            'carboidrato': 3.0,
            'gordura': 1.5,
            'quantidade': 30.0, // 30g
          },
          {
            'nome': 'Aveia em Flocos',
            'calorias': 76.0,
            'proteina': 2.6,
            'carboidrato': 13.0,
            'gordura': 1.4,
            'quantidade': 20.0, // 20g
          },
          {
            'nome': 'Banana',
            'calorias': 72.0,
            'proteina': 1.0,
            'carboidrato': 19.0,
            'gordura': 0.3,
            'quantidade': 80.0, // 1 unidade (80g)
          },
        ],
      },
      {
        'id': '4',
        'nome': 'Refeição 4 - Jantar',
        'horario': '19:00',
        'realizado': false,
        'alimentos': [
          {
            'nome': 'Cuscuz de Milho Cozido',
            'calorias': 112.0,
            'proteina': 2.5,
            'carboidrato': 25.0,
            'gordura': 0.3,
            'quantidade': 100.0, // 100g
          },
          {
            'nome': 'Filé de Frango ou Carne',
            'calorias': 297.0,
            'proteina': 56.0,
            'carboidrato': 0.0,
            'gordura': 6.5,
            'quantidade': 180.0, // 180g
          },
        ],
      },
    ];

    _refeicoes.addAll(
      mockRefeicoes.map((json) => RefeicaoModel.fromJson(json)).toList(),
    );

    return _refeicoes;
  }

  /// Simula toggle do status de uma refeição
  Future<void> toggleRefeicao(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final index = _refeicoes.indexWhere((r) => r.id == id);
    if (index != -1) {
      _refeicoes[index] = RefeicaoModel(
        id: _refeicoes[index].id,
        nome: _refeicoes[index].nome,
        horario: _refeicoes[index].horario,
        alimentos: _refeicoes[index].alimentos,
        realizado: !_refeicoes[index].realizado,
      );
    }
  }

  /// Simula busca de receitas sugeridas
  Future<List<ReceitaModel>> getReceitas() async {
    await Future.delayed(const Duration(milliseconds: 1200));

    final mockReceitas = [
      {
        'id': '1',
        'titulo': 'Frango com Batata Doce',
        'urlImagem': 'https://placehold.co/600x400/1A1A1A/007BFF?text=Frango',
        'tempoPreparo': 30,
        'tags': ['Alto Proteína', 'Low Carb'],
        'calorias': 450.0,
      },
      {
        'id': '2',
        'titulo': 'Salada Caesar Fitness',
        'urlImagem': 'https://placehold.co/600x400/1A1A1A/00CED1?text=Salada',
        'tempoPreparo': 15,
        'tags': ['Leve', 'Rápido'],
        'calorias': 280.0,
      },
      {
        'id': '3',
        'titulo': 'Omelete de Claras',
        'urlImagem': 'https://placehold.co/600x400/1A1A1A/FFD700?text=Omelete',
        'tempoPreparo': 10,
        'tags': ['Café da Manhã', 'Alto Proteína'],
        'calorias': 180.0,
      },
      {
        'id': '4',
        'titulo': 'Bowl de Quinoa',
        'urlImagem': 'https://placehold.co/600x400/1A1A1A/32CD32?text=Quinoa',
        'tempoPreparo': 25,
        'tags': ['Vegano', 'Completo'],
        'calorias': 380.0,
      },
    ];

    return mockReceitas.map((json) => ReceitaModel.fromJson(json)).toList();
  }
}
