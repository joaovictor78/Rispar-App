# Definição e Padrões de Projetos
Este documento, tem como objetivo definir os padrões utilizados e melhores práticas de desenvolvimento do aplicativo Rispar. Este documento tem como finalidade guiar o desenvolvimento do projeto, estabelecendo de maneira prática, metodologis, arquiteturas, padrões, frameworks, resultado das telas desenvolvidas etc, que foi e devem ser usados. 
Ademais, cabe destacar que, o contéudo dessa documentação não será estático, ou seja, poderá ser alterado quando necessário, uma vez que as tecnologias e necessidades do projeto se adequem a tal ação. Para isso basta editar este documento e submeter um pull request com alterçaões ou abrir uma issue neste repositório. 


## I Layouts Desenvolvidos 


## II Flutter Version
A Versão do flutter que é utilizada neste projeto foi a 2.12.1.

## III Apresentão geral da Arquitetura 
O sistema foi dividido de forma modular, dessa maneira cada modulo ficará responsável 
e em caso um modulo abranja outras funcionalidades, deve-se criar submodulos dentro daquele modulo caso cada tela envolva , por exemplo: 
  - modules: 
    - splash screen
    - simulação
      - iniciar_simulação
Além disso, cada modulo contém seu proprio sistema de arquitetura, cujo o utilizado neste projeto foi o Clean Dart, porém devido a baixa complexidade e tamanho do projeto, obtiu-se algumas camadas usando somente as seguintes camadas: Presenter, Domain e Infra. 
Também é recomendável, e foi utilizado práticas e padrões como SOLID e Injeção de Dependencia, com a finalidade de assegurar um baixo acoplamento de código e facilitar os testes unitários. 
## IV Práticas recomendaveis de segurança 
É altamente recomendavel, e utilizado nesse projeto o uso do recurso "dart-define" para o uso dedados sensiveis como: url's, chaves de api, entre outros dados, packages como .env e variantes não
criptografam esses dados e usando esses packages para dados privados e sensiveis podem deixa-los vulnaraveis mesmo após a geração do appbundle ou ipa. 
Para mais informações consulte: 
## V Práticas de gerencia e qualidade de codigo utilizadas 
 Testes
   - Testes são fundamentais para assegurar a qualidade do código e das regras de negocio, tal prática é facilitada devido a implantação do Clean Dart, uma vez que cada camadará terá responsabilidade unica. 
 Given-When-Then (Dado-Quando-Então)
 Mocks
   - Para a implementação de Mocks, foi utilizado o Mockito
 Cobertura de Testes 
   -  

## VI Recursos de Terceiros
  
## VII Boas práticas de desenvolvimento 
 
## VIII Biográfias 
