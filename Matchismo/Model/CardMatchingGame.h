//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by James Dunn on 4/2/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
  // To start the game, we must have a deck.
  // A deck must contain a certain number of cards.
  // Thus, our designated initializer:
  - (id)initWithCardCount:(NSUInteger)cardCount
                usingDeck:(Deck *)deck;
  // Flip a specific card over, by index.
  - (void)flipCardAtIndex:(NSUInteger)index;
  // Get a card, by its index.
  - (Card *)cardAtIndex:(NSUInteger)index;
  // Your current score
  @property (nonatomic, readonly) int score;
@end
