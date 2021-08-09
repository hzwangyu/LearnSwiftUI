//
//  Cardify.swift
//  Memorize
//
//  Created by hzwangyu on 2021/6/21.
//

import SwiftUI

struct Cardify: ViewModifier {

    func body(content: Content) -> some View {
        let shape = Rectangle()
        ZStack {
            shape
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 3)
                .padding()
            content
        }
    }
}

extension View {
    func cardify() -> some View {
        self.modifier(Cardify())
    }
}
