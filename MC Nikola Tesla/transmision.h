//
//  transmision.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface transmision : UIViewController{
    
    UIImageView *podloga;
    UIImageView *drawImage;
    UIImageView *stup;
    UIImageView *malamapa;
    UIImageView *zeleniKrug;
    BOOL prvi;
    CGPoint prethodni;
    UILabel *labela;
    int brk,stu;
    NSInteger brojPrelaza;
    __weak IBOutlet UINavigationBar *navBar;
    NSTimer *timer;
    int maxbrojKuca;
    int maxbrojStupova;
    AVAudioPlayer *zvuk1;
    double transformToX;
    double transformToY;
    
}


@end
