//
//  ContentView.swift
//  LearnSwiftUI
//
//  Created by hzwangyu on 2021/8/8.
//

import SwiftUI

struct ContentView: View {
    
    private let viewCards: [ViewCard] = [
        ViewCard(id: 1, name: "文本视图", icon: "textbox", type: .text),
        ViewCard(id: 2, name: "排版视图", icon: "text.alignleft", type: .layout),
        ViewCard(id: 3, name: "绘图视图", icon: "square.on.circle", type: .shape)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                GeometryReader { geometry in
                    LazyVGrid(columns: [adaptiveGridItem(width: floor(geometry.size.width / 2))], spacing: 0) {
                        ForEach(viewCards) { card in
                            NavigationLink(destination: destination(of: card.type)) {
                                Label(card.name, systemImage: card.icon)
                                    .cardify()
                                    .aspectRatio(1.5, contentMode: .fit)
                            }
                        }
                    }
                    .foregroundColor(.orange)
                }.padding()
            }
            .navigationBarTitle("SwiftUI 视图列表", displayMode: .large)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    private func destination(of cardType: CardType) -> some View {
        return VStack {
            switch cardType {
            case .text:
                TextRelatedView()
            case .layout:
                LayoutRelatedView()
            case .shape:
                ShapeRelatedView()
            }
        }
    }
    
}

struct ViewCard: Identifiable {
    var id: Int
    var name: String
    var icon: String
    var type: CardType
}

enum CardType {
    case text
    case layout
    case shape
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
