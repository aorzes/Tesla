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
    
    //instrument1
    instrument1 =[[UIImageView alloc]init];
    instrument1.image =[UIImage imageNamed:@"instrument"];
    instrument1.frame = CGRectMake(0, 0, velicina.width/5, velicina.width/5);
    instrument1.center = CGPointMake(velicina.width/6, navBar.center.y+navBar.frame.size.height/2+velicina.width/10);
    [self.view addSubview:instrument1];
    instrument1.layer.shadowColor = [UIColor blackColor].CGColor;
    instrument1.layer.shadowOffset = CGSizeMake(-6, 4);
    instrument1.layer.shadowOpacity = 0.6;
    instrument1.layer.shadowRadius = 2.0;
    
    osovinaK1 =[[UIImageView alloc]init];
    osovinaK1.image =[UIImage imageNamed:@"bomba"];
    osovinaK1.frame = CGRectMake(0, 0, 5, 5);
    osovinaK1.center = instrument1.center;
    [self.view addSubview:osovinaK1];
    
    kazaljka1 =[[UIImageView alloc]init];
    kazaljka1.image =[UIImage imageNamed:@"kaz2"];
    kazaljka1.frame = CGRectMake(0, 0, 5, instrument1.frame.size.height/3.5);
    kazaljka1.center = CGPointMake(2.5, -instrument1.frame.size.height/7);
    [osovinaK1 addSubview:kazaljka1];
    
    //instrument2
    instrument2 =[[UIImageView alloc]init];
    instrument2.image =[UIImage imageNamed:@"instrument"];
    instrument2.frame = CGRectMake(0, 0, velicina.width/5, velicina.width/5);
    instrument2.center = CGPointMake(velicina.width/2, instrument1.center.y);
    [self.view addSubview:instrument2];
    instrument2.layer.shadowColor = [UIColor blackColor].CGColor;
    instrument2.layer.shadowOffset = CGSizeMake(-6, 4);
    instrument2.layer.shadowOpacity = 0.6;
    instrument2.layer.shadowRadius = 2.0;
    
    osovinaK2 =[[UIImageView alloc]init];
    osovinaK2.image =[UIImage imageNamed:@"bomba"];
    osovinaK2.frame = CGRectMake(0, 0, 5, 5);
    osovinaK2.center = instrument2.center;
    [self.view addSubview:osovinaK2];
    
    kazaljka2 =[[UIImageView alloc]init];
    kazaljka2.image =[UIImage imageNamed:@"kaz2"];
    kazaljka2.frame = CGRectMake(0, 0, 5, instrument2.frame.size.height/3.5);
    kazaljka2.center = CGPointMake(2.5, -instrument2.frame.size.height/7);
    [osovinaK2 addSubview:kazaljka2];
    
    //instrument3
    instrument3 =[[UIImageView alloc]init];
    instrument3.image =[UIImage imageNamed:@"instrument"];
    instrument3.frame = CGRectMake(0, 0, velicina.width/5, velicina.width/5);
    instrument3.center = CGPointMake(velicina.width - velicina.width/6, instrument1.center.y);
    [self.view addSubview:instrument3];
    instrument3.layer.shadowColor = [UIColor blackColor].CGColor;
    instrument3.layer.shadowOffset = CGSizeMake(-6, 4);
    instrument3.layer.shadowOpacity = 0.6;
    instrument3.layer.shadowRadius = 2.0;
    
    osovinaK3 =[[UIImageView alloc]init];
    osovinaK3.image =[UIImage imageNamed:@"bomba"];
    osovinaK3.frame = CGRectMake(0, 0, 5, 5);
    osovinaK3.center = instrument3.center;
    [self.view addSubview:osovinaK3];
    
    kazaljka3 =[[UIImageView alloc]init];
    kazaljka3.image =[UIImage imageNamed:@"kaz2"];
    kazaljka3.frame = CGRectMake(0, 0, 5, instrument2.frame.size.height/3.5);
    kazaljka3.center = CGPointMake(2.5, -instrument2.frame.size.height/7);
    [osovinaK3 addSubview:kazaljka3];
    
    
    stator =[[UIImageView alloc]init];
    stator.image =[UIImage imageNamed:@"stator3"];
    stator.frame = CGRectMake(velicina.width/6, instrument1.frame.origin.y+instrument1.frame.size.height, velicina.width/1.5, velicina.width/1.5);
    [self.view addSubview:stator];
    
    stator.layer.shadowColor = [UIColor blackColor].CGColor;
    stator.layer.shadowOffset = CGSizeMake(-20, 20);
    stator.layer.shadowOpacity = 0.5;
    stator.layer.shadowRadius = 5.0;
    
    rotor =[[UIImageView alloc]init];
    rotor.image =[UIImage imageNamed:@"rotor3"];
    rotor.frame = CGRectMake(velicina.width/6, velicina.width/2, stator.frame.size.width/2.6, stator.frame.size.width/2.6);
    rotor.center = stator.center;
    [self.view addSubview:rotor];
    
    trigonom =[[UIImageView alloc]init];
    trigonom.image =[UIImage imageNamed:@"trigonom1"];
    trigonom.frame = CGRectMake(velicina.width/10, stator.center.y+stator.frame.size.height/2+velicina.width/30, velicina.width/1.25, velicina.width/3.75);
    //trigonom.center = stator.center;
    [self.view addSubview:trigonom];
    trigonom.animationImages=[NSArray arrayWithObjects:
                              [UIImage imageNamed: @"trigonom1"],
                              [UIImage imageNamed: @"trigonom2"],
                              [UIImage imageNamed: @"trigonom3"],
                              [UIImage imageNamed: @"trigonom4"],
                              [UIImage imageNamed: @"trigonom5"],
                              [UIImage imageNamed: @"trigonom6"],
                              [UIImage imageNamed: @"trigonom7"],
                              [UIImage imageNamed: @"trigonom8"],
                              [UIImage imageNamed: @"trigonom9"],
                              [UIImage imageNamed: @"trigonom10"],
                              [UIImage imageNamed: @"trigonom11"],
                              [UIImage imageNamed: @"trigonom12"],
                              [UIImage imageNamed: @"trigonom13"],
                              [UIImage imageNamed: @"trigonom14"],
                              [UIImage imageNamed: @"trigonom15"],
                              [UIImage imageNamed: @"trigonom16"],
                              [UIImage imageNamed: @"trigonom17"],
                              [UIImage imageNamed: @"trigonom18"],
                              [UIImage imageNamed: @"trigonom19"],
                              [UIImage imageNamed: @"trigonom20"],
                              [UIImage imageNamed: @"trigonom21"],
                              [UIImage imageNamed: @"trigonom22"],
                              [UIImage imageNamed: @"trigonom23"],
                              [UIImage imageNamed: @"trigonom24"],
                             nil];
    trigonom.animationDuration=5.0;
    trigonom.animationRepeatCount=0;
    [trigonom startAnimating];
    trigonom.layer.shadowColor = [UIColor blackColor].CGColor;
    trigonom.layer.shadowOffset = CGSizeMake(-3, 3);
    trigonom.layer.shadowOpacity = 0.6;
    trigonom.layer.shadowRadius = 1.0;
    
    
    [self napraviPolja];
    [self startM];
    [self startR];
    [self.view bringSubviewToFront:stator];
    [self.view bringSubviewToFront:navBar];
    

}

-(void) napraviPolja{
    double a = 0;
    double r = stator.frame.size.width/1.8; //3.1;
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
    
    //kazaljke
    [osovinaK1 setTransform:CGAffineTransformMakeRotation(sin(kutp)/2)];
    [osovinaK2 setTransform:CGAffineTransformMakeRotation(sin(kutp+2.09)/2)];
    [osovinaK3 setTransform:CGAffineTransformMakeRotation(sin(kutp+4.18)/2)];
    
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
