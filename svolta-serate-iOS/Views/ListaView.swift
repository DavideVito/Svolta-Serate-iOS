//
//  ListaView.swift
//  svolta-serate-iOS
//
//  Created by Davide Vitiello on 16/11/22.
//

import SwiftUI
import MapKit

struct ListaView: View {
    
    @ObservedObject private var evento_service = EventoModel()
    
    
    var body: some View {
        
        
        NavigationStack{
             
            List(evento_service.eventi) { evento in
                
                NavigationLink(value: evento) {
                    
                    VStack()
                    {
                        
                        HStack(spacing: 100)
                        {
                            BlurhashImage(link_foto: evento.foto, blurhash: evento.blurhash, dimensioni: CGSize(width: 50, height: 50))
                            Text(evento.nome).bold()
                        }
                        
                        Text(evento.descrizione.prefix(100))
                            .font(.subheadline)
                        
                    }
                    
                }
                .navigationDestination(for: Evento.self) { evt in
                    DettaglioEventoView(evento: evt, region: MKCoordinateRegion(center: evt.posizione.toCLLocation(), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)))
                }
                .navigationTitle("Eventi")
                
            }
            
        }
        
       
        .onAppear{
            evento_service.getEventi()
        }
    }
}

struct ListaView_Previews: PreviewProvider {
    static var previews: some View {
        ListaView()
    }
}
