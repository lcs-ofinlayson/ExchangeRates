//
//  ExchangeView.swift
//  ExchangeRates
//
//  Created by Oliver Finlayson on 2023-04-20.
//

import SwiftUI

struct ExchangeView: View {
    @State var listOfCurrencies: ListOfCurrencies = ListOfCurrencies(symbols: Symbols(AUD: "", BRL: "", BTC: "", CAD: "", CHF: "", CNY: "", EGP: "", EUR: "", GBP: "", HKD: "", INR: "", JPY: "", MXN: "", NZD: "", RUB: "", TRY: "", USD: "", ZAR: ""))
    var body: some View {
        VStack(spacing: 30) {
            Text("Exchange Rates")
                .font(.title)
            HStack {
                Text("Convert")
                Picker("Select Currency",selection: .constant(0)) {
                    Text("CAD")
                }
                Text("to")
                Picker("Select Currency",selection: .constant(0)) {
                    Text("USD")
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
