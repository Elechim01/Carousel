//
//  VerticalCarouselList.swift
//  Carousel (iOS)
//
//  Created by Michele Manniello on 31/07/21.
//

import SwiftUI

//Custom View Builder..
struct VerticalCarouselList<Content : View>: UIViewRepresentable {
    var content : Content
    init(@ViewBuilder contet: @escaping ()-> Content){
        self.content = contet()
    }
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        setUp(scrollView: scrollView)
        return scrollView
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    func setUp(scrollView : UIScrollView){
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
//        Extracting SwiftUI View...
        let hostView = UIHostingController(rootView: content)
//        clearing BG color of UIIView...
        hostView.view.backgroundColor = .clear
//        Constraints...
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
//            Width...
            hostView.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ]
        scrollView.addSubview(hostView.view)
        scrollView.addConstraints(constraints)
    }
}


