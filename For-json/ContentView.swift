//
//  ContentView.swift
//  For-json
//
//  Created by Tanvir Ahmed on 18/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
//    ContentView()
    ImgListView()
}
