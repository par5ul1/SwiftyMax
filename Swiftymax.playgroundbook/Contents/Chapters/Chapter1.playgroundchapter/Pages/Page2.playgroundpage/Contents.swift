/*:
 # What Is This Minimax of Which You Speak?
 
 If you were to ask a child how they think a computer could win at a game everytime, chances are they'd either say it's magic or that the computer is smart. Asking the same question from an adult, you'd hear something along the lines of _"The AI knows every possible move beforehand so that no matter what you play, it is prepared."_
 
 Well, turns out neither is completely wrong. Sure, the computer isn't magical or really smart, but that depends on your definition of smart. AI's are made to immitate human intelligence because ultimately, they are created by humans but that means that if the algorithm is clever, the AI is clever too. Now, what is this algorithm? As you might have figured out by now, in the case of Tic-Tac-Toe, it's Minimax. In fact, Minimax is an algorithm that works for any two players, [zero-sum game](glossary://zero-sum).
 
 * callout(At it's essence, Minimax serves one purpose:):
 
    Minimize a player's maximum possible loss.
 
 In other words:
 * The AI is trying every possible move, ever.
 * Assigning each one a score.
 * Going through every possible move's score.
 * Picking the one with the highest score
 
 So, the hypothetical adult was right. The computer does know every possible move combination. The only difference is, it calculates it on it's own everytime. It would theoretically be possible for a human to manually enter a list of every move possible in Tic-Tac-Toe but not only is it improbable that someone would write all the 255168 board configurations, it would be a waste of time and inefficient as the computer would have to compare its board against every one of those hand-typed boards and see which one it resembles the most in order to make a move.
 
 Therefore, we have the Minimax algorithm. Simply put, the AI will begin at an empty square, then act as the opponent and play on another empty square, then repeat this process until it reaches a [terminal state](glossary://terminal%20state). Here it takes a score and pushes it up one level (10, if it wins; -10 if the opponent wins; 0 if it's a tie). This goes on until the computer has exhausted every possible available move on a given board and returns one value: the index of the best place to play. This whole process is what is called in programming a recursive algorithm.
 
 Every empty spot the AI plays, it "minimaxes" the next empty spots as its opponent, and this goes on until terminal state is reached. Basically, the function calls itself every round until it gets a value. Then it retraces its steps until the very beginning.
 
 This process of recursively calling a function creates what programmers and mathematicians call trees. They are called trees because similar to real life trees, they have roots (in this case the initial board) and they have branches (the empty, possible moves) which could have branches themselves (the simulated opponent's moves) until they reach the leaves and we have a [full tree](glossary://full%20tree).
 
 Now that you know this, it makes sense that the AI would always win as it anticipates your every move and quite literally sees 8 steps ahead. Also, you can now see why the first move took longer than the others as it requires relatively more computation than the rest and computation takes time.
 
 With all that said, here is the full Minimax code I wrote so you can read through it and see how theory translates to code:
 
     // Define class move
 
     class move {
        var index = 10; // Index on board
        var score = 0; // Score (Risk) of move
     }
 
     func minimax(board: [String], player: String, aiPlayer: String, humanPlayer: String) -> move {
 
     var newBoard = board // Create a copy of board
 
     let emptySpots = blankSpaces(board: board) // Create an array of all the empty/possible spots on the board. blankSpaces() is defined elsewhere
 
     let endMove = move() // Instantiation of move class
 
     // Check if it's an end game. Function endGame() simply checks current board against a set of winning moves to check if current board is an end game.
 
     if endGame(board: board, player: aiPlayer) {
 
        endMove.score = 10 // +10 if AI wins
        return endMove
 
     }
     else if endGame(board: board, player: humanPlayer) {
 
        endMove.score = -10 // -10 if AI loses
        return endMove
 
     }
     else if emptySpots.isEmpty {
 
        return endMove // 0 if it's a tie. 0 was default value of endMove
 
     }
 
     var possibleMoves = [move](); // Initialize Array possibleMoves of type [move]
     for emptySpot in emptySpots { // Loop through all the empty spots
     let moveVar = move() // Instantiation of move class
     let index = Int(emptySpot)! // Convert value of emptySpot: String to Int and force unwrap because I'm sure it exists
     moveVar.index = index // Set index of moveVar to be current index
     newBoard[index] = player; // Play move on simulated board
 
     // If the current player is the AI, let the score = the minimax of the human player (recursion) given the current board. Otherwise, let score = the minimax of the AI player.
 
     if player == aiPlayer {
 
        let score = minimax(board: newBoard, player: humanPlayer, aiPlayer: aiPlayer, humanPlayer: humanPlayer).score
 
        moveVar.score = score
 
     } else {
 
        let score = minimax(board: newBoard, player: aiPlayer, aiPlayer: aiPlayer, humanPlayer: humanPlayer).score
 
        moveVar.score = score
     }
 
     // Reset simulated board to previous state so branch can change. Then push the move to the list of possible moves.
 
     newBoard[index] = String(moveVar.index);
 
     possibleMoves.append(moveVar);
 
     }
 
     var bestMove = 0; // Initialize variable bestMove which will hold the index of the best move

     // If the player is the AI, maximize the score. If it's human, minimize it. Then return the final score and the index
 
     if player == aiPlayer {
        var bestScore = -10000; // Best score has to be a very small number
 
        for (index, move) in possibleMoves.enumerated() { // Loop through all possible moves and if there is a move that's larger than the previous one, make that the new best.
            if move.score > bestScore {
                bestScore = move.score;
                bestMove = index;
            }
        }
     } else {
        var bestScore = 10000; // Best score has to be a very larger number
 
            for (index, move) in possibleMoves.enumerated() { // Loop through all possible moves and if there is a move that's smaller than the previous one, make that the new best.
                if move.score < bestScore {
                    bestScore = move.score;
                    bestMove = index;
                }
            }
     }
 
     return possibleMoves[bestMove] // Return the best move out of all possible ones. Score and index.
 
     }
 
     // This function will call the minimax and return only the index.
 
     func bestMove(board: [String], aiPlayer: String, humanPlayer: String) -> Int {
        return minimax(board: board, player: aiPlayer, aiPlayer: aiPlayer, humanPlayer: humanPlayer).index
     }
  */
//#-code-completion(everything, hide)
//#-hidden-code
page.assessmentStatus = .pass(message: "[Continue](@next)")
//#-end-hidden-code
