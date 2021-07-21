//
//  ContentView.swift
//  Landmarks
//
//  Created by 강수진 on 2021/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300) //height 만 매개변수로 지정하면 view는 자신의 contents에 맞게 자동으로 size 조정. 이 경우 MapView는 전체 가능한 공간을 모두 채우려고 함
            CircleImage()
                .offset(y: -130.0)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park.")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turble Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
