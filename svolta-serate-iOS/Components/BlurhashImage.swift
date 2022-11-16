//
//  BlurhashImage.swift
//  svolta-serate-iOS
//
//  Created by Davide Vitiello on 16/11/22.
//

import SwiftUI

struct BlurhashImage: View {
    
    @State public var link_foto: String
    @State public var blurhash: String
    @State public var dimensioni: CGSize
    
    var body: some View {
        
        
        AsyncImage(
            url: URL(string: link_foto),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: dimensioni.width, maxHeight: dimensioni.height)
            },
            
            placeholder: {
                Image(uiImage: UIImage(blurHash: blurhash, size: dimensioni)!)
            }
            
           
                                    
        )
        
        
    }
}

struct BlurhashImage_Previews: PreviewProvider {
    static var previews: some View {
        BlurhashImage(link_foto: "", blurhash: "", dimensioni: CGSize(width: 100, height: 100))
    }
}
