<?php
   if (session_status() == PHP_SESSION_NONE) {
      session_start();
   }
?>

<!DOCTYPE html>
   <html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <!--=============== FAVICON ===============-->
      <link rel="shortcut icon" href="resources/img/favicon_TTAN.png" type="image/x-icon">

      <!--=============== REMIXICONS ===============-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css">

      <!--=============== SWIPER CSS ===============-->
      <link rel="stylesheet" href="resources/css/swiper-bundle.min.css">

      <!--=============== CSS ===============-->
      <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
      <link rel="stylesheet" type="text/css" href="resources/css/screen.css">
      <link rel="stylesheet" type="text/css" href="resources/css/screen4login.css">
      <link rel="stylesheet" type="text/css" href="resources/css/cssDetailProduct.css">
      <link rel="stylesheet" type="text/css" href="resources/css/cssCheckout.css">

      <!--=============== GOOGLE FONTS ===============-->
      <!-- <meta http-equiv="Content-Security-Policy" content="style-src 'self' 'unsafe-inline' https://*.paypal.com:* https://*.paypalobjects.com https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com;"> -->
      
      <title><?php $this->getData('page_title');?></title>
   </head>
   <body class="">
      <!--==================== HEADER ====================-->
      <header class="header" id="header">
         <nav class="nav container">
            <div class="nav__data">
               <a href="<?php echo SITE_PATH . "index.php"?>" class="nav__logo">TTAN.STORE</a>
            </div>
            
            <!--==================== NAV MENU ====================-->
            <div class="nav__menu" id="nav-menu">
                  <ul class="nav__list">

                     <li class="">
                        <a href="<?php echo SITE_PATH . "index.php"?>" class="nav__link">Home</a>
                     </li>

                     <!--==================== Products Dropdown ====================-->
                     <li class="dropdown__item">
                        <div href="#" class="nav__link">
                           Products<i class="ri-arrow-drop-down-line dropdown__arrow"></i>
                        </div>

                        <ul class="dropdown__menu">

                           <li class="dropdown__subitem">
                              
                              <div class="dropdown__link">
                                 <i class="ri-computer-line"></i> PC <i class="ri-add-box-line dropdown__add" ></i>
                              </div>
                              

                              <ul class="dropdown__submenu">
                                 <li>
                                    <a href="<?php echo SITE_PATH . "index.php?id_category_sub=1"?>" class="dropdown__sublink">
                                       <i class="ri-gamepad-line"></i> PC Gaming
                                    </a>
                                 </li>

                                 <li>
                                    <a href="<?php echo SITE_PATH . "index.php?id_category_sub=2"?>" class="dropdown__sublink">
                                       <i class="ri-home-office-fill"></i> PC Offcie
                                    </a>
                                 </li>
                              </ul>
                           </li>
                           
                           <li class="dropdown__subitem">
                              <div class="dropdown__link">
                                 <i class="ri-macbook-line"></i> Laptop <i class="ri-add-box-line dropdown__add"></i>
                              </div>

                              <ul class="dropdown__submenu">
                                 <li>
                                    <a href="<?php echo SITE_PATH . "index.php?id_category_sub=3"?>" class="dropdown__sublink">
                                       <i class="ri-gamepad-fill"></i> Laptop Gaming
                                    </a>
                                 </li>

                                 <li>
                                    <a href="<?php echo SITE_PATH . "index.php?id_category_sub=4"?>" class="dropdown__sublink">
                                       <i class="ri-home-office-line"></i> Laptop Offcie
                                    </a>
                                 </li>
                              </ul>
                           </li>

                           <!-- <li class="dropdown__subitem">
                              <div class="dropdown__link">
                                 <i class="ri-mac-line"></i> Monitor Display <i class="ri-add-box-line dropdown__add"></i>
                              </div>

                              <ul class="dropdown__submenu">
                                 <li>
                                    <a href="#" class="dropdown__sublink">
                                       <i class="ri-computer-fill"></i> Monitor Gaming
                                    </a>
                                 </li>

                                 <li>
                                    <a href="#" class="dropdown__sublink">
                                       <i class="ri-tv-2-fill"></i> Monitor Offcie
                                    </a>
                                 </li>
                              </ul>
                           </li> -->

                           <li class="dropdown__subitem">
                              <div class="dropdown__link">
                                 <i class="ri-dashboard-2-line"></i> Device Network
                                 <i class="ri-add-box-line dropdown__add"></i>
                              </div>

                              <ul class="dropdown__submenu">
                                 <li>
                                    <a href="<?php echo SITE_PATH . "index.php?id_category_sub=5"?>" class="dropdown__sublink">
                                       <i class="ri-rfid-line"></i> Device Network Gaming
                                    </a>
                                 </li>

                                 <li>
                                    <a href="<?php echo SITE_PATH . "index.php?id_category_sub=6"?>" class="dropdown__sublink">
                                       <i class="ri-home-wifi-line"></i> Device Network Popular
                                    </a>
                                 </li>
                              </ul>
                           </li>
                        </ul>
                     </li>

                     <li class="">
                        <a href="#" class="nav__link">Contact</a>
                     </li>
                     
                     <?php if (isset($_SESSION['user'])): ?>
                     <!--==================== User Dropdown ====================-->
                     <li class="dropdown__item">
                         <div href="#" class="nav__link">
                             User<i class="ri-arrow-drop-down-line dropdown__arrow"></i>
                         </div>
                        
                         <ul class="dropdown__menu">
                             <li>
                                 <a href="#" class="dropdown__link">
                                     <i class="ri-user-3-line"></i> Profile
                                 </a>
                             </li>
                             <li>
                                 <a href="<?php echo SITE_PATH . "cart.php"; ?>" class="dropdown__link">
                                     <i class="ri-shopping-basket-2-fill"></i> Shopping cart
                                 </a>
                             </li>
                             <li>
                                 <form id="logout-form" action="user.php" method="post" style="display: none;">
                                     <input type="hidden" name="action" value="logout">
                                 </form>
                                 <a href="#" class="dropdown__link" onclick="document.getElementById('logout-form').submit();">
                                     <i class="ri-logout-box-r-line"></i> Logout
                                 </a>
                             </li>
                         </ul>
                     </li>
                    <?php else: ?>
                     <!--==================== User Dropdown ====================-->
                     <li class="dropdown__item">
                        <div href="#" class="nav__link">
                           User<i class="ri-arrow-drop-down-line dropdown__arrow"></i>
                        </div>

                        <ul class="dropdown__menu">
                           <li>
                              <a href="<?php echo SITE_PATH . "cart.php"; ?>" class="dropdown__link">
                                 <i class="ri-shopping-basket-2-fill"></i> Shopping cart
                              </a>
                           </li>
                           <li>
                              <a href="loginAndRegister.php" class="dropdown__link">
                                 <i class="ri-user-shared-fill"></i> Login
                              </a>
                           </li>
                        </ul>
                     </li> 
                  </ul>
                  <?php endif; ?>

                  <!--Close button-->
                  <div class="nav__close" id="nav-close">
                     <i class="ri-close-fill"></i>
                  </div>
            </div>

            <div href="#" class="nav__action">
               <!--theme button
               <i class="ri-sun-line change-theme" id="theme-button"></i>-->
               <i class="ri-moon-line change-theme" id="theme-button"></i>

               <!--search button-->
               <i class="ri-menu-search-line nav__search" id="search-btn"></i>

               <!--Toggle button-->
               <div class="nav__toggle" id="nav-toggle">
                  <i class="ri-menu-2-line"></i>
               </div>
            </div>

         </nav>

      </header>

      <!--==================== seach ====================-->
      <div id="search" class="search">
         <form action="search.php" method="GET" class="search__form">
            <i class="ri-search-line search__icon"></i>
            <input type="search" id="search-input" name="query" placeholder="What're you looking for?" class="search__input">
         </form>

         <i class="ri-close-line search__close" id="search-close"></i>
      </div>