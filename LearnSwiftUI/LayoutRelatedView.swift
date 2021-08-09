//
//  LayoutRelatedView.swift
//  LearnSwiftUI
//
//  Created by hzwangyu on 2021/8/8.
//

import SwiftUI

struct LayoutRelatedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(showsIndicators: false) {
                // 竖直排列
                HStack {
                    Text("VStack")
                        .font(.headline)
                    Spacer()
                    VStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                    }
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 200)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(radius: 3)
                }.padding()
                // 水平排列
                HStack {
                    Text("HStack")
                        .font(.headline)
                    Spacer()
                    HStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                    }
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 100)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(radius: 3)
                }.padding()
                // 重叠排列
                HStack {
                    Text("ZStack")
                        .font(.headline)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .offset(CGPoint(x: -5, y: -5))
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .offset(CGPoint(x: 5, y: 20))
                    }
                    .opacity(0.7)
                    .foregroundColor(.red)
                    .frame(width: 200, height: 100)
                    .padding()
                    .padding(.bottom)
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(radius: 3)
                }.padding()
            }
        }
        .navigationTitle("排版视图")
        .padding()
    }
}

struct LayoutRelatedView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutRelatedView()
    }
}
