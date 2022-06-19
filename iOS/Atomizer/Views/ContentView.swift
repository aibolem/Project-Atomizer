//
//  ContentView.swift
//  Atomizer
//
//  Created by John Seong on 2022-06-19.
//

import SwiftUI

struct ContentView: View {
    // Detect whether OS is on dark mode or light mode
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedControl: Controls = Controls.transform
    
    // Entry point
    var body: some View {
        NavigationView {
            landingPage()
        }
    }
    
    private func landingPage() -> some View {
        LazyVStack {
            topSection()
            buttonOptions()
            
            Text("Developed and Designed by **John Seong**.")
                .fontWeight(.light)
                .padding()
        }
    }
    
    private func topSection() -> some View {
        return (
            LazyVStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.leading, 50.0)
                    .padding(.trailing, 50.0)
                    .padding(.bottom, 2.5)
                
                Text("A **Remote** for **ElectronVisualized**.")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
            }
        )
    }
    
    private func buttonOptions() -> some View {
        return (
            LazyVStack {
                NavigationLink(destination: ControlView(selectedControl: self.$selectedControl)) {
                    Button(action: {
                        self.selectedControl = Controls.transform
                    }) {
                        HStack {
                            Image(systemName: "arrow.up.right.and.arrow.down.left.rectangle.fill")
                            
                            Text("**Transform** Position")
                                .font(.body)
                        }
                        .padding(8)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .contentShape(Rectangle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                        )
                    }
                    .padding(2.5)
                }
                
                NavigationLink(destination: ControlView(selectedControl: self.$selectedControl)) {
                    Button(action: {
                        self.selectedControl = Controls.camera
                    }) {
                        HStack {
                            Image(systemName: "arrow.triangle.2.circlepath.camera.fill")
                            Text("**Camera** View")
                                .font(.body)
                        }
                        .padding(8)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .contentShape(Rectangle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                        )
                    }
                    .padding(2.5)
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
