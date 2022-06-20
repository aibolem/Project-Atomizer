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
    
    @State private var isConnected: Bool = false
    
    @State private var accessToken: String = ""
    
    // Entry point
    var body: some View {
        NavigationView {
            landingPage()
        }
    }
    
    private func landingPage() -> some View {
        LazyVStack {
            topSection()
            if (isConnected) {
                // Use JWS (JSON token) for communication
                buttonOptionsWhenConnected()
            }
            else {
                buttonOptionsWhenIdle()
            }
            bottomSection()
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
    
    private func buttonOptionsWhenIdle() -> some View {
        return (
            LazyVStack {
                TextField(
                    "Enter your unique access token...",
                    text: $accessToken
                )
                .padding(5)
                .onSubmit {
                    
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                .padding()
                
                NavigationLink(destination: ControlView(selectedControl: self.$selectedControl)) {
                    
                    HStack {
                        Image(systemName: "wifi")
                        
                        Text("Connect")
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
                .simultaneousGesture(TapGesture().onEnded {
                    self.selectedControl = Controls.transform
                })
            }
        )
    }
    
    private func buttonOptionsWhenConnected() -> some View {
        return (
            LazyVStack {
                NavigationLink(destination: ControlView(selectedControl: self.$selectedControl)) {
                    
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
                .simultaneousGesture(TapGesture().onEnded {
                    self.selectedControl = Controls.transform
                })
                
                
                NavigationLink(destination: ControlView(selectedControl: self.$selectedControl)) {
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
                .simultaneousGesture(TapGesture().onEnded {
                    self.selectedControl = Controls.camera
                })
            }
        )
    }
    
    private func bottomSection() -> some View {
        return (
            Text("Developed and Designed by **John Seong**.")
                .fontWeight(.light)
                .padding()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
