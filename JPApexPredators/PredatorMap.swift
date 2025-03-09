//
//  PredatorMap.swift
//  JPApexPredators
//
//  Created by Vaibhav kulkarni on 09/03/25.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators()
    
    @State var position: MapCameraPosition
    @State var statellite = false
    
    var body: some View {
        Map(position: $position){
            ForEach(predators.apexPredators) {
                predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
            }
        }
        .mapStyle(statellite ? .imagery(elevation: .realistic): .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button {
                statellite.toggle()
            } label: {
                Image(systemName: statellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().allApexPredators[2].location, distance: 1000, heading: 250, pitch: 80)))
        .preferredColorScheme(.dark)
}
