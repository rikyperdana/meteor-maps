if Meteor.isClient

    Template.peta3.onRendered ->

        baseMap = L.tileLayer.provider 'OpenStreetMap.DE'

        map = L.map 'peta3',
            center: [0, 0]
            zoom: 1
            layers: [baseMap]
