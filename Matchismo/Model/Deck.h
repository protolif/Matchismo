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

  - (void)addCard:(Card *)card atTop:(BOOL)atTop;
  - (Card *)drawRandomCard;

@end
