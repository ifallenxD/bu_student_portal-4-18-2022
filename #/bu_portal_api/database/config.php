<?php
class Database
{
    // specify database credentials
    private $host = 'localhost';
    private $dbname = 'schooldb';
    private $user = 'postgres';
    private $password = 'pass';
    public $conn;

    // get database connection
    public function getConnection()
    {
        $this->conn = null;
        $dsn = 'pgsql:host=' . $this->host . ";port=5432;dbname=" . $this->dbname;

        try {
            $this->conn = new PDO($dsn, $this->user, $this->password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
        } catch (PDOException $exception) {
            echo 'Connection error: ' . $exception->getMessage();
        }

        return $this->conn;
    }
}