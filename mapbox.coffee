if Meteor.isClient

    Meteor.startup ->
        Mapbox.load()

    Deps.autorun ->
        if Mapbox.loaded()
            L.mapbox.accessToken = 'pk.eyJ1IjoicmlreXBlcmRhbmEiLCJhIjoiY2l3dm9rMmFvMDBnOTJ6c2FrOTJyc3J1bCJ9.WE9aYy03n5l0_phjpxRLMA'
