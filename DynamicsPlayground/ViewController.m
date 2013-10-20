//
//  ViewController.m
//  DynamicsPlayground
//
//  Created by Ty Lacock on 10/19/13.
//  Copyright (c) 2013 Ty Lacock. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIDynamicAnimator *animator;
@property UIDynamicBehavior *gravity;
@property UICollisionBehavior *collision;
@property UIView *square;
@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self action];
    
    
}

- (void)action
{
    
        self.square = [[UIView alloc] initWithFrame:CGRectMake(160, 50, 50, 50)];
        self.square.backgroundColor = [UIColor grayColor];
        [self.view addSubview:self.square];
    
    
    
    // Unmovable objects
    UIView *barrier = [[UIView alloc] initWithFrame:CGRectMake(0, 400, 120, 20)];
    barrier.backgroundColor = [UIColor redColor];
    [self.view addSubview:barrier];
    
    UIView *barrier2 = [[UIView alloc] initWithFrame:CGRectMake(200, 90, 130, 20)];
    barrier2.backgroundColor = [UIColor redColor];
    [self.view addSubview:barrier2];
    
    
    
    
    
    // -------------------
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[self.square]];
    [_animator addBehavior:_gravity];
    
    
    // Collision
    self.collision = [[UICollisionBehavior alloc] initWithItems:@[self.square]];
    self.collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.collision];
    
    // adds a boundry to barriers
    CGPoint rightEdge = CGPointMake(barrier.frame.origin.x + barrier.frame.size.width, barrier.frame.origin.y);
    [self.collision addBoundaryWithIdentifier:@"barrier" fromPoint:barrier.frame.origin toPoint:rightEdge];
    
    CGPoint leftEdge = CGPointMake(barrier2.frame.origin.x + barrier2.frame.size.width, barrier2.frame.origin.y);
    [self.collision addBoundaryWithIdentifier:@"barrier2" fromPoint:barrier2.frame.origin toPoint:leftEdge];
    
    
    
    
    // Box properties
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.square]];
    itemBehavior.elasticity = 0.6;
    [self.animator addBehavior:itemBehavior];
    
    

}

- (IBAction)play:(UIButton *)sender {
    
    [self.square removeFromSuperview];
    
    [self action];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
