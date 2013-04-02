//
//  PlayingCard.m
//  Matchismo
//
//  Created by James Dunn on 3/27/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

  - (int)match:(NSArray *)otherCards {
    int score = 0;
    
    // Ensures there is only 1 card to match
    if (otherCards.count == 1) {
      PlayingCard *otherCard = [otherCards lastObject];// safe from nil
      // Check for suit and rank matches.
      if ([otherCard.suit isEqualToString:self.suit]) {
        score = 1;
      } else if (otherCard.rank == self.rank) {
        score = 4;// rank matches are more rare
      }
    }
    
    return score;
  }

  - (NSString *)contents {// returns suit + rank
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
  }

  + (NSArray *)rankStrings {
    static NSArray *rankStrings = nil;// C static is like Ruby constant
    // Here, there be dragons. But I'll venture a guess:
    if (!rankStrings) rankStrings = @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return rankStrings;
  }

  + (NSArray *)validSuits {
    static NSArray *validSuits = nil;
    // Lazily instantiating an array of special characters
    if (!validSuits) validSuits = @[@"♥", @"♦", @"♠", @"♣"];
    return validSuits;
  }

  + (NSUInteger)maxRank {
    return [self rankStrings].count - 1;// should be 13
  }

  @synthesize suit = _suit;

  - (void)setSuit:(NSString *)suit {
    // The suit must be valid, matching one of the validSuits.
    if ([[PlayingCard validSuits] containsObject:suit]) {
      _suit = suit;
    }
  }

  - (NSString *)suit {
    return _suit ? _suit : @"?";// handling an unexpected nil value
  }

  - (void)setRank:(NSUInteger)rank {
    // Validate rank is less than or equal to maxRank
    // We don't want to end up with an NSArray out of bounds error
    if (rank <= [PlayingCard maxRank]) {
      _rank = rank;
    }
  }

@end
