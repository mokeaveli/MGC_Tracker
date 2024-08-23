//
//  HoleView.swift
//  MGC_Tracker
//
//  Created by Mike on 23/08/2024.
//

import SwiftUI

struct HoleView: View {
    @ObservedObject var viewModel: GolfTrackerViewModel
    @State private var yardage = ""
    @State private var club = ""
    @State private var rating = ""

    var body: some View {
        VStack {
            TextField("Yardage", text: $yardage)
                .keyboardType(.numberPad)
                .padding()

            TextField("Club", text: $club)
                .padding()

            TextField("Rating", text: $rating)
                .keyboardType(.numberPad)
                .padding()

            Button("Add Shot") {
                if let yardageInt = Int(yardage), let ratingInt = Int(rating) {
                    viewModel.addShot(yardage: yardageInt, club: club, rating: ratingInt)
                    self.yardage = ""
                    self.club = ""
                    self.rating = ""
                }
            }

            Button("End Hole") {
                viewModel.endHole()
            }
        }
        .navigationTitle("Current Hole")
    }
}

