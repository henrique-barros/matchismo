//
//  SetCardView.m
//  Matchismo
//
//  Created by Henrique Barros on 1/21/15.
//  Copyright (c) 2015 Henrique Barros. All rights reserved.
//

#import "SetCardView.h"

@implementation SetCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#define DEFAULT_FACE_CARD_SCALE_FACTOR 0.90

/*@synthesize faceCardScaleFactor = _faceCardScaleFactor;

- (CGFloat)faceCardScaleFactor
{
    if (!_faceCardScaleFactor) _faceCardScaleFactor = DEFAULT_FACE_CARD_SCALE_FACTOR;
    return _faceCardScaleFactor;
}

- (void)setFaceCardScaleFactor:(CGFloat)faceCardScaleFactor
{
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];
}*/



-(void) setShading:(NSString *)shading {
    _shading = shading;
    [self setNeedsDisplay];
}
-(void) setColor:(NSString *)color {
    _color = color;
    [self setNeedsDisplay];
}
-(void)setNumber:(NSString *)number {
    _number = number;
    [self setNeedsDisplay];
}

-(void) setSymbol:(NSString *)symbol {
    _symbol = symbol;
    [self setNeedsDisplay];
}


-(void) setActive:(BOOL)active {
    _active = active;
}



#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT; }
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }


