if Meteor.isClient

    # Animate a marker along line
    
    Template.peta1.onRendered ->

        map = L.mapbox.map 'peta1', 'mapbox.streets'
        map.setView [0, 0], 1

        geojson =
            type: 'LineString'
            coordinates: []
        start = [10, 20]
        momentum = [3, 3]
        
        for i in [0..300]
            start[0] += momentum[0]
            start[1] += momentum[1]
            momentum[1] *= -1 if start[1] > 60 or start[1] < -60
            momentum[0] *= -1 if start[0] > 170 or start[0] < -170
            geojson.coordinates.push start.slice()

        trajectory = L.geoJSON geojson
        trajectory.addTo map

        j = 0
        
        marker = L.marker [0, 0]
        marker.addTo map

        tick = () ->
            marker.setLatLng L.latLng geojson.coordinates[j][1], geojson.coordinates[j][0]
            if ++j < geojson.coordinates.length
                setTimeout tick, 100

        tick()
