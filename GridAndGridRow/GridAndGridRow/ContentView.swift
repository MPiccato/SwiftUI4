//
//  ContentView.swift
//  GridAndGridRow
//
//  Created by Martin Piccato on 05/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid(horizontalSpacing: 10, verticalSpacing: 20) {
            GridRow {
                
                Text("File 1")
                ForEach(0..<2) {
                    _ in Circle().fill(.red.gradient)
                }
            }
            GridRow {
                Text("File 2")
                ForEach(0..<6) {
                    _ in Circle().fill(.orange.gradient)
                }
            }
            GridRow {
                Text("File 3")
                ForEach(0..<4) {
                    _ in Circle().fill(.purple.gradient)
                }
            }
            GridRow {
                Text("File 4")
                ForEach(0..<5) {
                    _ in Circle().fill(.blue.gradient)
                }
            }
            
            
        }
        
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
