<?php

class Checkout{
    private $Database;
    private $db_table = 'checkout';


    function __construct($Database)
    {
        $this->Database = $Database;
    }


    /**
    * Insert user data and products name into the table 'checkout'
    * 
    * @access public
    * @param string, string, string, array
    * @return bool
    */
    public function insertData($full_name, $phone_number, $address, $products){


        if (is_array($products)) {
            $productsName = implode(', ', array_column($products, 'mainName'));
        }

        $query = "INSERT INTO " . $this->db_table . " 
        (full_name, phone_number, address, name_product) 
        VALUES (?, ?, ?, ?)";
        $stmt = $this->Database->prepare($query);
        $stmt->bind_param("ssss", $full_name, $phone_number, $address, $productsName);

        if($stmt->execute()){
            return true;
        } else {
            return false;
        }
    }
}
?>