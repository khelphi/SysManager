
-- Meu Banco de dados sysmanager
-- ------------------------------
CREATE SCHEMA IF NOT EXISTS sysManager;

-- marcar banco de dados para uso
-- ------------------------------
USE sysManager;

-- menha tabela de banco de dados
-- ------------------------------
CREATE TABLE IF NOT EXISTS sysManager.user
(
 `id` char(36) NOT NULL Default 'uuid()' COMMENT 'Identificador unico do registro',
 `userName` varchar(50) NOT NULL COMMENT 'nome de usu�rio',
 `email` varchar(100) NOT NULL COMMENT 'email do usu�rio',
 `password` varchar(50) NOT NULL COMMENT 'senha do usu�rio',
 `active` bit NOT NULL DEFAULT false COMMENT 'indicador se o usu�rio esta ativo ou inativo',
 `createdDate` DateTime NOT NULL DEFAULT NOW() COMMENT 'Data de cria��o do usu�rio',
 `updatedDate` Datetime NULL COMMENT 'Data de altera��o do reguistro',
 PRIMARY KEY(`id`)
);

-- -----------------------------------------------------
-- Table `sysManager`.`unity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sysManager.unity (
  `id` CHAR(36) not null default 'uuid()' comment 'Identificador do registro',
  `name` varchar(100) not null comment 'Nome do Unidade de produto',
  `active` bit NOT NULL default false comment 'Ativo ou inativo',
  `createdDate` datetime not null default NOW() comment 'data de cria��o do registro',
  `updatedDate` datetime null  comment 'data de atualiza��o do registro',
  PRIMARY KEY (`id`)
  );

-- ---------------------------
-- tabela de produtos
-- ---------------------------
CREATE TABLE IF NOT EXISTS sysManager.product
(
`id` char(36) NOT NULL DEFAULT 'uuid()' COMMENT 'Identificador unico do registro',
`productCode` varchar(50) NOT NULL COMMENT 'Codigo do produto',
`name` varchar(50) NOT NULL COMMENT 'nome/Descri��o do produto',
`productTypeId`  varchar(50) NOT NULL COMMENT 'tipo do produto',
`categoryId`  varchar(50) NOT NULL COMMENT 'categoria do produto',
`unityId`  varchar(50) NOT NULL COMMENT 'unidade de medida do produto',
`costPrice` decimal(15,9) DEFAULT 0  COMMENT 'pre�o de custo do produto',
`percentage` decimal(15,9) DEFAULT 0  COMMENT 'percentual de venda do produto',
`price` decimal(15,9) DEFAULT 0  COMMENT 'pre�o final do produto',
`active` bit NOT NULL DEFAULT false COMMENT 'indicador se o usu�rio esta ativo ou inativo',
`creationDate` DateTime NOT NULL DEFAULT NOW() COMMENT 'data de cria��o do registro',
`updateDate` DateTime NULL COMMENT 'data de atualiza��o do registro',
PRIMARY KEY(`id`),
CONSTRAINT `fk_producType` FOREIGN KEY (`productTypeId`) REFERENCES sysManager.productType(`id`),
CONSTRAINT `fk_category` FOREIGN KEY (`categoryId`) REFERENCES sysManager.category(`id`),
CONSTRAINT `fk_unity` FOREIGN KEY (`unityId`) REFERENCES sysManager.unity(`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
