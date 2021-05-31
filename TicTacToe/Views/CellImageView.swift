//
//  CellImageView.swift
//  TicTacToe
//
//  Created by Rohid on 31/5/21.
//

import SwiftUI

struct CellImageView: View {
    let proxy: GeometryProxy
    let systemName: String
    let color: Color
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .foregroundColor(color)
            .frame(
                width: abs(proxy.size.width / 3 - 80),
                height: abs(proxy.size.width / 3 - 80)
            )
            .aspectRatio(contentMode: .fit)
    }
}
