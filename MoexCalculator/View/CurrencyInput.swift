//
//  CurrencyInput.swift
//  MoexCalculator
//
//  Created by Кирилл Кашицкий on 04.08.2024.
//

import SwiftUI

struct CurrencyInput: View {
    
    var currency: Currency
    var amount: Double
    let calculator: (Double) -> Void
    let tapHandler: () -> Void
    
    var numberFormatter: NumberFormatter = { // 13
        var nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.usesGroupingSeparator = false
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    var body: some View {
        HStack {
            VStack {
                Text(currency.flag)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                
                Text(currency.rawValue)
                    .font(.title2)
            }
            .frame(height: 100)
            .onTapGesture(perform: tapHandler)
            
            let binding = Binding<Double> (
                get: {
                    amount
                },
                set: {
                    calculator($0)
                }
            )
            
            TextField("", value: binding, formatter: numberFormatter) // 7
                .font(.largeTitle)
                .multilineTextAlignment(.trailing)
                .minimumScaleFactor(0.5)
                .keyboardType(.numberPad)
        }
    }
}

struct CurrencyInput_Previewvs: PreviewProvider {
    static var previews: some View {
        CurrencyInput(
            currency: .RUB,
            amount: 1000,
            calculator: { _ in },
            tapHandler: {}
        )
    }
}

