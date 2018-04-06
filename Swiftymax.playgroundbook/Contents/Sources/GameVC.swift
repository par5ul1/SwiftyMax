import UIKit
import PlaygroundSupport

public let page = PlaygroundPage.current
public var board = ["0","1","2",
                    "3","4","5",
                    "6","7","8"]
public var humanPlayer = "X"
public var aiPlayer = humanPlayer == "O" ? "X" : "O"
public var humanPlayerImage = UIImage()
public var aiPlayerImage = UIImage()
public var buttons = [UIButton]()
public let ViewController = GameVC()

public func playerImages(aiPlayer: String, humanPlayer: String) {
    switch aiPlayer {
    case "X":
        aiPlayerImage = UIImage(named: "X.png")!
        humanPlayerImage = UIImage(named: "O.png")!
    case "O":
        aiPlayerImage = UIImage(named: "O.png")!
        humanPlayerImage = UIImage(named: "X.png")!
    default:
        break
    }
}

public class GameVC: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9607843137, blue: 0.6156862745, alpha: 1)
        playerImages(aiPlayer: aiPlayer, humanPlayer: humanPlayer)
        view.translatesAutoresizingMaskIntoConstraints = true
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getBoard()
    }
    
    public func getBoard() {
        
        let width: CGFloat = 280/3
        let height: CGFloat = width
        let offsetX: CGFloat = (self.view.frame.size.width/2 - CGFloat(3*width))/2
        let offsetY: CGFloat = (self.view.frame.size.height - CGFloat(3*height))/2
        
        for index in 0..<board.count {
            let xPos: CGFloat
            let yPos: CGFloat
            switch index {
            case 0,1,2:
                xPos = offsetX+width*CGFloat((index))
                yPos = offsetY+height*CGFloat((0))
            case 3,4,5:
                xPos = offsetX+width*CGFloat((index-3))
                yPos = offsetY+height*CGFloat((1))
            case 6,7,8:
                xPos = offsetX+width*CGFloat((index-6))
                yPos = offsetY+height*CGFloat((2))
            default:
                xPos = 0
                yPos = 0
            }
            let button = UIButton(frame: CGRect(x: xPos, y: yPos, width: width, height: height))
            button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            button.tag = index
            var image = UIImage()
            switch board[index] {
            case humanPlayer:
                image = humanPlayerImage
            case aiPlayer:
                image = aiPlayerImage
            default:
                break
            }
            
            button.setImage(image, for: .normal)
            button.addTarget(self, action: #selector(buttonPressed) , for: .touchUpInside)
            buttons.append(button)
            view.addSubview(button)
        }
        
        let imageView = UIImageView(frame: CGRect(x: offsetX, y: offsetY, width: width*3, height: height*3))
        let image = UIImage(named: "board.png")
        imageView.image = image
        view.addSubview(imageView)
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let button = sender
        humanMove(buttons: buttons, button: button)
        if gameOver(board: board, buttons: buttons) {return}
        aiMove(buttons: buttons)
        makeUntappable(board: board, buttons: buttons)
        if gameOver(board: board, buttons: buttons) {return}
    }
    
}
