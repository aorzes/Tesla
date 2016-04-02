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
  //  _skrol.contentSize = CGSizeMake(self.view.frame.size.width-50,760);
    
    pomakP = -0.2;
    
    velicina = self.view.frame.size;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    
        
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    _skrol.frame = CGRectMake(0, navBar.frame.origin.y+navBar.frame.size.height, velicina.width, velicina.height);
    _skrol.contentSize = CGSizeMake(self.view.frame.size.width-50,velicina.height*1.2);
    
    //double odnos = velicina.height/velicina.width;
    podloga.frame = CGRectMake(0, 0, velicina.height*1.33, velicina.height);
    
    bioB.frame = CGRectMake(velicina.width/10, 20, velicina.width/5, velicina.width/5);
    [bioB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    energyB.frame = CGRectMake(velicina.width/2-velicina.width/10, 20, velicina.width/5, velicina.width/5);
    [energyB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    motorB.frame = CGRectMake(velicina.width-velicina.width/5-velicina.width/10, 20, velicina.width/5, velicina.width/5);
    [motorB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    
    wirelesB.frame = CGRectMake(velicina.width/10, bioB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [wirelesB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    boatB.frame = CGRectMake(velicina.width/2-velicina.width/10, bioB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [boatB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    coilB.frame = CGRectMake(velicina.width-velicina.width/5-velicina.width/10, bioB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [coilB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    
    
    transmisionB.frame = CGRectMake(velicina.width/10, wirelesB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [transmisionB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    findB.frame = CGRectMake(velicina.width/2-velicina.width/10, wirelesB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [findB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    aboutB.frame = CGRectMake(velicina.width-velicina.width/5-velicina.width/10, wirelesB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [aboutB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    
    
    faradayB.frame = CGRectMake(velicina.width/10, transmisionB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [faradayB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    eggB.frame = CGRectMake(velicina.width/2-velicina.width/10, transmisionB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [eggB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    xrayB.frame = CGRectMake(velicina.width-velicina.width/5-velicina.width/10, transmisionB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [xrayB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    
    
    hydropowerB.frame = CGRectMake(velicina.width/10, faradayB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [hydropowerB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    radioB.frame = CGRectMake(velicina.width/2-velicina.width/10, faradayB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [radioB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    circuitB.frame = CGRectMake(velicina.width-velicina.width/5-velicina.width/10, faradayB.frame.origin.y+velicina.width/4, velicina.width/5, velicina.width/5);
    [circuitB.titleLabel setFont:[UIFont systemFontOfSize:velicina.width*0.035]];
    
    [UIView commitAnimations];
    
    [self startP];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startP{
    
    if(!timerP)
    { timerP = [NSTimer scheduledTimerWithTimeInterval:0.05
                                                target:self
                                              selector:@selector(miciPodlogu)
                                              userInfo:nil
                                               repeats:YES];
        
    }
    
    
}

-(void)miciPodlogu{

    CGRect pp= podloga.frame;
    pp.origin.x+=pomakP;
    if ((pp.origin.x+podloga.frame.size.width)<velicina.width || pp.origin.x>0) {
        pomakP*=-1;
        pp.origin.x+=pomakP;
    }
    
    podloga.frame = pp;

}

- (IBAction)ShareButton:(UIBarButtonItem *)sender {
    
    NSString *textToShare = @"Look at this awesome website for aspiring iOS Developers!";
    NSURL *myWebsite = [NSURL URLWithString:@"http://www.codingexplorer.com/"];
    
    NSArray *objectsToShare = @[textToShare, myWebsite];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [self presentViewController:activityVC animated:YES completion:nil];
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
