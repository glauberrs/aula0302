//
//  ViewController.m
//  aula0302
//
//  Created by Aluno on 06/05/15.
//  Copyright (c) 2015 Glauber. All rights reserved.
//

#import "ViewController.h"
#import "CelulaTableViewCell.h"
#import "Tela02.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int quant = 0;
    if (section == 0) {
        quant = 10;
    } else if (section ==1) {
        quant = 5;
    } else if (section ==2) {
        quant = 10;
    }
    return quant;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cursoItemCell";
    
    CelulaTableViewCell *cell = (CelulaTableViewCell * )[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CelulaTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //cell.textLabel.text = [NSString stringWithFormat:@"Linha %d", (int) indexPath.row ];//[cursosData objectAtIndex:indexPath.row];
    cell.label.text = [NSString stringWithFormat:@"%d", (int) indexPath.row];
    cell.secao.text = [NSString stringWithFormat:@"%d", (int) indexPath.section];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Linha Selecionada"
                                                           message:@"tocou" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [messageAlert show];*/
    
    /*UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];*/
    /*
    Tela02 *tela = [[Tela02 alloc] initWithNibName:@"Tela02" bundle:nil];
    tela.secaoValor = [NSString stringWithFormat:@"New  S %d", (int) indexPath.section];
    [self.navigationController pushViewController:tela animated:YES];
     */
    [self performSegueWithIdentifier:@"linha" sender:indexPath];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"linha"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *mensagem = [NSString stringWithFormat:@"Voce tocou na linha %d" , (int) indexPath.row];
        
        [[segue destinationViewController] setSecaoValor:mensagem];
    }
}


-(void)tableView:(UITableView *)tableView willDisplayCell:
(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
    
}


@end
