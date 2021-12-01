import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    // call fucntion here
    this.map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }));
    this._addMarkersToMap();
    this._fitMapToMarkers();
    this._addGeoLocateToMap();
  }

  _addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      // Create a HTML element for your custom marker
      const customMarker = document.createElement('div');
      customMarker.className = 'marker';
      customMarker.style.backgroundImage = `url('${marker.image_url}')`;
      customMarker.style.backgroundSize = 'contain';
      customMarker.style.width = '19px';
      customMarker.style.height = '25px';

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  // 'app/assets/images/MapMarker.png'


  // addmarkers to map here
  // _addMarkersToMap() {
  //   this.markersValue.forEach((marker) => {
  //     const popup = new mapboxgl.Popup().setHTML(marker.info_window);

  //     // Create a HTML element for your custom marker
  //     const customMarker = document.createElement('div');
  //     customMarker.className = 'marker';
  //     customMarker.style.backgroundImage = `url('${marker.image_url}')`;
  //     customMarker.style.backgroundSize = 'contain';
  //     customMarker.style.width = '19px';
  //     customMarker.style.height = '25px';

  //     // Pass the element as an argument to the new marker
  //     new mapboxgl.Marker(customMarker)
  //       .setLngLat([marker.lng, marker.lat])
  //       // .setPopup(popup)
  //       .addTo(this.map);
  //   });
  // }

  // 'app/assets/images/MapMarker.png'


  // _addMarkersToMap() {
  //    console.log("hello")
  //   console.log(this.markersValue)
  //   this.markersValue.forEach((marker) => {
  //     new mapboxgl.Marker()
  //       .setLngLat([marker.lng, marker.lat])
  //       .addTo(this.map);
  //   });
  // }
  _fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 1500 });
  }

  _addGeoLocateToMap() {
    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        // When active the map will receive updates to the device's location as it changes.
        trackUserLocation: true,
        // Draw an arrow next to the location dot to indicate which direction the device is heading.
        showUserHeading: true
      })
    );
  }

}
