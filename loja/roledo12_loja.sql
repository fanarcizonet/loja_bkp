-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 24-Mar-2023 às 01:59
-- Versão do servidor: 5.7.23-23
-- versão do PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `roledo12_loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `categoria_pai_id` int(11) DEFAULT NULL,
  `categoria_nome` varchar(45) NOT NULL,
  `categoria_ativa` tinyint(1) DEFAULT NULL,
  `categoria_meta_link` varchar(100) DEFAULT NULL,
  `categoria_data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoria_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `categoria_pai_id`, `categoria_nome`, `categoria_ativa`, `categoria_meta_link`, `categoria_data_criacao`, `categoria_data_alteracao`) VALUES
(3, 4, 'Canecas', 1, 'canecas', '2023-03-20 01:28:29', '2023-03-20 01:28:29'),
(4, 4, 'Chaveiros', 1, 'chaveiros', '2023-03-20 01:28:50', '2023-03-20 01:28:50'),
(5, 4, 'Camisetas', 1, 'camisetas', '2023-03-20 01:42:52', '2023-03-20 01:42:52'),
(6, 5, 'Ingressos', 1, 'ingressos', '2023-03-20 01:44:58', '2023-03-20 01:44:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias_pai`
--

CREATE TABLE `categorias_pai` (
  `categoria_pai_id` int(11) NOT NULL,
  `categoria_pai_nome` varchar(45) NOT NULL,
  `categoria_pai_ativa` tinyint(1) DEFAULT NULL,
  `categoria_pai_meta_link` varchar(100) DEFAULT NULL,
  `categoria_pai_data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoria_pai_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias_pai`
--

INSERT INTO `categorias_pai` (`categoria_pai_id`, `categoria_pai_nome`, `categoria_pai_ativa`, `categoria_pai_meta_link`, `categoria_pai_data_criacao`, `categoria_pai_data_alteracao`) VALUES
(4, 'Lembranças', 1, 'lembrancas', '2023-03-20 01:27:27', '2023-03-20 01:27:27'),
(5, 'Ingressos', 1, 'ingressos', '2023-03-20 01:44:17', '2023-03-20 01:44:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `cliente_data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cliente_nome` varchar(45) NOT NULL,
  `cliente_sobrenome` varchar(150) NOT NULL,
  `cliente_data_nascimento` date DEFAULT NULL,
  `cliente_cpf` varchar(20) NOT NULL,
  `cliente_telefone_fixo` varchar(20) DEFAULT NULL,
  `cliente_telefone_movel` varchar(20) NOT NULL,
  `cliente_email` varchar(100) NOT NULL,
  `cliente_cep` varchar(10) NOT NULL,
  `cliente_endereco` varchar(155) NOT NULL,
  `cliente_numero_endereco` varchar(20) DEFAULT NULL,
  `cliente_bairro` varchar(45) NOT NULL,
  `cliente_cidade` varchar(105) NOT NULL,
  `cliente_estado` varchar(2) NOT NULL,
  `cliente_complemento` varchar(145) DEFAULT NULL,
  `cliente_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `cliente_data_cadastro`, `cliente_nome`, `cliente_sobrenome`, `cliente_data_nascimento`, `cliente_cpf`, `cliente_telefone_fixo`, `cliente_telefone_movel`, `cliente_email`, `cliente_cep`, `cliente_endereco`, `cliente_numero_endereco`, `cliente_bairro`, `cliente_cidade`, `cliente_estado`, `cliente_complemento`, `cliente_data_alteracao`) VALUES
(5, '2023-03-22 17:58:20', 'Carolina', 'Sangali', '1986-06-10', '347.043.588-01', '', '(17) 9882-2334', 'carol@gmail.com', '15402-324', 'RUA DOS MACEDOS', '59', 'TROPICAL', 'OLIMPIA', 'SP', '', '2023-03-22 17:58:20'),
(6, '2023-03-22 18:10:26', 'carol', 'macedo', '1988-07-06', '228.713.288-03', '', '(17) 98128-0060', 'macedo@gmail.com', '15402-324', 'RUA MACEDO TELES', '66', 'TROPICAL', 'OLIMPIA', 'SE', '', '2023-03-22 18:10:26'),
(7, '2023-03-22 20:14:05', 'julio', 'cesar', '1988-07-10', '659.414.020-58', NULL, '(17) 9882-2335', 'julio@gmail.com', '15402-324', 'Rua José Gameiro', '59', 'Jardim Tropical', 'Olímpia', 'SP', NULL, '2023-03-22 20:14:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_correios`
--

CREATE TABLE `config_correios` (
  `config_id` int(11) NOT NULL,
  `config_cep_origem` varchar(20) NOT NULL,
  `config_codigo_pac` varchar(10) NOT NULL,
  `config_codigo_sedex` varchar(10) NOT NULL,
  `config_somar_frete` decimal(10,2) NOT NULL,
  `config_valor_declarado` decimal(5,2) NOT NULL,
  `config_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `config_correios`
--

INSERT INTO `config_correios` (`config_id`, `config_cep_origem`, `config_codigo_pac`, `config_codigo_sedex`, `config_somar_frete`, `config_valor_declarado`, `config_data_alteracao`) VALUES
(1, '80530-000', '04510', '04014', '0.10', '23.50', '2023-03-23 03:00:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_pagseguro`
--

CREATE TABLE `config_pagseguro` (
  `config_id` int(11) NOT NULL,
  `config_email` varchar(255) NOT NULL,
  `config_token` varchar(100) NOT NULL,
  `config_ambiente` tinyint(1) NOT NULL COMMENT '0 -> Ambiente real / 1 -> Ambiente sandbox',
  `config_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `config_pagseguro`
--

INSERT INTO `config_pagseguro` (`config_id`, `config_email`, `config_token`, `config_ambiente`, `config_data_alteracao`) VALUES
(1, 'fanarcizonet@gmail.com', 'F27E87D80E4C47E2B3CFEA7DF83B18C0', 1, '2023-03-23 16:03:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'cientes', 'General User');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(5, '131.255.71.253', 'joaodeus@gmail.com', 1679622821);

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE `marcas` (
  `marca_id` int(11) NOT NULL,
  `marca_nome` varchar(45) NOT NULL,
  `marca_meta_link` varchar(255) NOT NULL,
  `marca_ativa` tinyint(1) DEFAULT NULL,
  `marca_data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `marca_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`marca_id`, `marca_nome`, `marca_meta_link`, `marca_ativa`, `marca_data_criacao`, `marca_data_alteracao`) VALUES
(5, 'Rolê do Poxa Oficial', 'role-do-poxa-oficial', 1, '2023-03-20 01:26:23', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL,
  `pedido_codigo` varchar(8) DEFAULT NULL,
  `pedido_cliente_id` int(11) DEFAULT NULL,
  `pedido_valor_produtos` decimal(15,2) DEFAULT NULL,
  `pedido_valor_frete` decimal(15,2) DEFAULT NULL,
  `pedido_valor_final` decimal(15,2) DEFAULT NULL,
  `pedido_forma_envio` tinyint(1) DEFAULT NULL COMMENT '1 = Correios Sedex---------------------2 - Correios PAC',
  `pedido_data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pedido_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `pedido_codigo`, `pedido_cliente_id`, `pedido_valor_produtos`, `pedido_valor_frete`, `pedido_valor_final`, `pedido_forma_envio`, `pedido_data_cadastro`, `pedido_data_alteracao`) VALUES
(1, '24807391', 5, '70.00', '38.00', '108.00', 2, '2023-03-22 19:42:44', NULL),
(2, '89750462', 7, '15.00', '61.60', '76.60', 2, '2023-03-22 20:14:24', NULL),
(3, '75641329', 5, '35.00', '32.60', '67.60', 2, '2023-03-22 20:31:43', NULL),
(4, '75024839', 5, '35.00', '32.60', '67.60', 2, '2023-03-22 20:40:15', NULL),
(5, '43985610', 5, '15.00', '61.60', '76.60', 2, '2023-03-22 21:17:38', NULL),
(6, '39641870', 5, '35.00', '32.60', '67.60', 2, '2023-03-22 21:21:19', NULL),
(7, '23897016', 5, '35.00', '32.60', '67.60', 2, '2023-03-22 21:23:59', NULL),
(8, '25187093', 5, '35.00', '32.60', '67.60', 2, '2023-03-22 21:35:59', NULL),
(9, '28067493', 5, '35.00', '61.60', '96.60', 2, '2023-03-22 22:20:47', NULL),
(10, '59784201', 5, '15.00', '32.60', '47.60', 2, '2023-03-22 22:24:18', NULL),
(11, '76925084', 7, '35.00', '32.60', '67.60', 2, '2023-03-22 23:05:33', NULL),
(12, '76541329', 7, '35.00', '32.60', '67.60', 2, '2023-03-22 23:08:03', NULL),
(13, '72430819', 7, '35.00', '0.00', '35.00', 2, '2023-03-22 23:12:32', NULL),
(14, '46038591', 7, '35.00', '32.60', '67.60', 2, '2023-03-22 23:25:38', NULL),
(15, '05138749', 7, '35.00', '32.60', '67.60', 2, '2023-03-22 23:42:18', NULL),
(16, '09135827', 5, '35.00', '32.60', '67.60', 2, '2023-03-22 23:50:44', NULL),
(17, '96058372', 5, '35.00', '32.60', '67.60', 2, '2023-03-22 23:53:56', NULL),
(18, '73124950', 7, '35.00', '32.60', '67.60', 2, '2023-03-23 00:04:34', NULL),
(19, '96847102', 5, '35.00', '32.60', '67.60', 2, '2023-03-23 00:15:02', NULL),
(20, '63194502', 7, '15.00', '32.60', '47.60', 2, '2023-03-23 00:32:33', NULL),
(21, '13607254', 5, '35.00', '32.60', '67.60', 2, '2023-03-23 01:25:08', NULL),
(22, '54178329', 7, '15.00', '0.00', '15.00', 2, '2023-03-23 01:43:22', NULL),
(23, '65923801', 7, '35.00', '0.00', '35.00', 2, '2023-03-23 01:50:04', NULL),
(24, '26943587', 7, '15.00', NULL, '15.00', 2, '2023-03-23 01:51:43', NULL),
(25, '84623790', 7, '15.00', NULL, NULL, 2, '2023-03-23 01:53:15', NULL),
(26, '64293107', 7, '15.00', NULL, NULL, NULL, '2023-03-23 01:54:47', NULL),
(27, '79104532', 5, '35.00', NULL, NULL, NULL, '2023-03-23 02:00:27', NULL),
(28, '21476985', 5, '35.00', '3.00', '38.00', 2, '2023-03-23 02:11:39', NULL),
(29, '72405618', 5, '35.00', '6.00', '41.00', 2, '2023-03-23 02:14:22', NULL),
(30, '63781294', 7, '35.00', '0.00', '35.00', 2, '2023-03-23 02:24:01', NULL),
(31, '20351789', 7, '35.00', '32.60', '67.60', 1, '2023-03-23 02:46:57', NULL),
(32, '80317459', 5, '35.00', '32.60', '67.60', 1, '2023-03-23 02:52:40', NULL),
(33, '96715042', 5, '35.00', '61.60', '96.60', 2, '2023-03-23 02:56:39', NULL),
(34, '21543068', 5, '35.00', '29.60', '64.60', 1, '2023-03-23 02:59:53', NULL),
(35, '18964523', 5, '35.00', '29.50', '64.50', 1, '2023-03-23 12:52:51', NULL),
(36, '29056738', 5, '35.00', '29.50', '64.50', 1, '2023-03-23 16:43:22', NULL),
(37, '16049587', 5, '35.00', '29.50', '64.50', 1, '2023-03-24 01:14:32', NULL),
(38, '89301256', 5, '35.00', '29.50', '64.50', 1, '2023-03-24 01:16:47', NULL),
(39, '75086291', 5, '35.00', '29.50', '64.50', 1, '2023-03-24 02:03:47', NULL),
(40, '30154698', 5, '35.00', '29.50', '64.50', 1, '2023-03-24 03:19:56', NULL),
(41, '17362854', 5, '85.00', '34.90', '119.90', 1, '2023-03-24 04:40:01', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_produtos`
--

CREATE TABLE `pedidos_produtos` (
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `produto_nome` varchar(200) NOT NULL,
  `produto_quantidade` int(11) NOT NULL,
  `produto_valor_unitario` decimal(15,2) NOT NULL,
  `produto_valor_total` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos_produtos`
--

INSERT INTO `pedidos_produtos` (`pedido_id`, `produto_id`, `produto_nome`, `produto_quantidade`, `produto_valor_unitario`, `produto_valor_total`) VALUES
(1, 11, 'Caneca Personalizada', 2, '35.00', '70.00'),
(2, 12, 'Chaveiro Personalizado', 1, '15.00', '15.00'),
(3, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(4, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(5, 12, 'Chaveiro Personalizado', 1, '15.00', '15.00'),
(6, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(7, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(8, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(9, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(10, 12, 'Chaveiro Personalizado', 1, '15.00', '15.00'),
(11, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(12, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(13, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(14, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(15, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(16, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(17, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(18, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(19, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(20, 12, 'Chaveiro Personalizado', 1, '15.00', '15.00'),
(21, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(22, 12, 'Chaveiro Personalizado', 1, '15.00', '15.00'),
(23, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(24, 12, 'Chaveiro Personalizado', 1, '15.00', '15.00'),
(25, 12, 'Chaveiro Personalizado', 1, '15.00', '15.00'),
(26, 12, 'Chaveiro Personalizado', 1, '15.00', '15.00'),
(27, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(28, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(29, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(30, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(31, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(32, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(33, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(34, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(35, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(36, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(37, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(38, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(39, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(40, 11, 'Caneca Personalizada', 1, '35.00', '35.00'),
(41, 12, 'Chaveiro Personalizado', 1, '10.00', '10.00'),
(41, 14, 'Ingresso Pista', 1, '75.00', '75.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(11) NOT NULL,
  `produto_codigo` varchar(45) DEFAULT NULL,
  `produto_data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `produto_categoria_id` int(11) DEFAULT NULL,
  `produto_marca_id` int(11) DEFAULT NULL,
  `produto_nome` varchar(255) DEFAULT NULL,
  `produto_meta_link` varchar(255) DEFAULT NULL,
  `produto_peso` int(11) DEFAULT '0',
  `produto_altura` int(11) DEFAULT '0',
  `produto_largura` int(11) DEFAULT '0',
  `produto_comprimento` int(11) DEFAULT '0',
  `produto_valor` varchar(45) DEFAULT NULL,
  `produto_destaque` tinyint(1) DEFAULT NULL,
  `produto_controlar_estoque` tinyint(1) DEFAULT NULL,
  `produto_quantidade_estoque` int(11) DEFAULT '0',
  `produto_ativo` tinyint(1) DEFAULT NULL,
  `produto_descricao` longtext,
  `produto_data_alteracao` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `produto_codigo`, `produto_data_cadastro`, `produto_categoria_id`, `produto_marca_id`, `produto_nome`, `produto_meta_link`, `produto_peso`, `produto_altura`, `produto_largura`, `produto_comprimento`, `produto_valor`, `produto_destaque`, `produto_controlar_estoque`, `produto_quantidade_estoque`, `produto_ativo`, `produto_descricao`, `produto_data_alteracao`) VALUES
(11, '02568749', '2023-03-20 01:35:31', 3, 5, 'Caneca Personalizada', 'caneca-personalizada', 1, 15, 15, 15, '35.00', 1, 1, 10, 1, 'Caneca oficial do Rolê do Poxa', NULL),
(12, '48019352', '2023-03-20 01:36:48', 4, 5, 'Chaveiro Personalizado', 'chaveiro-personalizado', 1, 15, 15, 15, '10.00', 1, 1, 10, 1, 'Chaveiro oficial da Festa Rolê do Poxa', NULL),
(13, '29861043', '2023-03-20 01:46:52', 6, 5, 'Ingresso Camarote', 'ingresso-camarote', 1, 1, 1, 1, '100.00', 1, 1, 8, 1, 'Camarote da Festa Rolê do Poxa Junho 2022', NULL),
(14, '84650197', '2023-03-20 01:48:45', 6, 5, 'Ingresso Pista', 'ingresso-pista', 1, 1, 1, 1, '75.00', 1, 1, 10, 1, 'Ingresso pista da festa Rolê do Poxa', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_fotos`
--

CREATE TABLE `produtos_fotos` (
  `foto_id` int(11) NOT NULL,
  `foto_produto_id` int(11) DEFAULT NULL,
  `foto_caminho` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos_fotos`
--

INSERT INTO `produtos_fotos` (`foto_id`, `foto_produto_id`, `foto_caminho`) VALUES
(28, 13, 'e9b549a4285367dbc0812a6ce300b623.jpg'),
(29, 14, '132b299d33abab4731ffa9e9713df77b.jpg'),
(33, 11, '361abfa947e45ac5d6a766f9094a31fa.jpg'),
(35, 12, '635e50d1feaa337d01a436824f4bd9ad.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sistema`
--

CREATE TABLE `sistema` (
  `sistema_id` int(11) NOT NULL,
  `sistema_razao_social` varchar(145) DEFAULT NULL,
  `sistema_nome_fantasia` varchar(145) DEFAULT NULL,
  `sistema_cnpj` varchar(25) DEFAULT NULL,
  `sistema_ie` varchar(25) DEFAULT NULL,
  `sistema_telefone_fixo` varchar(25) DEFAULT NULL,
  `sistema_telefone_movel` varchar(25) NOT NULL,
  `sistema_email` varchar(100) DEFAULT NULL,
  `sistema_site_url` varchar(100) DEFAULT NULL,
  `sistema_cep` varchar(25) DEFAULT NULL,
  `sistema_endereco` varchar(145) DEFAULT NULL,
  `sistema_numero` varchar(25) DEFAULT NULL,
  `sistema_cidade` varchar(45) DEFAULT NULL,
  `sistema_estado` varchar(2) DEFAULT NULL,
  `sistema_produtos_destaques` int(11) NOT NULL,
  `sistema_texto` tinytext,
  `sistema_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sistema`
--

INSERT INTO `sistema` (`sistema_id`, `sistema_razao_social`, `sistema_nome_fantasia`, `sistema_cnpj`, `sistema_ie`, `sistema_telefone_fixo`, `sistema_telefone_movel`, `sistema_email`, `sistema_site_url`, `sistema_cep`, `sistema_endereco`, `sistema_numero`, `sistema_cidade`, `sistema_estado`, `sistema_produtos_destaques`, `sistema_texto`, `sistema_data_alteracao`) VALUES
(1, 'Loja virtual Inc2', 'Loja do Rolê', '80.838.809/0001-26', '683.90228-49', '(41) 3232-3030', '(17) 98128-0060', 'vendetudo@contato.com.br', 'http://vendetudo.com.br', '15402-325', 'Rua da Carol', '54', 'Curitiba', 'PR', 11, 'Preço e qualidade!', '2023-03-21 22:09:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `transacao_id` int(11) NOT NULL,
  `transacao_pedido_id` int(11) DEFAULT NULL,
  `transacao_cliente_id` int(11) DEFAULT NULL,
  `transacao_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `transacao_codigo_hash` varchar(255) DEFAULT NULL,
  `transacao_tipo_metodo_pagamento` tinyint(1) DEFAULT NULL COMMENT '1 = Cartão | 2 = Boleto | 3 = Transferência',
  `transacao_codigo_metodo_pagamento` varchar(10) DEFAULT NULL,
  `transacao_link_pagamento` varchar(255) DEFAULT NULL,
  `transacao_banco_escolhido` varchar(20) DEFAULT NULL,
  `transacao_valor_bruto` decimal(15,2) DEFAULT NULL,
  `transacao_valor_taxa_pagseguro` decimal(15,2) DEFAULT NULL,
  `transacao_valor_liquido` decimal(15,2) DEFAULT NULL,
  `transacao_numero_parcelas` int(11) DEFAULT NULL,
  `transacao_valor_parcela` decimal(15,2) DEFAULT NULL,
  `transacao_status` tinyint(1) DEFAULT NULL COMMENT 'Verificar documentação',
  `transacao_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `transacoes`
--

INSERT INTO `transacoes` (`transacao_id`, `transacao_pedido_id`, `transacao_cliente_id`, `transacao_data`, `transacao_codigo_hash`, `transacao_tipo_metodo_pagamento`, `transacao_codigo_metodo_pagamento`, `transacao_link_pagamento`, `transacao_banco_escolhido`, `transacao_valor_bruto`, `transacao_valor_taxa_pagseguro`, `transacao_valor_liquido`, `transacao_numero_parcelas`, `transacao_valor_parcela`, `transacao_status`, `transacao_data_alteracao`) VALUES
(1, 2, 7, '2023-03-22 20:14:24', '2429ACB6-AB46-439A-8D0B-E7C2D1206FD4', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=fcdd475aa12faea3cfa1b4801748481c6f57158227e6c019fef1e5a7d8ce78dd6d09c00d37b70a4d', NULL, '76.60', '4.22', '72.38', 1, '76.60', 1, NULL),
(2, 3, 5, '2023-03-22 20:31:43', 'C56946AC-8940-4F2B-9933-E62F89371FC1', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=a55d0b31a7068bd6c53c16128d4931a2b0d60ca3db5e17b1ffde0e87a159501805407e304c5bc3e9', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(3, 4, 5, '2023-03-22 20:40:15', '50A12486-518A-409A-BDE2-CA4880FB4C99', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=1cb79c84ead3f14b837670f0ac93397076948a8226f843f80fed763e70a1b8c26d1264b4ac262c26', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(4, 5, 5, '2023-03-22 21:17:38', '58AC4E5E-60FA-4281-AEBC-25F61AAA71A7', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=ad1219630f028259836c9ad43dbe9b80b8d2cacaac2cd906b5a70a3e23d3289728e926119254549f', NULL, '76.60', '4.22', '72.38', 1, '76.60', 1, NULL),
(5, 6, 5, '2023-03-22 21:21:19', '0C1D0C08-2EEC-4BC6-AE64-56C05AE98040', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=63b84f484e47d7130e6e5709665d4ede1a043a6a53834f534029b159138a4169d967a8254bbb40c6', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(6, 7, 5, '2023-03-22 21:23:59', '305B058D-8D5A-423B-BC54-44DFB6435CE7', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=ed5ed21bb455cba8122043cc591271b55729b3067d9944a8aa02252fbe46d422bb370ec1289047b5', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(7, 8, 5, '2023-03-22 21:35:59', '6129C34F-9EF1-4DD1-9861-28EB4A46ED05', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=3b94689a0e7f7bb3dd120723fcbfa6e05dcd816245439462ca8ee797ec0ee977945a453a9ccfe80d', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(8, 9, 5, '2023-03-22 22:20:47', 'CB92240F-1B6D-42EC-9C60-87ABA8F18FC9', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=3a82f5b97a3ffd6207805768a40356ce5c94019328375db95cbb37db1c544201bcd07a63cf84aaea', NULL, '96.60', '5.22', '91.38', 1, '96.60', 1, NULL),
(9, 10, 5, '2023-03-22 22:24:18', '5F1F4CB0-6592-42D7-A48B-D90D04660E98', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=88c2ceca31ec791318adc65e8a77531fedb1b6c9aea11ae3a89e8152919233a51607e202f0c0af03', NULL, '47.60', '2.78', '44.82', 1, '47.60', 1, NULL),
(10, 11, 7, '2023-03-22 23:05:33', 'FBF5D9C7-D05E-4AEA-88F2-DE8423FE3EB1', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=18f4d5de331dadbb33eb96161df3df54a24214e3752bd0c4c1adcca1164e1eab65c041c54f488d74', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(11, 12, 7, '2023-03-22 23:08:03', '92A14640-23E7-4547-B627-19CD30E7CE0F', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=fe90aa10d5251221576d661182a8c44981b8632bde6e17a7ef75e473ba2a632c14b7f192ed3a9e8d', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(12, 13, 7, '2023-03-22 23:12:32', 'BBD797A2-CDD6-40D1-8B69-D8315BA5C4B9', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=b03b587787e3171920da59619f2a04b2cce450fc96c4c1381d72a40d8638d22d35a6bef1b8e7c196', NULL, '35.00', '2.15', '32.85', 1, '35.00', 1, NULL),
(13, 14, 7, '2023-03-22 23:25:38', '175BA40B-ABC5-4FCF-8DB9-303B3EF55B1E', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=6adee741e05454e060a83093b805df91fc4a3b5ae9728c00fe09b368d616280f82e38e6ab53ef60e', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(14, 15, 7, '2023-03-22 23:42:18', '28180953-7B8C-4F9A-B192-61279434A468', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=3a974389594ce2c8269f1249ceffeb2a5f53a387de6ac58da94e0832be1b4ce70455254e3a21c64d', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(15, 16, 5, '2023-03-22 23:50:44', 'B0CA9D2C-62E4-422C-8B3B-BDE6C0DFA166', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=8ccd0dbd33135d511d08b42aa7cfa27bce6b8fc7e5b83c75e946390fec1560dc998303989a74658a', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(16, 17, 5, '2023-03-22 23:53:56', '1DA1B0B5-0082-4581-930E-24B19953B403', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=5b39c2786441b2443df710d936d117b16c5bdc5ff9302917610eda20f57f4ad1f2b26577e92d0806', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(17, 18, 7, '2023-03-23 00:04:34', '78E9EB34-FA59-4C1B-8289-F1535C6FACCB', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=4d0a6e928a4424393364632fb050d773aed0cc17344fd5b20bdb6b53182d03768c52c3227a66309d', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(18, 19, 5, '2023-03-23 00:15:02', 'D8ADB33C-BC2C-4848-9B08-3CE995486D16', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=d59d84040479247251b218b36a0a63e6ec693b82550d077ceb98256f819ea21e6ea75f13559047da', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(19, 20, 7, '2023-03-23 00:32:33', '6F576CB8-1ECE-412C-8D05-E7C4BEED2E62', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=6f4498321b66c6cfd820abb405113a77282fa56d73584787bc739b95410a9163c6aa3349ab2bf848', NULL, '47.60', '2.78', '44.82', 1, '47.60', 1, NULL),
(20, 21, 5, '2023-03-23 01:25:08', '773F45AF-F297-46B4-BAD0-20B24910F2EB', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=dac1f065dc6d4bf3fa3e2ca7e01b433a667956f3749b5d2d97438aec65f47b06e657ed6453e277db', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(21, 22, 7, '2023-03-23 01:43:22', '2FF8BE39-B879-4EBE-9DBA-CB2B9BA7432C', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=98cf98efb1a638dc2d3040d492949b5ae654e167ec0c629f427798f1f815aafed71daae4eec4785c', NULL, '15.00', '1.15', '13.85', 1, '15.00', 1, NULL),
(22, 23, 7, '2023-03-23 01:50:04', '2436307C-081A-4436-BF42-B71A9FF3FF2B', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=51e2fa9a9f8d37e56c4687f063f0de8b389df878f355fa469c1c46d77fe4b8ee5d68bbcfdc6f85ff', NULL, '35.00', '2.15', '32.85', 1, '35.00', 1, NULL),
(23, 24, 7, '2023-03-23 01:51:43', '62D4971C-F2C5-41EF-81FA-E8D6C1675D49', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=5f53a990f5d29b46a23220616c11884a5933845f885130ab3b19d75ebe01633df8d2edcebacd429e', NULL, '15.00', '1.15', '13.85', 1, '15.00', 1, NULL),
(24, 25, 7, '2023-03-23 01:53:15', '332418C8-CB21-4238-BBDE-AA4F18186BED', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=7981418bed088c5a281b4e3092fd5991b3722f76c30f2b1df47dcd97c35ef60e5ac48e29eb18716f', NULL, '15.00', '1.15', '13.85', 1, '15.00', 1, NULL),
(25, 26, 7, '2023-03-23 01:54:48', '5F0CCA7F-0498-4841-B187-576B13B61C59', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=f0bbe43952929cd201bb8bd1a1fea1a3c3126125f4f43fb219b2db0015890c11320ec2ca4774bf69', NULL, '15.00', '1.15', '13.85', 1, '15.00', 1, NULL),
(26, 27, 5, '2023-03-23 02:00:27', '500BC182-61F5-4E84-9405-87C043C020FA', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=08005582bb7967033c5c9251386e701a264b76a085a168595743e7b86029469301ce2729008ce071', NULL, '35.00', '2.15', '32.85', 1, '35.00', 1, NULL),
(27, 28, 5, '2023-03-23 02:11:39', '633F2A14-569F-46E2-B756-C44B62AD6FBF', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=43cd5cd52b5e40ce1653961ca7072279288ad1b54dff465a3f908b6f27c29ebc5a8f828fb5e8bf1f', NULL, '38.00', '2.30', '35.70', 1, '38.00', 1, NULL),
(28, 29, 5, '2023-03-23 02:14:22', 'B4062328-EC09-4744-A789-5A4F2BF33A53', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=a023e4caa9b9fbb809472ba555b794a80a6e2ff0b676c91f9c25a5ef32ad592c2bef9ee4f2947851', NULL, '41.00', '2.45', '38.55', 1, '41.00', 1, NULL),
(29, 30, 7, '2023-03-23 02:24:01', 'EB81E27E-6B2E-4749-A842-AAE600AF087F', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=26bdb14f09e403b7b851644e23ccb7090bff170f83e96e9a0a3ea33af6d5d18b4be0c39a6c83466b', NULL, '35.00', '2.15', '32.85', 1, '35.00', 1, NULL),
(30, 31, 7, '2023-03-23 02:46:57', '65D5591C-BAA9-46C0-9B04-9DCC1532742A', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=ce692199955b8cff05688ea93de85f246515bd274f4f0d6141a2e0f39b36e965e81bbd8bada014c3', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(31, 32, 5, '2023-03-23 02:52:40', '95F85045-EBFA-4EF6-8BB4-87EB6ECB51D5', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=b1403e0f3b9876399e513bff141b8904251d741759302cd1405b9126172fdc092c527579dc750669', NULL, '67.60', '3.77', '63.83', 1, '67.60', 1, NULL),
(32, 33, 5, '2023-03-23 02:56:39', '5EF6417F-0500-4E7B-AC0E-7D28D75D7B21', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=930f17e8c239b6f4369437ff9b440299f6c7fb23ba9979c59d4e2978a0c4a70ad38fd6104bc84fbd', NULL, '96.60', '5.22', '91.38', 1, '96.60', 1, NULL),
(33, 34, 5, '2023-03-23 02:59:53', '51431FE4-0436-4C79-A294-8EC0AA936071', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=99a2c51101884ae394348778ba80de0e5045d905b96116ca889ac892185f2e9afc0f16bc0f90ee9a', NULL, '64.60', '3.62', '60.98', 1, '64.60', 1, NULL),
(34, 35, 5, '2023-03-23 12:52:51', '78F0C8E9-476D-46AD-BBB3-14934FF9D6B1', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=e38fb6b5b01ea1916f77963bb8e1117ee63f0602f55f1642abd233ecd2e0386742b6393e4300d112', NULL, '64.50', '3.62', '60.88', 1, '64.50', 1, NULL),
(35, 36, 5, '2023-03-23 16:43:22', '544A2897-45FA-4FDC-9D90-49AA7C655B72', 3, '301', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=c07082b02e9f4af064b096b9d76bba6346265fddd18d11bff6e4511bdbb265b78cd7468f51605465', NULL, '64.50', '3.62', '60.88', 1, '64.50', 1, NULL),
(36, 37, 5, '2023-03-24 01:14:32', 'BDE48215-951A-47A0-A6E7-E218E8DBE454', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=b670d932329f30bd0539260611909a08474311041e3fd6172fced851d36ae9c1774d3f7f4d9ae096', NULL, '64.50', '3.62', '60.88', 1, '64.50', 1, NULL),
(37, 38, 5, '2023-03-24 01:16:47', '253C18A2-02AA-4B40-8DF3-086D744299FF', 3, '302', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=125dbbde02c34712b2e9af3bbc2c1c21464b6dd0e5de6f334b0d388ee891226542fbc3e499d52162', NULL, '64.50', '3.62', '60.88', 1, '64.50', 1, NULL),
(38, 39, 5, '2023-03-24 02:03:47', '9CB5D14B-3241-456E-AADF-D44B75C7A717', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=262887e8af1ce4ae5d128558cfc096bb7e0a431361f2b193b9fe133ca4a9c949dfb3c74fde00da6b', NULL, '64.50', '3.62', '60.88', 1, '64.50', 1, NULL),
(39, 40, 5, '2023-03-24 03:19:56', '951368C8-9971-4D2C-8BD7-ABF53D4BCB58', 3, '306', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=eff7022f92adb535042d737a963fb026b6a3547503b9b9d6bc1017f387c4127583b3d541a4a12af4', NULL, '64.50', '3.62', '60.88', 1, '64.50', 1, NULL),
(40, 41, 5, '2023-03-24 04:40:01', 'B21599C9-1CB2-48B6-B23F-820F03FFE889', 3, '301', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=7e1c6aaba289b7418634c52eb9680e5239faa9cd5408cc2900673e3bda0d56eeb24988d759356a26', NULL, '109.90', '5.88', '104.02', 1, '109.90', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `cliente_user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `ip_address`, `cliente_user_id`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', NULL, 'administrator', '$2y$12$qm.0e95a8d4JtpyW//MW.egtDJQx4n92G4wkFI9pkN5LBVvL7okRC', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1679589632, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '131.255.71.253', NULL, 'fanarcizo', '$2y$12$vXsCupq2Sjcj7hFOsmztpuO2A8dQRSevYsOz8/jh2r.KPNN/WVNKS', 'fanarcizonet@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678816466, 1678976210, 1, 'fabricio', 'narcizo', NULL, NULL),
(6, '131.255.71.253', 5, 'Carol', '$2y$10$86vsTyzqsKOkpLGQi6rBmuY84z3Pid2r1rKsLYXd5CO3VR7m8J8nK', 'carol@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1679507900, 1679627803, 1, 'Carolina', 'Sangali', NULL, '(17) 9882-2334'),
(7, '131.255.71.253', 6, 'carol', '$2y$10$tE6ACnGr2S1qhgYxjZ6GPOzwro4QHCIC3Z3YwCimVrgBJT4z6Eyo6', 'macedo@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1679508626, NULL, 1, 'carol', 'macedo', NULL, '(17) 98128-0060'),
(8, '131.255.71.253', 7, 'julio', '$2y$10$qRtmJft1fnSAH6QtMO2CkOfoGvB2oOIitkOiUKKZtWZJnEzHhxgLm', 'julio@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1679516045, 1679527494, 1, 'julio', 'cesar', NULL, '(17) 9882-2335');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(7, 6, 2),
(8, 7, 2),
(9, 8, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`),
  ADD KEY `categoria_pai_id` (`categoria_pai_id`);

--
-- Índices para tabela `categorias_pai`
--
ALTER TABLE `categorias_pai`
  ADD PRIMARY KEY (`categoria_pai_id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Índices para tabela `config_correios`
--
ALTER TABLE `config_correios`
  ADD PRIMARY KEY (`config_id`);

--
-- Índices para tabela `config_pagseguro`
--
ALTER TABLE `config_pagseguro`
  ADD PRIMARY KEY (`config_id`);

--
-- Índices para tabela `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`marca_id`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `pedido_cliente_id` (`pedido_cliente_id`);

--
-- Índices para tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD KEY `pedido_id` (`pedido_id`,`produto_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`),
  ADD KEY `produto_categoria_id` (`produto_categoria_id`),
  ADD KEY `produto_marca_id` (`produto_marca_id`);

--
-- Índices para tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD PRIMARY KEY (`foto_id`),
  ADD KEY `fk_foto_produto_id` (`foto_produto_id`);

--
-- Índices para tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`transacao_id`),
  ADD KEY `transacao_pedido_id` (`transacao_pedido_id`,`transacao_cliente_id`),
  ADD KEY `fk_transacao_cliente_id` (`transacao_cliente_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD KEY `cliente_user_id` (`cliente_user_id`);

--
-- Índices para tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `categorias_pai`
--
ALTER TABLE `categorias_pai`
  MODIFY `categoria_pai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `config_pagseguro`
--
ALTER TABLE `config_pagseguro`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `marca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `transacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categoria_pai_id` FOREIGN KEY (`categoria_pai_id`) REFERENCES `categorias_pai` (`categoria_pai_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_cliente_id` FOREIGN KEY (`pedido_cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD CONSTRAINT `fk_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD CONSTRAINT `fk_foto_produto_id` FOREIGN KEY (`foto_produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `fk_transacao_cliente_id` FOREIGN KEY (`transacao_cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_transacao_pedido_id` FOREIGN KEY (`transacao_pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`cliente_user_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
