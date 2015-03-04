//
//  Card.h
//  Matchismo
//
//  Created by Henrique Barros on 1/7/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
