/*
MySQL Backup
Source Server Version: 3.21.0
Source Database: review_produtos
Date: 12/1/2013 15:06:08
*/


-- ----------------------------
--  Table structure for `comentario`
-- ----------------------------
DROP TABLE IF EXISTS `comentario`;
CREATE TABLE `comentario` (
  `coment_id` smallint(6) NOT NULL DEFAULT '0',
  `usu_id` smallint(6) DEFAULT NULL,
  `img_id` smallint(6) DEFAULT NULL,
  `quant_estrela` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`coment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `grupo`
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `grupo_id` smallint(5) DEFAULT NULL,
  `grupo_perfil` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `imagem`
-- ----------------------------
DROP TABLE IF EXISTS `imagem`;
CREATE TABLE `imagem` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_titulo` varchar(30) DEFAULT NULL,
  `img_caminho` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `produto`
-- ----------------------------
DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `prod_cod` int(11) NOT NULL,
  `prod_nome` varchar(30) DEFAULT NULL,
  `prod_desc` varchar(30) DEFAULT NULL,
  `prod_preco` float DEFAULT NULL,
  `prod_img` varchar(255) DEFAULT NULL,
  `usu_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`prod_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `usu_id` smallint(6) NOT NULL DEFAULT '0',
  `grupo_id` smallint(6) DEFAULT NULL,
  `login` smallint(8) DEFAULT NULL,
  `senha` varchar(8) DEFAULT NULL,
  `usu_nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `produto` VALUES ('45','uhuh','dfd','16','uhuh',NULL),  ('48','arroz','muito bom','100',NULL,NULL);
