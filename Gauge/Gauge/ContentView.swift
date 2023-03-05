//
//  ContentView.swift
//  Gauge
//
//  Created by Martin Piccato on 05/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 0.5
    var body: some View {
        Form {
            Section("Lineal") {
                Gauge(value: value) {
                    Text("Value")
                }
                Gauge(value: value) {
                    Text("Value con %")
                } currentValueLabel: {
                    Text(updateValueToString())
                }
                Gauge(value: value) {
                    Text("Value")
                }.gaugeStyle(.accessoryLinear)
                    .tint(.red)
                Gauge(value: value) {
                    Text("Value con %")
                } currentValueLabel: {
                    Text(updateValueToString())
                }.gaugeStyle(.accessoryLinear)
                    .tint(.green)
                Gauge(value: value) {
                    Text("Value")
                }.gaugeStyle(.accessoryLinearCapacity)
                    .tint(.blue)
                Gauge(value: value) {
                    Text("Value con %")
                } currentValueLabel: {
                    Text(updateValueToString())
                }.gaugeStyle(.accessoryLinearCapacity)
                    .tint(.blue)
                
            }
            Section("Circular") {
                Gauge(value:value) {
                    
                } currentValueLabel: {
                    Text(updateValueToString())
                }
                .gaugeStyle(.accessoryCircular)
                    .tint(.red)
                HStack {
                    Gauge(value:value) {
                        Image(systemName: "wifi", variableValue: value)
                        
                    } currentValueLabel: {
                        Text(updateValueToString())
                    }
                    .gaugeStyle(.accessoryCircular)
                        .tint(.orange)
                    
                    Gauge(value:value) {
                        Image(systemName: "cellularbars", variableValue: value)
                        
                    } currentValueLabel: {
                        Text(updateValueToString())
                    }
                    .gaugeStyle(.accessoryCircular)
                        .tint(.purple)
                    
                }
                
            }
            Section {
                Slider(value: $value) {
                    Text("Actualizar valores")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                }
            }
        }
    }
    func updateValueToString() -> String {
        let formattedString = Int(self.value * 100)
        return "\(formattedString)" + "%"
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
