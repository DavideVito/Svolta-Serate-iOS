//
//  Evento.swift
//  svolta-serate-iOS
//
//  Created by Davide Vitiello on 01/11/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import MapKit

public struct Evento: Identifiable, Hashable{
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public static func == (lhs: Evento, rhs: Evento) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    public let id = UUID()
    
    let descrizione: String
    let data: Date
    let foto: String
    let nome: String
    let partecipanti: Int
    let durata: Int
    let blurhash: String
    let posizione: Posizione
    
    init?(data: [String: Any]) {
        guard
            let descrizione = data["descrizione"] as? String,
            let foto = data["foto"] as? String,
            let nome = data["nome"] as? String,
            let partecipanti = data["partecipanti"] as? Int,
            let durata = data["durata"] as? Int,
            let posizione = data["posizione"] as? [String: Any],
            let latitudine = posizione["latitudine"] as? Double,
            let longitudine = posizione["longitudine"] as? Double,
            let blurhash = data["blurhash"] as? String
                
                
        else {
            return nil
        }
        
        
        self.descrizione = descrizione
        self.foto = foto
        self.nome = nome
        self.partecipanti = partecipanti
        self.durata = durata
        self.data = Date()
        self.blurhash = blurhash
        self.posizione = Posizione(latitudine: latitudine, longitudine: longitudine)
    }
    
    
    
    
    
}

class EventoModel: ObservableObject
{
    
    private var db = Firestore.firestore()
    
    @Published var eventi = [Evento]()
    
  
    
    
    func getEventi() {
        
        
        
    
        
         db.collection("Eventi").whereField("data", isGreaterThanOrEqualTo: Date()).order(by: "data").getDocuments(completion: { querySnapshot, error in
            
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.eventi = documents.compactMap({ (queryDocumentSnapshot) -> Evento? in
                
                return Evento(data:  queryDocumentSnapshot.data())
                
                
                
                
            })
            
            
        })
            
         
        
        
        
        
        
    }
}
