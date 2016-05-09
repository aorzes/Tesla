//
//  Faradey.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Faradey : UIViewController

{
    UILabel *labela;
    UIImageView *podloga;
    UIImageView *planine1;
    UIImageView *planine2;
    UIImageView *strelica;
    UIImageView *drawImage;
    UIImageView *djecak;
    UIImageView *tcoil;
    UIImageView *cage;
    CGSize velicina;
    
    NSArray *stojiS;
    NSArray *trciS;
    NSArray *puziS;
    
    NSTimer *timerZ;
    NSTimer *timerT;
    NSTimer *timerB;
    NSTimer *timerN;
    
    double a;
    double b;
    CGPoint tocka;
    BOOL ukavezu;
    BOOL mrtav;
    BOOL stoji;
    
    double polozajZemlje;
    double visinaCoila;
    double visinaDjecaka;
    
    UIImageView *poluga;
    
    double da;
    double pda;
   
    
    double presao;
    double najPresao;
    
    __weak IBOutlet UINavigationBar *navBar;
    AVAudioPlayer *zvuk1;
}


@end
