//
//  SetGame.m
//  Matchismo
//
//  Created by Henrique Barros on 1/15/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "SetGame.h"
#import "SetCard.h"

@interface SetGame()



@end

@implementation SetGame


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(NSMutableArray *)setGameStatus {
    if (!_setGameStatus) {
        _setGameStatus = [[NSMutableArray alloc] init];
    }
    return _setGameStatus;
}



-(NSMutableArray *)matchHistory {
    if (!_matchHistory) _matchHistory = [[NSMutableArray alloc] init];
    return _matchHistory;
}

-(void)addMove:(NSArray *)move {
    [self.matchHistory addObject:move];
}

-(NSArray *) lastMatch {
    return [self.matchHistory lastObject];
}



-(BOOL)matched {
    return _matched;
}


-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init]; // super's designated initializer
    
    if(self) {
        for(int i=0;i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
            
        }
        
    }
    
    return self;
}

-(void) chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (card.isChosen) {
        card.chosen = NO;
    } else {
        self.numberOfChosenCards = 1;
        NSMutableArray  *chosenCards = [[NSMutableArray alloc] init]; //of Card
        for (Card *otherCard in self.cards) {
            //NSLog(@"teste");
            if (!otherCard.isMatched && otherCard.isChosen) {
                [chosenCards addObject:(Card *)otherCard];
                self.numberOfChosenCards++;
            }
        }
        if (self.numberOfChosenCards == 1) {
            if ([card isKindOfClass:[SetCard class]]) {
                SetCard *setCard = (SetCard *)card;
                [self.setGameStatus removeAllObjects];
                [self.setGameStatus addObject:setCard];
                self.matched = NO;
            }
            self.moveCompleted = NO;
        }
        else if (self.numberOfChosenCards == 2) {
            /*for (Card *otherCard in self.cards) {
                if (!otherCard.isMatched && otherCard.isChosen) {
                    if([otherCard isKindOfClass:[SetCard class]]) {
                        SetCard *setCard = (SetCard *)otherCard;
                        [self.setGameStatus addObject:setCard];
                    }
                }
            }*/
            if ([card isKindOfClass:[SetCard class]]) {
                SetCard *setCard = (SetCard *)card;
                [self.setGameStatus addObject:setCard];
                self.matched = NO;
            }
            self.moveCompleted = NO;
        }
        else if (self.numberOfChosenCards==3) {
            int matchScore = [card match:chosenCards];
            if (matchScore) {
                self.score += matchScore * MATCH_BONUS;
                for (Card *otherCard in chosenCards) {
                    otherCard.matched = YES;
                }
                card.matched = YES;
                self.matched = YES;
                if ([card isKindOfClass:[SetCard class]]) {
                    SetCard *setCard = (SetCard *)card;
                    [self.setGameStatus addObject:setCard];
                }
                [self addMove:[[NSArray alloc] initWithObjects:[self.setGameStatus objectAtIndex:0],[self.setGameStatus objectAtIndex:1],[self.setGameStatus objectAtIndex:2],[NSNumber numberWithInt:matchScore], nil]];
                //[self.cards removeObject:[self.setGameStatus objectAtIndex:0]];
                //[self.cards removeObject:[self.setGameStatus objectAtIndex:1]];
                //[self.cards removeObject:[self.setGameStatus objectAtIndex:2]];
                self.moveCompleted = YES;
                
            }
            else {
                self.score -= MISMATCH_PENALTY;
                for (Card *otherCard in chosenCards) {
                    otherCard.chosen = NO;
                }
                self.matched = NO;
                if ([card isKindOfClass:[SetCard class]]) {
                    SetCard *setCard = (SetCard *)card;
                    [self.setGameStatus addObject:setCard];
                    //NSLog(@"%ld", [self.setGameStatus count]);
                    SetCard* card1 = [self.setGameStatus objectAtIndex:0];
                    SetCard* card2 = [self.setGameStatus objectAtIndex:1];
                    SetCard* card3 = [self.setGameStatus objectAtIndex:2];
                    NSArray *array =[[NSArray alloc] initWithObjects:card1,card2,card3,[NSNumber numberWithInt:(-MISMATCH_PENALTY)], nil];
                    [self addMove:array];
                    NSLog(@"%ld", [self.matchHistory count]);
                    [self.setGameStatus insertObject:[self.setGameStatus lastObject] atIndex:0];
                    [self.setGameStatus removeLastObject];
                    [self.setGameStatus removeLastObject];
                    [self.setGameStatus removeLastObject];
                    self.moveCompleted = YES;
                }
            }
            self.numberOfChosenCards = 0;
        }
        self.score -=COST_TO_CHOOSE;
        card.chosen = YES;
    }
}
-(void) removeMatchedCards {
    [self.cards removeObject:[self.setGameStatus objectAtIndex:0]];
    [self.cards removeObject:[self.setGameStatus objectAtIndex:1]];
    [self.cards removeObject:[self.setGameStatus objectAtIndex:2]];
}

@end
