//
//  radio.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "radio.h"

@interface radio ()

@end

@implementation radio

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    station=@[@"http://85.25.237.199/iloveradio2.mp3",@"http://85.25.237.199/iloveradio5.mp3",@"http://live.brfm.net:8000/BrfmMP3",@"http://radiokafic.com:19580/;*.mp3",@"http://85.25.237.199/iloveradio3.mp3",@"http://rslradio.ice.infomaniak.ch/rslradio-128.mp3"];
    n=0;
}

- (void)viewDidAppear:(BOOL)animated {
    velicina = self.view.frame.size;
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    radioAB = [[UIImageView alloc]init];
    radioAB.image = [UIImage imageNamed:@"radioAB"];
    radioAB.frame = CGRectMake(velicina.width/6, velicina.width/2, velicina.width/1.2, velicina.width*1.2);
    radioAB.center= CGPointMake(velicina.width/2, velicina.height/2);
    radioAB.tag=1;
    [self.view addSubview:radioAB];
    tipUkljuci.center = CGPointMake(radioAB.center.x-radioAB.frame.size.width/3.5, radioAB.center.y+radioAB.frame.size.height/2-tipUkljuci.frame.size.height);
    [self.view bringSubviewToFront:tipUkljuci];
    tipUkljuci2.center = CGPointMake(radioAB.center.x+radioAB.frame.size.width/3.6, radioAB.center.y+radioAB.frame.size.height/2-tipUkljuci.frame.size.height);
    [self.view bringSubviewToFront:tipUkljuci2];
}

- (IBAction)playAction:(id)sender {
    n++;
    if (n>=station.count) {
        n=0;
    }
    NSString *stream=[station objectAtIndex:n];
    NSURL *url=[NSURL URLWithString:stream];
    
    radioPlayer = [[AVPlayer alloc]init];
    radioItem = [AVPlayerItem playerItemWithURL:url];
    radioPlayer = [AVPlayer playerWithPlayerItem:radioItem];
    radioPlayer = [AVPlayer playerWithURL:url];
    [radioPlayer play];
}

- (IBAction)playAction2:(id)sender {
    n--;
    if (n<0) {
        n = (int)station.count-1;
    }
    NSString *stream=[station objectAtIndex:n];
    NSURL *url=[NSURL URLWithString:stream];
    
    radioPlayer = [[AVPlayer alloc]init];
    radioItem = [AVPlayerItem playerItemWithURL:url];
    radioPlayer = [AVPlayer playerWithPlayerItem:radioItem];
    radioPlayer = [AVPlayer playerWithURL:url];
    [radioPlayer play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)vratiSe:(id)sender {
    [radioPlayer pause];
    radioPlayer=nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
