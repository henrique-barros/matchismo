//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Henrique Barros on 1/9/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject
@property (nonatomic, getter=isCards3Match) BOOL Cards3Match;
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@property (nonatomic, readwrite) NSInteger numberOfChosenCards;


//designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger) index;
-(Card *)cardAtIndex:(NSUInteger)index;

-(void)setCards3Match:(BOOL)Cards3Match;

@property (nonatomic, readonly) NSString * status;


@end
