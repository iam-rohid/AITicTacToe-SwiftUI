//
//  Cell.swift
//  TicTacToe
//
//  Created by Rohid on 25/5/21.
//

import Foundation

struct Cell: Hashable{
    public static func == (lhs: Cell, rhs: Cell) -> Bool {
        lhs.selectedBy == rhs.selectedBy
    }
    
    var selectedBy: SelectedBy = SelectedBy.none;
}
enum SelectedBy {
    case player1
    case player2
    case none
}
