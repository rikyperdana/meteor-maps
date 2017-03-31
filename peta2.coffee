if Meteor.isClient

    # Follow animation of a line along map

    Template.peta2.onRendered ->

        baseMap = L.tileLayer.provider 'OpenStreetMap.DE'

        map = L.map 'peta2',
            center: [0, 0]
            zoom: 0
            layers: [baseMap]

        polyline = L.polyline [],
            color: 'red'
            stroke: true
            weight: 5
            opacity: 0.5
        polyline.addTo map
        
        pointsAdded = 0
        
        add = () ->

            curve = Math.cos pointsAdded / 20
            polyline.addLatLng L.latLng curve * 30, pointsAdded

            map.setView [0, pointsAdded], 2

            if ++pointsAdded < 360
                window.setTimeout add, 100

        add()
