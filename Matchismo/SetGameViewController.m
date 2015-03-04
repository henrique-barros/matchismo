//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Henrique Barros on 1/15/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "SetGame.h"

#import "History.h"
#import "HistoryControllerViewController.h"
#include <math.h>
#include <stdlib.h>
#include <unistd.h>



@interface SetGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UIView *gridView;

@property (weak, nonatomic) IBOutlet UITextView *statusTextView;

@property (strong,nonatomic) SetGame *setGame;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) Deck *deck;
@property (nonatomic) BOOL gameHasStarted;
//@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) History *history;

@end

@implementation SetGameViewController

int compare(const void *first, const void *second)
{
    return *(const int *)first - *(const int *)second;
}

- (void)sortArray:(int *)array ofSize:(size_t)sz
{
    qsort(array, sz, sizeof(*array), compare);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Check History"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryControllerViewController class]]) {
            HistoryControllerViewController *hsvc = (HistoryControllerViewController *)segue.destinationViewController;
            hsvc.matchHistory = self.setGame.matchHistory;
        }
    }
}

-(void) viewDidLoad {
    //_setGame = self.game;
    [super viewDidLoad];
    [self drawCards];
    [self updateUI];
}

-(void) redrawCards:(NSMutableArray *)originalCardButtons {
    for (UIView *card in [self.gridView subviews]) {
        [card removeFromSuperview];
    }
    
    for (int i=0; i<[self.cardButtons count]; i++) {
        SetCardView *scv = (SetCardView *)[self.cardButtons objectAtIndex:i];
        NSInteger row = i/6;
        NSInteger column = i%6;
        CGRect rect = [self.grid frameOfCellAtRow:row inColumn:column];
        scv.frame = rect;
        [self.gridView addSubview:scv];
    }
}

-(void) drawCards {
    CGSize size;
    size.height = 400;
    size.width = 280;
    CGFloat aspectRatio = 0.65625;
    self.numberOfCards = 24;
    self.grid = [self createGridOfSize:size withAspectRatio:aspectRatio withMinimumNumberOfCells:self.numberOfCards*2];
    for (int i = 0; i < self.numberOfCards; i++) {
        SetCardView *scv = [[SetCardView alloc ] init];
        
        if ([[self.setGame cardAtIndex:i] isKindOfClass:[SetCard class]]) {
            SetCard *setCard = (SetCard *)[self.setGame cardAtIndex:i];
            scv.active = YES;
            scv.symbol = setCard.symbol;
            scv.number = setCard.number;
            scv.shading = setCard.shading;
            scv.color = setCard.color;
        }
        int factor;
        if (self.numberOfCards == 12) {
            factor = 6;
        } else {
            factor = 8;
        }
        NSInteger row = i/factor;
        NSInteger column = i%factor;
        CGRect rect = [self.grid frameOfCellAtRow:row inColumn:column];
        scv.frame =rect;
        [scv addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
        [self addCardButton:scv];
        [self.gridView addSubview:scv];
    }
}

+ (NSMutableAttributedString *)setAttributedStringForCard:(SetCard *)setCard {
    NSMutableAttributedString *cardTitle = [NSMutableAttributedString alloc];
    if ([setCard.number isEqualToString:@"1"]) {
        [cardTitle initWithString:setCard.symbol];
    }
    else if ([setCard.number isEqualToString:@"2"]) {
        [cardTitle initWithString:[NSString stringWithFormat:@"%@%@",setCard.symbol,setCard.symbol]];
    } else {
        [cardTitle initWithString:[NSString stringWithFormat:@"%@%@%@", setCard.symbol,setCard.symbol,setCard.symbol]];
    }
    NSRange r = [[cardTitle string] rangeOfString:[cardTitle string]];
    if ([setCard.color isEqualToString:@"green"]) {
        [cardTitle setAttributes:@{NSForegroundColorAttributeName : [UIColor greenColor]} range:r];
    }
    else if ([setCard.color isEqualToString:@"red"]) {
        [cardTitle setAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} range:r];
    } else {
        [cardTitle setAttributes:@{NSForegroundColorAttributeName : [UIColor purpleColor]} range:r];
    }
    
    if ([setCard.shading isEqualToString:@"solid"]) {
        [cardTitle addAttributes:@{NSUnderlineStyleAttributeName :@(NSUnderlineStyleNone)} range:r];
    }
    else if ([setCard.shading isEqualToString:@"stripped"]) {
        [cardTitle addAttributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)} range:r];
    } else {
        [cardTitle addAttributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleDouble)} range:r];
    }
    return cardTitle;
}

-(SetGame *)setGame {
    if (!_setGame) {
        _setGame = [[SetGame alloc] initWithCardCount:self.numberOfCards usingDeck:[self createDeck]];
    }
    return _setGame;
}

