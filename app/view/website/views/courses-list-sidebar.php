<?php
include "../include/header.php";?>
	<!-- /main_menu -->
	<body>
	<main>
		<section id="hero_in" class="courses">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>Online courses</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

		<div class="filters_listing sticky_horizontal">
			<div class="container">
				<ul class="clearfix">
					<li>
						<div class="switch-field">
							<input type="radio" id="all" name="listing_filter" value="all" checked>
							<label for="all">All</label>
							<input type="radio" id="popular" name="listing_filter" value="popular">
							<label for="popular">Popular</label>
							<input type="radio" id="latest" name="listing_filter" value="latest">
							<label for="latest">Latest</label>
						</div>
					</li>
					<li>
						<div class="layout_view">
							<a href="courses-grid.html"><i class="icon-th"></i></a>
							<a href="#0" class="active"><i class="icon-th-list"></i></a>
						</div>
					</li>
					<li>
						<select name="orderby" class="selectbox">
							<option value="category">Category</option>
							<option value="category 2">Literature</option>
							<option value="category 3">Architecture</option>
							<option value="category 4">Economy</option>
							</select>
					</li>
				</ul>
			</div>
			<!-- /container -->
		</div>
		<!-- /filters -->

		<div class="container margin_60_35">
			<div class="row">
				<aside class="col-lg-3" id="sidebar">
					<div id="filters_col"> <a data-toggle="collapse" href="#collapseFilters" aria-expanded="false" aria-controls="collapseFilters" id="filters_col_bt">Filters </a>
						<div class="collapse show" id="collapseFilters">
							<div class="filter_type">
								<h6>Category</h6>
								<ul>
									<li>
										<label>
											<input type="checkbox" class="icheck" checked>all <small>(945)</small>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" class="icheck">Architecture <small>(45)</small>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" class="icheck">Managment <small>(30)</small>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" class="icheck">Business <small>(25)</small>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" class="icheck">Litterature <small>(56)</small>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" class="icheck">Biology <small>(10)</small>
										</label>
									</li>
								</ul>
							</div>
							<div class="filter_type">
								<h6>Rating</h6>
								<ul>
									<li>
										<label>
											<input type="checkbox" class="icheck">
											<span class="rating"><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i> <small>(145)</small></span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" class="icheck">
											<span class="rating"><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i> <small>(25)</small></span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" class="icheck">
											<span class="rating"><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i> <small>(68)</small></span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" class="icheck">
											<span class="rating"><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i> <small>(34)</small></span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" class="icheck">
											<span class="rating"><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i> <small>(10)</small></span>
										</label>
									</li>
								</ul>
							</div>
						</div>
						<!--/collapse -->
					</div>
					<!--/filters col-->
				</aside>
				<!-- /aside -->

				<div class="col-lg-9" id="list_sidebar">
					<div class="box_list wow">
						<div class="row no-gutters">
							<div class="col-lg-5">
								<figure class="block-reveal">
									<div class="block-horizzontal"></div>
									<a href="course-detail.html"><img src="http://via.placeholder.com/800x533/ccc/fff/course__list_1.jpg" alt=""></a>
									<div class="preview"><span>Preview course</span></div>
								</figure>
							</div>
							<div class="col-lg-7">
								<div class="wrapper">
									<a href="#0" class="wish_bt"></a>
									<div class="price">$39</div>
									<small>Category</small>
									<h3>Persius delenit has cu</h3>
									<p>Dicam diceret ut ius, no epicuri dissentiet philosophia vix. Eam id legimus torquatos cotidieque, usu decore percipitur definitiones ex, nihil utinam recusabo mel no. </p>
									<div class="rating"><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i> <small>(145)</small></div>
								</div>
								<ul>
									<li><i class="icon_clock_alt"></i> 1h 30min</li>
									<li><i class="icon_like"></i> 890</li>
									<li><a href="course-detail.html">Enroll now</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /box_list -->
					<div class="box_list wow">
						<div class="row no-gutters">
							<div class="col-lg-5">
								<figure class="block-reveal">
									<div class="block-horizzontal"></div>
									<a href="course-detail.html"><img src="http://via.placeholder.com/800x533/ccc/fff/course__list_2.jpg" class="img-fluid" alt=""></a>
									<div class="preview"><span>Preview course</span></div>
								</figure>
							</div>
							<div class="col-lg-7">
								<div class="wrapper">
									<a href="#0" class="wish_bt"></a>
									<div class="price">$25</div>
									<small>Category</small>
									<h3>At deseruisse scriptorem</h3>
									<p>Dicam diceret ut ius, no epicuri dissentiet philosophia vix. Id usu zril tacimates neglegentur. Eam id legimus torquatos cotidieque, usu decore percipitur definitiones ex, nihil utinam recusabo mel no. </p>
									<div class="rating"><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i> <small>(145)</small></div>
								</div>
								<ul>
									<li><i class="icon_clock_alt"></i> 1h 30min</li>
									<li><i class="icon_like"></i> 890</li>
									<li><a href="course-detail.html">Enroll now</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /box_list -->
					<div class="box_list wow">
						<div class="row no-gutters">
							<div class="col-lg-5">
								<figure class="block-reveal">
									<div class="block-horizzontal"></div>
									<a href="course-detail.html"><img src="http://via.placeholder.com/800x533/ccc/fff/course__list_3.jpg" class="img-fluid" alt=""></a>
									<div class="preview"><span>Preview course</span></div>
								</figure>
							</div>
							<div class="col-lg-7">
								<div class="wrapper">
									<a href="#0" class="wish_bt"></a>
									<div class="price">$120</div>
									<small>Category</small>
									<h3>Ea vel semper quaerendum</h3>
									<p>Dicam diceret ut ius, no epicuri dissentiet philosophia vix. Id usu zril tacimates neglegentur. Eam id legimus torquatos cotidieque, usu decore percipitur definitiones ex, nihil utinam recusabo mel no. </p>
									<div class="rating"><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i> <small>(145)</small></div>
								</div>
								<ul>
									<li><i class="icon_clock_alt"></i> 1h 30min</li>
									<li><i class="icon_like"></i> 890</li>
									<li><a href="course-detail.html">Enroll now</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /box_list -->
					<div class="box_list wow">
						<div class="row no-gutters">
							<div class="col-lg-5">
								<figure class="block-reveal">
									<div class="block-horizzontal"></div>
									<a href="course-detail.html"><img src="http://via.placeholder.com/800x533/ccc/fff/course__list_4.jpg" class="img-fluid" alt=""></a>
									<div class="preview"><span>Preview course</span></div>
								</figure>
							</div>
							<div class="col-lg-7">
								<div class="wrapper">
									<a href="#0" class="wish_bt"></a>
									<div class="price">$54</div>
									<small>Category</small>
									<h3>Ei has exerci graecis</h3>
									<p>Dicam diceret ut ius, no epicuri dissentiet philosophia vix. Id usu zril tacimates neglegentur. Eam id legimus torquatos cotidieque, usu decore percipitur definitiones ex, nihil utinam recusabo mel no. </p>
									<div class="rating"><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i> <small>(145)</small></div>
								</div>
								<ul>
									<li><i class="icon_clock_alt"></i> 1h 30min</li>
									<li><i class="icon_like"></i> 890</li>
									<li><a href="course-detail.html">Enroll now</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /box_list -->
					<div class="box_list wow">
						<div class="row no-gutters">
							<div class="col-lg-5">
								<figure class="block-reveal">
									<div class="block-horizzontal"></div>
									<a href="course-detail.html"><img src="http://via.placeholder.com/800x533/ccc/fff/course__list_5.jpg" class="img-fluid" alt=""></a>
									<div class="preview"><span>Preview course</span></div>
								</figure>
							</div>
							<div class="col-lg-7">
								<div class="wrapper">
									<a href="#0" class="wish_bt"></a>
									<div class="price">$60</div>
									<small>Category</small>
									<h3>Decore tractatos</h3>
									<p>Dicam diceret ut ius, no epicuri dissentiet philosophia vix. Id usu zril tacimates neglegentur. Eam id legimus torquatos cotidieque, usu decore percipitur definitiones ex, nihil utinam recusabo mel no. </p>
									<div class="rating"><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i> <small>(145)</small></div>
								</div>
								<ul>
									<li><i class="icon_clock_alt"></i> 1h 30min</li>
									<li><i class="icon_like"></i> 890</li>
									<li><a href="course-detail.html">Enroll now</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /box_list -->
					<p class="text-center add_top_60"><a href="#0" class="btn_1 rounded">Load more</a></p>
				</div>
				<!-- /col -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
		<div class="bg_color_1">
			<div class="container margin_60_35">
				<div class="row">
					<div class="col-md-4">
						<a href="#0" class="boxed_list">
							<i class="pe-7s-help2"></i>
							<h4>Need Help? Contact us</h4>
							<p>Cum appareat maiestatis interpretaris et, et sit.</p>
						</a>
					</div>
					<div class="col-md-4">
						<a href="#0" class="boxed_list">
							<i class="pe-7s-wallet"></i>
							<h4>Payments and Refunds</h4>
							<p>Qui ea nemore eruditi, magna prima possit eu mei.</p>
						</a>
					</div>
					<div class="col-md-4">
						<a href="#0" class="boxed_list">
							<i class="pe-7s-note2"></i>
							<h4>Quality Standards</h4>
							<p>Hinc vituperata sed ut, pro laudem nonumes ex.</p>
						</a>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->
	</main>
	<!--/main-->
	
	<footer>
		<div class="container margin_120_95">
			<div class="row">
				<div class="col-lg-5 col-md-12 p-r-5">
					<p><img src="img/logo.png" width="149" height="42" data-retina="true" alt=""></p>
					<p>Mea nibh meis philosophia eu. Duis legimus efficiantur ea sea. Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu. Nihil facilisi indoctum an vix, ut delectus expetendis vis.</p>
					<div class="follow_us">
						<ul>
							<li>Follow us</li>
							<li><a href="#0"><i class="ti-facebook"></i></a></li>
							<li><a href="#0"><i class="ti-twitter-alt"></i></a></li>
							<li><a href="#0"><i class="ti-google"></i></a></li>
							<li><a href="#0"><i class="ti-pinterest"></i></a></li>
							<li><a href="#0"><i class="ti-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 ml-lg-auto">
					<h5>Useful links</h5>
					<ul class="links">
						<li><a href="#0">Admission</a></li>
						<li><a href="#0">About</a></li>
						<li><a href="#0">Login</a></li>
						<li><a href="#0">Register</a></li>
						<li><a href="#0">News &amp; Events</a></li>
						<li><a href="#0">Contacts</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>Contact with Us</h5>
					<ul class="contacts">
						<li><a href="tel://61280932400"><i class="ti-mobile"></i> + 61 23 8093 3400</a></li>
						<li><a href="mailto:info@udema.com"><i class="ti-email"></i> info@udema.com</a></li>
					</ul>
					<div id="newsletter">
					<h6>Newsletter</h6>
					<div id="message-newsletter"></div>
					<form method="post" action="assets/newsletter.php" name="newsletter_form" id="newsletter_form">
						<div class="form-group">
							<input type="email" name="email_newsletter" id="email_newsletter" class="form-control" placeholder="Your email">
							<input type="submit" value="Submit" id="submit-newsletter">
						</div>
					</form>
					</div>
				</div>
			</div>
			<!--/row-->
			<hr>
			<div class="row">
				<div class="col-md-8">
					<ul id="additional_links">
						<li><a href="#0">Terms and conditions</a></li>
						<li><a href="#0">Privacy</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<div id="copy">© 2017 Udema</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/footer-->
	
	<!-- Search Menu -->
	<div class="search-overlay-menu">
		<span class="search-overlay-close"><span class="closebt"><i class="ti-close"></i></span></span>
		<form role="search" id="searchform" method="get">
			<input value="" name="q" type="search" placeholder="Search..." />
			<button type="submit"><i class="icon_search"></i>
			</button>
		</form>
	</div><!-- / Search Menu -->

	<!-- COMMON SCRIPTS -->
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/common_scripts.js"></script>
    <script src="js/main.js"></script>
	<script src="assets/validate.js"></script>
  
</body>
</html>