# README
## <div style="text-align:center"><img src="https://052862636264-rispar.s3.amazonaws.com/twitter-large-summary-card.jpg?29827999"  width="200" height="100" /></div>

# Definição e Padrões de Projetos
Este documento, tem como objetivo definir os padrões utilizados e melhores práticas de desenvolvimento do aplicativo Rispar. Este documento tem como finalidade guiar o desenvolvimento do projeto, estabelecendo de maneira prática, metodologis, arquiteturas, padrões, frameworks, resultado das telas desenvolvidas etc, que foi e devem ser usados. 
Ademais, cabe destacar que, o contéudo dessa documentação não será estático, ou seja, poderá ser alterado quando necessário, uma vez que as tecnologias e necessidades do projeto se adequem a tal ação. Para isso basta editar este documento e submeter um pull request com alterçaões ou abrir uma issue neste repositório. 


## I Layouts Desenvolvidos 
<img src="https://user-images.githubusercontent.com/53379557/175564178-adf9943e-c4e3-4be1-a08e-9a65465faf89.png"  width="200" height="400" />
<img src="https://user-images.githubusercontent.com/53379557/175564228-25bb5d5e-6f39-48ce-a8a4-3d64589452ec.png"  width="200" height="420" />
<img src="https://user-images.githubusercontent.com/53379557/175564339-1630c274-1b14-4d8e-937c-ac0b0030fe28.png"  width="200" height="420" />
<img src="https://user-images.githubusercontent.com/53379557/175564371-c58082bd-3627-45c4-b460-66966e528422.png"  width="200" height="420" />
<img src="https://user-images.githubusercontent.com/53379557/175564391-17322b58-ae9a-4cb8-8fa3-6851303f428a.png"  width="200" height="420" />

## II Flutter Version
A Versão do flutter que é utilizada neste projeto foi a 2.12.1.

## III Apresentão geral da Arquitetura 

O sistema foi dividido de forma modular, baseado na jornada do usuario, e em caso um modulo abranja outras funcionalidades como por exemplo, dentro de uma tela principal há uma barra de navegação, pode-se criar um modulo start contendo submodulos dentro do modulo como (home, simulações anteriores, verficar cotação do bitcoin etc) por exemplo: 
  - **modules**: 
    - start
      - home
      - simulation_history

Além disso, quando o modulo conter o mesmo fluxo de jornada do usuario, como por exemplo informar os dados necessários para realizar a simulação, eles são divididos em diversas telas, porém é realizado somente um envio para o Backend e fazem parte do mesmo fluxo de jornada do usuario, então pode-se criar somente um modulo para aquele fluxo com diversas pages, por exemplo:

<img  src="https://user-images.githubusercontent.com/53379557/175557356-f4ec059d-b773-4afe-9f93-499b634e2528.png"  width="400" height="200" />

Além disso, cada modulo contém seu proprio sistema de arquitetura, cujo o utilizado neste projeto foi o Clean Dart.
Também é recomendável, e foi utilizado práticas e padrões como SOLID e Injeção de Dependencia, com a finalidade de assegurar um baixo acoplamento de código e facilitar os testes unitários. 

IMPORTANTE: Para garantir um baixo acoplamento os modulos devem ser totalmente independentes um dos outros e caso haja interação entre eles deve ser colocado no core.
### Core
O core é o coração do Rispar App, nele ficará todas as dependencias e utilitarios globais da aplicação. 

<img  src="https://user-images.githubusercontent.com/53379557/175559057-749722a1-5d73-4a59-94f7-dcf0cb4e7659.png"  width="200" height="200" />

### Clean Dart

Foi utilizado nesse projeto como base arquitetural o clean dart, pois auxilia na implementação e principios como o SOLID e utilização de Design Patterns, além disso 
a divisão de responsabilidades da aplicação facilita na hora de criar testes para a aplicação, apesar do clean arch(clean dart), aparentar um boilerplait relativamente grande em alguns momentos, conforme o crescimento do projeto se torna muito eficaz, então é importante destacar que, para o aplicativo desenvolvido, caso ele não for escalar é possivel utilizar padrões mais simples como (MVC, MVVM e MVP). Além disso foi utilizado o conceito de Value Objects para validação de valores como Email, Term, LTV etc.

Leia mais sobre: 
   - [**Clean Dart**]("https://github.com/Flutterando/Clean-Dart") 
   - [**Clean Architecture**]("https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html")
   - [**Value Objects**]("https://www.macoratti.net/20/11/c_valueobj1.htm")

![image](https://user-images.githubusercontent.com/53379557/175559723-dafd93a1-2420-46c5-b1e7-ac814bcf4f2e.png)

dio - Cliente HTTP

dartz - Auxilia no retorno de tuplas, trazendo programação funcional para o dart.

asuka - Mostra Snackbars, dialogs, ModalSheets em um único provider de forma simples e limpa

lottie - Auxilia no gerenciamento de animações controladas

build_runner - Pacote utilizado por alguns packages para geração de código (neste caso foi utilizado no mockito) para gerar as classes rodar flutter pub run build_runner build --delete-conflicting-outputs

mockito - Pacote que auxilia na geração de Mocks para testes

intl - Auxilia na conversão e formatação de valores como monetarios, datas etc.

flutter_masked_text2 - Auxilia na criação de mascaras para o TextFormField.


## VII Boas práticas de desenvolvimento 
IMPORTANTE: Deve-se atentar que por se tratar de um sistema comercial que envolve valores monetarios o uso do double ou float para armazenar esses valores, devem 
ser feito com cautela, pois apresentam imprecisões, além disso deve-se criar testes unitários para os diversos cenários envolvendo esses valores, para minimizar a
ocorrencia de falhas. 

Leia Mais: 
- [**Imprecisão do tipo Float/Double para valores monetarios**]("https://dzone.com/articles/never-use-float-and-double-for-monetary-calculatio#:~:text=All%20floating%20point%20values%20that,store%20it%20as%20it%20is.")
 
## VIII Biográfias 
