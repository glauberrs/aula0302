//
//  Tela02.h
//  aula0302
//
//  Created by Aluno on 07/05/15.
//  Copyright (c) 2015 Glauber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tela02 : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *secao;
@property (weak, nonatomic) IBOutlet UILabel *linha;
@property NSString *secaoValor;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end
