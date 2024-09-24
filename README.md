### Manual do Terráqueo

Este é um aplicativo Flutter que permite aos usuários adicionar e gerenciar uma lista de cidades. O aplicativo também oferece a opção de alternar entre temas claro e escuro.
Foi desenvolvido por SANTHIAGO CHAPIEWSKI e VINICIUS FROES. Com intuito de atender os pré-requisitos levantado pela professora TASSIANA KAUTZMANN na material Desenvolvimento em Aplicativos Moveis
### CENTRO UNIVERSITÁRIO – CATÓLICA DE SANTA CATARINA 
### JARAGUA DO SUL - SANTA CATARINA


## Funcionalidades

- Adicionar e remover cidades da lista.
- Alternar entre temas claro e escuro.
- Interface amigável com gradiente de cores.
- Visualização da previsão do tempo

## Capturas de Tela

### Tela Principal
![image](https://github.com/user-attachments/assets/58c6643c-d4a8-42c2-9e7a-97262f7011cb)

### Tela de Seleção de Tema
![image](https://github.com/user-attachments/assets/7537adfc-07b4-45fa-89ca-a1ec524cda04)

### Tela Home
![image](https://github.com/user-attachments/assets/8caeaa5b-4bb4-4355-bac6-9614ce8c69f2)

### Menu
![image](https://github.com/user-attachments/assets/4a07570d-df76-45d7-ac33-debcd8ed71e1)

### Tela Adicionar cidades
![image](https://github.com/user-attachments/assets/63fb8065-e8a3-42c6-a24a-95ce9f9b3454)

### Tela seleção Previsão do tempo
![image](https://github.com/user-attachments/assets/234921d7-4dc6-4649-b22b-e5ed09a672b9)

### Tela Previsão do tempo
![image](https://github.com/user-attachments/assets/20a57c5b-d62a-46d5-bc21-e70d89000b6c)


## Instalação

 Instale as dependências:
  
environment:
  sdk: ">=2.17.0"

dependencies:
  flutter:
    sdk: flutter

  provider: ^6.0.0

  shared_preferences: ^2.0.6

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true

  assets:
    - images/sol.png
    - images/nublado.png
    - images/chuva.png
    - images/avatar.jpg
    - images/Fundo_home.png
    - images/fundo_menu.jpg
    - images/fundo_city.jpeg
    - images/temperatura_frio.png
    - images/temperatura_quente.png
    - images/sol_nuvens.png
    - images/trovoada.png
    - images/sol_chuva.png
    - images/loading.gif
    - images/nevoeiro.png

  fonts:
    - family: Roboto
      fonts:
        - asset: fonts/Roboto-Regular.ttf
        - asset: fonts/Roboto-Bold.ttf
        - asset: fonts/Roboto-BlackItalic.ttf
          weight: 700

## Uso

1. Na tela principal, adicione o nome de uma cidade e clique em "Adicionar".
2. Para remover uma cidade, clique no ícone de lixeira ao lado do nome da cidade.
3. Para alternar entre temas claro e escuro, clique no ícone de brilho no canto superior direito.

## Estrutura do Projeto

- `main.dart`: Arquivo principal que inicializa o aplicativo.
- `home_screen.dart`: Tela principal do aplicativo.
- `tema_controller.dart`: Controlador para gerenciar os temas claro e escuro.
- `theme_selection_screen.dart`: Tela para selecionar o tema.
- `controllers/`: Diretório que contém controladores
- `models/`: Diretório que contém modelos de dados.
- `screens/`: Diretório que contém várias telas do aplicativo, incluindo:
  - `add_city_screen.dart`: Tela para adicionar uma nova cidade.
  - `city_screen.dart`: Tela que exibe informações sobre uma cidade específica.
  - `home_weather_screen.dart`: Tela principal que mostra informações meteorológicas.
  - `theme_selection_screen.dart`: Tela para selecionar o tema.
- `widgets/`: Diretório que contém widgets reutilizáveis, como:
  - `city_card.dart`: Widget que exibe informações sobre uma cidade.
  - `weather_data_card.dart`: Widget que exibe dados meteorológicos.


## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.


## Contato

Para mais informações, entre em contato com vinicius.froes@catolicasc.edu.br


