//
//  SetGame.h
//  Matchismo
//
//  Created by Henrique Barros on 1/15/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardMatchingGame.h"

@interface SetGame : CardMatchingGame


@property (nonatomic, strong) NSMutableArray* setGameStatus;

@property (nonatomic) BOOL matched;
@property (nonatomic, getter=isMoveCompleted) BOOL moveCompleted;
@property (nonatomic, strong) NSMutableArray* matchHistory;

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;


-(NSArray *)lastMatch;
-(void) removeMatchedCards;


@end
