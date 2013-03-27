//
//  Deck.m
//  Matchismo
//
//  Created by James Dunn on 3/27/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//

#import "Deck.h"

// Private Method Declaration
@interface Deck()
  // A Deck of many Cards
  // Deck.cards returns an NSMutableArray of Card objects
  @property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

  - (NSMutableArray *)cards {
    // Lazily instantiating an NSMutableArray for efficiency
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
  }

@end
