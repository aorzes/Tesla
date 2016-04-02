//
//  boat.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <CoreMotion/CoreMotion.h>

@interface boat : UIViewController
{
    CGSize velicina;
    CGFloat skala;
    int mk;
    int mkd;
    __weak IBOutlet UINavigationBar *navBar;
    CMMotionManager *motionManager;
    UIImageView *more;
    UIImageView *more1;
    UIImageView *more2;
    UIImageView *nebo;
    UIImageView *korito;
    UIImageView *kormilo;
    UIImageView *propeler;
    UIImageView *mjehurici;
    UIImageView *komandna;
    UIImageView *tipkaL;
    UIImageView *tipkaR;
    UIImageView *tipkaOn;
    UIImageView *tipkaOff;
    UIImageView *brojcanik1;
    UIImageView *brojcanik2;
    
    UIImageView *osovina1;
    UIImageView *osovina2;
    UIImageView *instrument1;
    UIImageView *instrument2;
    UIImageView *kaza1;
    UIImageView *kaza2;
    BOOL zutaUklj;
    BOOL crvenaUklj;
    double lastScale;
    
    NSTimer *timerM;
    

}

@end
