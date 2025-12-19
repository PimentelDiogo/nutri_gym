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

    // Dados mock do plano nutricional
    final mockRefeicoes = [
      {
        'id': '1',
        'nome': 'Café da Manhã',
        'horario': '07:00',
        'realizado': false,
        'alimentos': [
          {
            'nome': 'Ovos Mexidos',
            'calorias': 180.0,
            'proteina': 13.0,
            'carboidrato': 2.0,
            'gordura': 14.0,
            'quantidade': 100.0,
          },
          {
            'nome': 'Café com Leite',
            'calorias': 80.0,
            'proteina': 4.0,
            'carboidrato': 8.0,
            'gordura': 3.0,
            'quantidade': 200.0,
          },
          {
            'nome': 'Pão Integral',
            'calorias': 140.0,
            'proteina': 5.0,
            'carboidrato': 25.0,
            'gordura': 2.0,
            'quantidade': 50.0,
          },
        ],
      },
      {
        'id': '2',
        'nome': 'Almoço',
        'horario': '12:30',
        'realizado': false,
        'alimentos': [
          {
            'nome': 'Peito de Frango Grelhado',
            'calorias': 165.0,
            'proteina': 31.0,
            'carboidrato': 0.0,
            'gordura': 3.6,
            'quantidade': 100.0,
          },
          {
            'nome': 'Arroz Integral',
            'calorias': 130.0,
            'proteina': 2.7,
            'carboidrato': 28.0,
            'gordura': 1.0,
            'quantidade': 100.0,
          },
          {
            'nome': 'Salada Verde',
            'calorias': 25.0,
            'proteina': 2.0,
            'carboidrato': 5.0,
            'gordura': 0.3,
            'quantidade': 150.0,
          },
        ],
      },
      {
        'id': '3',
        'nome': 'Jantar',
        'horario': '19:00',
        'realizado': false,
        'alimentos': [
          {
            'nome': 'Sopa de Legumes',
            'calorias': 120.0,
            'proteina': 4.0,
            'carboidrato': 20.0,
            'gordura': 2.5,
            'quantidade': 300.0,
          },
          {
            'nome': 'Pão de Forma Integral',
            'calorias': 70.0,
            'proteina': 3.0,
            'carboidrato': 12.0,
            'gordura': 1.0,
            'quantidade': 30.0,
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
