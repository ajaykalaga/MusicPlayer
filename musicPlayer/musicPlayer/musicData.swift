//
//  musicData.swift
//  musicPlayer
//
//  Created by Ajay Sharma on 27/04/21.
//  Copyright © 2021 Ajay Sharma. All rights reserved.
//

import Foundation

struct musicData: Decodable {
    let results: [Results]
    
    
}
struct Results: Decodable {

    var  artistName: String
    var  trackName: String
    
    }

