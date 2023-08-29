<?php


class Database
{
    private $host = 'www.db4free.net';
    private $db = 'ifc__webservices';
    private $user = 'ifc__webservices';
    private $pass = 'ifc__webservices';

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
