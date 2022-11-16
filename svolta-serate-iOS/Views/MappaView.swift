//
//  MappaView.swift
//  svolta-serate-iOS
//
//  Created by Davide Vitiello on 16/11/22.
//

import SwiftUI
import MapKit

struct MappaView: View {
    
    @ObservedObject private var evento_service = EventoModel()
    
    @State public var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.333029, longitude: 11.920728), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        Map(
            
            coordinateRegion: $region,
            
            annotationItems: evento_service.eventi, annotationContent: { evento in
                
                MapMarker(coordinate: evento.posizione.toCLLocation())
                
                
            }
        )
    
        
        .onAppear(){
            evento_service.getEventi()
        }
    };
}

struct MappaView_Previews: PreviewProvider {
    static var previews: some View {
        MappaView()
    }
}
