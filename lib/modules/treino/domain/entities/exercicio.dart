/// Tipo de treino
enum TipoTreino { forca, aerobico }

/// Entidade de exercício
class Exercicio {
  final String nome;
  final int series;
  final int repeticoes;
  final String? urlVideo;

  const Exercicio({
    required this.nome,
    required this.series,
    required this.repeticoes,
    this.urlVideo,
  });

  @override
  String toString() {
    return 'Exercicio(nome: $nome, series: $series, repeticoes: $repeticoes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Exercicio &&
        other.nome == nome &&
        other.series == series &&
        other.repeticoes == repeticoes &&
        other.urlVideo == urlVideo;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        series.hashCode ^
        repeticoes.hashCode ^
        urlVideo.hashCode;
  }
}
