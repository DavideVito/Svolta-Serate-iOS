//
//  CustomPin.swift
//  svolta-serate-iOS
//
//  Created by Davide Vitiello on 17/11/22.
//

import SwiftUI
import Foundation


struct CustomPin: View {
    @State public var evento: Evento
    
    var body: some View {
        BlurhashImage(link_foto: evento.foto, blurhash: evento.blurhash, dimensioni: CGSize(width: 44,height: 44))
    }
}

