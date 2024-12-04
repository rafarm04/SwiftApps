//
//  ImageExample.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 01/12/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("appleIcon")
            .resizable() //Works to edit the size of the image
            //In case of having uneven frames we can use scaledToFit/scaledToFill
            .scaledToFit() // prioritizes keeping the image under the width limitations
            .scaledToFill() // The same as tFit, but under height limitations
            .frame(width: 50, height: 90)
        
        Image(systemName: "figure.run.treadmill")
            .resizable()
            .frame(width: 50, height: 50)
    }
}

#Preview {
    ImageExample()
}
