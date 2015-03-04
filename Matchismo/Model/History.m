//
//  History.m
//  Matchismo
//
//  Created by Henrique Barros on 1/16/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "History.h"

@interface History()

@property (nonatomic, strong) NSMutableArray *moves;

@end

@implementation History

- (NSMutableArray *)moves {
    if (!_moves) {
        _moves = [[NSMutableArray alloc] init];
    }
    return _moves;
}

- (NSString *)lastMove {
    return [self.moves objectAtIndex:[self.moves count] -1];
}

- (NSString *)moveAtIndex:(NSInteger)index {
    return [self.moves objectAtIndex:index];
}

- (void)addMove:(NSString *)move {
    [self.moves addObject:move];
}

@end
