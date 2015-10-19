<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.select.Elements" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="ISO-8859-1">
<title>Khmer 24 Scrapping</title>
	<style>
		.gallery_ads li{
			list-style-type: none;
			display: block;
		}
		.optional li {
			display: inline;
		}
	</style>
</head>
<body>
	<h3>What do you want to search?</h3>
	<div class="search_box">
		<form id="search_text" method="get">
			<input type="hidden" name="category" value="phone-accessories" />
			<input type="hidden" name="ad_field" value="" />
			<input type="hidden" name="ad_kindof" value=""/>
			<input type="hidden" name="filter[ad_price][from]" value="" />
			<input type="hidden" name="filter[ad_price][to]" value="" />
			<input type="hidden" name="sortby" value="" />
			<input type="hidden" name="location" value="0" />
			<input type="text" name="q" value="" placeholder="What are you looking for..." id="search_box" />
			<span>
			<select name="category" id="search_cate" class="form_control">
			<option value="0">All Categories</option>
			<option class="main-cat" value="buy-and-sell">Buy and Sell</option><option class="sub-cat" value="phones-tablets">Phones, Tablets</option><option class="sub-cat" value="phone-accessories" selected="">Phone Accessories</option><option class="sub-cat" value="phone-numbers">Phone Numbers</option><option class="sub-cat" value="computers">Computers</option><option class="sub-cat" value="computer-accessories">Computer accessories</option><option class="sub-cat" value="softwares">Softwares</option><option class="sub-cat" value="cds-dvds-vhs">CDS, DVDS, VHS</option><option class="sub-cat" value="household-items">Household Items</option><option class="sub-cat" value="consumer-electronics">Consumer Electronics</option><option class="sub-cat" value="tvs-videos-and-audios">TVs, Videos and Audios</option><option class="sub-cat" value="cameras-camcorders">Cameras, camcorders</option><option class="sub-cat" value="jewellery-watches">Jewellery, watches </option><option class="sub-cat" value="home-appliances">Home appliances </option><option class="sub-cat" value="books">Books</option><option class="sub-cat" value="video-games-consoles-toys">Video games, consoles, toys </option><option class="sub-cat" value="clothing-accessories">Clothing, accessories</option><option class="sub-cat" value="sports-equipment">Sports Equipment</option><option class="sub-cat" value="beauty-healthcare-products">Beauty &amp; Healthcare</option><option class="sub-cat" value="others-buy-sell">Others</option><option class="main-cat" value="cars-and-vehicles">Cars and Vehicles</option><option class="sub-cat" value="cars-for-sale">Cars for Sale</option><option class="sub-cat" value="motorcycles-for-sale">Motorcycles For Sale</option><option class="sub-cat" value="vehicles-for-rent"> Vehicles For Rent</option><option class="sub-cat" value="car-maintenance-repair">Car Maintenance &amp; Repair</option><option class="sub-cat" value="lorries-vans">Lorries &amp; Vans</option><option class="sub-cat" value="financing-insurance">Financing &amp; Insurance</option><option class="sub-cat" value="car-parts-accessories">Car Parts &amp; Accessories</option><option class="sub-cat" value="others-vihicles">Others</option><option class="main-cat" value="property-housing-rentals">House &amp; Lands</option><option class="sub-cat" value="house-for-sale">House For Sale</option><option class="sub-cat" value="house-for-rent">House For Rent</option><option class="sub-cat" value="apartment-for-sale">Apartment For Sale</option><option class="sub-cat" value="apartment-for-rent">Apartment For Rent</option><option class="sub-cat" value="landed-properties-for-sale">Land For Sale</option><option class="sub-cat" value="landed-properties-for-rent">Landed Properties For Rent</option><option class="sub-cat" value="commercial-properties-for-sale">Commercial Properties For Sale</option><option class="sub-cat" value="commercial-properties-for-rent">Commercial Properties For Rent</option><option class="sub-cat" value="room-for-rent">Room For Rent</option><option class="sub-cat" value="properties-wanted">Properties Wanted</option><option class="sub-cat" value="agent-services">Agent Services</option><option class="sub-cat" value="others-properties">Others</option><option class="main-cat" value="jobs">Jobs</option><option class="sub-cat" value="jobs-wanted">Jobs Wanted</option><option class="sub-cat" value="jobs-offer">Jobs Offer</option><option class="main-cat" value="business-products-and-services">Business &amp; Services</option><option class="sub-cat" value="accounting">Accounting</option><option class="sub-cat" value="automotive">Automotive</option><option class="sub-cat" value="bridal-services">Bridal Services</option><option class="sub-cat" value="advertising-media">Advertising &amp; Media</option><option class="sub-cat" value="cleaning-maid-services">Cleaning &amp; Maid Services</option><option class="sub-cat" value="construction-arch.-interiors">Construction, Arch. &amp; Interiors</option><option class="sub-cat" value="engineering">Engineering</option><option class="sub-cat" value="insurance">Insurance</option><option class="sub-cat" value="massage-spa">Massage &amp; Spa</option><option class="sub-cat" value="hospitality-travel-tourism">Hospitality, Travel &amp; Tourism</option><option class="sub-cat" value="health-medical-pharma">Health, Medical &amp; Pharma</option><option class="sub-cat" value="it-telecom">IT &amp; Telecom</option><option class="sub-cat" value="interior-design-renovation">Interior Design &amp; Renovation</option><option class="sub-cat" value="legal">Legal</option><option class="sub-cat" value="movers-logistics">Movers &amp; Logistics</option><option class="sub-cat" value="plumbing-electrical">Plumbing &amp; Electrical</option><option class="sub-cat" value="property-real-estate">Property &amp; Real Estate</option><option class="sub-cat" value="science">Science</option><option class="sub-cat" value="supply-chain-logistics">Supply Chain &amp; Logistics</option><option class="sub-cat" value="printing-publishing">Printing &amp; Publishing</option><option class="sub-cat" value="other-services">Other Services</option><option class="main-cat" value="education-training">Education &amp; Training</option><option class="sub-cat" value="computer-it-courses">Computer &amp; IT Courses</option><option class="sub-cat" value="academic-courses">Academic Courses</option><option class="sub-cat" value="language-courses">Language Courses</option><option class="sub-cat" value="programmes-for-children">Programmes for children</option><option class="sub-cat" value="fitness-sports-instruction">Fitness &amp; Sports Instruction</option><option class="sub-cat" value="music-singing-courses">Music &amp; Singing Courses</option><option class="sub-cat" value="seminars-workshops">Seminars &amp; Workshops</option><option class="sub-cat" value="tuition-services">Tuition Services</option><option class="sub-cat" value="enrichment-courses">Enrichment Courses</option><option class="sub-cat" value="others-education">Others</option><option class="main-cat" value="announcements">Announcements</option><option class="sub-cat" value="information-guide">Information &amp; Guide</option><option class="sub-cat" value="lost-found">Lost &amp; Found</option><option class="sub-cat" value="event">Event</option><option class="sub-cat" value="other-announcements">Other Announcements</option> </select>
			</span>
			<span>
			<select id="search_loc" class="form_control" name="location">
			<option value="0">All Locations</option>
			<option value="phnom-penh">Phnom Penh</option><option value="preah-sihanouk">Preah Sihanouk</option><option value="kampong-cham">Kampong Cham</option><option value="siem-reap">Siem Reap</option><option value="battambang">Battambang</option><option value="kandal">Kandal</option><option value="banteay-meanchey">Banteay Meanchey</option><option value="bavet">Bavet</option><option value="kampong-chhnang">Kampong Chhnang</option><option value="kampong-speu">Kampong Speu</option><option value="kampong-thom">Kampong Thom</option><option value="kampot">Kampot</option><option value="keb">Keb</option><option value="koh-kong">Koh Kong</option><option value="kratie">Kratie</option><option value="mondulkiri">Mondulkiri</option><option value="oddor-meanchey">Oddor Meanchey</option><option value="pailin">Pailin</option><option value="poipet">Poipet</option><option value="preah-vihear">Preah Vihear</option><option value="prey-veng">Prey Veng</option><option value="pursat">Pursat</option><option value="rattanakiri">Rattanakiri</option><option value="stung-treng">Stung Treng</option><option value="svay-rieng">Svay Rieng</option><option value="takeo">Takeo</option> </select>
			</span>
			<input class="btn btn_yellow" type="submit" value="Search" />
		</form>
	</div>
	 <%
		request.setCharacterEncoding("UTF-8");
	 	int result = 0;
		Elements linkTitle = null;
		Elements image = null;
		Elements title = null;
		Elements price = null;
		Elements list = null;

		
		if(request.getParameter("p")!=null)
		{
			try{
				String q = request.getParameter("q");
				String category = request.getParameter("category");
				String location = request.getParameter("location");
				String searchType = request.getParameter("searchtype");
				Document doc = Jsoup.connect("http://www.khmer24.com/search.html?location=&q="+q+"&category="+category+"&location="+location).get();
				linkTitle = doc.select("p_relative paid_ad a");
				image = doc.select(".middle img");
				title = doc.select(".title h2");
				price = doc.select(".price span");
				list = doc.select(".optional div");
			}catch(Exception e){
				e.printStackTrace();
			}
			if (result > 0) { %>
				search result for <strong><%=request.getParameter("q") %></strong>
				<% for(int i=0; i<result; i++){ %>
						<ul class="gallery_ads"><%=linkTitle.get(i).text()%> </ul>
				<% } %>
		<% }else{ %>
		<h3>No result found for <%= request.getParameter("q") %></h3>
	<% }
	}
	%> 

			<!-- <li class="p_relative paid_ad">
				<a href="http://www.khmer24.com/-adid-1046193" title="">
				<div><span class="img">
				<img alt="" class="midle" src="http://www.khmer24.com/images/items/15-08/s-134412-house-for-s44-c.jpg" />
				</span></div>
				<div class="detail">
					<h2 class="title">
					ផ្ទះល្វែង តំលៃពិសេស ទីតាំងល្អ​ និ... </h2>
					<span class="price price-pc">$76800</span>
					<p class="pc">លក់ផ្ទះ ល្វែង ផ្ទាល់ខ្លូន តំលៃ ពិសេស ទីតាំង ល្អ​ និង​ជួល បានថ្​លៃ
					៏+++++ស្ថិតនៅក្នុងក្រុង 1200ម ពីផ្លូវ 27...... <i>tel: 098333383,012535651</i></p>
					<div class="optional">
					<ul>
					<li>House For Sale</li>
					<li>Phnom Penh</li>
					<li>30-Sep-2015</li>
					<li>2921 hits</li>
					</ul>
					</div>
				</div>
				</a>
			</li>	 -->
	
</body>
</html>