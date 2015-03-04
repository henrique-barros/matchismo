//
//  Card.m
//  Matchismo
//
//  Created by Henrique Barros on 1/7/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards {
    int score = 0;
    
    for(Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]){
            score=1;
        }
    }
    return score;
}





@end
