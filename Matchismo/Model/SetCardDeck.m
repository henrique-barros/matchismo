//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Henrique Barros on 1/15/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

-(instancetype) init {
    self = [super init];
    if (self) {
        for (NSString *s1 in [SetCard validSymbols]) {
            for (NSString *s2 in [SetCard validColors]) {
                for (NSString *s3 in [SetCard validShading]) {
                    for (NSString *s4 in [SetCard validNumbers]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.symbol = s1;
                        card.color = s2;
                        card.shading = s3;
                        card.number = s4;
                        [self addCard:card];
                    }
                }
            }
        }
    }
    
    return self;
}

@end
