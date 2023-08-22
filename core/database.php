<?php


class Database
{
    private $host = 'localhost';
    private $db = 'ifc__webservices-js';
    private $user = 'root';
    private $pass = '';

    public function connect()
    {
        try {
            $dsn = "mysql:host=" . $this->host . ";dbname=" . $this->db;
            // make a database connection
            $pdo = new PDO($dsn, $this->user, $this->pass, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
        } catch (PDOException $e) {
            die($e->getMessage());
        } finally {
            if (!$pdo) {
                $pdo = null;
            }
        }
        return $pdo;
    }
}
