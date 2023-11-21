<?php
#importa a classe
require_once "../core/database.php";
require_once "../parsers/disciplinas.parser.php";

$cursoId = 1;
$db = new Database();
$conexao = $db->connect();
$sql = "SELECT disciplina.id id, codigo, disciplina.nome nome, carga, ementa, semestre, curso.nome curso_nome FROM disciplina INNER JOIN curso ON curso.id = disciplina.id_curso where disciplina.id_curso = $cursoId";

$stmt = $conexao->query($sql);
$disciplinas = $stmt->fetchAll(PDO::FETCH_ASSOC);

header("Content-Type: application/xml; charset=utf-8");
echo DisciplinasParser($disciplinas);
