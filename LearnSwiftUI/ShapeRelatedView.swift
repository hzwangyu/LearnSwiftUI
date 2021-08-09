//
//  ShapeRelatedView.swift
//  LearnSwiftUI
//
//  Created by hzwangyu on 2021/8/8.
//

import SwiftUI

struct ShapeRelatedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(showsIndicators: false) {
                HStack() {
                    Text("Rectangle")
                    Spacer()
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                }
                HStack {
                    Text("RoundedRectangle")
                    Spacer()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.orange)
                    
                }
                HStack {
                    Text("Circle")
                    Spacer()
                    Circle()
                        .frame(width: 100, height: 100)
                        
                        .foregroundColor(.red)
                    
                }
                HStack {
                    Text("Capsule")
                    Spacer()
                    Capsule()
                        .frame(width: 100, height: 50)
                        .foregroundColor(.blue)
                }
                HStack {
                    Text("Ellipse")
                    Spacer()
                    Ellipse()
                        .frame(width: 100, height: 50)
                        .foregroundColor(.green)
                }
                
            }
        }
        .navigationTitle("绘图视图")
        .padding()
    }
}

struct ShapeRelatedView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeRelatedView()
    }
}
