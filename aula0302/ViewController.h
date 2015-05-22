//
//  ViewController.h
//  aula0302
//
//  Created by Aluno on 06/05/15.
//  Copyright (c) 2015 Glauber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

