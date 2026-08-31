🏥 Data Warehouse de Voluntariado Hospitalar

Projeto acadêmico desenvolvido na disciplina de Arquitetura de Dados, com o objetivo de aplicar conceitos de Data Warehouse, modelagem dimensional, SQL e análise de dados para analisar atendimentos voluntários realizados em hospitais.

O projeto foi desenvolvido utilizando o Databricks e o modelo dimensional em Esquema Estrela (Star Schema), permitindo organizar os dados e gerar análises sobre voluntários, hospitais, atividades, períodos e atendimentos.

🎯 Objetivo do projeto

O projeto surgiu a partir da dificuldade de analisar e acompanhar os atendimentos voluntários hospitalares de forma organizada, integrada e estratégica.

O Data Warehouse foi desenvolvido para responder perguntas como:

Quais hospitais possuem mais atendimentos?
Qual atividade voluntária é mais realizada?
Qual período do dia possui maior concentração de atendimentos?
Qual perfil de voluntário participa mais?
Como os atendimentos se distribuem ao longo dos anos e meses?
🛠️ Tecnologias e ferramentas
Databricks — ambiente utilizado para implementação do Data Warehouse e consultas SQL
SQL — criação das tabelas e consultas analíticas
Delta Tables / Delta Lake — armazenamento das tabelas no ambiente Databricks
Draw.io — criação do Diagrama Entidade-Relacionamento e modelagem dimensional
Excel — base inicial dos dados
Inteligência Artificial — expansão da base para fins educacionais e analíticos
GitHub — documentação e versionamento do projeto

O projeto utilizou o modelo estrela, com uma tabela fato central e dimensões responsáveis por fornecer o contexto das análises.

📊 1. Base de dados

A base inicial foi obtida a partir de uma planilha de voluntariado hospitalar referente aos meses de janeiro e fevereiro de 2025.

A planilha original possuía 52 registros reais, contendo informações como:

nome;
local;
unidade;
número;
atividade;
data;
início;
fim;
total.

Para ampliar a capacidade de análise, foram adicionados dados fictícios utilizando Inteligência Artificial, mantendo a estrutura da base original.

Após a expansão, a base passou a possuir 4.224 registros. Os dados expandidos foram utilizados exclusivamente para fins educacionais e analíticos.

🏗️ 2. Modelagem Dimensional

Foi utilizado o modelo Star Schema (Esquema Estrela).

Nesse modelo, a tabela fato fica no centro e as tabelas dimensão fornecem informações complementares para as análises.

Tabela fato

fato_atendimento

Responsável por armazenar os eventos de atendimentos voluntários hospitalares.

Principais campos:

id_atendimento
id_voluntario
id_atividade
id_data_atendimento
id_hospital
id_local
id_periodo
total_horas
total_pessoas

A granularidade foi definida como:

Cada linha representa um atendimento voluntário hospitalar realizado, associado a um voluntário, atividade, data, local e período do dia.

🧩 3. Tabelas dimensão

Foram criadas as seguintes dimensões:

👤 dim_voluntario

Armazena informações sobre os voluntários:

id_voluntario
nome_voluntario
idade
genero

🎯 dim_atividade
Representa as atividades realizadas:

id_atividade
nome_atividade

🏥 dim_hospital
Armazena os hospitais:

id_hospital
nome_hospital

📍 dim_local
Permite análises relacionadas à localização:

id_local
nome_local
cidade
estado

📅 dim_data_atendimento
Permite análises temporais:

id_data_atendimento
dataa
mes
ano
dia_semana
inicio
fim

🕐 dim_periodo_horario
Permite analisar os atendimentos de acordo com o período do dia:

id_periodo
periodo
hora_inicio
hora_fim

A dimensão de período também foi utilizada nas análises para identificar a concentração dos atendimentos ao longo do dia.

🔗 4. Relacionamento entre as tabelas

As dimensões são relacionadas à tabela fato por meio de chaves primárias (PK) e chaves estrangeiras (FK).

Os relacionamentos possuem cardinalidade 1:N, pois um registro de uma dimensão pode estar relacionado a vários registros na tabela fato.

