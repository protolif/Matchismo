//
//  CardGameViewController.m
//  Matchismo
//
//  Created by James Dunn on 3/23/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//
//  Homework 1: Make each flip draw a new card
//  (instead of showing A♣ all the time).
//  Just add a deck property to your controller.
//  Then draw a random card from it,
//  with each flip to face up.

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
  // Private properties go here.
  @property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
  @property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
  @property (weak, nonatomic) IBOutlet UILabel *statusLabel;
  @property (nonatomic) int flipCount;
  @property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
  @property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation CardGameViewController

  - (IBAction)flipCard:(UIButton *)sender {
    // Ask the cardButtons array what the sender's index is,
    // then tell the game to flip that card, by its index.
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
  }

  - (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
  }

  - (void)updateUI {
    // Iterate over the cardButtons
    for (UIButton *cardButton in self.cardButtons) {
      // Fetch the card that corresponds to the cardButton
      Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
      // Set each cardButton's selected title (even if it's disabled).
      [cardButton setTitle:card.contents forState:UIControlStateSelected];
      [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
      // Select the card if it is face up
      cardButton.selected = card.isFaceUp;
      // Make the card untappable if it isUnplayable
      cardButton.enabled = !card.isUnplayable;
      // Make the card translucent if it's unplayable.
      cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    // Update the score.
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
  }

  - (CardMatchingGame *)game {
    // Lazily instantiating a CardMatchingGame
    if (!_game) {
      _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
  }

  - (void)setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;// Assigning the instance variable
    [self updateUI];
  }
@end
