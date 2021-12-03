import folium

m = folium.Map(location=[35.93213, -79.03572], zoom_start=13)
marker = folium.Marker([35.93213, -79.03572], popup="<b>Chapel Hill Public Library</b>", tooltip = 'Click me!')
marker.add_to(m)
m
m.save("report_fmap.html")