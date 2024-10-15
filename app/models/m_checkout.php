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
    public function insertData($full_name, $phone_number, $address, $products) {

        $productsQuantity = "";
        $productsPrice = "";
    
        
        foreach ($products as $product) {
            $quantity = $_SESSION['cart'][$product['id']];
            $totalPrice = $product['price'] * $quantity;
    
            $productsQuantity .= $quantity . ", ";
            $productsPrice .= $totalPrice . ", ";
        }
        
        
        if (is_array($products)) {
            $productsName = implode(', ', array_column($products, 'mainName'));
        }
    
        $query = "INSERT INTO " . $this->db_table . " 
        (full_name, phone_number, address, name_product, quantity_product, price_product) 
        VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $this->Database->prepare($query);
        $stmt->bind_param("ssssss", $full_name, $phone_number, $address, $productsName, $productsQuantity, $productsPrice);
    
        if ($stmt->execute()) {
            $stmt->close();
            return true;
        } else {
            $stmt->close();
            return false;
        }
    }
    
}
?>