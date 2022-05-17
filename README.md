<h1 align="center">Salesforce Petshop</h1>

Tabela de conteúdos
====================
<!--ts-->
* [Sobre](#Sobre)
* [Solução](#Solução)
* [Status do Projeto](#StatusDoProjeto)
* [Desafio](#Desafio)
<!--te-->

<h2>Sobre</h2>
<p>O escopo deste projeto foi preparado pela Everymind LTDA e Desenvolvido por mim como forma de desafio.</p>

<h2>Solução</h2>
<p>O objetivo da solução é criar um aplicativo no Salesforce para controlar e registrar as
adoções de pets.</p>

<h2>Desafio</h2>

- [ ] **Criar Objetos Personalizados**
    - [ ] **Pet**
    - [ ] **Adoção**
    - [ ] **Historico de Vacinação**

- [ ] **Criar Campos Personalizados**

    - [ ] **Contact**
        - [ ] **Name (Campo padrão do Salesforce)**
        - [ ] **Telefone (Campo padrão do Salesforce)**
        - [ ] **Data de nascimento (Campo padrão do Salesforce)**
        - [ ] **Email (Campo padrão do Salesforce)**
        - [ ] **Idade (Fórmula que se baseia na data de nascimento com a data atual)**

    - [ ] **Pet**
        - [ ] **Name (Campo padrão do Salesforce)**
        - [ ] **Espécie (Campo de seleção de lista)**
        - [ ] **Raça (Campo de seleção de lista)**
        - [ ] **Data da última vacinação (Campo de data)**
        - [ ] **Data da próxima vacinação (Campo de data)**

    - [ ] **Adoção**
        - [ ] **Name (Numeração automática gerado pelo próprio Salesforce)**
        - [ ] **Status (Campo de seleção de lista que representa a fase da adoção)**
        - [ ] **Data (Campo de data que representa a data da adoção)**
        - [ ] **Contact (Campo de relacionamento com o objeto Contact)**
        - [ ] **Pet (Campo de relacionamento com o objeto Pet)**

    - [ ] **Histórico de vacinação**
        - [ ] **Name (Numeração automática gerado pelo próprio Salesforce)**
        - [ ] **Local (Campo texto aberto que representa o local de vacinação)**
        - [ ] **Data (Campo de data que representa a data da vacinação)**
        - [ ] **Pet (Campo de relacionamento com o objeto Pet)**

- [ ] **Organizar Layouts**

- [ ] **App Builder para que todos os objetos criados tenham “Guias” para navegação.**

- [ ] **A fórmula do campo “Idade” no objeto Contact deverá ser numérica e contabilizada sempre que o registro for acessado.**

- [ ] **Os campos “Espécie” e “Raça” no objeto Pet deverão ser dependentes, ou seja, deverão ser exibidos apenas os valores de raças correspondentes de cada espécie. Abaixo os valores:**
    - [ ] **Cachorro**
        - [ ] **Vira-lata**
        - [ ] **Poodle**

    - [ ] **Gato**
        - [ ] **Siamês**
        - [ ] **Persa**

- [ ] **Uma adoção não pode ser criada com a data menor de hoje.**



