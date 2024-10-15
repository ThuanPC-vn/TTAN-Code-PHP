<?php
include("includes/public_header.php")
?>

      
      <!--==================== MAIN ====================-->
      <main class="main">

         <div class="loginForm">
         <!--==================== LOGIN FORM ====================-->
         <div class="wrapper">

            <span class="bg-animate"></span>
            <span class="bg-animate2"></span>

            <div class="form-box login" id="login__id">
               <h2 class="animation" style="--i:0; --j:21;">Login</h2>
               <form action="user.php" method="post">
                  <div class="input-box animation" style="--i:1; --j:22;">
                     <input type="text" name="email" required>
                     <label>Email</label>
                     <i class='bx bxs-user-account'></i>
                  </div>
                  <div class="input-box animation" style="--i:2; --j:23;">
                     <input type="password" name="password" required>
                     <label>Password</label>
                     <i class='bx bxs-lock'></i>
                  </div>
                  <button type="submit" name="btn-login" class="btn animation" style="--i:3; --j:24;">Login</button>
                  <div class="logreg-link animation" style="--i:4; --j:25;">
                     <p>
                        Don't have an account? 
                        <a href="#" class="register-link"> Signup </a>
                     </p>
                  </div>
               </form>
            </div>

            <div class="form-box register" id="register__id">
               <h2 class="animation" style="--i:17;">Sign Up</h2>
               
               <form action="user.php" method="post">

                  <div class="input-box animation" style="--i:18;">
                     <input type="text" name="email" required>
                     <label>Email</label>
                     <i class='bx bxl-gmail'></i>
                  </div>

                  <div class="input-box animation" style="--i:19;">
                     <input type="text" name="firtName" required>
                     <label>Firt Name</label>
                     <i class='bx bxs-user-badge'></i>
                  </div>

                  <div class="input-box animation" style="--i:20;">
                     <input type="text" name="lastName" required>
                     <label>Last Name</label>
                     <i class='bx bxs-user-pin' ></i>
                  </div>

                  <div class="input-box animation" style="--i:21;">
                     <input type="password" name="password" required>
                     <label>Password</label>
                     <i class='bx bxs-lock-open' ></i>
                  </div>

                  <div class="input-box animation" style="--i:22;">
                     <input type="text" name="repeatPassword" required>
                     <label>Repeat Password</label>
                     <i class='bx bxs-lock'></i>
                  </div>

                  <button type="submit" name="btn-register" class="btn animation" style="--i:24;">Register</button>

                  <div class="logreg-link animation" style="--i:25;">
                     <p>
                        You already have an account? 
                        <a href="#" class="login-link">Login Now</a>
                     </p>
                  </div>

               </form>
            </div>

         </div>
         </div>
      </main>


<?php
include("includes/public_footer.php")
?>