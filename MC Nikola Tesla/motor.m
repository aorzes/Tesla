//
//  motor.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "motor.h"

@interface motor ()

@end

@implementation motor

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated
{
    n=0;
    kutp=0;
    pomak=0.1;
    velicina = self.view.frame.size;
    UIImageView *podloga =[[UIImageView alloc]init];
    podloga.image =[UIImage imageNamed:@"daska"];
    podloga.frame = CGRectMake(0, 0, velicina.width, velicina.height);
    [self.view addSubview:podloga];
    
    stator =[[UIImageView alloc]init];
    stator.image =[UIImage imageNamed:@"stator2"];
    stator.frame = CGRectMake(velicina.width/6, velicina.width/2, velicina.width/1.5, velicina.width/1.5);
    [self.view addSubview:stator];
    
    stator.layer.shadowColor = [UIColor blackColor].CGColor;
    stator.layer.shadowOffset = CGSizeMake(-8, 6);
    stator.layer.shadowOpacity = 0.4;
    stator.layer.shadowRadius = 1.0;
    
    rotor =[[UIImageView alloc]init];
    rotor.image =[UIImage imageNamed:@"rotor3"];
    rotor.frame = CGRectMake(velicina.width/6, velicina.width/2, stator.frame.size.width/2.6, stator.frame.size.width/2.6);
    rotor.center = stator.center;
    [self.view addSubview:rotor];
    
    [self napraviPolja];
    [self startM];
    [self startR];
    [self.view bringSubviewToFront:navBar];
    
   
    
    

}

-(void) napraviPolja{
    double a = 0;
    double r = stator.frame.size.width/1.9; //3.1;
    zarulje = [[NSMutableArray alloc]init];
    for (int i = 0; i<8; i++) {
        UIImageView *polje =[[UIImageView alloc]init];
        polje.image =[UIImage imageNamed:@"zarulja0000"];
        polje.frame = CGRectMake(0, 0, velicina.width/10, velicina.width/10);
        polje.center = CGPointMake(stator.center.x+ r*cos(a), stator.center.y+ r*sin(a));
        polje.transform = CGAffineTransformMakeRotation(a+M_PI/2);
        [self.view addSubview:polje];
        a+=M_PI/4;
        [zarulje addObject:polje];
    }

}

-(void)startM{
    
    if(!timerM)
    { timerM = [NSTimer scheduledTimerWithTimeInterval:0.3
                                                target:self
                                              selector:@selector(vrti)
                                              userInfo:nil
                                               repeats:YES];
        
    }
    
    
}
-(void)startR{
    
    if(!timerR)
    { timerR = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                target:self
                                              selector:@selector(rotacija)
                                              userInfo:nil
                                               repeats:YES];
        
    }
    
    
}


-(void) vrti{

    n++;
    int n2;
    if(n>7) n=0;
    UIImageView *zarulja =(UIImageView *)[zarulje objectAtIndex:0];
    for (int i=0; i<8; i++) {
        zarulja =(UIImageView *)[zarulje objectAtIndex:i];
        zarulja.image = [UIImage imageNamed:@"zarulja0000"];
    }
    zarulja =(UIImageView *)[zarulje objectAtIndex:n];
    zarulja.image = [UIImage imageNamed:@"zarulja0010"];
    n2=n+3;
    if(n2>7) n2-=8;
    zarulja =(UIImageView *)[zarulje objectAtIndex:n2];
    zarulja.image = [UIImage imageNamed:@"zarulja0010"];
    n2=n+5;
    if(n2>7) n2-=8;
    zarulja =(UIImageView *)[zarulje objectAtIndex:n2];
    zarulja.image = [UIImage imageNamed:@"zarulja0010"];

    //[self rotacija];

}

-(void)rotacija{
    kutp+=pomak;
    CGAffineTransform rotate1 = CGAffineTransformMakeRotation(kutp);
    [rotor setTransform:rotate1];
    //[UIView beginAnimations:@"rotate" context:nil];
    //[UIView setAnimationDuration:0.3];
    //rotor.transform = CGAffineTransformMakeRotation(kutp);
    //[UIView commitAnimations];
    
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
