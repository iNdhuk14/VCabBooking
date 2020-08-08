<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<title>BookingPage</title>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		#map {
			height: 100%;
			width: 70%;
			float: left;
		}
		
		
		html, body {
			height: 100%;
			margin: 0;
			padding: 0;
		}
		
		h {
			font-family: Times New Roman;
			font-size: 20px;
			line-height: 1.42857143;
			color: #333;
		}
		
		span.tab-space {
			padding-left:6em;
		}
		
		.controls {
			border: 1px solid transparent;
			border-radius: 2px 0 0 2px;
			box-sizing: border-box;
			-moz-box-sizing: border-box;
			height: 32px;
			outline: none;
		
		}
		
		#origin-input .style {
			z-index: 0;
			position: absolute;
			left: 76px;
			top: 10px;
		}
		
		#destination-input .absolute {
			z-index: 0;
			position: absolute;
			top: 53px;
		}
		
		#origin-input {
			background-color: #212121;
			color: white !important;
			font-family: -webkit-pictograph;
			font-size: 20px;
			font-weight: 300;
			margin-left: 12px;
			padding: 0 11px 0 13px;
			text-overflow: ellipsis;
			width: 300px;
		}
		
		#origin-input:focus {
			border-color: #4d90fe;
		}
		
		#destination-input {
			background-color: #212121;
			color: white !important;
			font-family: -webkit-pictograph;
			font-size: 20px;
			font-weight: 300;
			margin-left: 12px;
			padding: 0 11px 0 13px;
			text-overflow: ellipsis;
			width: 300px;
			position: absolute;
			top: 53px;
		}
		
		#destination-input:focus {
			border-color: #4d90fe;
		}
		
		#mode-selector {
			    color: white;
			    background-color: red;
			    margin-left: 12px;
			    padding: 5px 11px 0px 11px;
		}
		
		#main {
			transition: margin-right .5s;
			padding: 16px;
			float: right;
			color: white;
		}
		
		#home {
			
			padding: 16px;
			float: left;
			color: white;
		}
		
		#title {
			font-family: "Allerta Stencil", Sans-serif;
			font-size: 50px;
			text-align: center;
			float: center;
			padding: 16px;
			background-color: #424242;
			color: white;
		}
		
		
		
		.control {
			border: 1px solid transparent;
			border-radius: 2px 0 0 2px;
			box-sizing: border-box;
			-moz-box-sizing: border-box;
			height: 32px;
			outline: none;
			text-align: center;
			width: 350px;
			font: 20px;
		}
		
		.input-group-addon img {
			height: 50px;
			margin-right: -5px;
			margin-bottom: -10px;
			vertical-align: text-bottom; 
		}
		
		.heading {
			font-size: 50px;
			font-family: Sans-serif;
			text-align: center;
			background-color:#30638c;
			color: white;
		}
		
		.submit {
			font-size: 1.1em;
			width: 200px;
			background-color: #324a45 !important;
			color: white !important;
			font-family: Times New Roman;
		}
		div.c {
		  text-align: center;
		  color:red;
		} 
		.selectpicker {
			font-size: 1.3em !important;
			width: 150px;
			background-color: white !important;
			color: #424242 !important;
			font-family: Times New Roman !important;
			border-color: #424242;
			border-radius: 2px;
		}
		
		.d-flex flex-row-reverse {
			padding-right: 0px !important;
			padding-left: 0px !important;
			margin-right: 0px !important;
			margin-left: 0px !important;
			width: 30%;
		}
		
		.col-md-offset-6 {
			background-color: #fafafa;
		}
		
		#source, #destination, #costEstimate, #timeEstimate, #distanceEstimate {
			font-size: 20px;
			font-family: Times New Roman;
			color: #616161;
		}
		
		hr {
			margin-top: 0px !important;
			margin-bottom: 2px !important;
			border: 0;
			border-top: 2px solid black !important;
		}
	</style>

</head>

<body>

