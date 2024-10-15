      <!--==================== FOOTER ====================-->
      <footer class="footer">
         <div class="footer__container container grid">
            <div>
               <a href="./index.html" class="footer__logo">
                  <img src="resources/img/TTAN_COM-removebg.png" alt="logo" class="logoTTAN">
               </a>
            </div>

            <div class="footer__data grid">

               <div>
                  <h3 class="footer___title">Products</h3>

                  <ul class="footer__links">

                     <li>
                        <a href="" class="footer__link">Computer Gaming</a>
                     </li>

                     <li>
                        <a href="" class="footer__link">Laptop Gaming</a>
                     </li>

                     <li>
                        <a href="" class="footer__link">Router Gaming</a>
                     </li>
                     
                     <li>
                        <a href="" class="footer__link">Keyboard Gaming</a>
                     </li>

                  </ul>
               </div>


               <div>
                  <h3 class="footer___title">Support</h3>

                  <ul class="footer__links">

                     <li>
                        <a href="" class="footer__link">Product Help</a>
                     </li>

                     <li>
                        <a href="" class="footer__link">Register</a>
                     </li>

                     <li>
                        <a href="" class="footer__link">Updates</a>
                     </li>

                     <li>
                        <a href="" class="footer__link">Provides</a>
                     </li>

                  </ul>
               </div>

               <div class="footer__group">
                  <form action="#" class="footer__form">
                     <input type="email" placeholder="Email" class="footer__input">
                     <button class="footer__button button">
                        Subcribe <i class="ri-mail-send-fill"></i>
                     </button>
                  </form>

                  <div class="footer__social">
                     <a href="https://www.facebook.com/" target="_blank" class="footer__social-link">
                        <i class="ri-facebook-box-fill"></i>
                     </a>
                     <a href="https://www.youtube.com" target="_blank" class="footer__social-link">
                        <i class="ri-youtube-line"></i>
                     </a>
                     <a href="https://www.telegram.com" target="_blank" class="footer__social-link">
                        <i class="ri-telegram-line"></i>
                     </a>
                  </div>
               </div>
            </div>
         </div>


         <span class="footer__copy">
            &#169; All Rights Reserved By TTAN Ltd.
         </span>
      </footer>

      <!--========== SCROLL UP ==========-->
      <a href="#" class="scrollup" id="scroll-up">
         <i class="ri-arrow-up-circle-line"></i>
      </a>

      <!--=============== SCROLLREVEAL ===============-->
      <script src="resources/js/scrollreveal.min.js"></script>

      <!--=============== SWIPER JS ===============-->
      <script src="resources/js/swiper-bundle.min.js"></script>

      <!--=============== MIXITUP JS ===============-->
      <script src="resources/js/mixitup.min.js"></script>

      <!--=============== DETAILPRODUCT JS ===============-->
      <script src="resources/js/jsDetailProduct.js"></script>

      <!--=============== MAIN JS ===============-->
      <script src="resources/js/main.js"></script>


      <script 
      src="https://sandbox.paypal.com/sdk/js?client-id=AVHmJ4T0nrI-wdIrVrfHs-UAJ4TPo5zSC0weYFV5K6AsREu7OxlvvIda7wwpjlrK7niiUM9gl9OAPAdj&buyer-country=US&currency=USD"
      data-sdk-integration-source="developer-studio">
      </script>

      <script>
         
         paypal.Buttons({
               style: {
                  layout: 'vertical',
                  color:  'gold',
                  shape:  'pill',
                  label:  'paypal'
               },
               createOrder: function(data, actions) {
                   return actions.order.create({
                       purchase_units: [{
                           amount: {
                               value: "<?php echo str_replace(',', '', $this->getData('total_amount', false)); ?>"
                           },
                       }, ],
                   });
               },
               onApprove: function(data, actions) {
                   return actions.order.capture().then(function(details) {
                       // Get form data
                       const name = document.querySelector('#name').value;
                       const phone = document.querySelector('#phone').value;
                       const address = document.querySelector('#address').value;   
                  
                  
                       // Create form data
                       const formData = new FormData(document.querySelector('#checkout-form'));
                       formData.append('name', name);
                       formData.append('phone', phone);
                       formData.append('address', address);
                       formData.append('paypal-checkout', '1');
                  
                       // Submit form data
                       fetch("checkout.php", {
                           method: "POST",
                           body: formData
                       })
                       .then(response => response.text())
                       .then(result => {
                           window.location.href = 'success.php';
                       })
                       .catch(error => {
                           console.error('Error:', error);
                           alert('An error occurred during checkout. Please try again.');
                       });
                   });
               }
         }).render('#paypal-button-container');

      </script>
   </body>
</html>