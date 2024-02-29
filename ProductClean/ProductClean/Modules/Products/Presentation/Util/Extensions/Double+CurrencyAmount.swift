//
//  Double+CurrencyAmount.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 26/02/24.
//

import Foundation

extension Double {
    
    /// It converts a double amount to a string with currency
    /// For example double value -> 100, return value -> "$100"
    func getAmountWithCurrency() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.locale = Locale(identifier: AppConstant.currencyIndentifier)
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
