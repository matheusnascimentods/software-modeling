# Relatório — Modelagem do Banco de Dados da Madeira Verde

> Versão reduzida do relatório entregue na A3. Os prints das tabelas no DBDesigner e o código SQL completo foram substituídos por referências aos scripts [`ddl.sql`](ddl.sql) e [`dml.sql`](dml.sql), e as consultas `SELECT * FROM` de cada tabela foram omitidas.

## Descrição do projeto

O grupo modelou o banco de dados do case do [edital](notice.md) em um **DER** e um **MER**, feitos no **DBDesigner**, e codificou o modelo em SQL para o **MariaDB**. O resultado tem **18 tabelas**; o diagrama de relacionamentos está no [README](README.md).

## Convenção de nomes

Cada coluna segue o padrão `<PREFIXO DA TABELA>_<TIPO>_<NOME>`:

| Tipo | Significado | Exemplo |
| :---: | :--- | :--- |
| `INT` | Inteiro | `COM_INT_QUANTIDADE_ESTOQUE` |
| `STR` | Texto (`CHAR`/`VARCHAR`) | `EMP_STR_CNPJ` |
| `FLO` / `DOU` | Decimal (`FLOAT`/`DOUBLE`) | `PRO_FLO_PRECO` |
| `DAT` / `TIM` | Data e hora | `FUN_DAT_DATA_ADMISSAO` |
| `ENU` | Enumeração | `ENC_ENU_FORMA_PAGAMENTO` |

As chaves estrangeiras repetem o nome da tabela referenciada antes da coluna, como `ENDERECO_END_INT_ID`. Todas as chaves primárias são inteiros com `AUTO_INCREMENT`.

## Decisões de modelagem

### Empresas: `EMPRESA`, `CLIENTE`, `FORNECEDOR`, `MANUTENCAO` e `CERTIFICADO`

- **`EMPRESA`** é uma superentidade com os atributos comuns a clientes, fornecedores e prestadores de manutenção: CNPJ (único), razão social, telefone, pessoa de contato e endereço. Cada especialização referencia uma empresa.
- **`CLIENTE`** guarda o endereço de cobrança como relacionamento com `ENDERECO`, o endereço de correspondência como texto, além de ramo de atividade, data de cadastramento e e-mail. O endereço de entrega fica em cada encomenda.
- **`MANUTENCAO`** representa a empresa especializada em máquinas, com o horário de expediente. O grupo criou **`CERTIFICADO`** para registrar as qualificações dessas empresas.
- **`FORNECEDOR`** acrescenta o e-mail de contato.

### Componentes: `COMPONENTE`, `MATERIAL`, `MAQUINA` e `FERRAMENTA`

- **`COMPONENTE`** é uma superentidade com código de barras (único), nome, estoque, preço unitário e unidade de estoque.
- **Matéria-prima e materiais diversos** foram unidos em **`MATERIAL`**, já que têm os mesmos atributos; o tipo é diferenciado por `MAT_STR_TIPO_MATERIAL`.
- **`MAQUINA`** registra tempo de vida, data da compra, fim da garantia e tempo de uso.
- **`FERRAMENTA`** recebeu uma **vida útil**, já que fabricantes costumam estimar um período de uso a partir do material, da aplicação e do desgaste.

### Relacionamentos N:N

| Tabela associativa | Liga | Atributo próprio |
| :--- | :--- | :--- |
| `FORNECIDO` | `FORNECEDOR` ↔ `COMPONENTE` | Demanda (quantidade fornecida) |
| `COMPOSICAO_PRODUTO` | `PRODUTO` ↔ `COMPONENTE` | Quantidade do componente no produto |
| `MAO_OBRA` | `FUNCIONARIO` ↔ `PRODUTO` | Documentação do serviço |
| `ORDEM_SERVICO` | `MANUTENCAO` ↔ `MAQUINA` | Data da manutenção e descrição do serviço |
| `ITEM_ENCOMENDA` | `ENCOMENDA` ↔ `PRODUTO` | Quantidade e datas de início e fim da produção |

### Endereços: `ENDERECO`

Como várias entidades têm endereço (empresas, clientes, funcionários e encomendas), ele virou uma tabela própria com CEP, número e complemento, evitando a repetição desses atributos.

### Pessoas e produção: `FUNCIONARIO` e `PRODUTO`

- **`FUNCIONARIO`** representa a mão de obra, com CPF e matrícula. A **hierarquia** é um autorrelacionamento: cada funcionário referencia o seu superior em `FUNCIONARIO_FUN_INT_ID`.
- **`PRODUTO`** separa as dimensões em largura, profundidade e altura, e guarda o desenho como o nome ou caminho do arquivo.

### Encomendas: `ENCOMENDA` e `ITEM_ENCOMENDA`

- A **forma de pagamento** é um `ENUM` com opções fixas: Pix, cartão de crédito, cartão de débito, boleto e cheque.
- A encomenda tem um **número de nota fiscal**, usado como identificador de negócio, e o endereço de entrega.
- **`ITEM_ENCOMENDA`** permite incluir vários produtos, e mais de uma unidade do mesmo produto, em uma encomenda.

## Scripts

| Script | Conteúdo |
| :--- | :--- |
| [`ddl.sql`](ddl.sql) | Cria o banco `MadeiraVerde` e as 18 tabelas, na ordem das dependências entre chaves estrangeiras |
| [`dml.sql`](dml.sql) | Insere dados fictícios em todas as tabelas: uma marcenaria, um fornecedor, um cliente, dois funcionários, dois produtos e uma encomenda com dois itens |

### Ajustes em relação à entrega original

Ao executar os scripts no MariaDB, que usa modo estrito por padrão, o DML original falhava. Para que ele rode do início ao fim:

- **Valores encurtados** para caber nos tamanhos das colunas: dois complementos de endereço, a razão social da marcenaria, o ramo de atividade do cliente e o nome da estante.
- **Forma de pagamento**: `'Crypto'`, que não existe no `ENUM`, foi trocado por `'Pix'`.
- **Comentário da ordem de serviço** corrigido: a máquina 1 é a CNC, não uma serra.

O DDL não mudou.

## Diferenças em relação ao edital

Alguns requisitos ficaram fora do modelo ou foram registrados de outra forma:

- **Uso na fabricação**: a quantidade necessária de material e o tempo de uso das máquinas ficam no próprio componente, não na relação com o produto; `COMPOSICAO_PRODUTO` guarda só uma quantidade genérica. As horas de mão de obra por produto não são registradas.
- **Data de necessidade** fica na encomenda, não em cada produto encomendado.
- **Telefones**: empresas e funcionários têm um único telefone, e não uma lista.
- **Forma de pagamento**: o `ENUM` não inclui dinheiro, citado no edital.
- **Funcionário sem superior**: como a coluna do superior é obrigatória, quem está no topo da hierarquia referencia a si mesmo.
