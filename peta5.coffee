if Meteor.isClient

    Template.peta5.onRendered ->

        map = L.mapbox.map 'peta5', 'mapbox.streets'
        map.setView [0, 0], 1
