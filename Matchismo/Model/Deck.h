//
//  Deck.h
//  Matchismo
//
//  Created by Henrique Barros on 1/7/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject




-(void)addCard:(Card *)card atTop:(BOOL)atTop;

-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
