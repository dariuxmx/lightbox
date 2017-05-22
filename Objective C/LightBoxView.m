//
//  LightBoxView.m
//  Objective C
//
//  Created by Edwin Dario Gutierrez Pech on 5/21/17.
//  Copyright © 2017 Darío Gutiérrez iOS Designer. All rights reserved.
//

#import "LightBoxView.h"
#define LIGHTBOX_WIDTH  310
#define LIGHTBOX_HEIGHT 440

BOOL shouldSetupConstraints = YES;


@implementation LightBoxView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    //Init setup for every element
    overlayView = [[UIView alloc] initWithFrame:CGRectZero];
    overlayView.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.5];
    [self addSubview:overlayView];
    
    lightBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    lightBoxView.backgroundColor = [UIColor whiteColor];
    lightBoxView.layer.cornerRadius = 6;
    [overlayView addSubview:lightBoxView];
    
    cancelButton = [[UIButton alloc] initWithFrame:CGRectZero];
    cancelButton.titleLabel.text = @"Cancel";
    cancelButton.tintColor = [UIColor blueColor];
    cancelButton.backgroundColor = [UIColor redColor];
    [cancelButton addTarget:self action:@selector(dismissLightBox) forControlEvents:UIControlEventTouchUpInside];
    [lightBoxView addSubview:cancelButton];
    
    titleLightBoxLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLightBoxLabel.text = @"Title";
    titleLightBoxLabel.textColor = [UIColor lightGrayColor];
    titleLightBoxLabel.backgroundColor = [UIColor greenColor];
    [titleLightBoxLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [lightBoxView addSubview:titleLightBoxLabel];
    
    doneButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [doneButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    doneButton.titleLabel.text = @"Done";
    doneButton.backgroundColor = [UIColor yellowColor];
    [doneButton addTarget:self action:@selector(dismissLightBox) forControlEvents:UIControlEventTouchUpInside];
    [lightBoxView addSubview:doneButton];
    
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    return self;
}

-(void)updateConstraints{
    if(shouldSetupConstraints){
        //Autolayout constraints
        CGFloat inset        = 5.0;
        CGFloat centerOffset = lightBoxView.frame.size.width / 2;
        
        [overlayView autoPinEdgesToSuperviewEdgesWithInsets: UIEdgeInsetsZero];
        
        [lightBoxView autoCenterInSuperview];
        [lightBoxView autoSetDimension:ALDimensionWidth toSize:LIGHTBOX_WIDTH];
        [lightBoxView autoSetDimension:ALDimensionHeight toSize:LIGHTBOX_HEIGHT];
        
        [cancelButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:inset];
        [cancelButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:inset];
        [cancelButton autoSetDimensionsToSize:CGSizeMake(80.0, 40.0)];
        
        [titleLightBoxLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withOffset:centerOffset];
        [titleLightBoxLabel autoSetDimensionsToSize:CGSizeMake(80.0, 40.0)];
        
        [doneButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:inset];
        [doneButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:inset];
        [doneButton autoSetDimensionsToSize:CGSizeMake(80.0, 40.0)];
        
        shouldSetupConstraints = YES;
    }
    [super updateConstraints];
}


-(void)dismissLightBox{
    //[overlayView removeFromSuperview];
    lightBoxView.alpha = 1;
    overlayView.alpha = 1;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        lightBoxView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        overlayView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    
}

-(void)showLightBox{
    [self addSubview:overlayView];
    overlayView.alpha = 0;
    lightBoxView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        lightBoxView.transform = CGAffineTransformMakeScale(1, 1);
        overlayView.alpha = 1;
    } completion:nil];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
