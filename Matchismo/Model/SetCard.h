//
//  SetCard.h
//  Matchismo
//
//  Created by Henrique Barros on 1/15/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic,strong) NSString *number;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *shading;

+(NSArray *)validShading;
+(NSArray *)validSymbols;
+(NSArray *)validColors;
+(NSArray *)validNumbers;

@end
