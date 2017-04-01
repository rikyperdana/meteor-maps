if Meteor.isClient

    # Distance between 2 markers

    Template.peta4.onRendered ->

        map = L.mapbox.map 'peta4', 'mapbox.streets'
        map.setView [0, 0], 1

        fixedMarker = L.marker [38.9, -77]
        fixedMarker.bindPopup 'Mapbox DC'
        fixedMarker.addTo map
        
        fc = fixedMarker.getLatLng()
        
        onClick = (event) ->
            c = event.latlng
            geojson =
                type: 'FeatureCollection'
                features: [
                    type: 'Feature'
                    geometry:
                        type: 'Point'
                        coordinates: [c.lng, c.lat]
                    properties:
                        'marker-color': 'orange'
                ,
                    type: 'Feature'
                    geometry:
                        type: 'LineString'
                        coordinates: [
                            [fc.lng, fc.lat]
                            [c.lng, c.lat]
                        ]
                    properties:
                        stroke: 'grey'
                        'stroke-opacity': 0.5
                        'stroke-width': 4
                ]

            distanceLine = L.geoJSON geojson
            distanceLine.addTo map

            distanceNumber = fc.distanceTo c
            meters = distanceNumber.toFixed 0
            console.log meters
            
            metersInfo = L.control
                position: 'bottomleft'
            metersInfo.onAdd = (map) ->
                div = L.DomUtil.create 'div'
                div.innerHTML += '<p>Love you</p>'
            metersInfo.addTo map

        map.on 'click', onClick
