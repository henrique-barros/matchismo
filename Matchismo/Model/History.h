//
//  History.h
//  Matchismo
//
//  Created by Henrique Barros on 1/16/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface History : NSObject

- (NSString *)lastMove;
- (NSString *)moveAtIndex:(NSInteger)index;
- (void)addMove:(NSString *)move;

@end
