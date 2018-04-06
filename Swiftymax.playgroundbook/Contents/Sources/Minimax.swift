//
//  Minimax.swift
//  
//
//  Created by Parsa Rahimi on 3/29/18.
//

public class move {
    public var index = 10;
    public var score = 0;
}

public func minimax(board: [String], player: String, aiPlayer: String, humanPlayer: String) -> move {
    
    var newBoard = board
    let emptySpots = blankSpaces(board: board)
    let endMove = move()
    
    if endGame(board: board, player: aiPlayer) {
        endMove.score = 10
        return endMove
    }
    else if endGame(board: board, player: humanPlayer) {
        endMove.score = -10
        return endMove
    }
    else if emptySpots.isEmpty {
        return endMove
    }
    
    var possibleMoves = [move]();
    for emptySpot in emptySpots {
        let moveVar = move()
        let index = Int(emptySpot)!
        moveVar.index = index
        newBoard[index] = player;
        
        if player == aiPlayer {
            let score = minimax(board: newBoard, player: humanPlayer, aiPlayer: aiPlayer, humanPlayer: humanPlayer).score
            moveVar.score = score
        } else {
            let score = minimax(board: newBoard, player: aiPlayer, aiPlayer: aiPlayer, humanPlayer: humanPlayer).score
            moveVar.score = score
        }
        
        newBoard[index] = String(moveVar.index);
        possibleMoves.append(moveVar);
        
    }
    
    var bestMove = 0;
    if player == aiPlayer {
        var bestScore = -10000;
        for (index, move) in possibleMoves.enumerated() {
            if move.score > bestScore {
                bestScore = move.score;
                bestMove = index;
            }
        }
    } else {
        var bestScore = 10000;
        for (index, move) in possibleMoves.enumerated() {
            if move.score < bestScore {
                bestScore = move.score;
                bestMove = index;
            }
        }
    }
    return possibleMoves[bestMove]
}

public func bestMove(board: [String], aiPlayer: String, humanPlayer: String) -> Int {
    return minimax(board: board, player: aiPlayer, aiPlayer: aiPlayer, humanPlayer: humanPlayer).index
}
