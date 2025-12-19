# NutriGym 🏋️‍♂️

App mobile de gerenciamento de nutrição e treinos desenvolvido em Flutter.

## 🎯 Funcionalidades

- **Dashboard**: Resumo de peso, calorias e próximo treino
- **Treino**: Visualização e acompanhamento de exercícios diários
- **Dieta**: Plano nutricional com tracking de refeições e receitas
- **Planner**: Perfil, evolução de peso e comunicação com nutricionista

## 🏗️ Arquitetura

- **Clean Architecture** com separação de camadas (Domain, Data, Presentation)
- **GetX** para state management, dependency injection e routing
- **Feature-First** structure para melhor organização
- **MVVM** pattern nos controllers

## 🎨 Design

- Dark theme premium (Preto, Prata, Azul Elétrico)
- Material Design 3
- Google Fonts
- Componentes customizados e reutilizáveis

## 🚀 Como Executar

```bash
# Instalar dependências
flutter pub get

# Executar o app
flutter run
```

## 📦 Dependências Principais

- `get: ^4.6.6` - State management e routing
- `google_fonts: ^6.2.1` - Tipografia
- `percent_indicator: ^4.2.3` - Gráficos circulares

## 📱 Módulos

### Home
Dashboard com resumo de peso, calorias e próximo treino.

### Treino
Lista de exercícios do dia com informações detalhadas.

### Dieta
- **Plano Diário**: Refeições com checkbox de conclusão
- **Receitas**: Grid de receitas sugeridas

### Planner
Perfil do usuário, mensagens do nutricionista e gráfico de evolução.

## 📄 Licença

MIT License - veja o arquivo [LICENSE](LICENSE) para detalhes.
