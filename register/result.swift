//
//  result.swift
//  register
//
//  Created by 陳昱豪 on 2019/11/9.
//  Copyright © 2019 Chen_Yu_Hao. All rights reserved.
//

import SwiftUI

struct result: View {
    var grade:Array<CGFloat>
    @State private var one:CGFloat=0
    @State private var two:CGFloat=0
    @State private var three:CGFloat=0
    @State private var four:CGFloat=0
    @State private var five:CGFloat=0
    var body: some View {
        VStack{
            HStack{
                ZStack(alignment: .bottom){
                    Path(CGRect(x: 25, y: 0, width: 20, height: 500)).fill(Color(red: 215/255, green: 109/255, blue: 219/255))
                    Image("Q璞").resizable().scaledToFit().frame(width:70,height:70).offset(x:0,y:one)

                }
                ZStack(alignment: .bottom){
                        Path(CGRect(x: 25, y: 0, width: 20, height: 500)).fill(Color(red: 155/255, green: 220/255, blue: 238/255))
                    Image("Q電").resizable().scaledToFit().frame(width:70,height:70).offset(x:0,y:two)

                }
                ZStack(alignment: .bottom){
                    Path(CGRect(x: 25, y: 0, width: 20, height: 500)).fill(Color(red: 254/255, green: 149/255, blue: 84/255))
                    Image("Q橘").resizable().scaledToFit().frame(width:70,height:70).offset(x:0,y:three)

                }
                ZStack(alignment: .bottom){
                    Path(CGRect(x: 25, y: 0, width: 20, height: 500)).fill(Color(red: 125/255, green: 209/255, blue: 71/255))
                    Image("Q逼").resizable().scaledToFit().frame(width:70,height:70).offset(x:0,y:four)

                }
                ZStack(alignment: .bottom){
                    Path(CGRect(x: 25, y: 0, width: 20, height: 500)).fill(Color(red: 1, green: 255/255, blue: 86/255))
                    Image("Q霸天").resizable().scaledToFit().frame(width:70,height:70).offset(x:0,y:five)
                }
            }.frame(height: 500)
            Button(action:{ withAnimation(Animation.linear(duration: 2)){
                self.one=self.grade[0]/831*500*(-1)
                self.two=self.grade[1]/831*500*(-1)
                self.three=self.grade[2]/831*500*(-1)
                self.four=self.grade[3]/831*500*(-1)
                self.five=self.grade[4]/831*500*(-1)
                }
            }){Text("顯示結果").padding().overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(red: 184/255, green: 232/255, blue: 255/255), lineWidth: 3))
.foregroundColor(Color.primary)}
        }
        
    }}

struct result_Previews: PreviewProvider {
    static var previews: some View {
        result(grade: [500,100,400,300,831])
    }
}