- (void) drawRect:(CGRect)rect {
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    
    [roundedRect addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    
    
    //[squiggle addClip];
    

    
    //[self drawSquiggleWithStartPoint:start WithEndPoint:point2];
    
    //[self drawDiamondInCenter:point2 WithDx:40];
    
    //[self drawOvalInCenter:point2 WithDx:40];
    
    CGPoint center;
    
    center.x = self.bounds.origin.x +self.bounds.size.width/2;
    center.y = self.bounds.origin.y + self.bounds.size.height/2;
    
     //1 squiggle:
     /*CGPoint point1;
    CGPoint point2;
    point1.x = center.x - self.bounds.size.width/4;
    point1.y = center.y - self.bounds.size.height/14;
    point2.x = center.x + self.bounds.size.width/4;
    point2.y = point1.y - self.bounds.size.height/8;
    UIBezierPath *squiggle = [self drawSquiggleWithStartPoint:point1 WithEndPoint:point2];
    //[squiggle stroke];
    //[[UIColor redColor] setFill];
    //[[UIColor redColor] setStroke];
    //[squiggle stroke];
    UIBezierPath *stripes = [UIBezierPath bezierPath];
    for ( int x = 0; x < self.bounds.size.width; x += 20 )
    {
        [stripes moveToPoint:CGPointMake( self.bounds.origin.x + x, self.bounds.origin.y )];
        [stripes addLineToPoint:CGPointMake( self.bounds.origin.x + x, self.bounds.origin.y + self.bounds.size.height )];
    }
    [stripes setLineWidth:10];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw the fill pattern first, using the outline to clip
    CGContextSaveGState( context );         // save the graphics state
    [squiggle addClip];                        // use the outline as the clipping path
    [[UIColor greenColor] set];              // blue color for vertical stripes
    [stripes stroke];                       // draw the stripes
    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
    
    // draw the outline of the shape
    [[UIColor greenColor] set];             // green color for the outline
    [squiggle stroke];
    
    //[squiggle closePath];
    //[squiggle fill];*/
    
    //2 squiggles:
    /*CGPoint point1;
    CGPoint point2;
    CGPoint point3;
    CGPoint point4;
    point1.x = center.x - self.bounds.size.width/4;
    point2.x = center.x + self.bounds.size.width/4;
    point3.x = point1.x;
    point4.x = point2.x;
    point1.y = center.y - self.bounds.size.height/6;
    point2.y = point1.y - self.bounds.size.height/8;
    point3.y = center.y + self.bounds.size.height/6;
    point4.y = point3.y - self.bounds.size.height/8;
    
    UIBezierPath *squiggle1 = [self drawSquiggleWithStartPoint:point1 WithEndPoint:point2];
    UIBezierPath *squiggle2 = [self drawSquiggleWithStartPoint:point3 WithEndPoint:point4];
    [squiggle1 stroke];
    [squiggle2 stroke];*/
    
    //3 squiggles:
    /*CGPoint point1;
    CGPoint point2;
    CGPoint point3;
    CGPoint point4;
    CGPoint point5;
    CGPoint point6;
    point1.x = center.x - self.bounds.size.width/4;
    point2.x = center.x + self.bounds.size.width/4;
    point3.x = point1.x;
    point4.x = point2.x;
    point5.x = point3.x;
    point6.x = point2.x;
    point1.y = center.y - self.bounds.size.height/14;
    point2.y = point1.y - self.bounds.size.height/8;
    point3.y = point2.y - self.bounds.size.height/8;
    point4.y = point3.y - self.bounds.size.height/8;
    point5.y = point1.y + self.bounds.size.height/4;
    point6.y = point5.y - self.bounds.size.height/8;
    UIBezierPath *squiggle1 = [self drawSquiggleWithStartPoint:point1 WithEndPoint:point2];
    UIBezierPath *squiggle2 = [self drawSquiggleWithStartPoint:point3 WithEndPoint:point4];
    UIBezierPath *squiggle3 = [self drawSquiggleWithStartPoint:point5 WithEndPoint:point6];
    [squiggle1 stroke];
    [squiggle2 stroke];
    [squiggle3 stroke];*/
    
    //1 oval:
    /*UIBezierPath *oval = [self drawOvalInCenter:center WithDx:self.bounds.size.width/4];
    [[UIColor redColor] setFill];
    [oval fill];*/
    
    //2 oval:
    /*CGPoint center1;
    CGPoint center2;
    center1.x = center.x;
    center2.x = center.x;
    center1.y = center.y + 0.1*self.bounds.size.height;
    center2.y = center.y - 0.1*self.bounds.size.height;
    UIBezierPath *oval1 = [self drawOvalInCenter:center1 WithDx:self.bounds.size.width/4];
    UIBezierPath *oval2 = [self drawOvalInCenter:center2 WithDx:self.bounds.size.width/4];
    [oval1 stroke];
    [oval2 stroke];*/
    
    //3 oval:
    /*CGPoint center1;
    CGPoint center2;
    CGPoint center3;
    center1.x = center.x;
    center2.x = center.x;
    center3.x = center.x;
    center1.y = center.y;
    center2.y = center1.y - 0.2*self.bounds.size.height;
    center3.y = center1.y + 0.2*self.bounds.size.height;
    UIBezierPath *oval1 = [self drawOvalInCenter:center1 WithDx:self.bounds.size.width/4];
    UIBezierPath *oval2 = [self drawOvalInCenter:center2 WithDx:self.bounds.size.width/4];
    UIBezierPath *oval3 =[self drawOvalInCenter:center3 WithDx:self.bounds.size.width/4];
    [oval1 stroke];
    [oval2 stroke];
    [oval3 stroke];*/
    
    //1 diamond:
    /*UIBezierPath *diamond = [self drawDiamondInCenter:center WithDx:self.bounds.size.width/4];
    [diamond stroke];*/
    
    //2 diamond:
    /*CGPoint center1;
    CGPoint center2;
    center1.x = center.x;
    center2.x = center.x;
    center1.y = center.y + 0.1*self.bounds.size.height;
    center2.y = center.y - 0.1*self.bounds.size.height;
    UIBezierPath *diamond1 = [self drawDiamondInCenter:center1 WithDx:self.bounds.size.width/4];
    UIBezierPath *diamond2 = [self drawDiamondInCenter:center2 WithDx:self.bounds.size.width/4];
    [diamond1 stroke];
    [diamond2 stroke];*/
    
    //3 diamond:
    /*CGPoint center1;
    CGPoint center2;
    CGPoint center3;
    center1.x = center.x;
    center2.x = center.x;
    center3.x = center.x;
    center1.y = center.y;
    center2.y = center1.y - 0.2*self.bounds.size.height;
    center3.y = center1.y + 0.2*self.bounds.size.height;
    UIBezierPath *diamond1 = [self drawDiamondInCenter:center1 WithDx:self.bounds.size.width/4];
    UIBezierPath *diamond2 = [self drawDiamondInCenter:center2 WithDx:self.bounds.size.width/4];
    UIBezierPath *diamond3 = [self drawDiamondInCenter:center3 WithDx:self.bounds.size.width/4];
    [diamond1 stroke];
    [diamond2 stroke];
    [diamond3 stroke];*/
    
    UIBezierPath *stripes = [UIBezierPath bezierPath];
    for ( int x = 0; x < self.bounds.size.width; x += 2*self.bounds.size.width/15 )
    {
        [stripes moveToPoint:CGPointMake( self.bounds.origin.x + x, self.bounds.origin.y )];
        [stripes addLineToPoint:CGPointMake( self.bounds.origin.x + x, self.bounds.origin.y + self.bounds.size.height )];
    }
    [stripes setLineWidth:self.bounds.size.width/15];
    
    
    
    if ([self.number isEqualToString:@"1"]) {
        if ([self.symbol isEqualToString:@"squiggle"]) {
            CGPoint point1;
            CGPoint point2;
            point1.x = center.x - self.bounds.size.width/4;
            point1.y = center.y - self.bounds.size.height/14;
            point2.x = center.x + self.bounds.size.width/4;
            point2.y = point1.y - self.bounds.size.height/8;
            UIBezierPath *squiggle = [self drawSquiggleWithStartPoint:point1 WithEndPoint:point2];
            if ([self.shading isEqualToString:@"solid"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setFill];
                    [[UIColor greenColor] setStroke];
                    [squiggle stroke];
                    [squiggle fill];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setFill];
                    [[UIColor redColor] setStroke];
                    [squiggle stroke];
                    [squiggle fill];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setFill];
                    [[UIColor purpleColor] setStroke];
                    [squiggle stroke];
                    [squiggle fill];
                }
            }
            else if ([self.shading isEqualToString:@"stripped"]) {
                if([self.color isEqualToString:@"green"]) {
                    
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle addClip];                        // use the outline as the clipping path
                    [[UIColor greenColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [[UIColor greenColor] set];             // green color for the outline
                    [squiggle stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle addClip];                        // use the outline as the clipping path
                    [[UIColor redColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [[UIColor redColor] set];             // green color for the outline
                    [squiggle stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle addClip];                        // use the outline as the clipping path
                    [[UIColor purpleColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [[UIColor purpleColor] set];             // green color for the outline
                    [squiggle stroke];
                }
            }
            else if ([self.shading isEqualToString:@"open"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setStroke];
                    [squiggle stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setStroke];
                    [squiggle stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setStroke];
                    [squiggle stroke];
                }
            }
        }
        else if ([self.symbol isEqualToString:@"oval"]) {
            UIBezierPath *oval = [self drawOvalInCenter:center WithDx:self.bounds.size.width/4];
            if ([self.shading isEqualToString:@"solid"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setFill];
                    [oval fill];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setFill];
                    [oval fill];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setFill];
                    [oval fill];
                }
            }
            else if ([self.shading isEqualToString:@"stripped"]) {
                if([self.color isEqualToString:@"green"]) {
                    
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval addClip];                        // use the outline as the clipping path
                    [[UIColor greenColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [[UIColor greenColor] set];             // green color for the outline
                    [oval stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval addClip];                        // use the outline as the clipping path
                    [[UIColor redColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [[UIColor redColor] set];             // green color for the outline
                    [oval stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval addClip];                        // use the outline as the clipping path
                    [[UIColor purpleColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [[UIColor purpleColor] set];             // green color for the outline
                    [oval stroke];
                }
            }
            else if ([self.shading isEqualToString:@"open"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setStroke];
                    [oval stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setStroke];
                    [oval stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setStroke];
                    [oval stroke];
                }
            }
        }
        else if ([self.symbol isEqualToString:@"diamond"]) {
            UIBezierPath *diamond = [self drawDiamondInCenter:center WithDx:self.bounds.size.width/4];
            if ([self.shading isEqualToString:@"solid"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setFill];
                    [diamond fill];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setFill];
                    [diamond fill];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setFill];
                    [diamond fill];
                }
            }
            else if ([self.shading isEqualToString:@"stripped"]) {
                if([self.color isEqualToString:@"green"]) {
                    
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond addClip];                        // use the outline as the clipping path
                    [[UIColor greenColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [[UIColor greenColor] set];             // green color for the outline
                    [diamond stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {

                    
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond addClip];                        // use the outline as the clipping path
                    [[UIColor redColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [[UIColor redColor] set];             // green color for the outline
                    [diamond stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond addClip];                        // use the outline as the clipping path
                    [[UIColor purpleColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [[UIColor purpleColor] set];             // green color for the outline
                    [diamond stroke];
                }
            }
            else if ([self.shading isEqualToString:@"open"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setStroke];
                    [diamond stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setStroke];
                    [diamond stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setStroke];
                    [diamond stroke];
                }
            }
        }
    }
    else if ([self.number isEqualToString:@"2"]) {
        if ([self.symbol isEqualToString:@"squiggle"]) {
            CGPoint point1;
            CGPoint point2;
            CGPoint point3;
            CGPoint point4;
            point1.x = center.x - self.bounds.size.width/4;
            point2.x = center.x + self.bounds.size.width/4;
            point3.x = point1.x;
            point4.x = point2.x;
            point1.y = center.y - self.bounds.size.height/6;
            point2.y = point1.y - self.bounds.size.height/8;
            point3.y = center.y + self.bounds.size.height/6;
            point4.y = point3.y - self.bounds.size.height/8;
            
            UIBezierPath *squiggle1 = [self drawSquiggleWithStartPoint:point1 WithEndPoint:point2];
            UIBezierPath *squiggle2 = [self drawSquiggleWithStartPoint:point3 WithEndPoint:point4];
            if ([self.shading isEqualToString:@"solid"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setFill];
                    [squiggle1 fill];
                    [squiggle2 fill];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setFill];
                    [squiggle1 fill];
                    [squiggle2 fill];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setFill];
                    [squiggle1 fill];
                    [squiggle2 fill];
                }
            }
            else if ([self.shading isEqualToString:@"stripped"]) {
                if([self.color isEqualToString:@"green"]) {
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle1 addClip];                        // use the outline as the clipping path
                    [[UIColor greenColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle2 addClip];                        // use the outline as the clipping path
                    [[UIColor greenColor] set];              // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [[UIColor greenColor] set];             // green color for the outline
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle1 addClip];                        // use the outline as the clipping path
                                 // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                }
            }
            else if ([self.shading isEqualToString:@"open"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setStroke];
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setStroke];
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setStroke];
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                }
            }
        }
        else if ([self.symbol isEqualToString:@"oval"]) {
            CGPoint center1;
            CGPoint center2;
            center1.x = center.x;
            center2.x = center.x;
            center1.y = center.y + 0.1*self.bounds.size.height;
            center2.y = center.y - 0.1*self.bounds.size.height;
            UIBezierPath *oval1 = [self drawOvalInCenter:center1 WithDx:self.bounds.size.width/4];
            UIBezierPath *oval2 = [self drawOvalInCenter:center2 WithDx:self.bounds.size.width/4];
            if ([self.shading isEqualToString:@"solid"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setFill];
                    [oval1 fill];
                    [oval2 fill];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setFill];
                    [oval1 fill];
                    [oval2 fill];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setFill];
                    [oval1 fill];
                    [oval2 fill];
                }
            }
            else if ([self.shading isEqualToString:@"stripped"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [oval1 stroke];
                    [oval2 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [oval1 stroke];
                    [oval2 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [oval1 stroke];
                    [oval2 stroke];
                }
            }
            else if ([self.shading isEqualToString:@"open"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setStroke];
                    [oval1 stroke];
                    [oval2 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setStroke];
                    [oval1 stroke];
                    [oval2 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setStroke];
                    [oval1 stroke];
                    [oval2 stroke];
                }
            }
        }
        else if ([self.symbol isEqualToString:@"diamond"]) {
            CGPoint center1;
            CGPoint center2;
            center1.x = center.x;
            center2.x = center.x;
            center1.y = center.y + 0.1*self.bounds.size.height;
            center2.y = center.y - 0.1*self.bounds.size.height;
            UIBezierPath *diamond1 = [self drawDiamondInCenter:center1 WithDx:self.bounds.size.width/4];
            UIBezierPath *diamond2 = [self drawDiamondInCenter:center2 WithDx:self.bounds.size.width/4];
            if ([self.shading isEqualToString:@"solid"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setFill];
                    [diamond1 fill];
                    [diamond2 fill];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setFill];
                    [diamond1 fill];
                    [diamond2 fill];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setFill];
                    [diamond1 fill];
                    [diamond2 fill];
                }
            }
            else if ([self.shading isEqualToString:@"stripped"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [diamond1 stroke];
                    [diamond2 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [diamond1 stroke];
                    [diamond2 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [diamond1 stroke];
                    [diamond2 stroke];
                }
            }
            else if ([self.shading isEqualToString:@"open"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setStroke];
                    [diamond1 stroke];
                    [diamond2 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setStroke];
                    [diamond1 stroke];
                    [diamond2 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setStroke];
                    [diamond1 stroke];
                    [diamond2 stroke];
                }
            }
        }
    }
    else if ([self.number isEqualToString:@"3"]) {
        if ([self.symbol isEqualToString:@"squiggle"]) {
            CGPoint point1;
            CGPoint point2;
            CGPoint point3;
            CGPoint point4;
            CGPoint point5;
            CGPoint point6;
            point1.x = center.x - self.bounds.size.width/4;
            point2.x = center.x + self.bounds.size.width/4;
            point3.x = point1.x;
            point4.x = point2.x;
            point5.x = point3.x;
            point6.x = point2.x;
            point1.y = center.y - self.bounds.size.height/14;
            point2.y = point1.y - self.bounds.size.height/8;
            point3.y = point2.y - self.bounds.size.height/8;
            point4.y = point3.y - self.bounds.size.height/8;
            point5.y = point1.y + self.bounds.size.height/4;
            point6.y = point5.y - self.bounds.size.height/8;
            UIBezierPath *squiggle1 = [self drawSquiggleWithStartPoint:point1 WithEndPoint:point2];
            UIBezierPath *squiggle2 = [self drawSquiggleWithStartPoint:point3 WithEndPoint:point4];
            UIBezierPath *squiggle3 = [self drawSquiggleWithStartPoint:point5 WithEndPoint:point6];
            if ([self.shading isEqualToString:@"solid"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setFill];
                    [squiggle1 fill];
                    [squiggle2 fill];
                    [squiggle3 fill];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setFill];
                    [squiggle1 fill];
                    [squiggle2 fill];
                    [squiggle3 fill];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setFill];
                    [squiggle1 fill];
                    [squiggle2 fill];
                    [squiggle3 fill];
                }
            }
            else if ([self.shading isEqualToString:@"stripped"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle3 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                    [squiggle3 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle3 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                    [squiggle3 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    CGContextSaveGState( context );         // save the graphics state
                    [squiggle3 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                    [squiggle3 stroke];
                }
            }
            else if ([self.shading isEqualToString:@"open"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setStroke];
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                    [squiggle3 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setStroke];
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                    [squiggle3 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setStroke];
                    [squiggle1 stroke];
                    [squiggle2 stroke];
                    [squiggle3 stroke];
                }
            }
        }
        else if ([self.symbol isEqualToString:@"oval"]) {
            CGPoint center1;
            CGPoint center2;
            CGPoint center3;
            center1.x = center.x;
            center2.x = center.x;
            center3.x = center.x;
            center1.y = center.y;
            center2.y = center1.y - 0.2*self.bounds.size.height;
            center3.y = center1.y + 0.2*self.bounds.size.height;
            UIBezierPath *oval1 = [self drawOvalInCenter:center1 WithDx:self.bounds.size.width/4];
            UIBezierPath *oval2 = [self drawOvalInCenter:center2 WithDx:self.bounds.size.width/4];
            UIBezierPath *oval3 =[self drawOvalInCenter:center3 WithDx:self.bounds.size.width/4];
            if ([self.shading isEqualToString:@"solid"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setFill];
                    [oval1 fill];
                    [oval2 fill];
                    [oval3 fill];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setFill];
                    [oval1 fill];
                    [oval2 fill];
                    [oval3 fill];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setFill];
                    [oval1 fill];
                    [oval2 fill];
                    [oval3 fill];
                }
            }
            else if ([self.shading isEqualToString:@"stripped"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    CGContextSaveGState( context );         // save the graphics state
                    [oval3 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [oval1 stroke];
                    [oval2 stroke];
                    [oval3 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    CGContextSaveGState( context );         // save the graphics state
                    [oval3 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [oval1 stroke];
                    [oval2 stroke];
                    [oval3 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [oval2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    CGContextSaveGState( context );         // save the graphics state
                    [oval3 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [oval1 stroke];
                    [oval2 stroke];
                    [oval3 stroke];
                }
            }
            else if ([self.shading isEqualToString:@"open"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setStroke];
                    [oval1 stroke];
                    [oval2 stroke];
                    [oval3 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setStroke];
                    [oval1 stroke];
                    [oval2 stroke];
                    [oval3 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setStroke];
                    [oval1 stroke];
                    [oval2 stroke];
                    [oval3 stroke];
                }
            }
        }
        else if ([self.symbol isEqualToString:@"diamond"]) {
            CGPoint center1;
            CGPoint center2;
            CGPoint center3;
            center1.x = center.x;
            center2.x = center.x;
            center3.x = center.x;
            center1.y = center.y;
            center2.y = center1.y - 0.2*self.bounds.size.height;
            center3.y = center1.y + 0.2*self.bounds.size.height;
            UIBezierPath *diamond1 = [self drawDiamondInCenter:center1 WithDx:self.bounds.size.width/4];
            UIBezierPath *diamond2 = [self drawDiamondInCenter:center2 WithDx:self.bounds.size.width/4];
            UIBezierPath *diamond3 = [self drawDiamondInCenter:center3 WithDx:self.bounds.size.width/4];
            if ([self.shading isEqualToString:@"solid"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setFill];
                    [diamond1 fill];
                    [diamond2 fill];
                    [diamond3 fill];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setFill];
                    [diamond1 fill];
                    [diamond2 fill];
                    [diamond3 fill];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setFill];
                    [diamond1 fill];
                    [diamond2 fill];
                    [diamond3 fill];
                }
            }
            else if ([self.shading isEqualToString:@"stripped"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond3 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [diamond1 stroke];
                    [diamond2 stroke];
                    [diamond3 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond3 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [diamond1 stroke];
                    [diamond2 stroke];
                    [diamond3 stroke];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] set];
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond1 addClip];                        // use the outline as the clipping path
                    // blue color for vertical stripes
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the fill pattern first, using the outline to clip
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond2 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    CGContextSaveGState( context );         // save the graphics state
                    [diamond3 addClip];                        // use the outline as the clipping path
                    [stripes stroke];                       // draw the stripes
                    CGContextRestoreGState( context );      // restore the graphics state, removes the clipping path
                    
                    // draw the outline of the shape
                    [diamond1 stroke];
                    [diamond2 stroke];
                    [diamond3 stroke];
                }
            }
            else if ([self.shading isEqualToString:@"open"]) {
                if([self.color isEqualToString:@"green"]) {
                    [[UIColor greenColor] setStroke];
                    [diamond1 stroke];
                    [diamond2 stroke];
                    [diamond3 stroke];
                }
                else if ([self.color isEqualToString:@"red"]) {
                    [[UIColor redColor] setFill];
                    [diamond1 fill];
                    [diamond2 fill];
                    [diamond3 fill];
                }
                else if ([self.color isEqualToString:@"purple"]) {
                    [[UIColor purpleColor] setFill];
                    [diamond1 fill];
                    [diamond2 fill];
                    [diamond3 fill];
                }
            }
        }
    }
    

}


