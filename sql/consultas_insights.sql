-- ============================================================
-- CONSULTAS SQL - GERAÇÃO DE INSIGHTS
-- Projeto: Data Warehouse de Voluntariado Hospitalar
-- ============================================================


-- ============================================================
-- 1. IDADE MÉDIA DOS VOLUNTÁRIOS
-- ============================================================

SELECT 
    ROUND(AVG(idade)) AS idade_media
FROM dim_voluntario;


-- ============================================================
-- 2. HORAS TOTAIS DE ATENDIMENTO
-- ============================================================

SELECT 
    ROUND(SUM(total_horas), 2) AS total_horas
FROM fato_atendimento;


-- ============================================================
-- 3. MÉDIA DE ATENDIMENTOS POR MÊS
-- ============================================================

SELECT 
    ROUND(AVG(total_mes)) AS media_atendimento_mes
FROM (
    SELECT 
        mes,
        COUNT(*) AS total_mes
    FROM dim_data_atendimento
    GROUP BY mes
) tabela;


-- ============================================================
-- 4. TOP 5 HOSPITAIS COM MAIS ATENDIMENTOS
-- ============================================================

SELECT 
    COUNT(*) AS total_atendimentos,
    nome_hospital
FROM fato_atendimento
JOIN dim_hospital
    ON fato_atendimento.id_hospital = dim_hospital.id_hospital
GROUP BY nome_hospital
ORDER BY total_atendimentos DESC
LIMIT 5;


-- ============================================================
-- 5. TOP 5 VOLUNTÁRIOS COM MAIOR IMPACTO EM ATENDIMENTOS
-- ============================================================

SELECT 
    SUM(total_pessoas) AS total_pessoas,
    nome_voluntario
FROM fato_atendimento
JOIN dim_voluntario
    ON fato_atendimento.id_voluntario = dim_voluntario.id_voluntario
GROUP BY nome_voluntario
ORDER BY total_pessoas DESC
LIMIT 5;


-- ============================================================
-- 6. ATENDIMENTOS POR GÊNERO
-- ============================================================

SELECT 
    genero,
    COUNT(*) AS total
FROM dim_voluntario
GROUP BY genero
ORDER BY total DESC;


-- ============================================================
-- 7. TOTAL DE ATENDIMENTOS POR ANO
-- ============================================================

SELECT 
    ano,
    COUNT(*) AS total_atendimentos
FROM dim_data_atendimento
GROUP BY ano
ORDER BY ano ASC;


-- ============================================================
-- 8. ATIVIDADE VOLUNTÁRIA MAIS REALIZADA
-- ============================================================

SELECT 
    da.nome_atividade,
    COUNT(*) AS total_atividades
FROM fato_atendimento fa
JOIN dim_atividade da
    ON fa.id_atividade = da.id_atividade
GROUP BY da.nome_atividade
ORDER BY total_atividades DESC;


-- ============================================================
-- 9. ATENDIMENTOS MENSAIS POR ANO
-- ============================================================

SELECT 
    ano,
    mes,
    COUNT(*) AS qtde_atendimento
FROM dim_data_atendimento
GROUP BY 
    ano,
    mes
ORDER BY 
    ano,
    mes;


-- ============================================================
-- 10. DISTRIBUIÇÃO DE ATENDIMENTOS POR PERÍODO DO DIA
-- ============================================================

SELECT 
    dim_periodo_horario.periodo,
    COUNT(*) AS total_atendimento
FROM fato_atendimento
JOIN dim_periodo_horario
    ON dim_periodo_horario.id_periodo = fato_atendimento.id_periodo
GROUP BY dim_periodo_horario.periodo;