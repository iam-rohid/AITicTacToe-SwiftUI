//
//  Circle.swift
//  TicTacToe
//
//  Created by Rohid on 25/5/21.
//

import SwiftUI

struct Circle: View {
    var body: some View {
        VStack{}
            .frame(width: 70, height: 70)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 70))
    }
}

struct Circle_Previews: PreviewProvider {
    static var previews: some View {
        Circle()
    }
}
