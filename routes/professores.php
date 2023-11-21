<?php
#importa a classe
require_once "../core/database.php";
require_once "../parsers/professores.parser.php";


$db = new Database();
$conexao = $db->connect();
$sql = "SELECT id, nome, email FROM professor";

$stmt = $conexao->query($sql);
$professores = $stmt->fetchAll(PDO::FETCH_ASSOC);

header("Content-Type: application/xml; charset=utf-8");
echo ProfessoresParser($professores);
