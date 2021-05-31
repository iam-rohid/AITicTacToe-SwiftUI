//
//  MoveModel.swift
//  TicTacToe
//
//  Created by Rohid on 31/5/21.
//

import SwiftUI

struct Move: Hashable{
    let id = UUID()
    let player: Player
    let index: Int
    
    func getIconName() -> String {
        return player == .human ? "xmark" : "circle"
    }
}
