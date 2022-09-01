//
//  RatingView.swift
//  Bookworm
//
//  Created by Jiaming Guo on 2022-09-01.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = "Rating: "
    var maxRating = 5
    var onImage = Image(systemName: "star.fill")
    var offImage: Image?
    var onColor = Color.yellow
    var offColor = Color.gray
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            ForEach(1..<maxRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
