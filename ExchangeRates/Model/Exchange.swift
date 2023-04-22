//
//  Exchange.swift
//  ExchangeRates
//
//  Created by Oliver Finlayson on 2023-04-20.
//

import Foundation

struct ListOfCurrencies: Codable {
    var symbols: Symbols
}

struct Symbols: Codable {
    var AUD: String
    var BRL: String
    var BTC: String
    var CAD: String
    var CHF: String
    var CNY: String
    var EGP: String
    var EUR: String
    var GBP: String
    var HKD: String
    var INR: String
    var JPY: String
    var MXN: String
    var NZD: String
    var RUB: String
    var TRY: String
    var USD: String
    var ZAR: String
}
