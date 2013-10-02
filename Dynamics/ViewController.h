//
//  ViewController.h
//  Dynamics
//
//  Created by Utsav Patel on 02/10/2013.
//  Copyright (c) 2013 Utsav Patel. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UICollisionBehaviorDelegate>

@property (nonatomic, strong) IBOutlet UIView *redView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (nonatomic, strong) UIPushBehavior *pushBehavior;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;

@end
