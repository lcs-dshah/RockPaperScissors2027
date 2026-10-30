# Rock Paper Scissors
 
You against the computer. Click a move, and the computer picks one at random.
 
## How to play
 
1. Click **Rock**, **Paper**, or **Scissors**.
2. The computer shows its move beside yours.
3. Rock beats scissors, scissors beats paper, and paper beats rock.
4. First to 10 points wins the round
 
## What I added
 
- Taught the computer the rules of rock, paper, scissors by adding specific win, tie and loss messages instead of the generic message that someone won.
- Changed the way the game keeps track of scores so that when the player wins a round they gain a point, when the computer wins it gains a point, and when it's a tie no one gains a point. 
- Removed rounds played and added a win streak that resets to zero when you lose to the computer.
- Added text on the screen to say either the player or computer won the game once they reached ten points. 
- Added a new view when either the player or computer reaches ten points with a Start new game button to reset the round.

## How it works

**First to 10 **- This feature uses three variables: playerScore, computerScore, and result.
The decision is done using an if statement with the comparison operator >= (greater than or equal to) and the | | (or) operator. The line if playerScore >= 10 | | computerScore >= 10 checks whether either player has reached a score of 10. Inside that check, separate if and else if conditions check which score reached 10 to display the correct message and SF Symbol.
An if statement with comparison operators was chosen over the remainder operator % because we need to check if a specific number was reached or exceeded, rather than checking for repeating patterns or multiples.

 
## Credits
 
- The starting game was written by Mr. Gordon.
- Win streak: Gemini (in the browser) suggested the lines; I checked them and typed them in.

## Testing

| Test | Chosen input |  Should happen | Did happen |
| --- | --- | --- | --- |
| Text on screen after gaining ten points   |  Click buttons until 10 points | Text appears on screen  | Said "Congrats..." or Oh no..." if the computer reached 10 points before the player |
| Colour of win, tie, loss, and round won or lost changes |  Clicked buttons to win, lose, or tie with computer. Played until 10 points |  Different colour writing for each result |  Colourof text changes depending on the outcome of the rounds/game |
| Start new game button resets the scores and win streask to zero | Played a round until 10 points were reached | Start new game button comes up and resets everything to zero | Button reset everything to zero |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |



