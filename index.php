<?php

include('app/init.php');
$Template->setData('page_class', 'home');
if (isset($_GET['id']) && is_numeric($_GET['id'])) {

  if ($_GET['id'] == 1) {
        // get all products from all categories

        // get category nav
        $category_nav = $Categories->getCategoryNav('all');
        $Template->setData('page_nav', $category_nav);

        // get products
        $products = $Products->create_product();
        $Template->setData('products', $products);

        $Template->load('app/views/v_public_home.php', 'TTAN STORE');
    } else {
        // get products from specific category
        $category = $Categories->getCategories($_GET['id']);

        // check if valid
        if (!empty($category)) {
            // get category nav
            $category_nav = $Categories->getCategoryNav($category['name']);
            $Template->setData('page_nav', $category_nav);

            // get all products from that category
            $cat_products = $Products->create_product($_GET['id']);

            if (!empty($cat_products)) {
                $Template->setData('products', $cat_products);
            } else {
                $Template->setData('products', '<li>No products exist in this category</li>');
            }
            $Template->load('app/views/v_public_home.php', $category['name']);
        }
  }
} else if( isset($_GET['id_category_sub']) && is_numeric($_GET['id_category_sub']) ){

  // get category nav
  $category_nav = $Categories->getCategoryNav('all');
  $Template->setData('page_nav', $category_nav);

  // get all products from that category
  $sub_cat_products = $Products->create_product($_GET['id_category_sub']);

  if (!empty($sub_cat_products)) {
      $Template->setData('products', $sub_cat_products);
  } else {
      $Template->setData('products', '<li>No products exist in this sub-category</li>');
  }
  $Template->load('app/views/v_public_home.php', 'Sub Category Products');

} else{
  // get all products from all categories

  //get category nav
  $category_nav = $Categories->getCategoryNav('all');
  $Template->setData('page_nav', $category_nav);

  //get products
  $products = $Products->create_product();
  $Template->setData('products', $products);

  $Template->load('app/views/v_public_home.php', 'TTAN STORE');
}

?>