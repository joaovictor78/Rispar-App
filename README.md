# Definição e Padrões de Projetos
Este documento, tem como objetivo definir os padrões utilizados e melhores práticas de desenvolvimento do aplicativo Rispar. Este documento tem como finalidade guiar o desenvolvimento do projeto, estabelecendo de maneira prática, metodologis, arquiteturas, padrões, frameworks, resultado das telas desenvolvidas etc, que foi e devem ser usados. 
Ademais, cabe destacar que, o contéudo dessa documentação não será estático, ou seja, poderá ser alterado quando necessário, uma vez que as tecnologias e necessidades do projeto se adequem a tal ação. Para isso basta editar este documento e submeter um pull request com alterçaões ou abrir uma issue neste repositório. 


## I Layouts Desenvolvidos 
![image](https://user-images.githubusercontent.com/53379557/175564178-adf9943e-c4e3-4be1-a08e-9a65465faf89.png), ![image](https://user-images.githubusercontent.com/53379557/175564228-25bb5d5e-6f39-48ce-a8a4-3d64589452ec.png), ![image](https://user-images.githubusercontent.com/53379557/175564339-1630c274-1b14-4d8e-937c-ac0b0030fe28.png), ![image](https://user-images.githubusercontent.com/53379557/175564371-c58082bd-3627-45c4-b460-66966e528422.png), ![image](https://user-images.githubusercontent.com/53379557/175564391-17322b58-ae9a-4cb8-8fa3-6851303f428a.png)

## II Flutter Version
A Versão do flutter que é utilizada neste projeto foi a 2.12.1.

## III Apresentão geral da Arquitetura 
<u>Modules</u>
O sistema foi dividido de forma modular, baseado na jornada do usuario, e em caso um modulo abranja outras funcionalidades como por exemplo, dentro de uma tela principal há uma barra de navegação, pode-se criar um modulo start contendo submodulos dentro do modulo como (home, simulações anteriores, verficar cotação do bitcoin etc) por exemplo: 
  - modules: 
    - start
      - home
      - simulation_history
Além disso, quando o modulo conter o mesmo fluxo de jornada do usuario, como por exemplo informar os dados necessários para realizar a simulação, eles são divididos em diversas telas, porém é realizado somente um envio para o Backend e fazem parte do mesmo fluxo de jornada do usuario, então pode-se criar somente um modulo para aquele fluxo com diversas pages, por exemplo:

![image](https://user-images.githubusercontent.com/53379557/175557356-f4ec059d-b773-4afe-9f93-499b634e2528.png)
Além disso, cada modulo contém seu proprio sistema de arquitetura, cujo o utilizado neste projeto foi o Clean Dart.
Também é recomendável, e foi utilizado práticas e padrões como SOLID e Injeção de Dependencia, com a finalidade de assegurar um baixo acoplamento de código e facilitar os testes unitários. 
IMPORTANTE: Para garantir um baixo acoplamento os modulos devem ser totalmente independentes um dos outros e caso haja interação entre eles deve ser colocado no core.
<u>Core</u>
O core é o coração do Rispar App, nele ficará todas as dependencias e utilitarios globais da aplicação. 

![image](https://user-images.githubusercontent.com/53379557/175559057-749722a1-5d73-4a59-94f7-dcf0cb4e7659.png)
<u>Clean Dart</u>
![image](https://user-images.githubusercontent.com/53379557/175559723-dafd93a1-2420-46c5-b1e7-ac814bcf4f2e.png)
Foi utilizado nesse projeto como base arquitetural o clean dart, pois auxilia na implementação e principios como o SOLID e utilização de Design Patterns, além disso 
a divisão de responsabilidades da aplicação facilita na hora de criar testes para a aplicação, apesar do clean arch(clean dart), aparentar um boilerplait relativamente grande em alguns momentos, conforme o crescimento do projeto se torna muito eficaz, então é importante destacar que, para o aplicativo desenvolvido, caso ele não for escalar é possivel utilizar padrões mais simples como (MVC, MVVM e MVP). 
Leia mais sobre: 


## IV Práticas recomendaveis de segurança 
É altamente recomendavel, e utilizado nesse projeto o uso do recurso "dart-define" para o uso dedados sensiveis como: url's, chaves de api, entre outros dados, packages como .env e variantes não
criptografam esses dados e usando esses packages para dados privados e sensiveis podem deixa-los vulnaraveis mesmo após a geração do appbundle ou ipa. 
Para mais informações consulte: 

## V Práticas de gerencia e qualidade de codigo utilizadas 
Testes
   - Testes são fundamentais para assegurar a qualidade do código e das regras de negocio, tal prática é facilitada devido a implantação do Clean Dart, uma vez que cada camadará terá responsabilidade unica. 
Mocks
   - Para a implementação de Mocks, foi utilizado o Mockito. 

## VI Recursos de Terceiros
Neste projeto foram utilizados os seguintes pacotes:

flutter_modular - Auxilia na utilização de injeção de depeência, além de possuir um sistema de gerenciamento de rotas inteligente.

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
 
## VIII Biográfias 
