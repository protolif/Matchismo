//
//  PlayingCard.m
//  Matchismo
//
//  Created by James Dunn on 3/27/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

  - (NSString *)contents {// returns suit + rank
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
  }

  + (NSArray *)rankStrings {
    static NSArray *rankStrings = nil;// C static is like Ruby constant
    // Here, there be dragons.
    return rankStrings;
  }

  + (NSArray *)validSuits {
    static NSArray *validSuits = nil;
    // Lazy instantiating an array of special characters
    if (!validSuits) validSuits = @[@"♥", @"♦", @"♠", @"♣"];
    return validSuits;
  }

@end
