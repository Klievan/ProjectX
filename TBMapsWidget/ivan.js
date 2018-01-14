self.onInit = function() {
    $.getScript('http://maps.googleapis.com/maps/api/js?key=AIzaSyCXEoW7ATlwZzKnhk31L_BG_nIdE0imx8M', function() {
    window.circlemap = new google.maps.Map(document.getElementById('map'), {
          zoom: 16,
          center: {lat: 37.090, lng: -95.712},
          mapTypeId: 'terrain'
        });
        window.gpscircle = new google.maps.Circle({
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#FF0000',
            fillOpacity: 0.35,
            map: window.circlemap,
            center: {lat: 41.878, lng: -87.629},
            radius: 100000,
            clickable: true,
          });
        window.gpsline = new google.maps.Polyline({
    strokeColor: '#FF0000',
    strokeOpacity: 0.5,
    strokeWeight: 2,
    map: window.circlemap
  });
  window.gpsline.setMap(window.circlemap);
});
    
    self.onResize();
}

self.onDataUpdated = function() {
    var lat, long, accuracy;
    for(var i = 0, len = self.ctx.defaultSubscription.data.length; i < len; i++) {
        if('dataKey' in self.ctx.defaultSubscription.data[i]){
        if(self.ctx.defaultSubscription.data[i]['dataKey']['label'] == 'lat')
            lat = self.ctx.defaultSubscription.data[i]['data'][0][1];
        if(self.ctx.defaultSubscription.data[i]['dataKey']['label'] == 'long')
            long = self.ctx.defaultSubscription.data[i]['data'][0][1];
        if(self.ctx.defaultSubscription.data[i]['dataKey']['label'] == 'accuracy')
            accuracy = self.ctx.defaultSubscription.data[i]['data'][0][1];
        }
    }
    if(window.gpscircle != undefined){
        window.gpscircle.setCenter({lat: lat, lng: long});
        window.gpscircle.setRadius(2.5*accuracy);
        window.circlemap.panTo(new google.maps.LatLng({lat: lat, lng: long}));
        window.gpsline.getPath().push(new google.maps.LatLng({lat: lat, lng: long}));
    }
    
    
}



self.onResize = function() {
}

self.onDestroy = function() {
}
