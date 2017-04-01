if Meteor.isClient

    Template.peta6.onRendered ->

        map = L.mapbox.map 'peta6', 'mapbox.streets'
        map.setView [0, 0], 1
