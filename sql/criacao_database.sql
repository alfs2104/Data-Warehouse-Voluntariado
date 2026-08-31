
CREATE DATABASE IF NOT EXISTS dw_health_dashboard;
-- drop database dw_health_dashboard;
-- drop table dim_atividade;
-- drop table dim_data_atendimento;
-- drop table dim_hospital;
-- drop table dim_local;
-- drop table dim_voluntario;
-- drop table fato_atendimento;


USE dw_health_dashboard;


CREATE OR REPLACE TABLE dim_data_atendimento (
    id_data_atendimento INT,
    data_atendimento DATE,
    mes INT,
    ano INT,
    dia_semana STRING,
    inicio STRING,
    fim STRING
)
USING DELTA;

CREATE OR REPLACE TABLE dim_hospital (
    id_hospital INT,
    nome_hospital STRING
)
USING DELTA;

CREATE OR REPLACE TABLE dim_local (
    id_local INT,
    nome_local STRING,
    cidade STRING,
    estado STRING
)
USING DELTA;

CREATE OR REPLACE TABLE dim_atividade (
    id_atividade INT,
    nome_atividade STRING
)
USING DELTA;

CREATE OR REPLACE TABLE dim_voluntario (
    id_voluntario INT,
    nome_voluntario STRING,
    idade INT,
    genero STRING
)
USING DELTA;

CREATE OR REPLACE TABLE dim_periodo_horario (
    Id_periodo INT, 
    periodo STRING,
    hora_inicio STRING,
    hora_fim STRING
)
USING DELTA;

CREATE OR REPLACE TABLE fato_atendimento (
    id_voluntario INT,
    id_atividade INT,
    id_data_atendimento INT,
    id_hospital INT,
    id_local INT,
    total_horas INT,
    total_pessoas INT,
    id_periodo INT
)
USING DELTA;
