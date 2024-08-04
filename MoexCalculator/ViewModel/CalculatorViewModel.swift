//
//  CalculatorViewModel.swift
//  MoexCalculator
//
//  Created by Кирилл Кашицкий on 04.08.2024.
//

import Foundation

final class CalculatorViewModel: ObservableObject {
    private var model = CalculatorModel()
    
    enum State {
        case loading
        case content
        case error
    }
    
    @Published var state: State = .content
    
    @Published var topCurrency: Currency = .CNY
    @Published var bottomCurrency: Currency = .RUB
    
    @Published var topAmount: Double = 0
    @Published var bottomAmount: Double = 0
    
    func setTopAmount(_ amount: Double) {
        topAmount = amount
        updateBottomAmount()
    }
    
    func setBottomAmount(_ amount: Double) {
        bottomAmount = amount
        updateTopAmount()
    }
    
    func updateTopAmount() {
        let bottomAmount = CurrencyAmount(
            currency: bottomCurrency,
            amount: bottomAmount
        )
        topAmount = model.convert(bottomAmount, to: topCurrency)
    }
    
    func updateBottomAmount() {
        let topAmount = CurrencyAmount(
            currency: topCurrency,
            amount: topAmount
        )
        bottomAmount = model.convert(topAmount, to: bottomCurrency)
    }
}

