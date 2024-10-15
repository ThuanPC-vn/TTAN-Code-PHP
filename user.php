<?php
include('app/init.php');

$Template->setData('page_class', '');

if ( isset($_POST['btn-login']) ){

    if(!empty($_POST['email']) && !empty($_POST['password'])){

        $email = $_POST['email'];
        $pass = $_POST['password'];

        $login = $User->login($email, $pass);

        if ( $login === true ) {
            // Thiết lập thời gian hoạt động cuối cùng
            $_SESSION['LAST_ACTIVITY'] = time(); 
            $Template->redirect(SITE_PATH . 'index.php');
        } else {
            $Template->redirect(SITE_PATH . 'loginAndRegister.php');
        }

    }else{
        $Template->redirect(SITE_PATH . 'loginAndRegister.php');
    }

}else if( isset($_POST['btn-register']) ){

    if (    !empty($_POST['email']) && !empty($_POST['firtName']) && !empty($_POST['lastName'])
            && !empty($_POST['password']) && !empty($_POST['repeatPassword'])   ) {

        $email = $_POST['email'];
        $first_name = $_POST['firtName'];
        $last_name = $_POST['lastName'];
        $password = $_POST['password'];
        $repeatPassword = $_POST['repeatPassword'];

        if ( $password === $repeatPassword ) {

            $register = $User->register($email, $first_name, $last_name, $password);

            if ( $register === true ) {
                $Template->redirect(SITE_PATH . 'index.php');
            } else {
                $Template->setData('error', 'Registration failed. Please try again.');
                $Template->redirect(SITE_PATH . 'loginAndRegister.php');
            }
        } else {
            $Template->setData('error', 'Passwords do not match.');
            $Template->redirect(SITE_PATH . 'loginAndRegister.php');
        }

    } else {
        $Template->setData('error', 'Please fill in all fields.');
        $Template->redirect(SITE_PATH . 'loginAndRegister.php');
    }

} else if (isset($_POST['action']) && $_POST['action'] == 'logout') {

    $User->logout();
    $Template->redirect(SITE_PATH . 'index.php');

} else {
    $Template->redirect(SITE_PATH . 'loginAndRegister.php');
}

?>