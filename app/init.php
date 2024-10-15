<?php

$servername = 'localhost';
$username= 'root';
$password = 'root';
$dataname = 'ttan_store';
$port = 8889;

$Database = mysqli_connect($servername, $username, $password, $dataname, $port);


mysqli_report(MYSQLI_REPORT_ERROR);
ini_set('display_errors', 1);

define('SITE_NAME', 'TTAN STORE');
define('SITE_PATH', 'http://localhost:8080/');
define('IMAGE_PATH', 'resources/img/');

include('app/models/m_product.php');
include('app/models/m_categories.php');
include('app/models/m_template.php');
include('app/models/m_cart.php');
include('app/models/m_checkout.php');
include('app/models/m_user.php');


$Template = new Template();
$Categories = new Categories($Database);
$Products = new Products($Database);
$Cart = new Cart();
$Checkout = new Checkout($Database);
$User = new User($Database);

// Thiết lập thời gian sống của session (5 phút)
// $timeout = 5 * 60; // 5 phút tính bằng giây

// Thiết lập thời gian sống của cookie session
// session_set_cookie_params($timeout);

session_start();

// Kiểm tra thời gian hoạt động cuối cùng của session
// if ( isset($_SESSION['user']) && 
//      isset($_SESSION['LAST_ACTIVITY']) &&
//      (time() - $_SESSION['LAST_ACTIVITY'] > $timeout) ){

//     // Nếu thời gian hoạt động cuối cùng vượt quá thời gian timeout, hủy session
//     session_unset();
//     session_destroy();
//     session_start();
//     $Template->redirect(SITE_PATH . 'loginAndRegister.php');
// }

// Cập nhật thời gian hoạt động cuối cùng của session
// if (isset($_SESSION['user'])) {
//     $_SESSION['LAST_ACTIVITY'] = time();
// }

// global
$Template->setData('cart_total_items', $Cart->getTotalItems());
$Template->setData('cart_total_cost', $Cart->getTotalCost());


?>