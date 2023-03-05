//
//  ContentView.swift
//  Sheet
//
//  Created by Martin Piccato on 05/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            
            Text("Suscribete a MP Data")
                .font(isActive ? .largeTitle.weight(.heavy) : .headline)
                .foregroundStyle(isActive ? .black : .green)
                .padding(isActive ? 20 : 0)
                .background(isActive ? .orange : .clear)
                .cornerRadius(isActive ? 20 : 0)
                .onTapGesture { withAnimation { isActive.toggle()}}
            Button("Abrir Hoja") {
                showSheet.toggle()
            }
            .padding(.top , 32)
        }
        .sheet(isPresented: $showSheet) {
            Text("Novedades de MP Data Trading")
                .presentationDetents([.medium, .fraction(0.2)])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
