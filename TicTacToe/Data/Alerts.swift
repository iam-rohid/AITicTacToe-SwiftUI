//
//  AlertContext.swift
//  TicTacToe
//
//  Created by Rohid on 31/5/21.
//

import SwiftUI

struct Alerts {
    static let playerWinsAlert = AlertModel(
        title: Text("You won! 🚀"),
        message: Text("You are the best 🔥"),
        buttonText: Text("Let's play again")
    )
    static let aiWinsAlert = AlertModel(
        title: Text("Ai wins! 🤖"),
        message: Text("You can't defeat your own ai 🐸"),
        buttonText: Text("Try again")
    )
    static let drawAlert = AlertModel(
        title: Text("It's a draw 🥂"),
        message: Text("What a game 😍"),
        buttonText: Text("Try again")
    )
}
