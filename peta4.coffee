if Meteor.isClient

    Template.peta4.onRendered ->

        baseMap = L.tileLayer.provider 'OpenStreetMap.DE'

        map = L.map 'peta4',
            center: [0, 0]
            zoom: 1
            layers: [baseMap]
