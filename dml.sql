-- Fábrica de Móveis Madeira Verde — DML (dados de exemplo)
-- Executar depois do ddl.sql. Todos os dados são fictícios.
-- Os IDs são gerados em sequência pelo AUTO_INCREMENT; os comentários indicam o ID de cada linha.

USE MadeiraVerde;

-- 1. ENDEREÇOS
INSERT INTO ENDERECO (END_STR_CEP, END_STR_NUMERO, END_STR_COMPLEMENTO) VALUES
    ('90210000', '1977', 'Galpão Hollywood'),      -- 1: sede da marcenaria
    ('89000000', '100',  'Distrito Industrial'),   -- 2: fornecedor Bosch
    ('11440000', '10',   'Mansão Mangaratiba'),    -- 3: cliente NJR
    ('22000001', '55',   'Sítio da Montanha'),     -- 4: funcionário
    ('33000002', '42',   'Trailer de Filmagem'),   -- 5: funcionário
    ('01310100', '1500', 'Loja Centro'),           -- 6: cliente Casa & Lar
    ('30140071', '220',  'Sala 4'),                -- 7: cliente Mobilar
    ('80010000', '45',   'Galpão 2'),              -- 8: cliente Sul Decor
    ('04538133', '900',  'Andar 3'),               -- 9: fornecedor Madeireira Paulista
    ('13010000', '12',   'Bloco B'),               -- 10: fornecedor Ferragens Campinas
    ('06454000', '300',  'Galpão Industrial'),     -- 11: manutenção TecMaq
    ('03102000', '78',   'Apto 21'),               -- 12: funcionário
    ('03310000', '150',  'Casa'),                  -- 13: funcionário
    ('03164000', '33',   'Casa 2'),                -- 14: funcionário
    ('01311000', '2000', 'Depósito Paulista'),     -- 15: entrega Casa & Lar
    ('09210000', '500',  'Galpão 3');              -- 16: manutenção MaqServ

-- 2. EMPRESAS (superentidade de clientes, fornecedores e manutenção)
INSERT INTO EMPRESA (ENDERECO_END_INT_ID, EMP_STR_CNPJ, EMP_STR_PESSOA_CONTATO, EMP_STR_RAZAO_SOCIAL, EMP_STR_TELEFONE) VALUES
    (1,  '11111111000199', 'George Lucas',    'Ford & Hilbert Marcenaria', '(11) 99999-7895'), -- 1: a marcenaria
    (2,  '22222222000100', 'Robert Bosch',    'Bosch Industrial Ltda',     '(41) 3333-8522'),  -- 2: fornecedor
    (6,  '33333333000101', 'Carla Menezes',   'Casa & Lar Móveis Ltda',    '(11) 3222-1100'),  -- 3: cliente
    (7,  '44444444000102', 'Rafael Souza',    'Mobilar Varejo Ltda',       '(31) 3555-2200'),  -- 4: cliente
    (8,  '55555555000103', 'Juliana Prado',   'Sul Decor Comércio Ltda',   '(41) 3666-3300'),  -- 5: cliente
    (9,  '66666666000104', 'Marcos Teixeira', 'Madeireira Paulista',       '(11) 3777-4400'),  -- 6: fornecedor
    (10, '77777777000105', 'Paula Ramos',     'Ferragens Campinas',        '(19) 3888-5500'),  -- 7: fornecedor
    (11, '88888888000106', 'Ricardo Alves',   'TecMaq Manutenção',         '(11) 3999-6600'),  -- 8: manutenção
    (3,  '99999999000107', 'Neymar Jr',       'NJR Entretenimento Ltda',   '(13) 3444-1010'),  -- 9: cliente
    (16, '10101010000108', 'Sérgio Nunes',    'MaqServ Industrial',        '(11) 3111-7700');  -- 10: manutenção

