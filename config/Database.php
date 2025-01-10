<?
// database connection

class Database{
    private $host = "localhost";
    private $db = "crud";
    private $user = "";
    private $pass = "";

    private $pdo;

    public function __construct(){
        $dsn = "mysql:host=$this->host;dbname=$this->db";
        $this->pdo = new PDO($dsn, $this->user, $this->pass);
    }

    public function query($sql, $params = []){
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt;
    }
}