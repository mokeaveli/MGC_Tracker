//
//  GolfModels.swift
//  MGC_Tracker
//
//  Created by Mike on 23/08/2024.
//

import Foundation

struct Shot: Identifiable {
    var id = UUID()
    var yardage: Int
    var club: String
    var rating: Int
}

struct Hole: Identifiable {
    var id = UUID()
    var shots: [Shot]
    var score: Int {
        return shots.count
    }
    var rating: Double {
        let totalRating = shots.reduce(0) { $0 + $1.rating }
        return Double(totalRating) / Double(shots.count)
    }
}

struct Round: Identifiable {
    var id = UUID()
    var holes: [Hole]
    var score: Int {
        return holes.reduce(0) { $0 + $1.score }
    }
    var rating: Double {
        let totalRating = holes.reduce(0.0) { $0 + $1.rating }
        return totalRating / Double(holes.count)
    }
}

