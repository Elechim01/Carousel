//
//  Home.swift
//  Carousel (iOS)
//
//  Created by Michele Manniello on 31/07/21.
//

import SwiftUI
@available(iOS 15.0, *)
struct Home: View {
//    Curent Tab...
    @State var currentTab = "For You"
//    Hising Tab Bar...
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
//        Tab View
        TabView(selection: $currentTab){
//            To get Safe Area...
            GeometryReader{proxy in
                let topEdge = proxy.safeAreaInsets.top
                ForYou(topEdge: topEdge)
                    .padding(.top,topEdge)
                    .ignoresSafeArea(.all, edges: .top)
            }
            .tag("For You")
            Text("Search")
                .tag("Search")
            Text("Following")
                .tag("Following")
            Text("Downloads")
                .tag("Downloads")
        }
        .overlay(
//            Custom Tab Bar ..
            CustomTabBar(currentTab: $currentTab)
            ,alignment: .bottom
        )
    }
}

@available(iOS 15.0, *)
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
