//
//  ContentView.swift
//  MGC_Tracker
//
//  Created by Mike on 23/08/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = GolfTrackerViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let currentRound = viewModel.currentRound {
                    NavigationLink("Continue Round", destination: RoundView(viewModel: viewModel))
                } else {
                    Button("Start Round") {
                        viewModel.startRound()
                    }
                }

                List(viewModel.completedRounds) { round in
                    Text("Round on \(round.id)")
                }

            }
            .navigationTitle("Golf Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

