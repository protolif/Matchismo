//
//  CardGameViewController.m
//  Matchismo
//
//  Created by James Dunn on 3/23/13.
//  Copyright (c) 2013 James Dunn. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
  // Private properties go here.
@end

@implementation CardGameViewController
  - (IBAction)flipCard:(UIButton *)sender {
    if (!sender.isSelected) {
      sender.selected = YES;
    } else {
      sender.selected = NO;
    }
  }
@end
