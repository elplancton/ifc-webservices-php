-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.27 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para ifc__webservices-js
CREATE DATABASE IF NOT EXISTS `ifc__webservices-js` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_cs */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ifc__webservices-js`;

-- Copiando estrutura para tabela ifc__webservices-js.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `semestres` int NOT NULL,
  `id_coordenador` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_coordenador` (`id_coordenador`),
  CONSTRAINT `fk_coordenador` FOREIGN KEY (`id_coordenador`) REFERENCES `professor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela ifc__webservices-js.curso: ~14 rows (aproximadamente)
INSERT INTO `curso` (`id`, `nome`, `semestres`, `id_coordenador`) VALUES
	(1, 'Tecnologia em Sistemas para Internet - TSI', 6, 5),
	(2, 'Bacharelado em Sistemas de Informação', 8, 3),
	(3, 'Técnico em Informática Integrado', 6, 2),
	(4, 'Bacharelado em Agronomia', 8, 6),
	(5, 'PROEJA', 6, 5),
	(7, 'teste2', 4, 6),
	(8, 'inserido', 6, 5),
	(9, 'inserido', 6, 5),
	(10, 'teste', 2, 5),
	(11, '12', 2, 3),
	(12, '45', 2, 3),
	(13, 'asda', 3, 4),
	(14, 'Curso do Rafael', 5, 3),
	(15, 'sdfsdfdsfdsf', 6, 2);

-- Copiando estrutura para tabela ifc__webservices-js.disciplina
CREATE TABLE IF NOT EXISTS `disciplina` (
  `id` int NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `carga` int NOT NULL,
  `ementa` text NOT NULL,
  `semestre` int NOT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_disc_curso` (`id_curso`),
  CONSTRAINT `fk_disc_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela ifc__webservices-js.disciplina: ~11 rows (aproximadamente)
INSERT INTO `disciplina` (`id`, `codigo`, `nome`, `carga`, `ementa`, `semestre`, `id_curso`) VALUES
	(2, 'STB0302', 'Inglês Instrumental', 60, 'Conscientização do processo de leitura. Estratégias de leitura. Gramática aplicada da língua inglesa. Reconhecimento de gêneros textuais e aquisição de vocabulário. Análise textual de um gênero. Leitura intensiva de diversos gêneros textuais da área de Informática. Redação acadêmica.', 1, 1),
	(3, 'STB0303', 'Introdução à Computação', 30, 'Evolução da computação (tecnologias e usos). Modelos funcionais dos computadores. Sistemas de códigos e codecs. Sistemas operacionais. Linguagens de programação. Sistemas de rede e Internet. Open Source/Free Software. O estado da arte. TI x Sustentabilidade.', 1, 1),
	(4, 'STB0304', 'Introdução à Programação Web', 60, 'Infraestrutura do Ambiente Web; Páginas Estáticas e Páginas Dinâmicas; Introdução a Linguagem de Marcação HTML e suas evoluções; Folhas de Estilos (CSS); Introdução a Programação Client-Side (JavaScript); Princípios para Web Design Responsivo.', 1, 1),
	(5, 'STB0305', 'Algoritmos e Técnicas de Programação', 90, 'Introdução à lógica de programação. Conceitos básicos sobre algoritmos. Algoritmos Estruturados: conceitos, estruturas de controle (seqüência, seleção e repetição)entrada e saída, atribuição; Operadores Básicos (Aritméticos, Relacionais e Lógicos); Resolução de problemas usando algoritmos; Verificação e correção de algoritmos através de testes de mesa; Implementações de algoritmos em uma linguagem de programação.Procedimentos e Funções.', 1, 1),
	(6, 'STB0306', 'Estrutura de Dados', 60, 'Conjuntos Numéricos: Conjunto dos números Naturais; Conjunto dos números Inteiros; Conjunto dos números Racionais: Frações e operações com frações.', 2, 1),
	(7, 'STB0307', 'Banco de Dados I', 60, 'Conscientização do processo de leitura. Estratégias de leitura. Gramática aplicada da língua inglesa. Reconhecimento de gêneros textuais e aquisição de vocabulário. Análise textual de um gênero. Leitura intensiva de diversos gêneros textuais da área de Informática. Redação acadêmica.', 2, 1),
	(8, 'STB0308', 'Sistemas Operacionais', 60, 'Evolução da computação (tecnologias e usos). Modelos funcionais dos computadores. Sistemas de códigos e codecs. Sistemas operacionais. Linguagens de programação. Sistemas de rede e Internet. Open Source/Free Software. O estado da arte. TI x Sustentabilidade.', 2, 1),
	(9, 'STB0309', 'Engenharia de Software I', 60, 'Infraestrutura do Ambiente Web; Páginas Estáticas e Páginas Dinâmicas; Introdução a Linguagem de Marcação HTML e suas evoluções; Folhas de Estilos (CSS); Introdução a Programação Client-Side (JavaScript); Princípios para Web Design Responsivo.', 2, 1),
	(10, 'STB0305', 'Programação Web', 60, 'Introdução à lógica de programação. Conceitos básicos sobre algoritmos. Algoritmos Estruturados: conceitos, estruturas de controle (seqüência, seleção e repetição)entrada e saída, atribuição; Operadores Básicos (Aritméticos, Relacionais e Lógicos); Resolução de problemas usando algoritmos; Verificação e correção de algoritmos através de testes de mesa; Implementações de algoritmos em uma linguagem de programação.Procedimentos e Funções.', 2, 1),
	(11, 'SIB0312', 'Desenvolvimento Web I', 60, 'Introdução à lógica de programação. Conceitos básicos sobre algoritmos. Algoritmos Estruturados: conceitos, estruturas de controle (seqüência, seleção e repetição)entrada e saída, atribuição; Operadores Básicos (Aritméticos, Relacionais e Lógicos); Resolução de problemas usando algoritmos; Verificação e correção de algoritmos através de testes de mesa; Implementações de algoritmos em uma linguagem de programação.Procedimentos e Funções.', 5, 2),
	(12, 'SIB0313', 'Desenvolvimento Web II', 60, 'Introdução à lógica de programação. Conceitos básicos sobre algoritmos. Algoritmos Estruturados: conceitos, estruturas de controle (seqüência, seleção e repetição)entrada e saída, atribuição; Operadores Básicos (Aritméticos, Relacionais e Lógicos); Resolução de problemas usando algoritmos; Verificação e correção de algoritmos através de testes de mesa; Implementações de algoritmos em uma linguagem de programação.Procedimentos e Funções.', 6, 2);

-- Copiando estrutura para tabela ifc__webservices-js.estudante
CREATE TABLE IF NOT EXISTS `estudante` (
  `id` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estudante_curso` (`id_curso`),
  CONSTRAINT `fk_estudante_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela ifc__webservices-js.estudante: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela ifc__webservices-js.matricula_estudante
CREATE TABLE IF NOT EXISTS `matricula_estudante` (
  `id_estudante` int NOT NULL,
  `id_disciplina` int NOT NULL,
  `ano` int NOT NULL,
  `semestre` int NOT NULL,
  PRIMARY KEY (`id_estudante`,`id_disciplina`),
  KEY `fk_matr_disciplina` (`id_disciplina`),
  CONSTRAINT `fk_matr_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`),
  CONSTRAINT `fk_matr_estudante` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela ifc__webservices-js.matricula_estudante: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela ifc__webservices-js.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela ifc__webservices-js.professor: ~7 rows (aproximadamente)
INSERT INTO `professor` (`id`, `nome`, `email`) VALUES
	(1, 'André Moraes', 'a****s@ifc.edu.br'),
	(2, 'Ângelo Frozza', 'a****a@ifc.edu.br'),
	(3, 'Daniel Anderle', 'd****e@ifc.edu.br'),
	(4, 'Daniel Varela', 'd****a@ifc.edu.br'),
	(5, 'Rafael Speroni', 'r****i@ifc.edu.br'),
	(6, 'Lidiane Visintin', 'l****n@ifc.edu.br'),
	(7, 'Joao', 'joao@gmail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
