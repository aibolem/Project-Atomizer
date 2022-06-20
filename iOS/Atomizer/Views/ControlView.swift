//
//  ControlView.swift
//  Atomizer
//
//  Created by John Seong on 2022-06-19.
//

import SwiftUI
import CoreMotion

struct ControlView: View {
    @Binding var selectedControl: Controls
    
    var body: some View {
        switch (selectedControl) {
        case Controls.transform:
            transformPage()
        case Controls.camera:
            cameraPage()
        }
    }
    
    private func transformPage() -> some View {
        return (
            Text("**Transform** Position")
                .font(.largeTitle)
        )
    }
    
    private func cameraPage() -> some View {
        return (
            Text("**Camera** View")
                .font(.largeTitle)
        )
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
