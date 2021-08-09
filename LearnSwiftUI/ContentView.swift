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
        ViewCard(id: 3, name: "绘图视图", icon: "square.on.circle", type: .shape),
        ViewCard(id: 4, name: "控制视图", icon: "switch.2", type: .control)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                GeometryReader { geometry in
                    LazyVGrid(columns: [adaptiveGridItem(width: widthThatFits(in: geometry.size))], spacing: 32) {
                        ForEach(viewCards) { card in
                            NavigationLink(destination: destination(of: card.type)) {
                                VStack(spacing: 10) {
                                    Image(systemName: card.icon)
                                    Text(card.name)
                                }
                                .frame(width: widthThatFits(in: geometry.size) - 64)
                                .aspectRatio(/*@START_MENU_TOKEN@*/1.5/*@END_MENU_TOKEN@*/, contentMode: .fit)
                            }
                            .cardify()
                            
                        }
                    }
                    .foregroundColor(.blue)
                }
            }
            .padding(.vertical)
            .navigationBarTitle("SwiftUI 视图列表", displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    private func widthThatFits(in size: CGSize) -> CGFloat {
        print(size.width)
        return floor(size.width / 2)
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
            case .control:
                ControlRelatedView()
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
    case control
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
