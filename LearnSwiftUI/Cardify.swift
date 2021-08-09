//
//  Cardify.swift
//  Memorize
//
//  Created by hzwangyu on 2021/6/21.
//

import SwiftUI

struct Cardify: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color("WhiteDarkMode"))
            .cornerRadius(15)
            .shadow(radius: 3)
            .padding(3)
    }
}

extension View {
    func cardify() -> some View {
        self.modifier(Cardify())
    }
}
