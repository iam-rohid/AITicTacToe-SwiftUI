//
//  Cross.swift
//  TicTacToe
//
//  Created by Rohid on 25/5/21.
//

import SwiftUI

struct Cross: View {
    var body: some View {
        VStack{}
            .frame(width: 70, height: 70)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 70))
    }
}

struct Cross_Previews: PreviewProvider {
    static var previews: some View {
        Cross()
    }
}
