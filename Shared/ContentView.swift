//
//  ContentView.swift
//  Shared
//
//  Created by Michele Manniello on 31/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 15.0, *){
        Home()
        }else{
            Text("Ciao")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
