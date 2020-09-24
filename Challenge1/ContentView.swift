//
//  ContentView.swift
//  Challenge1
//
//  Created by Angela Chen on 9/24/20.
//  Copyright © 2020 Angela Chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let temperaturePicker = ["Celcius", "Fahrenheit", "Kelvin"]
    let temps = [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
    @State private var input = ""
    @State private var temperaturePickNumInput = 0
    @State private var temperaturePickNumOutput = 0
    
    var resultValue: Double {
        let value = Double(input) ?? 0
        let inputVal = Measurement(value: value, unit: temps[temperaturePickNumInput])
        
        return inputVal.converted(to: temps[temperaturePickNumOutput]).value
    }
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("What unit are you starting with?")) {
                   Picker("Temperature", selection: $temperaturePickNumInput) {
                        ForEach(0 ..< temperaturePicker.count) {
                            Text("\(self.temperaturePicker[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    TextField("Put number here", text: $input).keyboardType(.decimalPad)
                    
                    
                }
                Section(header: Text("What unit do you want to end with?")) {
                   Picker("Temperature", selection: $temperaturePickNumOutput) {
                        ForEach(0 ..< temperaturePicker.count) {
                            Text("\(self.temperaturePicker[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                Section(header: Text("Resulting value")) {
                    Text("\(resultValue)")
                }
            }
        }.navigationBarTitle("WeSplit")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
