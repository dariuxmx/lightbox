//
//  LightBoxView.h
//  Objective C
//
//  Created by Edwin Dario Gutierrez Pech on 5/21/17.
//  Copyright © 2017 Darío Gutiérrez iOS Designer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PureLayout.h"

@interface LightBoxView : UIView{
    UIView   *overlayView;
    UIView   *lightBoxView;
    
    UIButton *cancelButton;
    UIButton *doneButton;
    UILabel  *titleLightBoxLabel;
    UIView   *contentView;
}

-(void)showLightBox;
-(void)dismissLightBox;

@end