- (IBAction)restartGameButton:(UIButton *)sender {
    self.gameHasStarted = NO;
    _setGame = [[SetGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    self.statusTextView.Text = @"";
    [self updateUI];
}

-(Deck *)createDeck {
    return [[SetCardDeck alloc] init];
}

-(Deck *)deck {
    if (!_deck) _deck = [[SetCardDeck alloc] init];
    return _deck;
}





- (IBAction)touchCardButton:(UIButton *)sender {
    if(!self.gameHasStarted) {
        self.gameHasStarted = YES;
    }
    //NSLog(@"String: %@", [sender attributedTitleForState:UIControlStateNormal]);
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.setGame chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

-(void) tap:(UITapGestureRecognizer *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender.view];
    [self.setGame chooseCardAtIndex:chosenButtonIndex];
    SetCard *card = (SetCard*)[self.setGame cardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (void)updateUI {
    //self.statusLabel.text = self.game.status;
    int cardsToRemove[3];
    int count = 0;
    NSMutableArray *originalCardButtons = [[NSMutableArray alloc] initWithArray:self.cardButtons];
    
    for (int i =0; i<[self.cardButtons count]; i++) {
    //for (SetCardView *cardButton in self.cardButtons) {
        SetCardView *cardButton = [self.cardButtons objectAtIndex:i];
        int cardButtonIndex = i;
        SetCard *card = (SetCard*)[self.setGame cardAtIndex:cardButtonIndex];
        cardButton.alpha = [self alphaForCard:card];
        if (card.isMatched) {
            //[cardButton removeFromSuperview];
            cardButton.active = NO;
            
            cardsToRemove[count] = cardButtonIndex;
            count++;
        }
       //NSLog(@"%@",card);
        //[cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        //[cardButton setAlpha:[self alphaForCard:card]];
        //cardButton.enabled = !card.isMatched;
    }
    [self sortArray:cardsToRemove ofSize:count];
    NSLog(@"[self.cardButtons description]-Antes>>%d", [self.cardButtons count]);
    NSLog(@"count:%d",count);
    
    
    int variavelTeste;
    __block BOOL animationFinished = NO;
    BOOL doneAnimation = NO;
    for (int i =0; i<count; i++) {
        doneAnimation = YES;
        if (i==1) {
            NSLog(@"cardsToRemove[%d]carta1>>%d",i, cardsToRemove[i]);
            [self removeCardButtonAtIndex:(cardsToRemove[i]-1)];
            
        }
        else if (i==2) {
            __block int carta1 = cardsToRemove[i]-2;
            variavelTeste = carta1;
            UIView *v = self.cardButtons[carta1];
            CGRect newFrame = v.frame;
            if (v.center.x > 160) {
                newFrame.origin.x = 350;
            } else {
                newFrame.origin.x = -30;
            }
            
            [UIView animateWithDuration:1.0 animations:^(void) {
                
                NSLog(@"v.center>>Antes: %f %f", v.center.x, v.center.y);
                
                v.frame = newFrame;
                //v.alpha = 0.0;
                
                NSLog(@"v.center>>Depois: %f %f", v.center.x, v.center.y);
                
                //animationFinished = YES;
            } completion:^ (BOOL finished){
                NSLog(@"Transicao da carta 2 ");
                if (finished) {
                    NSLog(@"teste3");
                    animationFinished = YES;
                    NSLog(@"[self.cardButtons description]-Depois>>%d", [self.cardButtons count]);
                    if (count) {
                        [self redrawCards:originalCardButtons];
                    }
                    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.setGame.score];
                } else {
                    NSLog(@"teste4");
                }
            }];
            
            NSLog(@"cardsToRemove[%d]carta2>>%d",i, cardsToRemove[i]);
            [self removeCardButtonAtIndex:(cardsToRemove[i]-2)];
            [self.setGame removeMatchedCards];
        }
        else  {
            NSLog(@"cardsToRemove[%d]carta0>>%d",i, cardsToRemove[i]);
            [self removeCardButtonAtIndex:cardsToRemove[i]];
        }
    }
    /*
    if (doneAnimation) {
        while (!animationFinished) {
            //NSLog(@"Transicao da carta em andamento ");
            NSLog(@"Posicao da carta 2: %d", self.cardButtons[variavelTeste].center)
        }
    }
    
    NSLog(@"[self.cardButtons description]-Depois>>%d", [self.cardButtons count]);
    if (count) {
        [self redrawCards:originalCardButtons];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.setGame.score];
     */
}




-(float)alphaForCard:(Card *)card {
    return card.isChosen ? 0.5 : 1;
}

@end
