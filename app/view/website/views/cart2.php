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

                    <div class="bs-wizard-step active">
                        <div class="text-center bs-wizard-stepnum">Payment</div>
                        <div class="progress">
                            <div class="progress-bar"></div>
                        </div>
                        <a href="#0" class="bs-wizard-dot"></a>
                    </div>

                    <div class="bs-wizard-step disabled">
                        <div class="text-center bs-wizard-stepnum">Finish!</div>
                        <div class="progress">
                            <div class="progress-bar"></div>
                        </div>
                        <a href="#0" class="bs-wizard-dot"></a>
                    </div>
                </div>
                <!-- End bs-wizard -->
            </div>
        </div>
    </section>
    <!--/hero_in-->

    <div class="bg_color_1">
        <div class="container margin_61_35">
            <div class="row">
                <div class="col-lg-8">
                    <div class="box_cart">
                        <div class="message">
                            <p>Exisitng Customer? <a href="#0">Click here to login</a></p>
                        </div>
                        <div class="form_title">
                            <h3><strong>1</strong>Your Details</h3>
                            <p>
                                Mussum ipsum cacilds, vidis litro abertis.
                            </p>
                        </div>
                        <div class="step">
                            <div class="row">
                                <div class="col-sm-6">
									<span class="input">
										<input class="input_field" type="text">
										<label class="input_label">
											<span class="input__label-content">First name</span>
										</label>
									</span>
                                </div>
                                <div class="col-sm-6">
									<span class="input">
										<input class="input_field" type="text">
										<label class="input_label">
											<span class="input__label-content">Last name</span>
										</label>
									</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
									<span class="input">
										<input class="input_field" type="email">
										<label class="input_label">
											<span class="input__label-content">Email</span>
										</label>
									</span>
                                </div>
                                <div class="col-sm-6">
									<span class="input">
										<input class="input_field" type="email">
										<label class="input_label">
											<span class="input__label-content">Confirm email</span>
										</label>
									</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
									<span class="input">
										<input class="input_field" type="text">
										<label class="input_label">
											<span class="input__label-content">Telephone</span>
										</label>
									</span>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <!--End step -->

                        <div class="form_title">
                            <h3><strong>2</strong>Payment Information</h3>
                            <p>
                                Mussum ipsum cacilds, vidis litro abertis.
                            </p>
                        </div>
                        <div class="step">
							<span class="input">
								<input class="input_field" type="text">
								<label class="input_label">
								  <span class="input__label-content">Name on card</span>
								</label>
							</span>
                            <div class="row">
                                <div class="col-md-6">
									<span class="input">
										<input class="input_field" type="text">
										<label class="input_label">
										  <span class="input__label-content">Card number</span>
										</label>
									</span>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <img src="img/payments.png" alt="Cards" class="cards">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 add_top_30">
                                    <label>Expiration date</label>
                                    <div class="row">
                                        <div class="col-md-6">
											<span class="input">
												<input class="input_field" type="text">
												<label class="input_label">
												  <span class="input__label-content">MM</span>
												</label>
											</span>
                                        </div>
                                        <div class="col-md-6">
											<span class="input">
												<input class="input_field" type="text">
												<label class="input_label">
												  <span class="input__label-content">Year</span>
												</label>
											</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 add_top_30">
                                    <div class="form-group">
                                        <label>Security code</label>
                                        <div class="row">
                                            <div class="col-md-4">
												<span class="input">
													<input class="input_field" type="text">
													<label class="input_label">
													  <span class="input__label-content">CCV</span>
													</label>
												</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--End row -->

                            <h5>Or checkout with Paypal</h5>
                            <p>
                                Lorem ipsum dolor sit amet, vim id accusata sensibus, id ridens quaeque qui. Ne qui vocent ornatus molestie, reque fierent dissentiunt mel ea.
                            </p>
                            <p>
                                <img src="img/paypal_bt.png" alt="Image">
                            </p>
                        </div>
                        <hr>
                        <!--End step -->

                        <div class="form_title">
                            <h3><strong>3</strong>Billing Address</h3>
                            <p>
                                Mussum ipsum cacilds, vidis litro abertis.
                            </p>
                        </div>
                        <div class="step">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
									<span class="input">
										<input class="input_field" type="text">
										<label class="input_label">
											<span class="input__label-content">Country</span>
										</label>
									</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
									<span class="input">
										<input class="input_field" type="text">
										<label class="input_label">
											<span class="input__label-content">Street line 1</span>
										</label>
									</span>
                                </div>
                                <div class="col-md-6 col-sm-6">
									<span class="input">
										<input class="input_field" type="text">
										<label class="input_label">
											<span class="input__label-content">Street line 2</span>
										</label>
									</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
									<span class="input">
										<input class="input_field" type="text">
										<label class="input_label">
											<span class="input__label-content">City</span>
										</label>
									</span>
                                </div>
                                <div class="col-md-3">
									<span class="input">
										<input class="input_field" type="text">
										<label class="input_label">
											<span class="input__label-content">State</span>
										</label>
									</span>
                                </div>
                                <div class="col-md-3">
									<span class="input">
										<input class="input_field" type="text">
										<label class="input_label">
											<span class="input__label-content">Postal code</span>
										</label>
									</span>
                                </div>
                            </div>
                            <!--End row -->
                        </div>
                        <hr>
                        <!--End step -->
                        <div id="policy">
                            <h5>Cancellation policy</h5>
                            <p class="nomargin">Lorem ipsum dolor sit amet, vix <a href="#0">cu justo blandit deleniti</a>, discere omittantur consectetuer per eu. Percipit repudiare similique ad sed, vix ad decore nullam ornatus.</p>
                        </div>
                    </div>
                </div>
                <!-- /col -->

                <aside class="col-lg-4" id="sidebar">
                    <div class="box_detail">
                        <div id="total_cart">
                            Total <span class="float-right">69.00$</span>
                        </div>
                        <div class="add_bottom_30">Lorem ipsum dolor sit amet, sed vide <strong>moderatius</strong> ad. Ex eius soleat sanctus pro, enim conceptam in quo, <a href="#0">brute convenire</a> appellantur an mei.</div>
                        <a href="cart3.php" class="btn_1 full-width">Checkout</a>
                        <a href="courses-grid-sidebar.html" class="btn_1 full-width outline"><i class="icon-right"></i> Continue Shopping</a>
                    </div>
                </aside>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bg_color_1 -->
</main>
<!--/main-->
<?php include "../include/footer.php";?>



