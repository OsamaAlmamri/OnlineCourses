<?php include "../include/header.php";?>
<!-- /main_menu -->

<main>
    <section id="hero_in" class="cart_section">
        <div class="wrapper">
            <div class="container">
                <div class="bs-wizard clearfix">
                    <div class="bs-wizard-step">
                        <div class="text-center bs-wizard-stepnum">Your cart</div>
                        <div class="progress">
                            <div class="progress-bar"></div>
                        </div>
                        <a href="cart1.php" class="bs-wizard-dot"></a>
                    </div>

                    <div class="bs-wizard-step">
                        <div class="text-center bs-wizard-stepnum">Payment</div>
                        <div class="progress">
                            <div class="progress-bar"></div>
                        </div>
                        <a href="cart2.php" class="bs-wizard-dot"></a>
                    </div>

                    <div class="bs-wizard-step active">
                        <div class="text-center bs-wizard-stepnum">Finish!</div>
                        <div class="progress">
                            <div class="progress-bar"></div>
                        </div>
                        <a href="#0" class="bs-wizard-dot"></a>
                    </div>
                </div>
                <!-- End bs-wizard -->
                <div id="confirm">
                    <h4>Order completed!</h4>
                    <p>You'll receive a confirmation email at mail@example.com</p>
                </div>
            </div>
        </div>
    </section>
    <!--/hero_in-->
</main>
<!--/main-->
<?php include "../include/footer.php";?>



