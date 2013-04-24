//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by James Dunn on 4/2/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//
//  Homework 2a: Make a status label that explains
//  why points are gained or lost.
//  Homework 2b: In lieu of a 3 card matching mode,
//  I choose to implement a difficulty setting,
//  because it's far less confusing to the user,
//  while still demonstrating the UISwitch control.

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
      // Enable Easy Mode
      self.easyModeEnabled = YES;
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
  #define EASY_MODE_BONUS 2

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
              int gained = matchScore * MATCH_BONUS;
              // Apply the easy mode bonus when appropriate
              if (self.easyModeEnabled == YES) {
                gained *= EASY_MODE_BONUS;
              }
              self.score += gained;
              self.status = [NSString stringWithFormat:@"Yes, the cards match. +%d points", gained];
            } else {
              // Flip the other card over,
              otherCard.faceUp = NO;
              // and take points off.
              self.score -= MISMATCH_PENALTY;
              self.status = [NSString stringWithFormat:@"No, the cards don't match. -%d points", MISMATCH_PENALTY];
            }
            break;// out of the for loop
          } else {
            self.status = @"You paid a point to flip a card.";
          }
        }
        // Subtract the flip cost from the score.
        self.score -= FLIP_COST;
      } else {
        // Clear the status message.
        self.status = @"";
      }
      // Flip the card over.
      card.faceUp = !card.isFaceUp;
    }
  }
@end
