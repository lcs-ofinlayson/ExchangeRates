//
//  ExchangeView.swift
//  ExchangeRates
//
//  Created by Oliver Finlayson on 2023-04-20.
//

import SwiftUI

struct ExchangeView: View {
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

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
    }
}
