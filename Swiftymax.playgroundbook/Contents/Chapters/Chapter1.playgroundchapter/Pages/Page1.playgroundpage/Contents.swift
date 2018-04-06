/*:
 # Tic-Tac-Toe
 **The Invincible AI**
 
 Have you ever played Tic-Tac-Toe with a computer and wondered how it knew exactly what move to play so you don't win?
 
 If you have, great! This PlaygroundBook will attempt to explain the [algorithm](glossary://algorithm) behind the AI's decisions in a simple, easy to understand manner so that you can follow along with whatever coding experience you have.
 
 If, on the other hand, you have not yet had the pleasure of being beaten countlessly by an AI without ever being able to return the favour, I have recreated my own Tic-Tac-Toe game with the algorithm implemented so you can experience what I mean by unbeatable AI first-hand before moving forward.
 
 Go ahead and run the code to try it out. Simply tap anywhere on the board, wait for the AI to make a decision before tapping on any other square. The first move will take a very short while as the [computations](glossary://computation) are quite heavy. They will get quicker as you continue the game. The reason for this will become apparent in the following pages.
 
 You are currently cross (X). If you wish to change to nought (O), simply edit the code below to _"O"_.
 */
//#-code-completion(everything, hide)
humanPlayer = /*#-editable-code*/ "X" /*#-end-editable-code*/
//#-hidden-code
humanPlayer = humanPlayer.uppercased()
//#-end-hidden-code

/*:
 You can play as many times as you wish. Simply re-run the code to reset the board. If are getting frustrated by losing or tying to the machine, here is the raw board for you so you can make it impossible for the AI to win. Just change the indices 0 and 1 to humanPlayer and play your move in the center. You can see how the AI has no choice but to lose.
 
 ````
 board = [humanPlayer,humanPlayer,"2",
         "3","4","5",
         "6","7","8"]
 ````
 
*/
//#-editable-code
board = ["0","1","2",
         "3","4","5",
         "6","7","8"]
//#-end-editable-code
//#-hidden-code
aiPlayer = humanPlayer == "O" ? "X" : "O"

import UIKit
import PlaygroundSupport

page.liveView = ViewController;

//#-end-hidden-code