<script>
	var lat;
	var lng;
	
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		}
		return;
	}
	
	function showPosition(position) {
		lat = position.coords.latitude;
		lng = position.coords.longitude;
	}
	
	function initMap() {
		var map = new google.maps.Map(document.getElementById('map'), {
			mapTypeControl : false,
			center : {
				lat : 11.3410,
				lng : 77.7172
			},
			zoom : 13
		});
		getLocation();
		new AutocompleteDirectionsHandler(map);
		var geocoder = new google.maps.Geocoder;
		var infowindow = new google.maps.InfoWindow;
	
		document.getElementById('submit').addEventListener('click', function() {
			geocodeLatLng(geocoder, map, infowindow);
		});
	}
	
	function geocodeLatLng(geocoder, map, infowindow) {
		var input = lat + "," + lng;
		console.log(input);
		var latlngStr = input.split(',', 2);
		var latlng = {
			lat : parseFloat(latlngStr[0]),
			lng : parseFloat(latlngStr[1])
		};
		geocoder
				.geocode(
						{
							'location' : latlng
						},
						function(results, status) {
							if (status === 'OK') {
								if (results[1]) {
									map.setZoom(11);
									var marker = new google.maps.Marker({
										position : latlng,
										map : map
									});
									document.getElementById('origin-input').value = (results[1].formatted_address);
									infowindow.open(map, marker);
								} else {
									window.alert('No results found');
								}
							} else {
								window.alert('Geocoder failed due to: ' + status);
							}
						});
	
	}
	
	var originInput;
	var destinationInput;
	var target = "Erode";
	var target1 = "Coimbatore";
	
	function AutocompleteDirectionsHandler(map) {
		this.map = map;
		this.originPlaceId = null;
		this.destinationPlaceId = null;
		this.travelMode = 'DRIVING';
		originInput = document.getElementById('origin-input');
		destinationInput = document.getElementById('destination-input');
		var modeSelector = document.getElementById('mode-selector');
		this.directionsService = new google.maps.DirectionsService;
		this.directionsDisplay = new google.maps.DirectionsRenderer;
		this.directionsDisplay.setMap(map);
	
		var originAutocomplete = new google.maps.places.Autocomplete(originInput, {
			placeIdOnly  : true
			
		});
		var destinationAutocomplete = new google.maps.places.Autocomplete(
				destinationInput, {
					placeIdOnly : true
					
				});
	
		this.setupClickListener('changemode-walking', 'WALKING');
		this.setupClickListener('changemode-transit', 'TRANSIT');
		this.setupClickListener('changemode-driving', 'DRIVING');
	
		this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
		this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');
	
		this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
		this.map.controls[google.maps.ControlPosition.TOP_LEFT]
				.push(destinationInput);
		this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);
	}
	
	AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) {
		var radioButton = document.getElementById(id);
		var me = this;
		radioButton.addEventListener('click', function() {
			me.travelMode = mode;
			me.route();
		});
	};
	
	AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(
			autocomplete, mode) {
		var me = this;
		autocomplete.bindTo('bounds', this.map);
		autocomplete.addListener('place_changed', function() {
			var place = autocomplete.getPlace();
			if (!place.place_id) {
				window.alert("Please select an option from the dropdown list.");
				return;
			}
			if (mode === 'ORIG') {
				me.originPlaceId = place.place_id;
			} else {
				me.destinationPlaceId = place.place_id;
			}
			me.route();
		});
	
	};
	
	AutocompleteDirectionsHandler.prototype.route = function() {
		if (!this.originPlaceId || !this.destinationPlaceId) {
			return;
		}
		var me = this;
	
		this.directionsService.route({
			origin : {
				'placeId' : this.originPlaceId
			},
			destination : {
				'placeId' : this.destinationPlaceId
			},
			travelMode : this.travelMode
		}, function(response, status) {
			if (status === 'OK') {
				me.directionsDisplay.setDirections(response);
				getDropLatitudeLongitude();
				getPickupLatitudeLongitude();
			} else {
				window.alert('Directions request failed due to ' + status);
			}
		});
	};
	
	
	var plat;
	var plng;
	var dlat;
	var dlng;
	
	function getPickupLatitudeLongitude() {
		var address = document.getElementById("origin-input").value;
		document.getElementById("source").value = document
				.getElementById("origin-input").value;
		geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			plat = results[0].geometry.location.lat();
			plng = results[0].geometry.location.lng();
		});
	}
	
	function getDropLatitudeLongitude() {
		var address = document.getElementById("destination-input").value;
		document.getElementById("destination").value = document
				.getElementById("destination-input").value;
		geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			dlat = results[0].geometry.location.lat();
			dlng = results[0].geometry.location.lng();
		});
	}
	
	function calcDistance() {
		var distance = google.maps.geometry.spherical.computeDistanceBetween(
				new google.maps.LatLng(plat, plng), new google.maps.LatLng(dlat,
						dlng));
		document.getElementById("costEstimate").value = (((distance / 1000)));
	}
	
	function getDistance() {
		getLocation();
		originInput = document.getElementById('origin-input');
		destinationInput = document.getElementById('destination-input');
		var distanceService = new google.maps.DistanceMatrixService();
		distanceService
				.getDistanceMatrix(
						{
							origins : [ $("#origin-input").val() ],
							destinations : [ $("#destination-input").val() ],
							travelMode : google.maps.TravelMode.DRIVING,
							unitSystem : google.maps.UnitSystem.METRIC,
							durationInTraffic : true,
							avoidHighways : false,
							avoidTolls : false
						},
						function(response, status) {
							if (status !== google.maps.DistanceMatrixStatus.OK) {
								console.log('Error:', status);
							} else {
								originInput = originInput.value;
								destinationInput = destinationInput.value;
								console.log(originInput,destinationInput);
								if (((originInput.indexOf(target) != -1) || (destinationInput.indexOf(target) != -1))) {
									
	
								} else {
									if((((originInput.indexOf(target1) != -1) && (destinationInput.indexOf(target1) != -1)))){
										
									}else {
										alert("Choose within the vicinity of Erode!!");
										return;
									}
								}
								var costPerKm = parseInt(document
										.getElementById("type").value);
								var baseFare;
								if(costPerKm == 6) {
									baseFare = 35;
								} else if(costPerKm == 8) {
									baseFare = 45;
								} else {
									baseFare = 150;
								}
								var distance1 = (response.rows[0].elements[0].distance.value) / 1000;
								document.getElementById("distanceEstimate").value = parseInt(distance1 + 0.5) + " Km";
								var finalAmount = ((response.rows[0].elements[0].distance.value) / 1000) * costPerKm;
								if(finalAmount < baseFare) {
									document.getElementById("costEstimate").value = baseFare;
								} else {
									document.getElementById("costEstimate").value = parseInt((((response.rows[0].elements[0].distance.value) / 1000) * costPerKm));
								
								}
								document.getElementById("timeEstimate").value = (response.rows[0].elements[0].duration.text);
	
							}
	
						});
	}
		
