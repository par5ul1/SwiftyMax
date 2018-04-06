//
//  Functions.swift
//  
//
//  Created by Parsa Rahimi on 3/29/18.
//

import UIKit

public func blankSpaces(board: [String]) -> [String] {
    
    return board.filter { $0 != "X" && $0 != "O" };
    
}

func makeUntappable(board: [String], buttons: [UIButton]) {
    
    for button in buttons {
        if board[button.tag] == "O" || board[button.tag] == "X" {
            button.removeTarget(nil, action: nil, for: .allEvents)
        }
    }
    
}

public func endGame(board: [String], player: String) -> Bool {
    
    let endGames = [
        [0,4,8],
        [2,4,6],
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        ];
    
    for endGame in endGames {
        
        if board[endGame[0]] == player && board[endGame[1]] == player && board[endGame[2]] == player {
            return true
        }
        
    }
    return false
    
}

public func gameOver(board: [String], buttons: [UIButton]) -> Bool {
    
    let aiWins = endGame(board: board, player: aiPlayer)
    let humanWins = endGame(board: board, player: humanPlayer) // Hopefully Never
    let tie = blankSpaces(board: board).count == 0
    
    if  aiWins || tie || humanWins {
        
        let endGames = [
            [0,4,8],
            [2,4,6],
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            ];
        
        func getEndMove(player: String) -> [Int] {
            for endGame in endGames {
                
                if board[endGame[0]] == player && board[endGame[1]] == player && board[endGame[2]] == player {
                    return endGame
                }
            }
            return [0,0,0]
        }
        
        switch true {
        case aiWins:
            for move in getEndMove(player: aiPlayer) {
                buttons[Int(move)].backgroundColor = #colorLiteral(red: 1, green: 0.9333333333, blue: 0.3450980392, alpha: 1)
            }
            page.assessmentStatus = .pass(message: "AI Wins!\n[Move On](@next)")
        case tie:
            page.assessmentStatus = .pass(message: "You Tied!\n[Move On](@next)")
        case humanWins:
            for move in getEndMove(player: humanPlayer) {
                buttons[Int(move)].backgroundColor = #colorLiteral(red: 1, green: 0.9333333333, blue: 0.3450980392, alpha: 1)
            }
            page.assessmentStatus = .pass(message: "You Win!\n[Move On](@next)")
        default:
            break
            
        }
        
        for button in buttons {
            button.removeTarget(nil, action: nil, for: .allEvents)
        }
        
        return true
    }
    
    return false
    
}

public func aiMove(buttons: [UIButton]) {
    let index: Int = bestMove(board: board, aiPlayer: aiPlayer, humanPlayer: humanPlayer)
    board[index] = aiPlayer
    let button: UIButton = buttons[index]
    UIView.transition(with: button as UIView, duration: 0.2, options: .transitionCrossDissolve, animations: {
        button.setImage(aiPlayerImage, for: .normal)
    }, completion: nil)
}

public func humanMove(buttons: [UIButton], button: UIButton) {
    board[button.tag] = humanPlayer
    UIView.transition(with: button as UIView, duration: 0.2, options: .transitionCrossDissolve, animations: {
        button.setImage(humanPlayerImage, for: .normal)
    }, completion: nil)
}
