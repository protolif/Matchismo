//
//  Deck.h
//  Matchismo
//
//  Created by James Dunn on 3/27/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

  // Add a Card to either the top or bottom
  // of an NSMutableArray of Card objects
  - (void)addCard:(Card *)card atTop:(BOOL)atTop;

  // Randomly select a Card from the Deck,
  // and return a pointer to it.
  - (Card *)drawRandomCard;

@end
