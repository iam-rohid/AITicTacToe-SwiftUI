//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Rohid on 31/5/21.
//

import SwiftUI

final class GameViewModel: ObservableObject{
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let winPatterns: Set<Set<Int>> = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var playerTurn: Bool = true
    @Published var alertItem: AlertModel?
    @Published var hardnessLevel: Int = 1
    // Proccesing Player Move
    func proccessPlayerMove(in index: Int) {
        if !playerTurn {return}
        if isPlaceAlreadyTacken(in: moves, at: index) {return}
        
        moves[index] = Move(
            player: .human,
            index: index
        )
        
        // Check If Win or draw
        if winCheck(in: moves, for: .human) {
            print("Human Wins")
            alertItem = Alerts.playerWinsAlert
            return
        }
        if drawCheck(in: moves){
            print("Draw")
            alertItem = Alerts.drawAlert
            return
        }
        playerTurn = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.proccessAIMove()
        }
    }
    
    // Proccessing AI Move
    func proccessAIMove() {
        let computerIndex = getAINextMove(in: moves)
        
        moves[computerIndex] = Move(
            player: .computer,
            index: computerIndex
        )
        
        // Check If Win or draw
        if winCheck(in: moves, for: .computer) {
            print("Computer Wins")
            self.alertItem = Alerts.aiWinsAlert
            return
        }
        if self.drawCheck(in: moves){
            print("Draw")
            alertItem = Alerts.drawAlert
            return
        }
        playerTurn = true
    }
    
    func isPlaceAlreadyTacken(in cells: [Move?], at index: Int) -> Bool {
        return cells.contains(where: {$0?.index == index})
    }
    
    func getAINextMove(in cells: [Move?]) -> Int {
        if hardnessLevel >= 1 {
            // Checking if ai can win
            let aiCells = cells.compactMap{$0}.filter{$0.player == .computer}
            let aiPositions = Set(aiCells.map{$0.index})
            
            for pattern in winPatterns{
                let positions = pattern.subtracting(aiPositions)
                if positions.count == 1 && !isPlaceAlreadyTacken(in: cells, at: positions.first!){
                    return positions.first!
                }
            }
        
            // Checking if ai can block player
            let playerCells = cells.compactMap{$0}.filter{$0.player == .human}
            let playerPositions = Set(playerCells.map{$0.index})
            
            for pattern in winPatterns{
                let positions = pattern.subtracting(playerPositions)
                if positions.count == 1 && !isPlaceAlreadyTacken(in: cells, at: positions.first!){
                    return positions.first!
                }
            }
        }
        
        if hardnessLevel == 2 {
            // Take the center point if can
            let centerPoint: Int = 4
            if(!isPlaceAlreadyTacken(in: cells, at: centerPoint)){
                return centerPoint
            }
        }
        
        // Take a random point
        var index = Int.random(in: 1..<9)
        while isPlaceAlreadyTacken(in: cells, at: index) {
            index = Int.random(in: 1..<9)
        }
        return index
    }
    
    func winCheck(in cells: [Move?], for player: Player) -> Bool{
        let playerCells = cells.compactMap{$0}.filter{$0.player == player}
        let playerPositions = Set(playerCells.map{$0.index})
        
        for pattern in winPatterns {
            if pattern.subtracting(playerPositions).count == 0 {
                return true;
            }
        }
        
        return false
    }
    
    func drawCheck(in cells: [Move?]) -> Bool {
        return cells.compactMap{$0}.count == 9
    }
    
    func reset() {
        moves = Array(repeating: nil, count: 9)
        playerTurn = true
    }
}
