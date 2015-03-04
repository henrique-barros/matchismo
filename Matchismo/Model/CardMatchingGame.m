//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Henrique Barros on 1/9/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()



@property (nonatomic, readwrite) NSString* status;



@end

@implementation CardMatchingGame

-(NSInteger) numberOfChosenCards {
    return _numberOfChosenCards;
}

-(NSString *) status {
    return _status;
}


-(NSMutableArray *) cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)setCards3Match:(BOOL)Cards3Match {
    _Cards3Match = Cards3Match;
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

-(Card *)cardAtIndex:(NSUInteger)index {
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void) chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (card.isChosen) {
        card.chosen = NO;
        for (Card *otherCard in self.cards) {
            if (otherCard.isChosen) {
                self.status = otherCard.contents;
            }
        }
    } else {
        // match against other chosen cards
        for (Card *otherCard in self.cards) {
            if (!otherCard.isMatched && otherCard.isChosen) {
                int matchScore = [card match:@[otherCard]];
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    otherCard.matched = YES;
                    card.matched = YES;
                    self.status = [NSString stringWithFormat:@"Matched %@ %@ for %d points", card.contents,otherCard.contents, matchScore * MATCH_BONUS];
                }
                else {
                    self.score -= MISMATCH_PENALTY;
                    otherCard.chosen = NO;
                    self.status = [NSString stringWithFormat:@"%@ %@ don't match! %d point penalty!", card.contents, otherCard.contents, MISMATCH_PENALTY];
                }
                break;
            }
        }
        
        self.score -=COST_TO_CHOOSE;
        
        card.chosen = YES;
    }
}

@end
