<?php
#importa a classe
require_once "Database.php";
require_once "parsers/cursos.parser.php";

#instancia um obj de Database
$db = new Database();
#recebe a conexao
$conexao = $db->connect();

#string de consulta
$sql = "select id, nome, semestre, id_coordenador, coordenador.name coordenador_name from curso inner join professor ON professor.id = id_coordenador";
#executa a consulta
$stmt = $conexao->query($sql);
#transforma o resultado da consulta em um array de objs
$cursos = $stmt->fetchAll(PDO::FETCH_ASSOC);
CursosParser($cursos);
