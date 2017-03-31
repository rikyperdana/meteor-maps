if Meteor.isClient

    Template.peta5.onRendered ->

        baseMap = L.tileLayer.provider 'OpenStreetMap.DE'

        map = L.map 'peta5',
            center: [0, 0]
            zoom: 1
            layers: [baseMap]
