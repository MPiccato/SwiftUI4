//
//  ContentView.swift
//  MultiDatePicker_ShareLink
//
//  Created by Martin Piccato on 05/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate: Set<DateComponents> = []
    @State private var finalDates: String = ""
    let url = URL(string: "https://www.mpiccato.com.ar")!
    
    var body: some View {
        
        Form {
            MultiDatePicker(selection: $selectedDate, in: .now...) {
                       Label("Elige una fecha", systemImage: "calendar.badge.plus")
            }
            .onChange(of: selectedDate) { _ in
                getDatesFormatted()
            }
        
            Section {
                Text(finalDates)
            }
            
        }
        ShareLink("Suscribete MP Data Trading",
                  item: url,
                  subject: Text("Fechas de..."),
                  message: Text(finalDates)
        )
    }
    
    func getDatesFormatted() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YY"
        
        let dates = selectedDate
            .compactMap { Calendar.current.date(from: $0)}
            .map { formatter.string(from: $0)}
        finalDates = dates.joined(separator: "\n")
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
