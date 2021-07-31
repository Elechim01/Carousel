//
//  Movie.swift
//  Carousel (iOS)
//
//  Created by Michele Manniello on 31/07/21.
//

import SwiftUI
struct Movie : Identifiable {
    var id = UUID().uuidString
    var movieName : String
    var artwork: String
}
var movies = [
    Movie(movieName: "Mountain1", artwork: "post1"),
    Movie(movieName: "Mountain2", artwork: "post2"),
    Movie(movieName: "Mountain3", artwork: "post3"),
    Movie(movieName: "Mountain4", artwork: "post4"),
    Movie(movieName: "Mountain5", artwork: "post5"),
    Movie(movieName: "Mountain6", artwork: "post6"),
    Movie(movieName: "Mountain7", artwork: "post7")
    
]
