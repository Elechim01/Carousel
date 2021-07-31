//
//  ForYou.swift
//  Carousel (iOS)
//
//  Created by Michele Manniello on 31/07/21.
//

import SwiftUI

struct ForYou: View {
    var topEdge : CGFloat
    var body: some View {
        VStack(spacing: 15){
            HStack{
                Text("Today For You")
                    .font(.title.bold())
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "person.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                        .overlay(
                            Circle()
                                .fill(.red)
                                .frame(width: 13, height: 13)
                                .offset(x: -1, y: -1)
                            ,alignment: .topTrailing
                        )
                }

            }
            .padding(.horizontal)
//           Setting MaxHeight for offset Calculation...
            .frame(height: 70)
            GeometryReader{ proxy in
                let size = proxy.size
//                Custom Vertcal Carousel List...
                VerticalCarouselList{
//                    Movies...
                    VStack(spacing:0) {
                        ForEach(movies){movie in
    //                        Card View..
//                            70 = title View...
//                            15 = Spacing...
//                            Remiming is safe area to top
                            MovieCardView(movie: movie, topOffset: 70 + 15 + topEdge )
                                .frame(height: size.height)
                        }
                    }
                }
            }
        }
    }
}

struct ForYou_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//Card View
struct MovieCardView:View {
    var movie : Movie
    var topOffset : CGFloat
    var body: some View{
//        To get size for Image...
//        Uisng Geometry reader...
        
        GeometryReader{ proxy in
            let size = proxy.size
//            Scaling and Opacity Effect...
            let minY = proxy.frame(in:.global).minY - topOffset
            let progress = -minY / size.height
//            Incrrasing Scale by 3
            let scale = 1-(progress/3)
//            this is happening bcz we need to eliminate top offset..
//            to get started from 0.....
//            Opacity
            let opacity = 1-progress
            ZStack {
                Image(movie.artwork)
                    .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width - 30, height: size.height - 80)
            .cornerRadius(15)
            }
            .padding(.horizontal,15)
            .scaleEffect(minY < 0 ? scale:1)
            .opacity(minY < 0 ? opacity : 1)
//            stopping vew when y value goes < 0
            .offset(y: minY < 0 ? -minY : 0)
        }
    }
}
