//
//  radio.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface radio : UIViewController
{
    UIImageView *radioAB;
    CGSize velicina;
    
    __weak IBOutlet UIButton *radioTipka1;
    __weak IBOutlet UINavigationBar *navBar;
    
    __weak IBOutlet UIButton *playB;
    NSArray *station;
    int n;
    __weak IBOutlet UIButton *tipUkljuci;
    
    __weak IBOutlet UIButton *tipUkljuci2;
    AVPlayerItem *radioItem;
    AVPlayer *radioPlayer;
    
}


@end
