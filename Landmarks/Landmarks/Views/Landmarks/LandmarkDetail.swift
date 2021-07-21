//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 강수진 on 2021/07/21.
//

import SwiftUI

struct LandmarkDetail: View {
    //해당 attribute를 뷰에서 사용해서 높은 계층에서 보낸 data를 수신할 수 있음
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where:  {
            $0.id == landmark.id
        })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300) //height 만 매개변수로 지정하면 view는 자신의 contents에 맞게 자동으로 size 조정. 이 경우 MapView는 전체 가능한 공간을 모두 채우려고 함
            CircleImage(image: landmark.image)
                .offset(y: -130.0)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turble Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
