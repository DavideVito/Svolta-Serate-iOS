//
//  DettaglioEventoView.swift
//  svolta-serate-iOS
//
//  Created by Davide Vitiello on 16/11/22.
//

import SwiftUI
import MapKit

struct DettaglioEventoView: View {
    @State public var evento: Evento
    @State public var region: MKCoordinateRegion
    
    
    
    var body: some View {
        
        
        VStack {
            
            
            Text(evento.nome)
                .font(.largeTitle)
                .frame(alignment: .center)
            
            
            
            BlurhashImage(link_foto: evento.foto, blurhash: evento.blurhash, dimensioni: CGSize(width: 200, height: 200))
            
            
            
            
            
            VStack{
                Text("Descrizione")
                    .font(.title2)
                    .padding(.bottom)
                
                Text(evento.descrizione)
                
                
            }
            .padding(.top)
            
            
            //Map(
            //
            //    coordinateRegion: $region,
            //    interactionModes: .zoom,
            //    showsUserLocation: true,
            //
            //    annotationItems: [evento],
            //    annotationContent: { evento in
            //        MapMarker(coordinate: evento.posizione.toCLLocation())
            //    }
            //).padding(.top)
            
            
            
            
            
            
        }
        
        .padding(.horizontal)
        
        
    }
}

