//
//  CellView.swift
//  TicTacToe
//
//  Created by Rohid on 31/5/21.
//

import SwiftUI

struct CellView: View {
    let proxy: GeometryProxy
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundColor(Color(UIColor.secondarySystemBackground))
            .frame(
                width: proxy.size.width / 3 - 20,
                height: proxy.size.width / 3 - 20
            )
    }
}
