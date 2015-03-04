//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Henrique Barros on 1/8/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype)init {
    //Inicializacao da superclasse
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank =1; rank < [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        
        }
    }
    
    return self;
}

@end
