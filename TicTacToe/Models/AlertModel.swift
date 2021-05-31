//
//  AlertModel.swift
//  TicTacToe
//
//  Created by Rohid on 31/5/21.
//

import SwiftUI

struct AlertModel: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let buttonText: Text
}
