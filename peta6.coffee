if Meteor.isClient

    Template.peta6.onRendered ->

        baseMap = L.tileLayer.provider 'OpenStreetMap.DE'

        map = L.map 'peta6',
            center: [0, 0]
            zoom: 1
            layers: [baseMap]
