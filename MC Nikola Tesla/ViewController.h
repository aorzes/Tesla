//
//  ViewController.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>


@interface ViewController : UIViewController
{

    __weak IBOutlet UINavigationBar *navBar;
    __weak IBOutlet UIImageView *podloga;
    
    
    __weak IBOutlet UIButton *bioB;
    __weak IBOutlet UIButton *energyB;
    __weak IBOutlet UIButton *motorB;
    
    __weak IBOutlet UIButton *wirelesB;
    __weak IBOutlet UIButton *boatB;
    __weak IBOutlet UIButton *coilB;
    
    
    __weak IBOutlet UIButton *transmisionB;
    __weak IBOutlet UIButton *findB;
    __weak IBOutlet UIButton *aboutB;
    
    
    __weak IBOutlet UIButton *faradayB;
    __weak IBOutlet UIButton *eggB;
    __weak IBOutlet UIButton *xrayB;
    
    
    __weak IBOutlet UIButton *hydropowerB;
    __weak IBOutlet UIButton *radioB;
    __weak IBOutlet UIButton *circuitB;
    
    NSTimer *timerP;
    double pomakP;
    CGSize velicina;
    
    __weak IBOutlet ADBannerView *baneaAd;
}

@property (weak, nonatomic) IBOutlet UIScrollView *skrol;
- (IBAction)ShareButton:(UIBarButtonItem *)sender;

@end

