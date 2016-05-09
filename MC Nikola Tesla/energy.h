//
//  energy.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface energy : UIViewController
{
    UIImageView *podloga;
    UIImageView *ruckaVentila;
    UIImageView *turbina;
    UIImageView *rotor;
    UIImageView *osovina1;
    UIImageView *osovina2;
    UIImageView *osovina3;
    UIImageView *prekidac;
    UIImageView *letva;
    UIImageView *zupcanik1;
    UIImageView *zupcanik2;
    UIImageView *mlazG;
    UIImageView *mlazD;
    UIImageView *ulazVode;
    
    
    UITextView *textGen;
    UITextView *textTurb;
    UITextView *textUstav;
    
    
    NSArray *turbinaA;
    NSArray *rotorA;
    NSArray *mlazDA;
    NSArray *mlazGA;
    NSArray *vodaUlaz;
    
     CGSize velicina;
    __weak IBOutlet UINavigationBar *navBar;
    BOOL otvorenVentil;
    BOOL otvorenaUstava;
    
    NSTimer *timerR;
    double kutP;
    
}

@end
