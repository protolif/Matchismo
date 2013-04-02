//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by James Dunn on 4/2/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//

#import "CardMatchingGame.h"

// Private APIs go in a Class Extension
@interface CardMatchingGame()
  @property (strong, nonatomic) NSMutableArray *cards;
  @property (nonatomic, readwrite) int score;
@end

@implementation CardMatchingGame

  - (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;// Lazy instatiation again
  }

  - (id)initWithCardCount:(NSUInteger)count
                usingDeck:(Deck *)deck {
    self = [super init];// NSObject's designated initializer
    
    if (self) {
      // Loop through the specified number of cards.
      for (int i = 0; i < count; i++) {
        // Draw a random card from the specified deck.
        Card *card = [deck drawRandomCard];
        
        if (!card) {// Gain protection from malformed decks.
          self = nil;// because arrays can't contain nil values.
          break;// out of the for loop
        } else {
          self.cards[i] = card;// Store the card in cards property.
        }
      }
    }
    
    return self;
  }

  - (Card *)cardAtIndex:(NSUInteger)index {
    // Ensure the argument isn't out of bounds.
    return (index < self.cards.count) ? self.cards[index] : nil;
  }

  #define FLIP_COST 1
  #define MISMATCH_PENALTY 2
  #define MATCH_BONUS 4

  - (void)flipCardAtIndex:(NSUInteger)index {
    // Fetch the card by its index.
    Card *card = [self cardAtIndex:index];
    // Ensure the card is playable and face down.
    if (!card.isUnplayable) {
      if (!card.isFaceUp) {
        // Loop through the other cards.
        for (Card *otherCard in self.cards) {
          // Check for cards that are face up and playable.
          if (otherCard.isFaceUp && !otherCard.isUnplayable) {
            // Check for a match.
            int matchScore = [card match:@[otherCard]];
            if (matchScore) {
              // Mark both cards as unplayable.
              otherCard.unplayable = YES;
              card.unplayable = YES;
              // Add points to the score.
              self.score += matchScore * MATCH_BONUS;
            } else {
              // Flip the other card over,
              otherCard.faceUp = NO;
              // and take points off.
              self.score -= MISMATCH_PENALTY;
            }
            break;// out of the for loop
          }
        }
        // Subtract the flip cost from the score.
        self.score -= FLIP_COST;
      }
      // Flip the card over.
      card.faceUp = !card.isFaceUp;
    }
  }
@end
