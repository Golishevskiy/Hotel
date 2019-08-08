//
//  ResponseAndParse.swift
//  Hotel
//
//  Created by Per Pert on 7/30/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import Foundation

class Parse {
    
    func loadJson(filename fileName: String) -> [Hotel]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseHotel.self, from: data)
                return jsonData.response.hotels
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

