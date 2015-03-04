//
//  ViewController.m
//  Matchismo
//
//  Created by Henrique Barros on 1/7/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *gridView;
@property (strong,nonatomic) CardMatchingGame *game;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) NSMutableArray *cardButtons; //of PlayingCardViews
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
//@property (nonatomic) BOOL gameHasStarted;
//@property (nonatomic,strong) Grid *grid;
//@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;


@end

@implementation ViewController;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self drawCards];
}

-(void)drawCards {
    CGSize size;
    size.height = 400;
    size.width = 280;
    CGFloat aspectRatio = 0.65625;
    self.numberOfCards = 24;
    self.grid = [self createGridOfSize:size withAspectRatio:aspectRatio withMinimumNumberOfCells:self.numberOfCards];
    for (int i = 0; i < self.numberOfCards; i++) {
        PlayingCardView *pcv = [[PlayingCardView alloc] init];
        if ([[self.game cardAtIndex:i] isKindOfClass:[PlayingCard class]]) {
            PlayingCard *card = (PlayingCard *)[self.game cardAtIndex:i];
            pcv.rank = card.rank;
            pcv.suit = card.suit;
            pcv.faceUp = NO;
        }
        NSInteger row = i%4;
        NSInteger column = i/4;
        CGRect rect = [self.grid frameOfCellAtRow:row inColumn:column];
        pcv.frame = rect;
        [pcv addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];

        [self addCardButton:pcv];
        [self.gridView addSubview:pcv];
        
    }
}




-(CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.numberOfCards usingDeck:[self createDeck]];
    return _game;
}

- (IBAction)restartGameButton:(UIButton *)sender {
    self.gameHasStarted = NO;
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    [self updateUI];
}

-(Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}


- (IBAction)tap:(UITapGestureRecognizer *)sender {
    
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender.view];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [UIView transitionWithView:sender.view
                      duration:0.2
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations: ^{
                        NSLog(@"teste");
                    }
                    completion:NULL];
    [self updateUI];
}



- (void)updateUI {
    NSLog(@"%@",self.cardButtons);
    //self.statusLabel.text = self.game.status;
    for (PlayingCardView *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        if (card.isChosen) {
            cardButton.faceUp = YES;
        }
        else {
            cardButton.faceUp = NO;
        }
        if (card.isMatched) {
            [cardButton setAlpha:0.6];
        }

    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}



@end
