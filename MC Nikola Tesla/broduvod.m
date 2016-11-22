//
//  broduvod.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 01/04/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import "broduvod.h"

@implementation broduvod

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {

    CGSize velicina = self.view.frame.size;
    
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    papir.frame=CGRectMake(10, navBar.frame.origin.y+navBar.frame.size.height+10, velicina.width-20, velicina.height-(navBar.frame.origin.y+navBar.frame.size.height+10));
    tekst.frame=CGRectMake(papir.frame.origin.x+30, papir.frame.origin.y+10, papir.frame.size.width-40, papir.frame.size.height-30);
    [tekst setFont:[UIFont fontWithName:@"Snell Roundhand" size:velicina.width*0.06]];
}

- (IBAction)vratiSe:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
