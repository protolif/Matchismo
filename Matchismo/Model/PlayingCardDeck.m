//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by James Dunn on 3/30/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

  - (id)init {// Generate a Deck 52 Cards
    self = [super init];// Initialize the superclass Deck.
    
    if (self) {// Ensure that Deck initialized OK.
      // Iterate over the valid suits.
      for (NSString *suit in [PlayingCard validSuits]) {
        // Iterate over the valid ranks.
        for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
          // Create a PlayingCard.
          PlayingCard *card = [[PlayingCard alloc] init];
          // Assign its rank and suit properties.
          card.rank = rank;
          card.suit = suit;
          // Add the card to to the Deck (self.cards).
          [self addCard:card atTop:YES];
        }
      }
    }
    return self;
  }
@end
