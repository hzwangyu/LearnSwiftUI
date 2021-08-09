//
//  HierarchyRelatedView.swift
//  LearnSwiftUI
//
//  Created by hzwangyu on 2021/8/9.
//

import SwiftUI

struct HierarchyRelatedView: View {
    let circleRadius: CGFloat = 62
    let names = ["天狗", "爆款", "国际", "海外", "超市", "充值", "机票", "金币", "拍卖", "吃货", "分类", "美食", "健康", "生活", "汽车", "闲猪", "会员", "门票", "土货", "鲜食"]
    let emojis = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌","🍉","🍇","🍓", "🫐", "🍈", "🍒", "🍑", "🥭","🍍","🥥","🥝", "🍟", "🧀", "🥑"]
    @State var showModal = false
    @State var showActionSheet = false
    @State var showAlert = false
    @State var showAlert2 = false
    
    var body: some View {
        TabView {
            GeometryReader { fullView in
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { value in
                        HStack {
                            ForEach((0..<names.count), id: \.self) { index in
                                GeometryReader { geo in
                                    VStack {
//                                        let distAbs = abs(fullView.frame(in: .global).midX - geo.frame(in: .global).midX)
//                                        let centered = isCentered(distAbs: distAbs)
                                        
                                        ZStack {
                                            Text("\(emojis[index])").font(.system(size: circleRadius))
                                        }
//                                        .scaleEffect(x: centered ? 1 : 0.7, y: centered ? 1 : 0.7)
                                        Text("\(names[index])")
//                                            .font(centered ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .semibold))
                                    }
                                    .id(index)
                                }.frame(width: circleRadius, height: circleRadius * 2)
                            }.animation(.easeInOut(duration: 0.1))
                        }
                        .onAppear {
                            value.scrollTo(5)
                        }
                    }
                }
                .foregroundColor(.black)
                .padding()
            }
            .foregroundColor(.orange)
            .tabItem {
                Image(systemName: "scroll")
                Text("Scroll")
            }
            
            
            NavigationView {
                VStack {
                    NavigationLink("绘图视图", destination: ShapeRelatedView())
                }
                .font(.headline).cardify()
                .navigationBarTitle("导航视图", displayMode: .automatic)
                .navigationBarItems(
                    leading: Button("左侧按钮") {},
                    trailing:Button("右侧按钮") {}
                )
            }
            .tabItem {
                Image(systemName: "network")
                Text("Navigation")
            }
            
            
            VStack(spacing: 50) {
                Button(action: {
                    showModal.toggle()
                }, label: {
                    Text("显示「长弹窗」").font(.headline).cardify()
                }).sheet(isPresented: $showModal) {
                    ShapeRelatedView()
                }
                
                Button(action: {
                    showActionSheet.toggle()
                }, label: {
                    Text("显示「行动列表」").font(.headline).cardify()
                }).actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(
                        title: Text("要执行什么操作？"),
                        message: Text("补充文字说明"),
                        buttons: [
                            .default(Text("添加至收藏夹"), action: {
                                
                            }),
                            .destructive(Text("删除"), action: {
                                
                            }),
                            .cancel()
                        ]
                    )
                }
                
            }.tabItem {
                Image(systemName: "square.stack")
                Text("Modal")
            }
            
            
            VStack(spacing: 50) {
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Text("显示「允许选择的警告」").font(.headline).cardify()
                }).alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("删除"),
                        message: Text("此操作会永久移除该文件，你确定要继续吗？"),
                        primaryButton: .destructive(Text("是")),
                        secondaryButton: .default(Text("否"))
                    )
                }
                
                Button(action: {
                    showAlert2.toggle()
                }, label: {
                    Text("显示「通知型警告」").font(.headline).cardify()
                }).alert(isPresented: $showAlert2) {
                    Alert(
                        title: Text("用时较长"),
                        message: Text("执行该操作预计用时 5 分钟以上，请保持应用在前台状态。"),
                        dismissButton: .default(Text("我知道了"))
                    )
                }
                
            }.tabItem {
                Image(systemName: "exclamationmark.triangle")
                Text("Alert")
            }
            
            
        }
    }
    
    // 辅助函数，通过距离中点的位置来判断滑动视图中被选中的按钮
    func isCentered(distAbs: CGFloat) -> Bool {
        distAbs < (circleRadius / 2 + 5) ? true : false
    }
}

struct HierarchyRelatedView_Previews: PreviewProvider {
    static var previews: some View {
        HierarchyRelatedView()
    }
}