-- 3. COMPONENTES (superentidade de materiais, máquinas e ferramentas)
INSERT INTO COMPONENTE (COM_STR_CODIGO_BARRA, COM_STR_NOME, COM_INT_QUANTIDADE_ESTOQUE, COM_FLO_PRECO_UNITARIO, COM_STR_UNIDADE_ESTOQUE) VALUES
    ('789100000001', 'Mogno Africano Raro',          50,   1200.50,   'M2'),      -- 1: matéria-prima
    ('789100000002', 'Parafuso Banhado a Ouro',      5000, 5.00,      'UNIDADE'), -- 2: material
    ('789100000003', 'Verniz Marítimo Premium',      20,   350.00,    'LATA'),    -- 3: material
    ('789100000004', 'Puxador de Cristal Swarovski', 10,   450.00,    'UNIDADE'), -- 4: material
    ('789100000005', 'Chapa de MDF 18mm',            120,  189.90,    'CHAPA'),   -- 5: matéria-prima
    ('789100000006', 'Lixa Grão 2000',               300,  2.50,      'FOLHA'),   -- 6: material
    ('789100000007', 'Cola PVA Extra',               40,   32.00,     'GALÃO'),   -- 7: material
    ('789100000008', 'Dobradiça Caneco 35mm',        800,  4.20,      'UNIDADE'), -- 8: material
    ('789100000009', 'Fresadora CNC Router',         1,    185000.00, 'UNIDADE'), -- 9: máquina
    ('789100000010', 'Serra Esquadrejadeira',        1,    42000.00,  'UNIDADE'), -- 10: máquina
    ('789100000011', 'Lixadeira Orbital',            3,    890.00,    'UNIDADE'), -- 11: máquina
    ('789100000012', 'Serra Circular Manual',        2,    650.00,    'UNIDADE'), -- 12: ferramenta
    ('789100000013', 'Esquadro de Aço 30cm',         6,    45.00,     'UNIDADE'), -- 13: ferramenta
    ('789100000014', 'Jogo de Chaves de Fenda',      4,    120.00,    'JOGO');    -- 14: ferramenta

-- 4. FERRAMENTAS (vida útil em dias)
INSERT INTO FERRAMENTA (COMPONENTE_COM_INT_ID, FER_DAT_DATA_COMPRA, FER_INT_VIDA_UTIL) VALUES
    (12, '2023-01-15', 1825),
    (13, '2022-08-10', 3650),
    (14, '2024-04-20', 1095);

-- 5. MATERIAIS (matérias-primas e materiais diversos)
INSERT INTO MATERIAL (COMPONENTE_COM_INT_ID, MAT_STR_TIPO_MATERIAL, MAT_INT_QUANTIDADE_NECESSARIA, MAT_STR_UNIDADE_MEDIDA) VALUES
    (1, 'Matéria-prima',    10, 'M2'),
    (2, 'Material diverso', 50, 'UNIDADE'),
    (3, 'Material diverso', 2,  'LATA'),
    (4, 'Material diverso', 4,  'UNIDADE'),
    (5, 'Matéria-prima',    3,  'CHAPA'),
    (6, 'Material diverso', 50, 'FOLHA'),
    (7, 'Material diverso', 1,  'GALÃO'),
    (8, 'Material diverso', 8,  'UNIDADE');

-- 6. MÁQUINAS (tempo de vida e de uso em horas)
INSERT INTO MAQUINA (COMPONENTE_COM_INT_ID, MAQ_INT_TEMPO_VIDA, MAQ_DAT_DATA_COMPRA, MAQ_DAT_FIM_GARANTIA, MAQ_STR_TEMPO_USO) VALUES
    (9,  7000,  '2021-05-10', '2026-05-10', 2500), -- 1: CNC
    (10, 10000, '2022-03-01', '2025-03-01', 1800), -- 2: serra esquadrejadeira
    (11, 3000,  '2024-02-15', '2025-02-15', 600);  -- 3: lixadeira

-- 7. FORNECEDORES
INSERT INTO FORNECEDOR (EMPRESA_EMP_INT_ID, FOR_STR_EMAIL) VALUES
    (2, 'vendas@bosch-pro.com'),                 -- 1
    (6, 'comercial@madeireirapaulista.com.br'),  -- 2
    (7, 'vendas@ferragenscampinas.com.br');      -- 3

-- 8. FORNECIDO (componente × fornecedor, com a demanda)
INSERT INTO FORNECIDO (COMPONENTE_COM_INT_ID, FORNECEDOR_FOR_INT_ID, FOR_INT_DEMANDA) VALUES
    (2,  1, 10000),
    (11, 1, 3),
    (12, 1, 2),
    (1,  2, 200),
    (5,  2, 150),
    (3,  3, 30),
    (4,  3, 40),
    (6,  3, 500),
    (7,  3, 60),
    (8,  3, 1000);

-- 9. CLIENTES (varejistas pessoa jurídica)
INSERT INTO CLIENTE (EMPRESA_EMP_INT_ID, ENDERECO_END_INT_ID, CLI_STR_ENDERECO_CORRESPONDENCIA, CLI_STR_RAMO_ATIVIDADE, CLI_DAT_DATA_CADASTRAMENTO, CLI_STR_EMAIL) VALUES
    (9, 3, 'Condomínio AeroRural',             'Entretenimento',   '2023-11-01', 'njr@instituto.com'),       -- 1
    (3, 6, 'Caixa Postal 1020, São Paulo',     'Varejo de móveis', '2022-04-12', 'compras@casaelar.com.br'), -- 2
    (4, 7, 'Av. Afonso Pena, 220, BH',         'Varejo de móveis', '2023-02-08', 'pedidos@mobilar.com.br'),  -- 3
    (5, 8, 'Rua XV de Novembro, 45, Curitiba', 'Decoração',        '2024-06-20', 'contato@suldecor.com.br'); -- 4

