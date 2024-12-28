<?php

class User{
    private $Database;
    private $db_table = 'user';


    function __construct($Database)
    {
        $this->Database = $Database;
    }

    /**
     * Register a new user
     * 
     * @access public
     * @param string, string, string, string
     * @return bool
     */
    public function register($email, $first_name, $last_name, $password) {
        $hashed_password = password_hash($password, PASSWORD_BCRYPT);

        $stmt = $this->Database->prepare("INSERT INTO " . $this->db_table . " 
                                        (email, first_name, last_name, password)
                                        VALUES (?, ?, ?, ?)");

        $stmt->bind_param("ssss", $email, $first_name, $last_name, $hashed_password);

        if ($stmt->execute()) {
            $stmt->close();
            return true;
        } else {
            $stmt->close();
            return false;
        }
    }


    /**
     * Login user
     * 
     * @access public
     * @param string, string
     * @return bool
     */
    public function login($email, $password) {
        $query = "SELECT id_user, password FROM " . $this->db_table . " WHERE email = ?";
        $stmt = $this->Database->prepare($query);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            if (password_verify($password, $row['password'])) {
                session_start();
                $_SESSION['user'] = $row['id_user'];
                $stmt->close();
                return true;
            }
        }
        
        $stmt->close();
        return false;
    }


    /**
     * Logout user
     * 
     * @access public
     * @param null
     * @return null
     */
    public function logout() {
        session_start();
        session_unset();
        session_destroy();
    }
}