//
//  ViewController.m
//  Dynamics
//
//  Created by Utsav Patel on 02/10/2013.
//  Copyright (c) 2013 Utsav Patel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self setupCollisions];
    
//    [self setupGravityBehavior];
    [self setupPushBehavior];
}

- (void)setupCollisions
{
    _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_redView]];
    [_collisionBehavior addBoundaryWithIdentifier:@"BottomWall" fromPoint:CGPointMake(0, self.view.frame.size.height) toPoint:CGPointMake(self.view.frame.size.width, self.view.frame.size.height)];
    
    [_collisionBehavior addBoundaryWithIdentifier:@"TopWall" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(self.view.frame.size.width, 0)];
    
    [_collisionBehavior setCollisionDelegate:self];
    [_animator addBehavior:_collisionBehavior];
}

- (void)setupGravityBehavior
{
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[_redView]];
    [_animator addBehavior:_gravityBehavior];

    CGVector vector = CGVectorMake(0.0, 1.0);
    [_gravityBehavior setGravityDirection:vector];
}

- (void)setupPushBehavior
{
    _pushBehavior = [[UIPushBehavior alloc] initWithItems:@[_redView] mode:UIPushBehaviorModeInstantaneous];
    [_pushBehavior setPushDirection:CGVectorMake(0.0, 50.0)];
    [_animator addBehavior:_pushBehavior];
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if ([(NSString *)identifier isEqualToString:@"BottomWall"]) {
        [_pushBehavior setPushDirection:CGVectorMake(0.0, -50.0)];
        [_pushBehavior setActive:YES];
    } else if ([(NSString *)identifier isEqualToString:@"TopWall"]) {
        [_pushBehavior setPushDirection:CGVectorMake(0.0, 50.0)];
        [_pushBehavior setActive:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
