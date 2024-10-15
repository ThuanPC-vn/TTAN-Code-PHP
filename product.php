<?php
include('app/init.php');
$Template->setData('page_class', 'product');

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
  //show product

  $product = $Products->getProductData($_GET['id']);
  $productImgSub = $Products->getImgSub($_GET['id']);

  if (!empty($product) && !empty($productImgSub)) {
    // pass product data to view
    $Template->setData('prod_id', $_GET['id']);
    $Template->setData('prod_mainName', $product['mainName']);
    $Template->setData('prod_subName', $product['subName']);
    $Template->setData('prod_description', $product['description']);
    
    // Convert price to integer
    $price = intval($product['price']);
    // Format price with commas if greater than 1000
    $formatted_price = $price >= 1000 ? number_format($price) : $price;

    $Template->setData('prod_price', $formatted_price);
    $Template->setData('prod_image', IMAGE_PATH . $product['img']);

    $Template->setData('prod_imgSub', $productImgSub);

    // create category nav
    $category_nav = $Categories->getCategoryNav($product['category_name']);
    $Template->setData('page_nav', $category_nav);

    //display view
    $Template->load('./app/views/v_public_product.php', "Detail Product");
  } else {
    //error message
    $Template->redirect(SITE_PATH);
  }
} else {
  //error message
  $Template->redirect(SITE_PATH);
}
