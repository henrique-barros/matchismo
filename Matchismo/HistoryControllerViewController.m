//
//  HistoryControllerViewController.m
//  Matchismo
//
//  Created by Henrique Barros on 1/16/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "HistoryControllerViewController.h"

@interface HistoryControllerViewController ()
@property (weak, nonatomic) IBOutlet UITextView *historyTextView;

@end

@implementation HistoryControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.historyTextView.Text = @"";
    // Do any additional setup after loading the view.
    NSLog(@"%@",self.matchHistory);
    for (NSArray *match in self.matchHistory) {
        SetCard *card1 = match[0];
        SetCard *card2 = match[1];
        SetCard *card3 = match[2];
        NSNumber *score = match[3];
        NSMutableAttributedString *attributedString = [SetGameViewController setAttributedStringForCard:card1];
        [attributedString appendAttributedString:[SetGameViewController setAttributedStringForCard:card2]];
        [attributedString appendAttributedString:[SetGameViewController setAttributedStringForCard:card3]];
        NSAttributedString *matched;
        if ([score intValue]>0) {
            matched = [[NSAttributedString alloc] initWithString:@" Matched!"];
        }
        else {
            matched = [[NSAttributedString alloc] initWithString:@"Not matched!"];
        }
        [attributedString appendAttributedString:matched];
        NSAttributedString *points = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" for %d points", [score intValue]]];
        [attributedString appendAttributedString:points];
        NSMutableAttributedString *previousText = [[NSMutableAttributedString alloc] initWithAttributedString:self.historyTextView.attributedText];
        NSAttributedString *escape = [[NSAttributedString alloc] initWithString:@"\n"];
        
        [previousText appendAttributedString:escape];
        [previousText appendAttributedString:attributedString];
        self.historyTextView.attributedText = previousText;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
