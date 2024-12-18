//
//  ImgListView.swift
//  For-json
//
//  Created by Tanvir Ahmed on 18/12/24.
//

import Foundation
import SwiftUI

struct ErrorWrapper: Identifiable {
    let id = UUID()  // This ensures the error is uniquely identifiable
    let message: String
}


struct ImgListView: View {
    @State private var imgs: [Img] = []
//    @State private var errorMessage: String? = nil
    @State private var errorMessage: ErrorWrapper? = nil


    var body: some View {
        NavigationView {
            List(imgs, id: \.id) { img in
                HStack {
                    AsyncImage(url: URL(string: img.thumbnailUrl)) { image in
                        image.resizable()
                             .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                    VStack(alignment: .leading) {
                        Text(img.title)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Images")
            .onAppear {
                fetchImgs()
            }
            .alert(item: $errorMessage) { error in
                Alert(
                    title: Text("Error"),
                    message: Text(error.message),
                    dismissButton: .default(Text("OK"))
                )
            }

        }
    }

    func fetchImgs() {
        APIService.shared.fetchImgs { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let imgs):
                    self.imgs = imgs
                case .failure(let error):
                    self.errorMessage = ErrorWrapper(message: error.localizedDescription)
                }
            }
        }
    }
}