-- 10. FUNCIONÁRIOS
-- Harrison Ford (ID 1) está no topo da hierarquia e referencia a si mesmo como superior
INSERT INTO FUNCIONARIO (FUN_INT_ID, ENDERECO_END_INT_ID, FUNCIONARIO_FUN_INT_ID, FUN_STR_CPF, FUN_STR_MATRICULA, FUN_STR_NOME, FUN_STR_TELEFONE, FUN_STR_CARGO, FUN_FLO_SALARIO, FUN_DAT_DATA_ADMISSAO, FUN_STR_DESC_PROFISSIONAL)
VALUES (1, 5, 1, '11122233344', 'SOLO-001', 'Harrison Ford', '(11) 91111-9634', 'Mestre Carpinteiro', 25000.00, '1970-01-01', 'Especialista em Madeira Maciça');

INSERT INTO FUNCIONARIO (ENDERECO_END_INT_ID, FUNCIONARIO_FUN_INT_ID, FUN_STR_CPF, FUN_STR_MATRICULA, FUN_STR_NOME, FUN_STR_TELEFONE, FUN_STR_CARGO, FUN_FLO_SALARIO, FUN_DAT_DATA_ADMISSAO, FUN_STR_DESC_PROFISSIONAL) VALUES
    (4,  1, '55566677788', 'FAZ-TUDO', 'Rodrigo Hilbert',      '(11) 92222-1235', 'Artesão Sênior',          15000.00, '2020-06-15', 'Constrói capelas e berços'),                 -- 2
    (12, 1, '12345678901', 'MV-003',   'Ana Beatriz Costa',    '(11) 93333-4567', 'Supervisora de Produção', 8500.00,  '2019-03-11', 'Gestão de equipes e controle de qualidade'), -- 3
    (13, 3, '23456789012', 'MV-004',   'Bruno Henrique Silva', '(11) 94444-5678', 'Marceneiro',              4200.00,  '2021-09-01', 'Montagem de móveis planejados'),             -- 4
    (14, 3, '34567890123', 'MV-005',   'Camila Rocha',         '(11) 95555-6789', 'Operadora de CNC',        4800.00,  '2022-05-16', 'Programação e operação de router CNC');      -- 5

-- 11. PRODUTOS (dimensões em metros, tempo médio de produção em horas)
INSERT INTO PRODUTO (PRO_STR_NOME, PRO_STR_COR, PRO_FLO_PESO, PRO_FLO_PRECO, PRO_STR_DESENHO_PRODUTO, PRO_FLO_LARGURA, PRO_FLO_PROFUNDIDADE, PRO_FLO_ALTURA, PRO_INT_TEMPO_MEDIO_PRODUCAO) VALUES
    ('Mesa de Poker NJR Edition', 'Verde e Dourado', 85.5,  45000.00, 'poker_table_v10.cad',     2.50, 1.20, 0.80, 160), -- 1
    ('Estante de Troféus',        'Carvalho Escuro', 120.0, 15000.00, 'estante_trofeus.pdf',     3.00, 0.50, 2.20, 90),  -- 2
    ('Armário Multiuso 2 Portas', 'Branco',          45.0,  1290.00,  'armario_multiuso_v3.dwg', 0.80, 0.45, 1.80, 24),  -- 3
    ('Mesa de Jantar 6 Lugares',  'Nogueira',        60.0,  2490.00,  'mesa_jantar_6l.dwg',      1.80, 0.90, 0.78, 30),  -- 4
    ('Cama Box Casal',            'Freijó',          70.0,  1890.00,  'cama_casal_v2.dwg',       1.58, 2.05, 0.45, 28),  -- 5
    ('Rack para TV',              'Preto Fosco',     28.0,  890.00,   'rack_tv_180.dwg',         1.80, 0.40, 0.55, 12);  -- 6

-- 12. COMPOSIÇÃO DOS PRODUTOS (quantidade de cada componente por produto)
INSERT INTO COMPOSICAO_PRODUTO (PRODUTO_PRO_INT_ID, COMPONENTE_COM_INT_ID, COP_INT_QUATIDADE) VALUES
    (1, 1, 10), (1, 2, 50), (1, 3, 2),
    (2, 1, 6),  (2, 3, 2),
    (3, 5, 4),  (3, 8, 4),  (3, 4, 2), (3, 2, 40),
    (4, 1, 4),  (4, 7, 1),  (4, 3, 1),
    (5, 5, 5),  (5, 2, 60),
    (6, 5, 3),  (6, 4, 2),  (6, 8, 2);

