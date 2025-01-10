<?
// CRUD 

// Include the database connection file

include("Database.php");

class ORM{
    private $db;
    private $table;
    private $values;



    public function __construct($table){
        $this->db = new Database();
        $this->table = $table;
    }

    public function create($values){
        $this->values = $values;
        $columns = implode(", ", array_keys($values));
        $placeholders = implode(", ", array_fill(0, count($values), "?"));
        $sql = "INSERT INTO $this->table ($columns) VALUES ($placeholders)";
        $this->db->query($sql, array_values($values));
    }

    public function read($columns = "*", $where = "1"){
        $sql = "SELECT $columns FROM $this->table WHERE $where";
        return $this->db->query($sql);
    }

    public function update($values, $where){
        $this->values = $values;
        $set = "";
        foreach($values as $key => $value){
            $set .= "$key = ?, ";
        }
        $set = rtrim($set, ", ");
        $sql = "UPDATE $this->table SET $set WHERE $where";
        $this->db->query($sql, array_values($values));
    }

    public function delete($where){
        $sql = "DELETE FROM $this->table WHERE $where";
        $this->db->query($sql);
    }
}
