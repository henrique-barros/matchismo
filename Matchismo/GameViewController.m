//
//  GameViewController.m
//  Matchismo
//
//  Created by Henrique Barros on 1/21/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController


-(BOOL)gameHasStarted {
    return _gameHasStarted;
}

-(NSMutableArray *)cardButtons {
    if (!_cardButtons) {
        _cardButtons = [[NSMutableArray alloc] init];
    }
    return _cardButtons;
}

-(void)addCardButton:(UIView *)cardButton {
    [self.cardButtons addObject:cardButton];
}
-(void)removeCardButtonAtIndex:(NSInteger)index {
    [self.cardButtons removeObjectAtIndex:index];
}
-(Grid *)createGridOfSize:(CGSize)size withAspectRatio:(CGFloat)aspectRatio withMinimumNumberOfCells:(NSUInteger)minCells {
    Grid *grid = [[Grid alloc] init];
    grid.size = size;
    grid.cellAspectRatio = aspectRatio;
    grid.minimumNumberOfCells = minCells;
    return grid;
}

@end
