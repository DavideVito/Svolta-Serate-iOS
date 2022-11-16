//
//  File.swift
//  svolta-serate-iOS
//
//  Created by Davide Vitiello on 01/11/22.
//

import Foundation
import UIKit

public class Functions
{
    
     static func downloadImageWithURL(url: String) -> UIImage! {
            
            let date = NSData(contentsOf: URL(string: url)!)
            return UIImage(data: date! as Data)
        }
    
}
