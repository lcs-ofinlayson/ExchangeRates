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
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
    }
}
