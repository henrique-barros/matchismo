//
//  SetGameViewController.h
//  Matchismo
//
//  Created by Henrique Barros on 1/15/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCard.h"
#import "GameViewController.h"
#import "SetCardView.h"

@interface SetGameViewController : GameViewController

+ (NSMutableAttributedString *)setAttributedStringForCard:(SetCard *)setCard;

@end
