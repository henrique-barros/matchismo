//
//  SetCardView.h
//  Matchismo
//
//  Created by Henrique Barros on 1/21/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCardView : UIView

@property (nonatomic,strong) NSString *number;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *shading;

@property (nonatomic,getter=isActive) BOOL active;

@end
