//
//  DMCircleButton.h
//  Perq
//
//  Created by Daniel McCarthy on 1/2/14.
//  Copyright (c) 2014 Daniel McCarthy. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    DMCircleButtonAnimationTypeBlink = 1,
    DMCircleButtonAnimationTypePulse
};

typedef NSUInteger DMCircleButtonAnimationType;

@interface DMCircleButton : UIButton
@property (nonatomic) DMCircleButtonAnimationType animationType;
+ (DMCircleButton *)buttonWithLabel:(NSString *)label backgroundColor:(UIColor *)color textColor:(UIColor *)textColor font:(UIFont *)font size:(CGFloat)size animationType:(DMCircleButtonAnimationType)aType;
+ (DMCircleButton *)buttonWithImage:(UIImage *)image backgroundColor:(UIColor *)color size:(CGFloat)size animationType:(DMCircleButtonAnimationType)aType;
@end
