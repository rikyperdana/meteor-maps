if Meteor.isClient

    # Colored Map
    Template.peta5.onRendered ->
        map = L.mapbox.map 'peta5', 'mapbox.streets'
        map.setView [0, 0], 1

        getColor = (density) ->
            switch
                when density > 1000 then 'maroon'
                when density > 500 then 'red'
                when density > 200 then 'orange'
                when density > 100 then 'yellow'
                when density > 50 then 'green'
                when density > 20 then 'teal'
                when density > 10 then 'blue'
                else 'grey'

        style = (feature) ->
            fillColor: getColor feature.properties.density
            weight: 2
            opacity: 1
            color: 'white'
            dashArray: '3'
            fillOpacity: 0.7

        highlightFeature = (event) ->
            layer = event.target
            layer.setStyle
                weight: 5
                color: '#666'
                dashArray: ''
                fillOpacity: 0.7
            layer.bringToFront()
            info.update layer.feature.properties

        resetHighlight = (event) ->
            layer = event.target
            geojson.resetStyle event.target
            info.update layer.feature.properties

        zoomFeature = (event) ->
            map.fitBounds event.target.getBounds()

        onEachFeature = (feature, layer) ->
            layer.on
                mouseover: highlightFeature
                mouseout: resetHighlight
                click: zoomFeature

        geojson = L.geoJson statesData,
            style: style
            onEachFeature: onEachFeature
        geojson.addTo map

        info = L.control()
        
        info.onAdd = (map) ->
            this._div = L.DomUtil.create 'div', 'info'
            this.update()
            this._div

        info.update = (props) ->
            propsInfo = if props then props.name + ' ' + props.density else 'Hover a state'
            this._div.innerHTML = '<h4>Population Density</h4>' + propsInfo

        info.addTo map

        legend = L.control position: 'bottomright'
        
        legend.onAdd = (map) ->
            div = L.DomUtil.create 'div', 'info legend'
            grades = [1000, 500, 200, 100, 50, 20, 10, 0]
            for i in grades
                div.innerHTML +=  i + '<br/>'
            return div

        legend.addTo map
