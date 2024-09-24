<?php
include('app/init.php');
$Template->setData('page_class', '');


if ( isset($_POST['btn-checkout']) ){
    
    if(!empty($_POST['name']) && !empty($_POST['phone'])
    && !empty($_POST['address']) && !empty($_SESSION['cart'])){

        $fullName = $_POST['name'];
        $phoneNumber = $_POST['phone'];
        $address = $_POST['address'];
        
        $products = $Cart->get();

        if(!empty($products)){
            $checkOut = $Checkout->insertData($fullName, $phoneNumber, $address, $products);
        }

        if($checkOut == true){
            $Cart->empty_cart();
            $Template->redirect(SITE_PATH . 'success.php');
        }else{
           $Template->redirect(SITE_PATH); 
        }

    }else{
       $Template->redirect(SITE_PATH . 'cart.php'); 
    }
    
}else{
    $Template->redirect(SITE_PATH);
}

?>