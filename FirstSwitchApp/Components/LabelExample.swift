//
//  labelExample.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 01/12/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        //These 2 are the same
        //Label("Hello, World!", image: "appleIcon")
        //But this one allows to have different components on the title and the image
        Label(
            title:{Text("Hello, World!")},
            icon: {Image("appleIcon")
                .resizable()
                .frame(width: 50, height: 50)})
    }
}

#Preview {
    LabelExample()
}
