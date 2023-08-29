<?php
#importa a classe
require_once "core/database.php";
require_once "parsers/cursos.parser.php";

$db = new Database();
$conexao = $db->connect();
$sql = "select curso.id id, curso.nome nome, semestres, id_coordenador, coordenador.nome coordenador_nome from curso inner join professor coordenador ON coordenador.id = id_coordenador";

$stmt = $conexao->query($sql);
$cursos = $stmt->fetchAll(PDO::FETCH_ASSOC);

header("Content-Type: application/xml; charset=utf-8");
echo CursosParser($cursos);

