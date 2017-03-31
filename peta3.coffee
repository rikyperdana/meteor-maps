if Meteor.isClient

    # Marker movement

    Template.peta3.onRendered ->

        baseMap = L.tileLayer.provider 'OpenStreetMap.DE'

        map = L.map 'peta3',
            center: [0, 0]
            zoom: 1
            layers: [baseMap]

        marker = L.marker [-73, 40]
        
        t = 0
        
        interval = () ->
            formula1 = Math.cos(t * 0.5) * 50
            formula2 = Math.sin(t) * 50
            marker.setLatLng L.latLng formula1, formula2
            t += 0.1

        window.setInterval interval, 50
        
        marker.addTo map
