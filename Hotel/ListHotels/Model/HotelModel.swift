//
//  HotelModel.swift
//  Hotel
//
//  Created by Per Pert on 7/31/19.
//  Copyright © 2019 Petro. All rights reserved.

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct ResponseHotel: Codable {
    let status: String
    let response: Response
}

struct Response: Codable {
    let hotels: [Hotel]
}

struct Hotel: Codable {
    let hotelName, descriprionHotel: String
    let hoteAdress: String?
    let rooms: [Room]
}

struct Room: Codable {
    let roomPrice, roomNumber: String
    let roomCategory: RoomCategory
    let roomIsFree: Bool
    let roomDescription: String
    let image: [String]?
}

enum RoomCategory: String, Codable {
    case econom = "econom"
    case lux = "lux"
    case standart = "standart"
    case superlux = "superlux"
}

class HotelFunctions {
    
    func CountRoomIsFree(hotel: Hotel) -> Int {
        var freeRooms = 0
        for room in hotel.rooms {
            if room.roomIsFree {
                freeRooms += 1
            }
        }
        return freeRooms
    }
}

