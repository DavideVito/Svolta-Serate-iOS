//
//  Posizione.swift
//  svolta-serate-iOS
//
//  Created by Davide Vitiello on 16/11/22.
//

import Foundation
import MapKit


public class Posizione
{

    public let latitudine: Double
    public let longitudine: Double
    
    
    init(latitudine: Double, longitudine: Double)
    {
        
        self.latitudine = latitudine
        self.longitudine = longitudine
    }
    
    public func toCLLocation() -> CLLocationCoordinate2D
    {
        return CLLocationCoordinate2D(latitude: self.latitudine, longitude: self.longitudine)
    }
    
     
}
