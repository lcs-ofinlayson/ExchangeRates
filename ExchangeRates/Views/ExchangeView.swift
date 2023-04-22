//
//  ExchangeView.swift
//  ExchangeRates
//
//  Created by Oliver Finlayson on 2023-04-20.
//

import SwiftUI

struct ExchangeView: View {
    @State var listOfCurrencies: ListOfCurrencies = ListOfCurrencies(symbols: Symbols(AUD: "", BRL: "", BTC: "", CAD: "", CHF: "", CNY: "", EGP: "", EUR: "", GBP: "", HKD: "", INR: "", JPY: "", MXN: "", NZD: "", RUB: "", TRY: "", USD: "", ZAR: ""))
    let symbols = ["AUD", "BRL", "BTC", "CAD", "CHF", "CNY", "EGP", "EUR", "GBP", "HKD", "INR", "JPY", "MXN", "NZD", "RUB", "TRY", "USD", "ZAR"]
    var names: [String] {
        return [listOfCurrencies.symbols.AUD, listOfCurrencies.symbols.BRL, listOfCurrencies.symbols.BTC, listOfCurrencies.symbols.CAD, listOfCurrencies.symbols.CHF, listOfCurrencies.symbols.CNY, listOfCurrencies.symbols.EGP, listOfCurrencies.symbols.EUR, listOfCurrencies.symbols.GBP, listOfCurrencies.symbols.HKD, listOfCurrencies.symbols.INR, listOfCurrencies.symbols.JPY, listOfCurrencies.symbols.MXN, listOfCurrencies.symbols.NZD, listOfCurrencies.symbols.RUB, listOfCurrencies.symbols.TRY, listOfCurrencies.symbols.USD, listOfCurrencies.symbols.ZAR]
    }
    @State var currency1 = 0
    @State var currency2 = 1
    var body: some View {
        VStack(spacing: 30) {
            Text("Exchange Rates")
                .font(.title)
            HStack {
                Text("Convert")
                Picker("Select Currency",selection: $currency1) {
                    ForEach(0..<18) { currency in
                        Text(names[currency])
                    }
                }
            }
            HStack {
                Text("to")
                Picker("Select Currency",selection: $currency2) {
                    ForEach(0..<18) { currency in
                        Text(names[currency])
                    }
                }
            }
            HStack {
                Text("Amount of Currency:")
                TextField("Amount", text: .constant("100"))
            }
            Text("Converted Amount: 73.11")
            Spacer()
        }
        .padding()
        .task {
            await getCurrencies()
        }
    }
    func getCurrencies() async {
        let url = "https://api.apilayer.com/exchangerates_data/symbols"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("FixeMjZs6M6bbiEs1tG0KG3xQLGMBSOq", forHTTPHeaderField: "apikey")
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            listOfCurrencies = try decoder.decode(ListOfCurrencies.self, from: data)
            print(String(data: data, encoding: .utf8)!)
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
    }
}
