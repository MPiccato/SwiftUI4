//
//  ContentView.swift
//  NavigationStack
//
//  Created by Martin Piccato on 05/03/2023.
//

import SwiftUI

struct Fruit: Hashable, Identifiable {
    var id = UUID()
    var name: String
}

struct Developer: Hashable {
    let name: String
}

var fruits: [Fruit] = [
    .init(name: "🟠 orange"),
    .init(name: "🍎 Apple"),
    .init(name: "🍒 Cherries"),
    .init(name: "🍌 Banana"),
    .init(name: "🍓 Strawberry"),
    .init(name: "🍉 Watermelon"),
    .init(name: "🍋 Lemon"),
    .init(name: "🫐 Blueberries"),
]

struct ContentView: View {
    
    let developer: Developer = .init(name: "MP Data Trading")
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section {
                    NavigationLink(developer.name, value: developer)
                }
                Section {
                    List(fruits) { fruit in
                        NavigationLink(fruit.name, value: fruit)
                        
                    }
                    .navigationTitle("Fruits")
                    
                }
            }
            .navigationDestination(for: Fruit.self) { fruit in Text(fruit.name)
            }
            .navigationDestination(for: Developer.self){
                developer in
                VStack {
                    Image(systemName: "laptopcomputer")
                    Text(developer.name)
                }
                .font(.largeTitle)
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
