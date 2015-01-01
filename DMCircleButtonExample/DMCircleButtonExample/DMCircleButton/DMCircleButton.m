//
//  DMCircleButton.m
//
//  Created by Daniel McCarthy on 1/2/14.
//  Copyright (c) 2014 Daniel McCarthy. All rights reserved.
//

#import "DMCircleButton.h"

@interface DMCircleButton () {
    CGRect fullFrame;
    CGFloat buttonAlpha;
}

@end

@implementation DMCircleButton

#pragma mark - Setup
+ (DMCircleButton *)buttonWithLabel:(NSString *)label backgroundColor:(UIColor *)color textColor:(UIColor *)textColor font:(UIFont *)font size:(CGFloat)size animationType:(DMCircleButtonAnimationType)aType {
    return [[self alloc] initWithColor:color textColor:textColor label:label size:size buttonType:aType font:font animationType:aType alpha:1.0f];
}

+ (DMCircleButton *)buttonWithImage:(UIImage *)image backgroundColor:(UIColor *)color size:(CGFloat)size animationType:(DMCircleButtonAnimationType)aType {
    return [[self alloc] initWithImage:image size:size buttonType:UIButtonTypeCustom font:[UIFont systemFontOfSize:17.0f] animationType:aType alpha:1.0f];
}

#pragma mark - initMethods

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (id)initWithColor:(UIColor *)color textColor:(UIColor *)textColor label:(NSString *)label size:(CGFloat)size buttonType:(UIButtonType)buttonType font:(UIFont *)font animationType:(DMCircleButtonAnimationType)aType alpha:(CGFloat)alpha {
    CGRect frame = CGRectMake(0, 0, size, size);
    if (alpha) {
        buttonAlpha = alpha;
    } else {
        buttonAlpha = 1.0f;
    }
    DMCircleButton *button = [self buttonWithColor:color font:font frame:frame];
    button.frame = frame;
    [button setTitle:label forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    self = button;
    if (self) {
        self.animationType = aType;
        [self addTarget:self action:@selector(animateButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image size:(CGFloat)size buttonType:(UIButtonType)buttonType font:(UIFont *)font animationType:(DMCircleButtonAnimationType)aType alpha:(CGFloat)alpha {
    CGRect frame = CGRectMake(0, 0, size, size);
    if (alpha) {
        buttonAlpha = alpha;
    } else {
        buttonAlpha = 1.0f;
    }
    DMCircleButton *button = [self buttonWithImage:image font:font frame:frame];
    button.frame = frame;
    self = button;
    if (self) {
        self.animationType = aType;
        [self addTarget:self action:@selector(animateButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - internal setup methods

- (DMCircleButton *)buttonWithColor:(UIColor *)color font:(UIFont *)font frame:(CGRect)frame {
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    backgroundView.userInteractionEnabled   = NO;
    backgroundView.backgroundColor          = color;
    backgroundView.alpha                    = buttonAlpha;
    
    DMCircleButton *button = [DMCircleButton buttonWithType:UIButtonTypeSystem];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.titleLabel.textAlignment             = NSTextAlignmentCenter;
    button.titleLabel.numberOfLines             = 2;
    button.layer.cornerRadius                   = frame.size.width/2;
    button.layer.masksToBounds                  = YES;
    [button setBackgroundColor:[UIColor clearColor]];
    [button insertSubview:backgroundView belowSubview:button.titleLabel];
    button.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    
    return button;
}

- (DMCircleButton *)buttonWithImage:(UIImage *)image font:(UIFont *)font frame:(CGRect)frame {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    imgView.backgroundColor         = [UIColor clearColor];
    imgView.userInteractionEnabled  = NO;
    imgView.alpha = buttonAlpha;
    
    DMCircleButton *button = [DMCircleButton buttonWithType:UIButtonTypeSystem];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.titleLabel.textAlignment             = NSTextAlignmentCenter;
    button.titleLabel.numberOfLines             = 2;
    button.layer.cornerRadius                   = frame.size.width/2;
    button.layer.masksToBounds                  = YES;
    [button setBackgroundColor:[UIColor clearColor]];
    [button insertSubview:imgView belowSubview:button.titleLabel];
    button.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    
    return button;
}

- (void)setupPropertiesWithFrame:(CGRect)frame andColor:(UIColor *)color {
    UIImage *circleImage = [self circleWithColor:color andSize:frame.size.width];
    [self setBackgroundImage:circleImage forState:UIControlStateNormal];
}

- (void)animateButtonTouch {
    if (self.animationType == DMCircleButtonAnimationTypeBlink) {
        [self animateBlink];
    } else if (self.animationType == DMCircleButtonAnimationTypePulse) {
        [self animatePulse];
    } else {
        [self animateBlink];
    }
}

- (void)animateBlink {
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.layer.affineTransform = CGAffineTransformMakeScale(0.2f, 0.2f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.layer.affineTransform = CGAffineTransformMakeScale(1.0f, 1.0f);
        } completion:nil];
    }];
}

- (void)animatePulse {
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.layer.affineTransform = CGAffineTransformMakeScale(1.2f, 1.2f);
    } completion:^(BOOL finished) {
        self.layer.affineTransform = CGAffineTransformMakeScale(1.0f, 1.0f);
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.layer.affineTransform = CGAffineTransformMakeScale(1.2f, 1.2f);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.layer.affineTransform = CGAffineTransformMakeScale(1.0f, 1.0f);
            } completion:nil];
        }];
    }];
}

- (UIImage *)circleWithColor:(UIColor *)color andSize:(CGFloat)size {
    static UIImage *circleImg = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), NO, 0.0f);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSaveGState(ctx);
        
        CGRect rect = CGRectMake(0, 0, size, size);
        CGContextSetFillColorWithColor(ctx, color.CGColor);
        CGContextFillEllipseInRect(ctx, rect);
        
        CGContextRestoreGState(ctx);
        circleImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
    });
    return circleImg;
}

@end
