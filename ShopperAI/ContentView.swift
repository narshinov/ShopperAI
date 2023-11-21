//
//  ContentView.swift
//  ShopperAI
//
//  Created by Nikita Arshinov on 21.11.23.
//

import SwiftUI

struct ContentView: View {
    
    private var products = [
        "banana",
        "apples",
        "chees",
        "milk",
        "oranges"
    ]
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(products, id: \.self) {
                    CardView(product: $0)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
