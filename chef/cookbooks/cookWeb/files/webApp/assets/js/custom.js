
let constructMapData = {
    position: {
        lat : '',
        lng : ''
    },
    pTitle: '',
    icon: '',
    addr: ''
};


document.getElementById('search__form-js').addEventListener('submit', (e) => {
    // stops the form from submitting - avoid page refresh
    e.preventDefault();
    initMap();
});

// initialise map retrieve the lng and lat of the location specified in the form input and 
async function initMap() {
    let input = document.getElementById('search-js');
    let autocomplete = new google.maps.places.Autocomplete(input);

    autocomplete.addListener('place_changed', function() {
        let place  = autocomplete.getPlace();
        let location = {lat:place.geometry.location.lat(), lng: place.geometry.location.lng()};
        constructMapData.position.lat = location.lat, constructMapData.position.lng = location.lng;

        let options = {
            center: location,
            zoom: 15,
            scaleControl: true,
        };
        
        let map = new google.maps.Map(document.getElementById('map'), options);

        let service = new google.maps.places.PlacesService(map);

        service.nearbySearch( {
            location: location,
            radius: 500,
            type: 'cafe'
        }, showCoffeShops);
    });
}
initMap();


// show content of the distance from coffee shops inside the element on page
function showCoffeShops(results, status) {
    console.log(results);
    if(status == 'OK' && results) {
        let content = document.getElementById('coffee__content-js');
        content.innerHTML = '';
        results.forEach(mk2 => {
            let mark = { lat: mk2.geometry.location.lat(), lng: mk2.geometry.location.lng() };
            content.innerHTML +='<div style="text-align:left; font-size:1rem; padding:5px; border-bottom:2px solid #ccc;"><span><p><strong style="font-weight:600">' + mk2.name +'</strong></span> '+ haversine_distance(constructMapData.position, mark) + '<small> (miles)</small><br>Location:'+mk2.vicinity+'</p>'+ mk2.photos[0].html_attributions[0] +'</div>';
        });
    }
}

// pulled from the web, calculates the point point distance from one location to the other, traffic and road layout not considered
function haversine_distance(prop, mk2) {
    let R = 3958.8; // Radius of the Earth in miles
    let rlat1 = prop.lat * (Math.PI/180); // Convert degrees to radians
    let rlat2 = mk2.lat * (Math.PI/180); // Convert degrees to radians
    let difflat = rlat2 - rlat1; // Radian difference (latitudes)
    let difflon = (mk2.lng - prop.lng) * (Math.PI/180); // Radian difference (longitudes)

    let d = 2 * R * Math.asin(Math.sqrt(Math.sin(difflat/2)*Math.sin(difflat/2)+Math.cos(rlat1)*Math.cos(rlat2)*Math.sin(difflon/2)*Math.sin(difflon/2)));
    return Math.round(d * 100)/100;
};

/**
 * Reference
 * https://cloud.google.com/blog/products/maps-platform/how-calculate-distances-map-maps-javascript-api
 */