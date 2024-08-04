//
//  CalculatorMidel.swift
//  MoexCalculator
//
//  Created by Кирилл Кашицкий on 04.08.2024.
//

import Foundation

struct CalculatorModel {
    private(set) var currenceRates = CurrencyRates()
    
    mutating func setCurrencyRates(_ currencyRates: CurrencyRates) {
        self.currenceRates = currencyRates
    }
    
    func convert(_ source: CurrencyAmount, to target: Currency) -> Double {
        guard
            let sourceRate = currenceRates[source.currency],
            let targetRate = currenceRates[target]
        else { return 0 }
        
        if targetRate.isZero {
            return 0
        } else {
            return source.amount * sourceRate / targetRate
        }
    }
}
