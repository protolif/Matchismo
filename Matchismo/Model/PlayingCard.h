//
//  PlayingCard.h
//  Matchismo
//
//  Created by James Dunn on 3/27/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
  @property (strong, nonatomic) NSString *suit;
  @property (nonatomic) NSUInteger rank;
  + (NSArray *) validSuits;
  + (NSUInteger) rank;
@end
