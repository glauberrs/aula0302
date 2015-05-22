//
//  Tela02.m
//  aula0302
//
//  Created by Aluno on 07/05/15.
//  Copyright (c) 2015 Glauber. All rights reserved.
//

#import "Tela02.h"
#import <QuartzCore/QuartzCore.h>


@interface Tela02 ()

@end

@implementation Tela02

- (void)viewDidLoad {
    [super viewDidLoad];
    _secao.text = _secaoValor;
    
    self.secao.backgroundColor = [UIColor orangeColor];
    self.secao.layer.cornerRadius = 25.0;
    self.secao.layer.borderColor = [UIColor blackColor].CGColor;
    self.secao.layer.borderWidth = 2;
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior* gravityBehavior =
    [[UIGravityBehavior alloc] initWithItems:@[_secao]];
    [self.animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior =
    [[UICollisionBehavior alloc] initWithItems:@[_secao]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collisionBehavior];
    
    UIDynamicItemBehavior *elasticityBehavior =
    [[UIDynamicItemBehavior alloc] initWithItems:@[_secao]];
    elasticityBehavior.elasticity = 0.7f;
    [self.animator addBehavior:elasticityBehavior];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (frameTapGesture:)];
    
    
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
