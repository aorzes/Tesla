//
//  ViewController.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //_skrol.frame = CGRectMake(10, self.view.frame.size.height-50, self.view.frame.size.width-20,self.view.frame.size.height-100 );
    
}
-(void)viewDidAppear:(BOOL)animated
{
    _skrol.contentSize = CGSizeMake(self.view.frame.size.width-50,760);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