//Start point = primeiro vertice traço de cima, end point = segundo vertice traço de cima
-(UIBezierPath *) drawSquiggleWithStartPoint:(CGPoint) startPoint WithEndPoint:(CGPoint) endPoint {
    UIBezierPath *squiggle = [[UIBezierPath alloc] init];
    
    CGPoint controlPoint1;
    controlPoint1.x = (startPoint.x + endPoint.x)/2;
    controlPoint1.y = startPoint.y + 0.9*(startPoint.y - endPoint.y);
    CGPoint controlPoint2;
    controlPoint2.x = (startPoint.x + endPoint.x)/2;
    controlPoint2.y = endPoint.y - 0.9*(startPoint.y - endPoint.y);
    
    [squiggle moveToPoint:startPoint];
    [squiggle addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    CGPoint point3;
    point3.x = endPoint.x;
    point3.y = endPoint.y + 1.5*(startPoint.y-endPoint.y);
    
    CGPoint controlPoint3;
    controlPoint3.x = endPoint.x + 0.1 * (endPoint.x-startPoint.x);
    controlPoint3.y = (point3.y + endPoint.y)/2;
    
    [squiggle addQuadCurveToPoint:point3 controlPoint:controlPoint3];
    
    CGPoint point4;
    point4.x = startPoint.x;
    point4.y = startPoint.y + 1.5*(startPoint.y-endPoint.y);
    

    
    [squiggle moveToPoint:point4];
    CGPoint controlPoint4;
    controlPoint4.x = (point4.x + point3.x)/2;
    controlPoint4.y = point4.y + 0.9*(point4.y - point3.y);
    CGPoint controlPoint5;
    controlPoint5.x = (point4.x + point3.x)/2;
    controlPoint5.y = point3.y - 0.9*(point4.y - point3.y);
    
    
    [squiggle addCurveToPoint:point3 controlPoint1:controlPoint4 controlPoint2:controlPoint5];
    
    CGPoint controlPoint6;
    controlPoint6.x = startPoint.x - 0.1 * (endPoint.x-startPoint.x);
    controlPoint6.y = (startPoint.y + point4.y)/2;
    
    [squiggle moveToPoint:startPoint];
    [squiggle addQuadCurveToPoint:point4 controlPoint:controlPoint6];

    //[squiggle closePath];
    
    [[UIColor blackColor] setStroke];
    //[squiggle stroke];
    return squiggle;
}


//Dx = distancia do centro até os vertices do lado
-(UIBezierPath *) drawDiamondInCenter:(CGPoint)center WithDx:(int)dx {
    UIBezierPath *diamond =[[UIBezierPath alloc] init];
    CGPoint left;
    CGPoint top;
    CGPoint right;
    CGPoint bottom;
    left.x = center.x - dx;
    left.y = center.y;
    right.x = center.x + dx;
    right.y = center.y;
    top.x = center.x;
    top.y = center.y - dx + 0.4*dx;
    bottom.x = center.x;
    bottom.y = center.y + dx - 0.4*dx;
    [diamond moveToPoint:left];
    [diamond addLineToPoint:top];
    [diamond addLineToPoint:right];
    [diamond addLineToPoint:bottom];
    
    [diamond closePath];
    [[UIColor blackColor] setStroke];
    //[diamond stroke];
    return diamond;
}

//dx = distancia do centro do oval até o traço que liga os dois vertices
-(UIBezierPath *) drawOvalInCenter:(CGPoint)center WithDx:(int)dx {
    UIBezierPath *oval = [[UIBezierPath alloc] init];
    CGPoint point1;
    CGPoint point2;
    CGPoint point3;
    CGPoint point4;
    point1.x = center.x - dx;
    point1.y = center.y - 0.4*dx;
    point2.y = point1.y;
    point2.x = point1.x + 2*dx;
    point3.x = point2.x;
    point3.y = point2.y + 2 * (0.4 * dx);
    point4.x = point1.x;
    point4.y = point3.y;
    [oval moveToPoint:point1];
    [oval addLineToPoint:point2];
    CGPoint controlPoint1;
    controlPoint1.x = point2.x + 0.7*dx;
    controlPoint1.y = (point2.y + point3.y) / 2;
    [oval addQuadCurveToPoint:point3 controlPoint:controlPoint1];
    [oval addLineToPoint:point4];
    CGPoint controlPoint2;
    controlPoint2.x = point1.x - 0.7*dx;
    controlPoint2.y = (point1.y + point4.y)/2;
    [oval addQuadCurveToPoint:point1 controlPoint:controlPoint2];
    [[UIColor blackColor] setStroke];
    //[oval stroke];
    return oval;
}




- (void)setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}




@end
