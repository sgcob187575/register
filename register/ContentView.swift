//
//  ContentView.swift
//  register
//
//  Created by 陳昱豪 on 2019/11/9.
//  Copyright © 2019 Chen_Yu_Hao. All rights reserved.
//

import SwiftUI
extension CGFloat {
    public func show ()-> Int {
        return Int(self)
    }
}
struct ContentView: View {
    @State private var name = ""
    var accounts = Array<People>()
    @State private var selectfavo=0
    @State private var selectsong=0
    @State private var account=""
    @State private var selectDate = Date()
    @State private var isReg=false
    @State private var showalert=false
    @State private var showsecond=false
    @State private var showsong=false
    @State private var scale: CGFloat = 1
    @State private var bright: Double = 0.2
    @State private var grade:Array<CGFloat>=[0,0,0,0,0]
    let today=Date()
    let startdate=Calendar.current.date(byAdding: .year,value: -100, to: Date())!
    let members=["阿璞","阿電","小橘","劉逼","霸天"]
    let songs=[allsong[55],allsong[54],allsong[0]]
    var body: some View {
        NavigationView {
            VStack{
                photoblend(scale: self.scale, bright: self.bright,selectfavo: self.selectfavo).offset(y:-50)
                Form {
                    scaleslider(scale:self.$scale)
                    brightslider(bright: self.$bright)
                    filedname(name: self.$name)
                    DatePicker("生日",selection: self.$selectDate,in: self.startdate...self.today, displayedComponents: .date)
                    Toggle("是否已加入夭怪村",isOn: $isReg)
                    if isReg{
                        TextField("妖怪村帳號", text: $account).padding().overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 2))

                    }
                    memberpicker(selectfavo: self.$selectfavo)
                    Slider(value: $grade[selectfavo], in: 0...831,step: 3, minimumValueLabel: Text("0"), maximumValueLabel:Text("831")){
                        Text("")
                        
                    }.accentColor(.orange)
                    Stepper(value:self.$grade[selectfavo]){
                        Text("對\(members[selectfavo])\(grade[selectfavo].show())分的愛")
                    }
                    Picker("選一首歌",selection: self.$selectsong){
                        ForEach(0..<songs.count){(index) in
                            Text(self.songs[index].name)
                        }
                    }
                }.offset(y:-50)

                Buttontwo(grade:self.grade,selectsong:selectsong, showsecond:self.$showsecond, showalert:self.$showalert, showsong:self.$showsong).frame(height:2)
            }.alert(isPresented: $showalert) { () -> Alert in
                let answer = "阿璞真的帥"
                return Alert(title: Text(answer),message: Text("但是滿分太過分了"))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct filedname: View {
    @Binding var name:String
    var body: some View {
        TextField("你的名字", text: self.$name)
            .padding().overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 3))
    }
}

struct memberpicker: View {
    
    @Binding var selectfavo:Int
    let members=["阿璞","阿電","小橘","劉逼","霸天"]
    var body: some View {
        Picker("最愛的成員",selection: self.$selectfavo){
            ForEach(0..<members.count) { (index) in
                Text(self.members[index])
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct Buttontwo: View {
    var grade:Array<CGFloat>
    var selectsong:Int
    @Binding var showsecond:Bool
    @Binding var showalert:Bool
    
    @Binding var showsong:Bool
    let songs=[allsong[55],allsong[54],allsong[0]]
    var body: some View {
        HStack{
            Spacer()
            Button(action:{self.showsong=true}){Text("聽歌").padding().foregroundColor(Color.primary).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(red: 184/255, green: 232/255, blue: 255/255), lineWidth: 3))}.sheet(isPresented:self.$showsong){SongView(song:self.songs[self.selectsong])}
            Spacer()
            Button(action:{
                if self.grade[0]==831{
                    self.showalert=true
                }
                else{self.showsecond=true}
            }){Text("結果").padding().foregroundColor(Color.primary).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(red: 184/255, green: 232/255, blue: 255/255), lineWidth: 3))}.sheet(isPresented:self.$showsecond){result(grade: self.grade)}
            Spacer()
        }
    }
}
struct brightslider: View {
    @Binding var bright:Double
    var body: some View {
        Slider(value: $bright,in:0...1,step:0.01,minimumValueLabel: Image(systemName: "sun.max.fill").imageScale(.small),maximumValueLabel:Image(systemName: "sun.max.fill").imageScale(.large) ){
            Text("")
        }.accentColor(.yellow)
    }
}

struct scaleslider: View {
    @Binding var scale:CGFloat
    var body: some View {
        Slider(value: $scale, in: 0...1,step: 0.05, minimumValueLabel: Text("小"), maximumValueLabel:Text("大")){
            Text("")
            
        }.accentColor(.green)
    }
}

struct photoblend: View {
    var scale:CGFloat
    var bright:Double
    var selectfavo:Int
    let members=["阿璞","阿電","小橘","劉逼","霸天"]
    var body: some View {
        ZStack{
            Image("logo").scaleEffect(self.scale).brightness(self.bright).frame(width:400,height: 150)
            Image(members[selectfavo]).scaleEffect(self.scale).brightness(self.bright).frame(width:400,height: 150)
                .blendMode(.screen)
            
        }
    }
}
