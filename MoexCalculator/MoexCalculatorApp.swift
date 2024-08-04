//
//  MoexCalculatorApp.swift
//  MoexCalculator
//
//  Created by Кирилл Кашицкий on 04.08.2024.
//

import SwiftUI

@main
struct MoexCalculatorApp: App {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
