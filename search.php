<?php

include('app/init.php');

$query = isset($_GET['query']) ? $_GET['query'] : '';

$Template->setData('page_class', 'search');
$Template->setData('page_title', 'Search Results');

if ( isset($_GET['query']) && !empty($_GET['query']) ) {

    // get category nav
    $category_nav = $Categories->getCategoryNav('all');
    $Template->setData('page_nav', $category_nav);

    $products = $Products->create_product($query);
    $Template->setData('products', $products);
    
} else {
    $Template->setData('products', '<li>No search query provided</li>');
}

$Template->load('app/views/v_public_search.php', 'Search Results');

?>
