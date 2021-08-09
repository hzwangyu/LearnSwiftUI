//
//  ControlRelatedView.swift
//  LearnSwiftUI
//
//  Created by hzwangyu on 2021/8/9.
//

import SwiftUI
import MapKit

struct ControlRelatedView: View {
    
    @State var toggleValue: Bool = false
    
    @State var pickerValue = 0
    var pickerOptions = ["步行", "自行车", "汽车"]
    
    @State var sliderValue = 30.0
    @State var stepperValue = 0
    
    @State var selectedDate = Date()
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -100, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 100, to: Date())!
        return min...max
    }
    
    @State var progressValue = 0.5
    @State var location = MKCoordinateRegion(center: .init(latitude: 30.192685, longitude: 120.252095), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Toggle").font(.headline)
                    Toggle("音效", isOn: $toggleValue)
                        .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                }
                .frame(height: 80)
                .cardify()
                
                VStack(alignment: .leading) {
                    Text("Button").font(.headline)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Label("播放", systemImage: "play.fill").font(.headline)
                    })
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                }
                .frame(height: 80)
                .cardify()
            }
            
            VStack(alignment: .leading) {
                Text("Picker pick \(pickerOptions[pickerValue])").font(.headline)
                Picker("Picker", selection: $pickerValue) {
                    ForEach(0..<pickerOptions.count, id: \.self) { index in
                        Text(pickerOptions[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            .cardify()
            
            
            VStack(alignment: .leading) {
                Text("Slider").font(.headline)
                HStack {
                    Image(systemName: "sun.min")
                    Slider(value: $sliderValue, in: 0...100)
                    Image(systemName: "sun.max.fill")
                }
            }
            .cardify()
            
            VStack(alignment: .leading) {
                Text("Stepper").font(.headline)
                Stepper(value: $stepperValue, in: -5...5, step: 1) {
                    Text("当前数值： \(stepperValue)")
                }
            }
            .cardify()
            
            VStack(alignment: .leading) {
                Text("DatePicker").font(.headline)
                DatePicker(
                    selection: $selectedDate,
                    in: dateRange,
                    displayedComponents: [.date, .hourAndMinute],
                    label: {
                        Text("截止日期")
                    }
                )
            }
            .cardify()
            
            HStack {
                Text("Context").font(.headline)
                Spacer()
                Label("长按菜单", systemImage: "ellipsis.circle")
                    .contextMenu {
                        Button("选项 A") { }
                        Button("选项 B") { }
                    }
            }
            .cardify()
            
            VStack(alignment: .leading) {
                Text("ProgressView").font(.headline)
                Spacer()
                ProgressView(value: progressValue)
            }
            .cardify()
            
            VStack(alignment: .leading) {
                Text("Map").font(.headline)
                Map(coordinateRegion: $location)
                    .frame(width: 300, height: 300, alignment: .center)
                    .cornerRadius(15)
            }
            .cardify()
            
        }
        .navigationTitle("控制视图")
        .padding()
    }
}

struct ControlRelatedView_Previews: PreviewProvider {
    static var previews: some View {
        ControlRelatedView()
            .preferredColorScheme(.light)
        ControlRelatedView()
            .preferredColorScheme(.dark)
    }
}