</script>
   
	<input id="origin-input" class="controls" type="text"
		placeholder="Enter an origin location">
	<input id="submit" type="button" class="btn btn-default submit"
		value="Get Your Current Location">
	<input id="destination-input" class="controls" type="text"
		placeholder="Enter a destination location">
    
	<div id="mode-selector" class="controls">
		<input type="radio" name="type" id="changemode-walking"> <label
			for="changemode-walking">Walking</label> <input type="radio"
			name="type" id="changemode-transit"> <label
			for="changemode-transit">Transit</label> <input type="radio"
			name="type" id="changemode-driving" checked="checked"> <label
			for="changemode-driving">Driving</label>
	</div>


	<div id="map"></div>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAy9aGs-9bYoooKvylpzXKQJqpZQ4KO9f0&libraries=places&callback=initMap"
		async defer></script>
	<div class="d-flex flex-row-reverse">
		<div class="heading">Book a Ride</div>
		<div class="row">
			<form  action="UserPayment" method="post">
				<div class="col-md-offset-6">
					<div>
						<br> &ensp;
						<h>Source:</h>
						<span class="tab-space"></span> <input name="source"  id ="source" class="control"
							type="text" placeholder="Your Source"><br> &ensp;
						<h>Destination:</h>
						<span class="tab-space"></span> <input name="destination" id="destination"
							class="control" type="text" placeholder="Your Destination">
						<br> &ensp;
						<h>Car Type:</h>
						&ensp;&ensp; <select class="selectpicker show-tick"
							data-style="btn-primary" id="type" name="type">
							<option value=6>Micro</option>
							<option value=8>Mini</option>
						</select> <br> <br> <span class="tab-space"></span>
						<button type="button" class="btn btn-default submit"
							onclick="getDistance()">Estimate Ride</button>
						&ensp; <br> <br> &ensp;
						<h> Estimated Distance :</h>
						<input id="distanceEstimate"  name="distanceEstimate" class="control" type="text"
							placeholder=""><br> &ensp;
						<h> Estimated Ride Cost :</h>
						<input id="costEstimate"  name="costEstimate" class="control" type="text"
							placeholder=""><br> &ensp;
						<h> Estimated Ride Time :</h>
						<input id="timeEstimate" class="control" type="text"
							placeholder=""> &ensp; <br> <span class="tab-space"></span>
						<button type="submit" class="btn btn-default submit" onclick="paymentPage()">
							Confirm Your Ride</button>
							<div class="c">
							<h1>Your id is..${id}</h1>
							</div>
					</div>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
	function paymentPage() {
		window.location.href="/UserPayment";
	}
</script>
	
</body>
</html>