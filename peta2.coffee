if Meteor.isClient

    # Follow animation of a line along map

    Template.peta2.onRendered ->

        map = L.mapbox.map 'peta2', 'mapbox.streets'
        map.setView [0, 0], 1

        polyline = L.polyline [],
            color: 'red'
            stroke: true
            weight: 5
            opacity: 0.5
        polyline.addTo map
        
        pointsAdded = 0
        
        add = () ->

            curve = Math.cos(pointsAdded / 20) * 30
            polyline.addLatLng L.latLng curve, pointsAdded

            map.setView [0, pointsAdded], 2

            if ++pointsAdded < 360
                window.setTimeout add, 100

        add()
