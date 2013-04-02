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

@interface CardGameViewController ()
  // Private properties go here.
  @property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
  @property (nonatomic) int flipCount;
  @property (strong, nonatomic) Deck *deck;
  @property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController

  - (IBAction)flipCard:(UIButton *)sender {
    //  if (!sender.selected) { // AKA face down
    //    // Draw a new card
    //    Card *card = [self.deck drawRandomCard];
    //    // Set the button's contents, for the selected state.
    //    [sender setTitle:card.contents forState:UIControlStateSelected];
    //  }
    // Flip the card over
    sender.selected = !sender.isSelected;
    self.flipCount++;
  }

  - (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
  }

  - (Deck *)deck {
    // Lazily instantiating a PlayingCardDeck
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
  }
@end
