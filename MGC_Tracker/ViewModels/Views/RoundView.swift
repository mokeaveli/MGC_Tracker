//
//  RoundView.swift
//  MGC_Tracker
//
//  Created by Mike on 23/08/2024.
//

import SwiftUI

struct RoundView: View {
    @ObservedObject var viewModel: GolfTrackerViewModel

    var body: some View {
        VStack {
            if let currentHole = viewModel.currentHole {
                HoleView(viewModel: viewModel)
            } else {
                Button("Start Hole") {
                    viewModel.startHole()
                }
            }

            List(viewModel.currentRound?.holes ?? []) { hole in
                Text("Hole \(hole.id) - Score: \(hole.score) Rating: \(hole.rating)")
            }

            if viewModel.currentRound?.holes.count == 18 {
                Button("Complete Round") {
                    viewModel.completeRound()
                }
            }
        }
        .navigationTitle("Current Round")
    }
}

