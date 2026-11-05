# Trabalho - DGT2812 Desenvolvimento de Aplicativos Móveis com Flutter

## Dados do Aluno

- **Nome:** Thalita Laurentino
- **Disciplina:** Desenvolvimento Mobile com Flutter
- **Instituição:** Estácio

---

## Objetivo

Desenvolver uma aplicação utilizando o framework Flutter, aplicando os conceitos de construção de interfaces gráficas por meio da composição de widgets. O projeto foi desenvolvido para representar a interface de uma agência de viagens chamada **"Explore Mundo"**, utilizando elementos visuais como imagens, textos, ícones e listas.

---

## Desenvolvimento

Inicialmente foi criado um novo projeto Flutter e configurado o ambiente de desenvolvimento utilizando **Android Studio** e **Flutter SDK**.

Durante a atividade foram aplicados os principais widgets estudados ao longo das microatividades, incluindo:

- `MaterialApp`
- `Scaffold`
- `AppBar`
- `Container`
- `Row`
- `Column`
- `Expanded`
- `Icon`
- `Text`
- `Image`
- `ListView`
- `StatefulWidget`
- `InkWell`
- `TextField`
- `ElevatedButton`
- `SnackBar`
- `ListTile`

A interface foi adaptada para representar a agência de viagens **"Explore Mundo"**, conforme o contexto apresentado no enunciado.

### Seção de Imagem

Foi adicionada uma imagem localizada na pasta `images` do projeto, utilizando o widget `Image.asset()`. A imagem representa um destino turístico divulgado pela agência.

### Seção de Título

Foi criada uma seção contendo:

- Nome do destino turístico;
- Localização do destino;
- Cinco estrelas de avaliação interativas;
- Contador de avaliações.

Ao tocar em uma estrela, o usuário registra sua nota (de 1 a 5), o contador de avaliações é atualizado e a nota escolhida é exibida na tela. Para isso foram utilizados os widgets `Row`, `Column`, `Expanded`, `Container` e `GestureDetector`.

### Seção de Botões

Foi implementada uma linha contendo três ações principais do aplicativo:

- CALL (ligação);
- ROUTE (rota);
- SHARE (compartilhar).

Cada ação foi construída utilizando ícones e textos organizados em colunas, por meio do método auxiliar `_buildButtonColumn` e do alinhamento `MainAxisAlignment.spaceEvenly`. Os botões respondem ao toque por meio do widget `InkWell`, exibindo uma mensagem de retorno (`SnackBar`) ao usuário.

### Seção de Avaliações e Comentários

Foi criada uma seção interativa que permite aos clientes compartilharem suas experiências de viagem:

- Campo de texto (`TextField`) para escrever um comentário;
- Botão `ElevatedButton` para publicar o comentário;
- Lista de comentários exibida com `ListTile`, atualizada em tempo real.

### Seção de Texto

Foi criada uma área descritiva apresentando informações sobre os serviços oferecidos pela agência de viagens **Explore Mundo**.

### ListView

Para permitir a rolagem do conteúdo em diferentes tamanhos de tela, o widget `Column` foi substituído por `ListView`, tornando a interface mais adaptável e acessível.

---

## Estrutura do Projeto

Além do arquivo principal `main.dart`, foi criada uma pasta denominada `images`, contendo a imagem utilizada na aplicação.

Também foi realizada a configuração do arquivo `pubspec.yaml` para disponibilizar a imagem como recurso do projeto.

---

## Resultado Obtido

O aplicativo desenvolvido apresenta:

- Imagem de destaque do destino turístico;
- Informações do destino;
- Avaliação interativa por estrelas;
- Botões de navegação com retorno visual ao toque;
- Texto descritivo;
- Seção de comentários dos clientes;
- Rolagem de conteúdo através do widget `ListView`.

A interface foi construída com sucesso utilizando os conceitos estudados durante as microatividades do curso.

---

## Conclusão

A realização desta atividade permitiu aplicar na prática os principais conceitos de desenvolvimento de interfaces com Flutter. Foram utilizados diversos widgets de layout e organização visual, possibilitando a construção de uma interface simples, organizada e funcional para a agência de viagens **Explore Mundo**.

O projeto contribuiu para o entendimento da estrutura básica de aplicações Flutter, da utilização de recursos visuais e da composição de widgets para criação de interfaces responsivas.
