//
//  SongView.swift
//  register
//
//  Created by 陳昱豪 on 2019/11/9.
//  Copyright © 2019 Chen_Yu_Hao. All rights reserved.
//

import SwiftUI
import AVFoundation
struct SongView: View {
    @State var player: AVPlayer?
    var song:Song
    var body: some View {
        ScrollView(.vertical){
            Text(song.lyrics).padding(50)
        }.frame(minWidth:0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity).background(LinearGradient(gradient: Gradient(colors: [Color.init( red: 228/255, green: 114/255, blue: 246/255), Color.init( red: 71/255, green: 191/255, blue: 250/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))).edgesIgnoringSafeArea(.all).onAppear{
            if self.player == nil, let url = Bundle.main.url(forResource: self.song.name, withExtension: "mp3") {
            self.player = AVPlayer(url: url)
            self.player?.play()
            }
        }
    }
}
struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        
        SongView(song:allsong[55])
    }
}
