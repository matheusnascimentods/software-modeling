# Edital da A3 — Modelagem de Software (2025/2)

> Resumo do edital da atividade avaliativa A3 da disciplina **Modelagem de Software**, da **Universidade Anhembi Morumbi**, reduzido ao que é necessário para entender o projeto.

## Objetivo

Orientar os entregáveis da A3 da disciplina, oferecida aos cursos de ADS, Engenharia da Computação, Ciência da Computação e GTI.

## Grupos

- De **5 a 6 alunos**, com a divisão de tarefas de cada membro apresentada até 15 dias após a liberação do edital; a avaliação é individual.
- Alunos com ingresso tardio podem entrar em um grupo, sem penalidade por entregas já vencidas, desde que o limite de integrantes seja respeitado.

## Case: Fábrica de Móveis Madeira Verde

A fábrica quer um sistema de informação que cubra suas principais áreas. Ela trabalha **por encomenda**, sem estoque de produtos prontos, e atende apenas **pessoas jurídicas** (varejistas de várias regiões do país).

| Área | O que registrar |
| :--- | :--- |
| **Clientes** | Código, CNPJ, razão social, endereços de cobrança, correspondência e entrega, telefones, pessoa de contato, ramo de atividade e data de cadastramento |
| **Produtos** | Código, nome, cor, dimensões, peso, preço, tempo médio de fabricação e desenho (armários, mesas, camas etc.) |
| **Componentes** | Código, nome, quantidade em estoque, preço unitário e unidade de estoque, para matérias-primas, materiais diversos, máquinas e ferramentas; um componente serve a vários produtos e um produto usa vários componentes |
| **Máquinas** | Além dos dados de componente: tempo médio de vida, data da compra e fim da garantia |
| **Uso na fabricação** | Matérias-primas e materiais: quantidade necessária e unidade de medida. Máquinas e ferramentas: tempo de uso. Mão de obra: quantidade de horas |
| **Funcionários** | Matrícula, nome, endereço, telefones, cargo, salário, data de admissão e qualificações; cada empregado tem um único superior, que pode gerenciar vários empregados |
| **Encomendas** | Número, data de inclusão, valor total, desconto, valor líquido, forma de pagamento (cheque, dinheiro, cartão de crédito) e quantidade de parcelas; pertence a um único cliente e pode ter vários produtos, cada um com quantidade e data de necessidade |
| **Fornecedores** | CNPJ, razão social, endereço, telefones e pessoa de contato; um fornecedor pode fornecer itens de qualquer grupo de componentes |
| **Manutenção de máquinas** | Empresas especializadas (CNPJ, razão social, endereço, telefones e pessoa de contato) e, a cada manutenção, a data e a descrição das ações realizadas |

## Entregáveis

1. **DER** — Diagrama Entidade-Relacionamento, na **3ª Forma Normal**.
2. **MER** — Modelo Entidade-Relacionamento.
3. **Script SQL** — DDL e DML.

A ferramenta de criação fica a critério do grupo.

## Regras de entrega

- Um único arquivo **PDF**, sem compactação, com os nomes completos e RAs dos integrantes acima dos prints dos diagramas.
- Todos os integrantes postam o mesmo arquivo, no mesmo local, no Ulife; quem não postar fica com nota zero.

## Materiais deste repositório

| Entregável | Arquivo |
| :--- | :--- |
| Decisões de modelagem (DER e MER) | [`report.md`](report.md) |
| Script DDL | [`ddl.sql`](ddl.sql) |
| Script DML | [`dml.sql`](dml.sql) |
