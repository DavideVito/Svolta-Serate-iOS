//
//  ContentView.swift
//  svolta-serate-iOS
//
//  Created by Davide Vitiello on 01/11/22.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var eventi_view_model = EventoModel()
    
    
    let dateFormatter = DateFormatter()

    


    
    
    
    
    
    var body: some View {
        
        
        TabView{
            ListaView().tabItem{
                Label("Lista", systemImage: "list.bullet")
            }
            
            MappaView().tabItem {
                Label("Mappa", systemImage: "map")
            }
            
          
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
