//
//  TextRelatedView.swift
//  LearnSwiftUI
//
//  Created by hzwangyu on 2021/8/8.
//

import SwiftUI

struct TextRelatedView: View {
    
    @State var textInputField = ""
    @State var secureInputField = ""
    @State var textEditorInput = "TextEditor: 支持点击并编辑多行文字" // 6
    
    var body: some View {
        VStack(alignment: .leading, spacing: 50.0) {
            Text("Text: 仅显示文本，不支持输入")
            
            Label("Label: 显示文本和图标，不支持输入", systemImage: "text.justify")
            
            TextField("TextField: 支持用户输入单行信息", text: $textInputField).textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            SecureField("SecureField: 支持输入，但不明码显示", text: $secureInputField).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Link("Link: 点击并跳转链接", destination: URL(string: "https://www.apple.com.cn/")!)
            
            TextEditor(text: $textEditorInput)
            
        }
        .navigationTitle("文本视图")
        .padding()
    }
}

struct TextRelatedView_Previews: PreviewProvider {
    static var previews: some View {
        TextRelatedView()
    }
}
