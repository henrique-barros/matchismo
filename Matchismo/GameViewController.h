//
//  GameViewController.h
//  Matchismo
//
//  Created by Henrique Barros on 1/21/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Grid.h"

@interface GameViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *cardButtons; //cards in the game board
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) BOOL gameHasStarted;
@property (nonatomic, strong) Grid *grid;
@property (nonatomic) NSInteger numberOfCards;

-(BOOL)gameHasStarted;

-(void)addCardButton:(UIView *)cardButton;
-(void)removeCardButtonAtIndex:(NSInteger)index;
-(Grid *)createGridOfSize:(CGSize)size withAspectRatio:(CGFloat)aspectRatio withMinimumNumberOfCells:(NSUInteger)minCells;



@end
