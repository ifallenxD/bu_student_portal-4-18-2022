<?php
class Database
{
    // specify database credentials
    private $host = '10.20.30.234';
    private $dbname = 'database';
    private $user = 'testuser';
    private $password = '123456';
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