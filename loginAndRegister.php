<?php
include('app/init.php');

$Template->setData('page_class', 'Login & Register');

$Template->load('./app/views/v_public_loginAndRegister.php', "Login & Register");

?>