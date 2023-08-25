-- CreateTable
CREATE TABLE "motivos" (
    "id" SERIAL NOT NULL,
    "descricao" VARCHAR(50),
    "configuracaoClienteId" INTEGER,
    "codigo" VARCHAR(20),
    "nome" VARCHAR(20),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "motivos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "times" (
    "id" SERIAL NOT NULL,
    "descricao" VARCHAR(50),
    "metasId" INTEGER,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "times_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "metas" (
    "id" SERIAL NOT NULL,
    "descricao" VARCHAR(50),
    "status" VARCHAR(50),
    "valor_meta" DECIMAL(10,2),
    "valor_alcancado" DECIMAL(10,2),
    "data_inicial" TIMESTAMP(3),
    "data_final" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "configuracaoClienteId" INTEGER,

    CONSTRAINT "metas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tipo_projeto" (
    "id" SERIAL NOT NULL,
    "descricao" VARCHAR(50),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "tipo_projeto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "campanha_mkt" (
    "id" SERIAL NOT NULL,
    "titulo" VARCHAR(50),
    "html_body" VARCHAR(10000),
    "configuracaoClienteId" INTEGER,
    "tipo_msgId" INTEGER,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "campanha_mkt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lista_mkt" (
    "id" SERIAL NOT NULL,
    "titulo" VARCHAR(50),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "lista_mkt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lista_contato_cliente" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "lista_mktId" INTEGER,
    "contactsId" INTEGER,
    "clienteId" INTEGER,

    CONSTRAINT "lista_contato_cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "campanha_lista" (
    "id" SERIAL NOT NULL,
    "updated_at" TIMESTAMP(3),
    "campanha_mktId" INTEGER,
    "lista_mktId" INTEGER,

    CONSTRAINT "campanha_lista_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "formulario_dinamico" (
    "id" SERIAL NOT NULL,
    "publico" BOOLEAN,
    "url_formulario" VARCHAR(250),
    "title" VARCHAR(50),
    "json" JSONB,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "projetoId" INTEGER,
    "processoId" INTEGER,
    "configuracaoClienteId" INTEGER,
    "nome_campanha" VARCHAR(255),
    "link_redirect" VARCHAR(800),
    "logo" VARCHAR(500),
    "logo_width" VARCHAR(10),
    "logo_height" VARCHAR(10),

    CONSTRAINT "formulario_dinamico_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "form_ask" (
    "id" SERIAL NOT NULL,
    "formulario_dinamicoId" INTEGER,
    "json" JSONB,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "form_ask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "projeto" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(50),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "tipo_projetoId" INTEGER,
    "operador" VARCHAR(150),
    "configuracaoClienteId" INTEGER,

    CONSTRAINT "projeto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "processo" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(500),
    "color" VARCHAR(10),
    "etapa" INTEGER,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "projetoId" INTEGER,
    "operador" VARCHAR(150),

    CONSTRAINT "processo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "task_produto" (
    "id" SERIAL NOT NULL,
    "taskId" INTEGER,
    "produtoId" INTEGER,

    CONSTRAINT "task_produto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "task" (
    "id" SERIAL NOT NULL,
    "contato_nome" VARCHAR(100),
    "contato_numero" VARCHAR(20),
    "title" VARCHAR(100),
    "description" VARCHAR(500),
    "processoId" INTEGER,
    "valor_Inicial" DECIMAL(10,2),
    "valor_Final" DECIMAL(10,2),
    "marcar_venda" BOOLEAN,
    "desconto" DECIMAL(10,2),
    "previsao_fechamento" TIMESTAMP(3),
    "status" VARCHAR(50),
    "emailId" INTEGER,
    "anotacoesId" INTEGER,
    "contactsId" INTEGER,
    "usersId" INTEGER,
    "operador" VARCHAR(150),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "metasId" INTEGER,
    "vendaId" INTEGER,
    "empresa" VARCHAR(100),
    "motivosId" INTEGER,
    "produtoId" INTEGER,
    "arquivado" BOOLEAN,

    CONSTRAINT "task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mensageria" (
    "id" SERIAL NOT NULL,
    "processo" VARCHAR(20) NOT NULL,
    "data_processamento" TIMESTAMP(3),
    "data_envio" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "tipo_msgId" INTEGER,
    "emailId" INTEGER,
    "smsId" INTEGER,

    CONSTRAINT "mensageria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tipo_msg" (
    "id" SERIAL NOT NULL,
    "tipo_msgm" VARCHAR(20) NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "tipo_msg_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "email" (
    "id" SERIAL NOT NULL,
    "titulo" VARCHAR(50) NOT NULL,
    "from" VARCHAR(50) NOT NULL,
    "to" VARCHAR(50) NOT NULL,
    "html_body" VARCHAR(10000) NOT NULL,
    "data_envio" TIMESTAMP(3) NOT NULL,
    "taskId" INTEGER,

    CONSTRAINT "email_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sms" (
    "id" SERIAL NOT NULL,
    "titulo" VARCHAR(50) NOT NULL,
    "from" VARCHAR(50) NOT NULL,
    "to" VARCHAR(50) NOT NULL,
    "body" VARCHAR(1000) NOT NULL,
    "data_envio" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "sms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attachments" (
    "id" SERIAL NOT NULL,
    "link" VARCHAR(500),
    "description" VARCHAR(500),
    "emailId" INTEGER,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "attachments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "arquivos" (
    "id" SERIAL NOT NULL,
    "link" VARCHAR(500),
    "description" VARCHAR(500),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "taskId" INTEGER,
    "clienteId" INTEGER,

    CONSTRAINT "arquivos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "anotacoes" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(100),
    "description" VARCHAR(500),
    "date" TIMESTAMP(3),
    "is_fav" BOOLEAN,
    "tag" VARCHAR(100),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "taskId" INTEGER,

    CONSTRAINT "anotacoes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "log_taks" (
    "id" SERIAL NOT NULL,
    "chave" VARCHAR(50),
    "valor" VARCHAR(50),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "taskId" INTEGER,

    CONSTRAINT "log_taks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sub_task" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(50),
    "description" VARCHAR(500),
    "description_text" VARCHAR(500),
    "priority" VARCHAR(50),
    "status" VARCHAR(500),
    "date_start" TIMESTAMP(3),
    "date_end" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "taskId" INTEGER,

    CONSTRAINT "sub_task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "configuracaoCliente" (
    "id" SERIAL NOT NULL,
    "logo_link" VARCHAR(500),
    "cover_link" VARCHAR(500),
    "nome_empresa" VARCHAR(150),
    "nome_fantasia" VARCHAR(150),
    "cnpj_cpf" VARCHAR(21),
    "telefone" VARCHAR(25),
    "responsavel" VARCHAR(25),
    "email" VARCHAR(150),
    "departamento" VARCHAR(150),
    "setor" VARCHAR(150),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "logradouro" VARCHAR(150),
    "bairro" VARCHAR(150),
    "estado" VARCHAR(150),
    "cidade" VARCHAR(150),
    "pais" VARCHAR(150),
    "complemento" VARCHAR(150),
    "cep" VARCHAR(25),
    "numero" VARCHAR(20),

    CONSTRAINT "configuracaoCliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cliente" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(200),
    "sobrenome" VARCHAR(200),
    "email" VARCHAR(200),
    "empresa" VARCHAR(150),
    "data_nascimento" TIMESTAMP(3),
    "cpf" VARCHAR(150),
    "cnpj" VARCHAR(150),
    "rg" VARCHAR(150),
    "telefone" VARCHAR(25),
    "responsavel" VARCHAR(25),
    "linkFoto" VARCHAR(500),
    "sexoId" INTEGER,
    "planoId" INTEGER,
    "configuracaoClienteId" INTEGER,
    "cep" VARCHAR(25),
    "logradouro" VARCHAR(150),
    "bairro" VARCHAR(150),
    "estado" VARCHAR(150),
    "cidade" VARCHAR(150),
    "pais" VARCHAR(150),
    "complemento" VARCHAR(150),
    "numero" VARCHAR(20),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "historico_cliente" (
    "id" SERIAL NOT NULL,
    "chave" VARCHAR(25),
    "valor" VARCHAR(500),
    "operador" VARCHAR(50),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "clienteId" INTEGER,

    CONSTRAINT "historico_cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categoria_produto" (
    "id" SERIAL NOT NULL,
    "codigo" VARCHAR(150) NOT NULL,
    "nome" VARCHAR(150) NOT NULL,
    "detalhamento" VARCHAR(500),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "operador" VARCHAR(150) NOT NULL,
    "configuracaoClienteId" INTEGER,

    CONSTRAINT "categoria_produto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "produto" (
    "id" SERIAL NOT NULL,
    "codigo" VARCHAR(150) NOT NULL,
    "nome" VARCHAR(150) NOT NULL,
    "detalhamento" VARCHAR(500),
    "link_img" VARCHAR(500),
    "qtd_estoque" DECIMAL(10,2),
    "preco_venda" DECIMAL(10,2),
    "ativo" BOOLEAN,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "operador" VARCHAR(150) NOT NULL,
    "categoria_produtoId" INTEGER,
    "clienteId" INTEGER,
    "descricao" VARCHAR(500),

    CONSTRAINT "produto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "servico" (
    "id" SERIAL NOT NULL,
    "codigo" VARCHAR(150) NOT NULL,
    "nome" VARCHAR(150) NOT NULL,
    "detalhamento" VARCHAR(500),
    "valor_hora" DECIMAL(10,2) NOT NULL,
    "ativo" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "operador" VARCHAR(150),
    "clienteId" INTEGER,

    CONSTRAINT "servico_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "venda" (
    "id" SERIAL NOT NULL,
    "valor_total" DECIMAL(10,2),
    "status" VARCHAR(20) NOT NULL DEFAULT 'venda',
    "configuracaoClienteId" INTEGER,
    "taskId" INTEGER,
    "usersId" INTEGER,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "venda_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fornecedor" (
    "id" SERIAL NOT NULL,
    "link_img" VARCHAR(500),
    "nome_responsavel" VARCHAR(200),
    "email" VARCHAR(200),
    "empresa" VARCHAR(150),
    "cnpj" VARCHAR(150),
    "telefone" VARCHAR(25),
    "celular" VARCHAR(25),
    "foto" VARCHAR(500),
    "ativo" BOOLEAN,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "operador" VARCHAR(150),
    "clienteId" INTEGER,

    CONSTRAINT "fornecedor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissao_modulos" (
    "id" SERIAL NOT NULL,
    "ver" BOOLEAN,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "userId" INTEGER,
    "moduloId" INTEGER,

    CONSTRAINT "permissao_modulos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissao_sub_modulos" (
    "id" SERIAL NOT NULL,
    "editar" BOOLEAN,
    "ver" BOOLEAN,
    "deletar" BOOLEAN,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "userId" INTEGER,
    "subModuloId" INTEGER,

    CONSTRAINT "permissao_sub_modulos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "historico_permissao" (
    "id" SERIAL NOT NULL,
    "operador" VARCHAR(150),
    "descricao" VARCHAR(150),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "permissao_modulosId" INTEGER,
    "permissao_sub_modulosId" INTEGER,

    CONSTRAINT "historico_permissao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "modulo" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(150),
    "url" VARCHAR(150),
    "ativo" BOOLEAN,
    "ordem" INTEGER,
    "icon" VARCHAR(51),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "modulo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sub_modulo" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(150),
    "url" VARCHAR(150),
    "ativo" BOOLEAN,
    "icon" VARCHAR(40),
    "ordem" INTEGER,
    "moduloId" INTEGER,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "sub_modulo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sexo_enum" (
    "id" SERIAL NOT NULL,
    "descricao" VARCHAR(11),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "sexo_enum_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "opcao" (
    "id" SERIAL NOT NULL,
    "descricao" VARCHAR(11),
    "Opcao" BOOLEAN,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "opcao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tipo_usuario_enum" (
    "id" SERIAL NOT NULL,
    "descricao" VARCHAR(21),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "tipo_usuario_enum_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contacts" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "number" VARCHAR(255),
    "profilePicUrl" TEXT,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "email" VARCHAR(255),
    "configuracaoClienteId" INTEGER,
    "logradouro" VARCHAR(150),
    "bairro" VARCHAR(150),
    "estado" VARCHAR(150),
    "cidade" VARCHAR(150),
    "pais" VARCHAR(150),
    "complemento" VARCHAR(150),
    "numero" VARCHAR(20),
    "cep" VARCHAR(25),

    CONSTRAINT "Contacts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "sobrenome" VARCHAR(200),
    "empresa" VARCHAR(150),
    "cpf" VARCHAR(150),
    "telefone" VARCHAR(25),
    "linkFoto" VARCHAR(500),
    "isAdmin" BOOLEAN,
    "themeDark" BOOLEAN,
    "operador" VARCHAR(150),
    "sexoId" INTEGER,
    "clienteId" INTEGER,
    "name" VARCHAR(255),
    "email" VARCHAR(255),
    "profile" VARCHAR(255) DEFAULT 'admin',
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "timesId" INTEGER,
    "logradouro" VARCHAR(150),
    "bairro" VARCHAR(150),
    "estado" VARCHAR(150),
    "cidade" VARCHAR(150),
    "pais" VARCHAR(150),
    "complemento" VARCHAR(150),
    "numero" VARCHAR(20),
    "primeiro_acesso" BOOLEAN,
    "gerente_conta" BOOLEAN,
    "termos" BOOLEAN,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cliente_produto" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(200),
    "sobrenome" VARCHAR(200),
    "email" VARCHAR(200),
    "cpf" VARCHAR(150),
    "telefone" VARCHAR(25),
    "link_img" VARCHAR(500),
    "createdAt" TIMESTAMPTZ(6),
    "updatedAt" TIMESTAMPTZ(6),

    CONSTRAINT "cliente_produto_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "task_vendaId_key" ON "task"("vendaId");

-- CreateIndex
CREATE UNIQUE INDEX "venda_taskId_key" ON "venda"("taskId");

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- AddForeignKey
ALTER TABLE "motivos" ADD CONSTRAINT "motivos_configuracaoClienteId_fkey" FOREIGN KEY ("configuracaoClienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "times" ADD CONSTRAINT "times_metasId_fkey" FOREIGN KEY ("metasId") REFERENCES "metas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "metas" ADD CONSTRAINT "metas_configuracaoClienteId_fkey" FOREIGN KEY ("configuracaoClienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campanha_mkt" ADD CONSTRAINT "campanha_mkt_configuracaoClienteId_fkey" FOREIGN KEY ("configuracaoClienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campanha_mkt" ADD CONSTRAINT "campanha_mkt_tipo_msgId_fkey" FOREIGN KEY ("tipo_msgId") REFERENCES "tipo_msg"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lista_contato_cliente" ADD CONSTRAINT "lista_contato_cliente_lista_mktId_fkey" FOREIGN KEY ("lista_mktId") REFERENCES "lista_mkt"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lista_contato_cliente" ADD CONSTRAINT "lista_contato_cliente_contactsId_fkey" FOREIGN KEY ("contactsId") REFERENCES "Contacts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lista_contato_cliente" ADD CONSTRAINT "lista_contato_cliente_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "cliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campanha_lista" ADD CONSTRAINT "campanha_lista_campanha_mktId_fkey" FOREIGN KEY ("campanha_mktId") REFERENCES "campanha_mkt"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campanha_lista" ADD CONSTRAINT "campanha_lista_lista_mktId_fkey" FOREIGN KEY ("lista_mktId") REFERENCES "lista_mkt"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formulario_dinamico" ADD CONSTRAINT "formulario_dinamico_configuracaoClienteId_fkey" FOREIGN KEY ("configuracaoClienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formulario_dinamico" ADD CONSTRAINT "formulario_dinamico_processoId_fkey" FOREIGN KEY ("processoId") REFERENCES "processo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "formulario_dinamico" ADD CONSTRAINT "formulario_dinamico_projetoId_fkey" FOREIGN KEY ("projetoId") REFERENCES "projeto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "form_ask" ADD CONSTRAINT "form_ask_formulario_dinamicoId_fkey" FOREIGN KEY ("formulario_dinamicoId") REFERENCES "formulario_dinamico"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projeto" ADD CONSTRAINT "projeto_configuracaoClienteId_fkey" FOREIGN KEY ("configuracaoClienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projeto" ADD CONSTRAINT "projeto_tipo_projetoId_fkey" FOREIGN KEY ("tipo_projetoId") REFERENCES "tipo_projeto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "processo" ADD CONSTRAINT "processo_projetoId_fkey" FOREIGN KEY ("projetoId") REFERENCES "projeto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_produto" ADD CONSTRAINT "task_produto_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "produto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_produto" ADD CONSTRAINT "task_produto_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_contactsId_fkey" FOREIGN KEY ("contactsId") REFERENCES "Contacts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_metasId_fkey" FOREIGN KEY ("metasId") REFERENCES "metas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_motivosId_fkey" FOREIGN KEY ("motivosId") REFERENCES "motivos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_processoId_fkey" FOREIGN KEY ("processoId") REFERENCES "processo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mensageria" ADD CONSTRAINT "mensageria_tipo_msgId_fkey" FOREIGN KEY ("tipo_msgId") REFERENCES "tipo_msg"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mensageria" ADD CONSTRAINT "mensageria_emailId_fkey" FOREIGN KEY ("emailId") REFERENCES "email"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mensageria" ADD CONSTRAINT "mensageria_smsId_fkey" FOREIGN KEY ("smsId") REFERENCES "sms"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "email" ADD CONSTRAINT "email_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attachments" ADD CONSTRAINT "attachments_emailId_fkey" FOREIGN KEY ("emailId") REFERENCES "email"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "arquivos" ADD CONSTRAINT "arquivos_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "cliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "arquivos" ADD CONSTRAINT "arquivos_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anotacoes" ADD CONSTRAINT "anotacoes_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "log_taks" ADD CONSTRAINT "log_taks_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sub_task" ADD CONSTRAINT "sub_task_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cliente" ADD CONSTRAINT "cliente_configuracaoClienteId_fkey" FOREIGN KEY ("configuracaoClienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cliente" ADD CONSTRAINT "cliente_sexoId_fkey" FOREIGN KEY ("sexoId") REFERENCES "sexo_enum"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "historico_cliente" ADD CONSTRAINT "historico_cliente_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "cliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categoria_produto" ADD CONSTRAINT "categoria_produto_configuracaoClienteId_fkey" FOREIGN KEY ("configuracaoClienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "produto_categoria_produtoId_fkey" FOREIGN KEY ("categoria_produtoId") REFERENCES "categoria_produto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "produto_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "servico" ADD CONSTRAINT "servico_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "venda" ADD CONSTRAINT "venda_configuracaoClienteId_fkey" FOREIGN KEY ("configuracaoClienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "venda" ADD CONSTRAINT "venda_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "venda" ADD CONSTRAINT "venda_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fornecedor" ADD CONSTRAINT "fornecedor_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permissao_modulos" ADD CONSTRAINT "permissao_modulos_moduloId_fkey" FOREIGN KEY ("moduloId") REFERENCES "modulo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permissao_modulos" ADD CONSTRAINT "permissao_modulos_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permissao_sub_modulos" ADD CONSTRAINT "permissao_sub_modulos_subModuloId_fkey" FOREIGN KEY ("subModuloId") REFERENCES "sub_modulo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permissao_sub_modulos" ADD CONSTRAINT "permissao_sub_modulos_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "historico_permissao" ADD CONSTRAINT "historico_permissao_permissao_modulosId_fkey" FOREIGN KEY ("permissao_modulosId") REFERENCES "permissao_modulos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "historico_permissao" ADD CONSTRAINT "historico_permissao_permissao_sub_modulosId_fkey" FOREIGN KEY ("permissao_sub_modulosId") REFERENCES "permissao_sub_modulos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sub_modulo" ADD CONSTRAINT "sub_modulo_moduloId_fkey" FOREIGN KEY ("moduloId") REFERENCES "modulo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contacts" ADD CONSTRAINT "Contacts_configuracaoClienteId_fkey" FOREIGN KEY ("configuracaoClienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "configuracaoCliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_sexoId_fkey" FOREIGN KEY ("sexoId") REFERENCES "sexo_enum"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_timesId_fkey" FOREIGN KEY ("timesId") REFERENCES "times"("id") ON DELETE SET NULL ON UPDATE CASCADE;
