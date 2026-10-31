//
//  RockPaperScissorsView.swift
//  RockPaperScissors
//
//  WHAT THIS GAME DOES NOW
//  You pick rock, paper or scissors. The computer picks one at random.
//  The app shows both moves and counts how many rounds you have played.
//  It can tell when a round is a tie.
//
//  WHAT IT DOES NOT DO YET
//  When the two moves are different, it only says "Someone won".
//  It does not know who!
//  Rock beats scissors, scissors beats paper, and paper beats rock.
//

//  NEW FOR MAKE IT YOURS
//  Says who won or if it's a tie.
//  Keeps track of your and the computers score
//  Keeps track of the number of rounds you've won in a row.
// Plays Rock Paper Scissors against the computer.
// Keeps track of scores, win streaks, and determines the overall winner when a player reaches 10 points.



import SwiftUI

// The picture for each move. These are emoji, so they are just text.
// TRY: Change these to other emoji to give the game a new theme.
let rockEmoji = "✊"
let paperEmoji = "✋"
let scissorsEmoji = "✌️"

// The target score needed to win the game.
    let targetScore: Int = 10

// The game itself: what it remembers, what it shows on the screen,
// and what it does when you click a button.
struct RockPaperScissorsView: View {
    
    // MARK: - Stored properties
    
    // Each @State variable is something the game remembers.
    // When one of them changes, the screen updates by itself.
    
    // The name of each move, such as "Rock", and the emoji that shows it.
    // Before the first round, nobody has picked a move yet.
    @State var playerMove: String = "No move yet"
    @State var playerEmoji: String = "🤷"
    @State var computerMove: String = "No move yet"
    @State var computerEmoji: String = "🤷"
    

    
    // What happened in the last round.
    @State var result: String = "Let's play!"
    
    
    // The player's total score
    @State var playerScore = 0
    // The computer's totsl score
    @State var computerScore = 0
    // The current number of consecutive player wins
    @State var winStreak: Int = 0
    
    
   

    
    
        
  
    // MARK: - Computed properties
    
    
    
    var body: some View {
        VStack(spacing: 24) {
            
            // The title at the top of the screen.
            Text("Rock Paper Scissors")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color.indigo)
            // Shrink the title a little if it does not fit on one line.
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            // The two moves, side by side.
            HStack {
                VStack(spacing: 8) {
                    Label("You", systemImage: "person.fill")
                        .font(.headline)
                    Text(playerEmoji)
                        .font(.system(size: 90))
                    Text(playerMove)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity)
                
                Text("vs")
                    .font(.title)
                    .foregroundStyle(Color.secondary)
                
                VStack(spacing: 8) {
                    Label("Computer", systemImage: "desktopcomputer")
                        .font(.headline)
                    Text(computerEmoji)
                        .font(.system(size: 90))
                    Text(computerMove)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
            .background(Color.blue.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
            // The result of the round.
            Text(result)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(messageColor)
            
            Spacer()
            
            // One button for each move the player can make.
            // The code inside the braces runs when that button is clicked.
           
            // Plays Rock Paper Scissors against the computer.
            // Keeps track of scores, win streaks, and determines the overall winner when a player reaches 10 points.
            
            Text("Win streak: \(winStreak)")
                .font(.title)
                .foregroundStyle(Color.secondary)
            
            HStack {
                Text("Your score: \(playerScore)")
                    .font(.title)
                    .foregroundStyle(Color.secondary)
                
                Spacer()
                
                Text("Computer score: \(computerScore)")
                    .font(.title)
                    .foregroundStyle(Color.secondary)
            }
            
            
            
        }
        .padding(32)
        .fontDesign(.rounded)
        // How big the game's window is on the Mac. It can be made taller or wider.
        .frame(minWidth: 520, minHeight: 640)
        
        
    }
    
    // MARK: - Functions
    
    // The player picked rock.
    func chooseRock() {
        playerMove = "Rock"
        playerEmoji = rockEmoji
        playRound()
    }
    
    // The player picked paper.
    func choosePaper() {
        playerMove = "Paper"
        playerEmoji = paperEmoji
        playRound()
    }
    
    // The player picked scissors.
    func chooseScissors() {
        playerMove = "Scissors"
        playerEmoji = scissorsEmoji
        playRound()
    }
    
    // The computer picks its move at random.
    func chooseComputerMove() {
        
        // Pick 1, 2 or 3. Each number stands for one move.
        let randomNumber: Int = Int.random(in: 1...3)
        
        if randomNumber == 1 {
            computerMove = "Rock"
            computerEmoji = rockEmoji
        } else if randomNumber == 2 {
            computerMove = "Paper"
            computerEmoji = paperEmoji
        } else {
            computerMove = "Scissors"
            computerEmoji = scissorsEmoji
        }
    }
    
    // Plays one round, once the player has picked a move.
    // Plays one round, once the player has picked a move.
    
    // The text colour of the round result
    @State private var messageColor: Color = Color.white
    
        func playRound() {
            
           
            
            if playerMove == computerMove {
                result = "It's a tie!"
                messageColor = Color.yellow
                return
            }
            
            else if playerMove == "Paper" && computerMove == "Rock" {
                result = "You win! Paper beats rock!"
                playerScore = playerScore + 1
                winStreak += 1
                messageColor = Color.green
            } else if playerMove == "Rock" && computerMove == "Scissors" {
                result = "You win! Rock beats Scissors!"
                playerScore = playerScore + 1
                winStreak += 1
                messageColor = Color.green
            } else if playerMove == "Scissors" && computerMove == "Paper" {
                result = "You win! Scissors beats paper!"
                playerScore = playerScore + 1
                winStreak += 1
                messageColor = Color.green
            }
            
            else {
                result = "Oh no, you lost!"
                computerScore = computerScore + 1
                winStreak = 0
                messageColor = Color.red
            }
            
            if playerScore == targetScore {
                            result = "Congrats! You won this round!"
                            messageColor = Color.blue
                        }
                        
                        if computerScore == targetScore {
                            result = "Oh no, the computer beat you this round!"
                            messageColor = Color.purple
                        }
        }
        
   
    // Resets all game values back to their starting state.
        func startNewGame() {
            playerScore = 0
            computerScore = 0
            winStreak = 0
            result = "🤷"
            playerMove = "🤷"
            computerMove = "🤷"
            playerEmoji = "🤷"
            computerEmoji = "🤷"
        }

      
        
       
    }

#Preview {
        RockPaperScissorsView()
    }
