# Jogo de Blackjack em Flutter

Este é um projeto de exemplo de um jogo de Blackjack criado em Flutter que segue os princípios de Clean Architecture. O objetivo deste projeto é demonstrar como organizar o código em camadas e manter um código limpo e bem estruturado.

<br/><br/><br/>
<div align="center">
<img src="https://github.com/lucassant/flutter_blackjack/blob/main/gif%20blackjack.gif" width="400">
</div>
<br/><br/><br/>

## Características do Jogo

- É possível ter mais de um jogador na mesa
- A carta A pode valer 1 ou 11 pontos, dependendo da situação
- As cartas J, Q e K valem 10 pontos
- A cada rodada, todos que ainda estão jogando recebem uma carta
- A mesa vence quando atinge 21 pontos ou quando todos os jogadores ultrapassam 21 pontos
- O jogador vence quando atinge 21 pontos ou quando a mesa ultrapassa 21 pontos
- O jogador pode pedir mais cartas até atingir 21 pontos ou estourar
- É possível embaralhar as cartas da mesa

## Estrutura do Projeto

Este projeto segue uma estrutura de Clean Architecture para manter o código organizado e facilmente expansível. A estrutura geral é a seguinte:

- `lib/` : Contém a implementação do jogo de Blackjack.
  - `core/` : Contém as classes que são compartilhadas entre os módulos.
  - `modules/` : Contém os módulos do aplicativo.    
    - `data/` : Implementa os repositórios concretos e mapas de dados.
    - `domain/` : Contém as regras de negócio e casos de uso.
    - `presentation/` : Lida com a interface do usuário e a camada de apresentação.
  - `main.dart` : Ponto de entrada do aplicativo.
- `test/` : Contém os testes unitários e de widget.

## Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas:

- Flutter: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart: [Dart Installation Guide](https://dart.dev/get-dart)

## Como Executar o Projeto

1. Clone este repositório:

```
git clone https://github.com/seu-usuario/seu-projeto.git
```

2. Navegue até o diretório do projeto:

```
cd seu-projeto
```

3. Execute o aplicativo:

```
flutter run
```
