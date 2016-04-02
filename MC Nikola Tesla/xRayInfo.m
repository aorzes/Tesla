//
//  xRayInfo.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 16/02/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import "xRayInfo.h"

@interface xRayInfo ()

@end

@implementation xRayInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
   
    CGSize velicina = self.view.frame.size;
    
    navBar.frame = CGRectMake(0, 20, self.view.frame.size.width, 44);
    UIImageView *daska = [[UIImageView alloc]init];
    daska.image = [UIImage imageNamed:@"daska"];
    daska.frame = CGRectMake(0, 0, velicina.width, velicina.height);
    [self.view addSubview:daska];
    
    tube = [[UIImageView alloc]init];
    tube.image = [UIImage imageNamed:@"xrayTube"];
    tube.frame = CGRectMake(20, 100, velicina.width-40, (velicina.width-40)*0.77);
    [self.view addSubview:tube];
    
    tube.layer.shadowColor = [UIColor blackColor].CGColor;
    tube.layer.shadowOffset = CGSizeMake(-8, 6);
    tube.layer.shadowOpacity = 0.4;
    tube.layer.shadowRadius = 1.0;

    
    elektron = [[UIImageView alloc]init];
    elektron.image = [UIImage imageNamed:@"elektron"];
    elektron.frame = CGRectMake(tube.center.x+tube.frame.size.width/11, tube.center.y-tube.frame.size.width/15, velicina.width/30, velicina.width/30);
    
   
    
    [self.view addSubview:elektron];
    [self startE];
    
    xReyBeam = [[UIImageView alloc]init];
    xReyBeam.image = [UIImage imageNamed:@"xReyBeam8"];
    xReyBeam.frame = CGRectMake(tube.center.x-tube.frame.size.width/11, tube.center.y- velicina.width/3-tube.frame.size.width/15, velicina.width/3, velicina.width/3);
    [self.view addSubview:xReyBeam];
    
    xReyBeam.animationImages=[NSArray arrayWithObjects:
                              [UIImage imageNamed: @"xReyBeam1.png"],
                              [UIImage imageNamed: @"xReyBeam2.png"],
                              [UIImage imageNamed: @"xReyBeam3.png"],
                              [UIImage imageNamed: @"xReyBeam4.png"],
                              [UIImage imageNamed: @"xReyBeam5.png"],
                              [UIImage imageNamed: @"xReyBeam6.png"],
                              [UIImage imageNamed: @"xReyBeam7.png"],
                              [UIImage imageNamed: @"xReyBeam8.png"],
                              nil];
    xReyBeam.animationDuration=1.90;
    xReyBeam.animationRepeatCount=0;
    [xReyBeam startAnimating];
    
    

    
    
    UITextView *textpolje = [[UITextView alloc]init];
    textpolje.text =@"Roentgen's letter to Tesla dated July 20th, 1901. The letter reads: 'Dear Sir! You have surprised me tremendously with the beautiful photographs of wonderful discharges and I tell you thank you very much for that. If only I knew how you make such things! With the expression of special respect I remain yours devoted, W. C. Roentgen.'";
    [textpolje setFont:[UIFont systemFontOfSize:17]];
    textpolje.frame = CGRectMake(tube.frame.origin.x, tube.frame.origin.y+tube.frame.size.height + 20,
                                 tube.frame.size.width, velicina.height - (tube.frame.origin.y+tube.frame.size.height + 30));
    [self.view addSubview:textpolje];

    [self.view bringSubviewToFront:navBar];
    [self.view bringSubviewToFront:xReyBeam];
    [self.view bringSubviewToFront:elektron];
}


-(void)startE{
    
    if(!timerE)
    { timerE = [NSTimer scheduledTimerWithTimeInterval:0.02
                                                target:self
                                              selector:@selector(pucaj)
                                              userInfo:nil
                                               repeats:YES];
        
    }
    
    
}

-(void) pucaj{

    CGPoint pe = elektron.center;
    pe.x -= 2;
    if (pe.x<tube.center.x-tube.frame.size.width/12) {
        pe.x=tube.center.x+tube.frame.size.width/11;
    }
    elektron.center = pe;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