-- 13. MÃO DE OBRA (funcionário × produto)
INSERT INTO MAO_OBRA (FUNCIONARIO_FUN_INT_ID, PRODUTO_PRO_INT_ID, MAO_STR_DOCUMENTACAO) VALUES
    (2, 1, 'Tutorial em Vídeo: Como construir uma mesa do zero'),
    (1, 2, 'Entalhe e acabamento da estante'),
    (5, 3, 'Corte das chapas na CNC'),
    (4, 3, 'Montagem e instalação das portas'),
    (4, 4, 'Montagem do tampo e dos pés'),
    (1, 4, 'Acabamento com verniz'),
    (4, 5, 'Montagem da estrutura da cama'),
    (5, 6, 'Corte e furação na CNC');

-- 14. ENCOMENDAS (valor total = soma dos itens; valor líquido = total - desconto)
INSERT INTO ENCOMENDA (ENDERECO_END_INT_ID, CLIENTE_CLI_INT_ID, ENC_INT_NUMERO_NF, ENC_DATA_INCLUSAO, ENC_DOU_VALOR_TOTAL_ENC, ENC_DOU_DESCONTO, ENC_DOU_VALOR_LIQUIDO, ENC_DAT_DATA_NECESSIDADE, ENC_ENU_FORMA_PAGAMENTO, ENC_QUANTIDADE_PARCELA, ENC_STR_NF) VALUES
    (3,  1, 101010, '2023-12-01', 60000.00, 5000.00, 55000.00, '2023-12-24', 'Pix',               1, 'NF-e Poker Night'), -- 1
    (15, 2, 101011, '2024-03-05', 8850.00,  450.00,  8400.00,  '2024-04-05', 'Boleto',            3, 'NF-e 101011'),      -- 2
    (7,  3, 101012, '2024-05-10', 9340.00,  0.00,    9340.00,  '2024-06-10', 'Cartão de crédito', 6, 'NF-e 101012'),      -- 3
    (8,  4, 101013, '2024-07-22', 4450.00,  200.00,  4250.00,  '2024-08-15', 'Cheque',            2, 'NF-e 101013'),      -- 4
    (6,  2, 101014, '2024-09-02', 6870.00,  0.00,    6870.00,  '2024-10-01', 'Cartão de débito',  1, 'NF-e 101014');      -- 5

-- 15. ITENS DAS ENCOMENDAS (fim da produção NULL = ainda em produção)
INSERT INTO ITEM_ENCOMENDA (PRODUTO_PRO_INT_ID, ENCOMENDA_ENC_INT_ID, ITE_DAT_INICIO_PRODUCAO, ITE_DAT_FIM_PRODUCAO, ITE_INT_QUANTIDADE_PRODUTO) VALUES
    (1, 1, '2023-12-02', NULL,         1),
    (2, 1, '2023-12-05', NULL,         1),
    (3, 2, '2024-03-07', '2024-03-20', 3),
    (4, 2, '2024-03-08', '2024-03-25', 2),
    (5, 3, '2024-05-12', '2024-06-01', 4),
    (6, 3, '2024-05-15', '2024-05-30', 2),
    (6, 4, '2024-07-24', '2024-08-05', 5),
    (4, 5, '2024-09-04', NULL,         2),
    (5, 5, '2024-09-06', NULL,         1);

-- 16. MANUTENÇÃO, CERTIFICADOS E ORDENS DE SERVIÇO
INSERT INTO MANUTENCAO (EMPRESA_EMP_INT_ID, MAN_TIM_INICIO_EXPEDIENTE, MAN_TIM_FIM_EXPEDIENTE) VALUES
    (8,  '07:00:00', '17:00:00'), -- 1: TecMaq
    (10, '08:00:00', '18:00:00'); -- 2: MaqServ

INSERT INTO CERTIFICADO (MANUTENCAO_MAN_INT_ID, CER_STR_CERTIFICADO_PROFISSIONAL) VALUES
    (1, 'Certificação FSC - Madeira Sustentável'),
    (1, 'NR-12 Segurança em Máquinas'),
    (2, 'ISO 9001'),
    (2, 'Técnico Autorizado Bosch');

INSERT INTO ORDEM_SERVICO (MANUTENCAO_MAN_INT_ID, MAQUINA_MAQ_INT_ID, ORD_DAT_DATA_MANUTENCAO, ORD_STR_DESCRICAO_SERVICO) VALUES
    (1, 1, '2023-11-15', 'Afiação da Lâmina de Diamante da CNC'),
    (1, 2, '2024-01-20', 'Troca de correias e alinhamento da serra esquadrejadeira'),
    (2, 3, '2024-04-03', 'Substituição da base de lixamento'),
    (2, 1, '2024-08-12', 'Calibração dos eixos e lubrificação da CNC'),
    (1, 2, '2024-10-05', 'Revisão preventiva semestral');
