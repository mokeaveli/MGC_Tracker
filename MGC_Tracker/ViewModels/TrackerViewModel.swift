//
//  TrackerViewModel.swift
//  MGC_Tracker
//
//  Created by Mike on 23/08/2024.
//

import SwiftUI

class GolfTrackerViewModel: ObservableObject {
    @Published var currentRound: Round?
    @Published var currentHole: Hole?
    @Published var completedRounds: [Round] = []

    func startRound() {
        currentRound = Round(holes: [])
    }

    func startHole() {
        currentHole = Hole(shots: [])
    }

    func addShot(yardage: Int, club: String, rating: Int) {
        guard var hole = currentHole else { return }
        let shot = Shot(yardage: yardage, club: club, rating: rating)
        hole.shots.append(shot)
        currentHole = hole
    }

    func endHole() {
        guard var round = currentRound, let hole = currentHole else { return }
        round.holes.append(hole)
        currentRound = round
        currentHole = nil
    }

    func completeRound() {
        guard let round = currentRound else { return }
        completedRounds.append(round)
        currentRound = nil
    }
}

