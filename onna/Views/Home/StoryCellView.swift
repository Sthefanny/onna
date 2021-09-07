//
//  StoryCellView.swift
//  onna
//
//  Created by Daniella Onishi on 07/09/21.
//

import SwiftUI

struct StoryCellView: View {
    var instaStoryInfo: InstaStoryInfo
    var body: some View {
        HStack {
            VStack {
                Image(instaStoryInfo.image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text(instaStoryInfo.text)
                    .font(.system(size: 10, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
            }
        }
    }
}

struct InstaStoryInfo: Identifiable {
    var id = UUID()
    var image: String
    var text: String
    var content: String
}

struct StoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCellView(instaStoryInfo: InstaStoryInfo(image: "", text: "", content: ""))
    }
}
