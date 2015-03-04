//
//  PlayingCard.m
//  Matchismo
//
//  Created by Henrique Barros on 1/7/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)otherCards {
    int score = 0;
    if ([otherCards count] ==1 ) {
        id card = [otherCards firstObject];
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *) card;
            if (otherCard.rank == self.rank) {
                score = 4;
            } else if (otherCard.suit == self.suit) {
                score = 1;
            }
        }
    }
    //Assignment 2
    else {
        id card = otherCards[0];
        id card2 = otherCards[1];
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *) card;
            if (otherCard.rank == self.rank) {
                score +=4;
            } else if (otherCard.suit == self.suit) {
                score +=1;
            }
        }
        if ([card2 isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard2 = (PlayingCard *) card2;
            if (otherCard2.rank == self.rank) {
                score +=4;
            } else if (otherCard2.suit == self.suit) {
                score +=1;
            }
        }
        if ([card isKindOfClass:[PlayingCard class]] && [card2 isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *) card;
            PlayingCard *otherCard2 = (PlayingCard *) card2;
            if (otherCard.rank == otherCard2.rank) {
                score +=4;
            } else if (otherCard.suit == otherCard2.suit) {
                score +=1;
            }
        }
    }
    
    
    return score;
}

-(NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; //because we provide setter and getter
+ (NSArray *) validSuits {
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}
-(void)setSuit:(NSString *)suit {
    if([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}
-(NSString *)suit {
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3",
             @"4", @"5",@"6",@"7",@"8",@"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
    return [[PlayingCard rankStrings] count];
}

- (void)setRank:(NSUInteger)rank   {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}



@end
