//
//  PlayingCard.m
//  Matchismo
//
//  Created by James Dunn on 3/27/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

  - (NSString *)contents {
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
  }

  + (NSArray *)rankStrings {
    static NSArray *rankStrings = nil;
    // Here, there be dragons.
    return rankStrings;
  }
@end
