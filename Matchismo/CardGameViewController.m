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
  @property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
  @property (nonatomic) int flipCount;
@end

@implementation CardGameViewController

  - (IBAction)flipCard:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    self.flipCount++;
  }

  - (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
  }
@end