Exemplos:

1 voluntário → N atendimentos
1 hospital → N atendimentos
1 atividade → N atendimentos
1 local → N atendimentos
1 data → N atendimentos
1 período → N atendimentos

🗄️ 5. Implementação no Databricks

A implementação foi realizada no Databricks, seguindo as etapas:

Criação do database;
Criação das tabelas dimensão;
Criação da tabela fato;
Inserção dos dados;
Realização das consultas SQL;
Análise dos resultados;
Geração dos insights.

As tabelas foram criadas utilizando o formato Delta, por meio do comando:

USING DELTA;

O formato Delta foi utilizado como padrão de armazenamento analítico no ambiente Databricks.

🔎 6. Consultas SQL

Após a construção do Data Warehouse, foram realizadas consultas SQL para gerar indicadores e responder às perguntas de negócio.

Entre as análises realizadas estão:

👥 Perfil dos voluntários
idade média;
distribuição por gênero;
voluntários com maior número de atendimentos.

🏥 Hospitais
hospitais com maior quantidade de atendimentos;
Top 5 hospitais.

🎯 Atividades
atividade voluntária mais realizada;
atividade com menor quantidade de registros.

📅 Análises temporais
atendimentos por ano;
atendimentos por mês;
média de atendimentos por mês;
comportamento mensal dos atendimentos.

🕐 Período
distribuição dos atendimentos entre manhã, tarde e noite.

📈 7. Principais resultados

As consultas permitiram gerar indicadores e insights sobre os atendimentos voluntários.

Entre os resultados apresentados estão:

Idade média dos voluntários: 44 anos;
Horas totais de atendimento: aproximadamente 2,35 milhões;
Média de atendimentos por mês: aproximadamente 343 registros;
Hospital Infantil Sabará: maior volume de registros entre os hospitais analisados;
Ana: voluntária com maior impacto em atendimentos;
Gênero feminino: 72,45% dos registros analisados;
Entretenimento: atividade voluntária mais realizada, com 1.171 registros;
Música Sacra: atividade com menor volume de registros;
Período da tarde: maior concentração de atendimentos.

Esses resultados foram utilizados para gerar os gráficos e insights apresentados no projeto.

💡 Insights

A análise permitiu identificar padrões relacionados aos voluntários, hospitais, atividades, períodos e distribuição temporal dos atendimentos.

* **Volume Por Unidade:** O Hospital Infantil Sabará apresentou o maior volume de registros, indicando forte atuação das atividades voluntárias nessa unidade.
* **Engajamento em Ações:** Entretenimento foi a atividade mais realizada, demonstrando maior participação em ações voltadas ao acolhimento e ao bem-estar dos pacientes.
* **Concentração de Horários:** O período da tarde concentrou a maior quantidade de atendimentos voluntários, enquanto o período noturno apresentou menor participação.

---

📁 Estrutura do Repositório

```text
Data-Warehouse-Voluntariado/
│
├── README.md
│
├── documentos/
│   ├── Construção_Data_Warehouse_Voluntariado.docx
│   └── apresentação_voluntariado.pptx
│
├── sql/
│   ├── criacao_database.sql
│   ├── criacao_dimensoes.sql
│   ├── criacao_fato.sql
│   └── consultas_insights.sql
│
├── modelagem/
│   └── DER.png
│
└── dados/
    └── README.md

🎓 Conclusão & Documentação

O projeto demonstrou como técnicas de análise de dados e modelagem dimensional no Databricks ajudam na gestão do voluntariado hospitalar, fornecendo visibilidade clara sobre o engajamento e auxiliando no direcionamento de recursos para ações sociais.

Para conferir o detalhamento completo e os slides da apresentação, acesse os arquivos na pasta documentos/:

📄 Documentação do Projeto: Construção_Data_Warehouse_Voluntariado.docx

📊 Apresentação em Slides: apresentação_voluntariado.pptx

💙 Projeto Acadêmico
Curso: Inteligência e Análise de Dados
Disciplina: Arquitetura de Dados
Ano: 2026
