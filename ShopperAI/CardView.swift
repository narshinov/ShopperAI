//
//  CardView.swift
//  ShopperAI
//
//  Created by Nikita Arshinov on 21.11.23.
//

import SwiftUI

struct CardView: View {
    var product: String
    
    @State private var color: Color = .black
    @State private var offset = CGSize.zero

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 320, height: 420)
                .border(.white, width: 6)
                .clipShape(.rect(cornerRadius: 4))
                .foregroundStyle(color.opacity(0.9))
                .shadow(radius: 4)
            Text(product)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .bold()
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged {
                    offset = $0.translation
                    withAnimation {
                        changeColor(width: offset.width)
                    }
                }
                .onEnded {_ in
                    withAnimation {
                        swipeCard(width: offset.width)
                    }
                }
        )
    }
}

private extension CardView {
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            offset = CGSize(width: -500, height: .zero)
            
        case 150...500:
            offset = CGSize(width: 500, height: .zero)
            
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
            
        case 130...500:
            color = .green
            
        default:
            color = .black
        }
    }
}

#Preview {
    CardView(product: "Milk")
}
