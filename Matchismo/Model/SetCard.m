//
//  SetCard.m
//  Matchismo
//
//  Created by Henrique Barros on 1/15/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


#pragma number;
@synthesize number = _number;

-(void)setNumber:(id)number {
    if ([[SetCard validNumbers] containsObject:number]) {
        _number = number;
    }
}

+ (NSArray *) validNumbers{
    //return @[@1,@2,@3];
    NSArray *array = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
    return array;
}

-(NSString *)number {
    return _number;
}

@synthesize symbol = _symbol;
+(NSArray *)validSymbols {
    return @[@"diamond",@"squiggle",@"oval"];
}
-(void)setSymbol:(NSString *)symbol {
    if ([[SetCard validSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
}
-(NSString *)symbol {
    return _symbol;
}

@synthesize color = _color;

+ (NSArray *) validColors {
    return @[@"red", @"green", @"purple"];
}

- (void)setColor:(NSString *)color {
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}

-(NSString *)color {
    return _color;
}

@synthesize shading = _shading;

+(NSArray *)validShading {
    return @[@"solid", @"stripped", @"open"];
}
-(void)setShading:(NSString *)shading {
    if([[SetCard validShading] containsObject:shading]) {
        _shading = shading;
    }
}
-(NSString *)shading {
    return _shading;
}

-(int) match:(NSArray *)otherCards {
    int score = 0;
    if ([otherCards count] == 2) {
        SetCard *card2 = otherCards[0];
        SetCard *card3 = otherCards[1];
        if ([self.number isEqualToString:card2.number] && [card2.number isEqualToString:card3.number]) {
            if ([self.symbol isEqualToString:card2.symbol] && [card2.symbol isEqualToString:card3.symbol]) {
                if ([self.shading isEqualToString:card2.shading] && [card2.shading isEqualToString:card3.shading]) {
                    if ([self.color isEqualToString:card2.color] && [card2.color isEqualToString:card3.color]) {
                        return 2;
                    } else if (![self.color isEqualToString:card2.color] && ![card2.color isEqualToString:card3.color])
                        return 2;
                    else {
                        return 0;
                    }
                } else if (![self.shading isEqualToString:card2.shading] && ![card2.shading isEqualToString:card3.shading]) {
                    if ([self.color isEqualToString:card2.color] && [card2.color isEqualToString:card3.color]) {
                        return 2;
                    } else if (![self.color isEqualToString:card2.color] && ![card2.color isEqualToString:card3.color])
                        return 2;
                    else {
                        return 0;
                    }
                } else {
                    return 0;
                }
            }
            else if (![self.symbol isEqualToString:card2.symbol] && ![card2.symbol isEqualToString:card3.symbol]) {
                if ([self.shading isEqualToString:card2.shading] && [card2.shading isEqualToString:card3.shading]) {
                    if ([self.color isEqualToString:card2.color] && [card2.color isEqualToString:card3.color]) {
                        return 2;
                    } else if (![self.color isEqualToString:card2.color] && ![card2.color isEqualToString:card3.color])
                        return 2;
                    else {
                        return 0;
                    }
                } else if (![self.shading isEqualToString:card2.shading] && ![card2.shading isEqualToString:card3.shading]) {
                    if ([self.color isEqualToString:card2.color] && [card2.color isEqualToString:card3.color]) {
                        return 2;
                    } else if (![self.color isEqualToString:card2.color] && ![card2.color isEqualToString:card3.color])
                        return 2;
                    else {
                        return 0;
                    }
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        }
        else if (![self.number isEqualToString:card2.number] && ![card2.number isEqualToString:card3.number]){
            if ([self.symbol isEqualToString:card2.symbol] && [card2.symbol isEqualToString:card3.symbol]) {
                if ([self.shading isEqualToString:card2.shading] && [card2.shading isEqualToString:card3.shading]) {
                    if ([self.color isEqualToString:card2.color] && [card2.color isEqualToString:card3.color]) {
                        return 2;
                    } else if (![self.color isEqualToString:card2.color] && ![card2.color isEqualToString:card3.color])
                        return 2;
                    else {
                        return 0;
                    }
                } else if (![self.shading isEqualToString:card2.shading] && ![card2.shading isEqualToString:card3.shading]) {
                    if ([self.color isEqualToString:card2.color] && [card2.color isEqualToString:card3.color]) {
                        return 2;
                    } else if (![self.color isEqualToString:card2.color] && ![card2.color isEqualToString:card3.color])
                        return 2;
                    else {
                        return 0;
                    }
                } else {
                    return 0;
                }
            }
            else if (![self.symbol isEqualToString:card2.symbol] && ![card2.symbol isEqualToString:card3.symbol]) {
                if ([self.shading isEqualToString:card2.shading] && [card2.shading isEqualToString:card3.shading]) {
                    if ([self.color isEqualToString:card2.color] && [card2.color isEqualToString:card3.color]) {
                        return 2;
                    } else if (![self.color isEqualToString:card2.color] && ![card2.color isEqualToString:card3.color])
                        return 2;
                    else {
                        return 0;
                    }
                } else if (![self.shading isEqualToString:card2.shading] && ![card2.shading isEqualToString:card3.shading]) {
                    if ([self.color isEqualToString:card2.color] && [card2.color isEqualToString:card3.color]) {
                        return 2;
                    } else if (![self.color isEqualToString:card2.color] && ![card2.color isEqualToString:card3.color])
                        return 2;
                    else {
                        return 0;
                    }
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
            
        }
        else {
            return 0;
        }
    }
    
    
    return score;
}

@end
