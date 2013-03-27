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

  - (void)addCard:(Card *)card atTop:(BOOL)atTop {
    
    if (atTop) {// in the case of true,
      // insert the Card at the 0 index of self.cards
      [self.cards insertObject:card atIndex:0];
    } else {
      // appending the Card to the self.cards property
      [self.cards addObject:card];
    }
  }

@end
