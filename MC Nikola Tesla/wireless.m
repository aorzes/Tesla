//
//  wireless.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "wireless.h"

@interface wireless ()

@end

@implementation wireless

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    kutp=0;
    pomak=0.1;
}

-(void)viewDidAppear:(BOOL)animated{
    
    for (UIImageView *slika in self.view.subviews) {
        if (slika.tag>0) {
            [slika removeFromSuperview];
        }
        
    }
    
    CGSize velicina = self.view.frame.size;
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    
    wire1 = [[UIImageView alloc]init];
    wire1.image = [UIImage imageNamed:@"wireles1"];
    wire1.frame = CGRectMake(10, navBar.frame.origin.y+navBar.frame.size.height+20, velicina.width/2-20, (velicina.width/2-20)*2.5);
    wire1.tag=1;
    [self.view addSubview:wire1];

    wire2 = [[UIImageView alloc]init];
    wire2.image = [UIImage imageNamed:@"wireles2"];
    wire2.frame = CGRectMake(velicina.width-wire1.frame.size.width-20, wire1.frame.origin.y, wire1.frame.size.width, wire1.frame.size.height);
    wire2.tag=0;
    [self.view addSubview:wire2];
    
    stator = [[UIImageView alloc]init];
    stator.image = [UIImage imageNamed:@"stator2"];
    stator.frame = CGRectMake(wire1.frame.origin.x, wire1.frame.origin.y+wire1.frame.size.height/1.25, wire1.frame.size.width/2.4, wire1.frame.size.width/2.4);
    [self.view addSubview:stator];
    
    rotor = [[UIImageView alloc]init];
    rotor.image = [UIImage imageNamed:@"rotor2"];
    rotor.frame = CGRectMake(10, 10, stator.frame.size.height/2.7, stator.frame.size.height/2.7);
    rotor.center = stator.center;
    rotor.tag=1;
    [self.view addSubview:rotor];
    
    zarulja = [[UIImageView alloc]init];
    zarulja.image = [UIImage imageNamed:@"zarulja0000"];
    zarulja.frame = CGRectMake(wire2.frame.origin.x+wire2.frame.size.width/1.4,
                               wire2.frame.origin.y+wire2.frame.size.height/1.5,
                               wire2.frame.size.height/8,
                               wire2.frame.size.height/6);
    [self.view addSubview:zarulja];
    zarulja.tag=1;
    
    zarulja2 = [[UIImageView alloc]init];
    zarulja2.image = [UIImage imageNamed:@"zarulja0010"];
    zarulja2.frame = CGRectMake(wire2.frame.origin.x+wire2.frame.size.width/1.4,
                               wire2.frame.origin.y+wire2.frame.size.height/1.5,
                               wire2.frame.size.height/8,
                               wire2.frame.size.height/6);
    [self.view addSubview:zarulja2];
    zarulja2.tag=1;
    [self startR];
    
    UITextView *tekst = [[UITextView alloc]init];
    tekst.frame = CGRectMake(wire1.frame.origin.x, wire1.frame.origin.y+wire1.frame.size.height+10, velicina.width-20, velicina.height-(wire1.frame.origin.y+wire1.frame.size.height+20));
    tekst.layer.borderWidth=1;
    tekst.layer.borderColor = [UIColor lightGrayColor].CGColor;
    tekst.text =@"Wireless power transfer\nTesla is the first one who invented the wireless power transfer. The principle is simple, but it does not apply because it would be difficult to charge the energy. Through the thick wire with a little winding runs a strong current which has low voltage, and through a large coil of thin wire runs low current with high voltage. It has one end connected to the antenna that spreads the radio waves, and the other end is grounded. These waves are received by the second antenna that is connected to its winding of a thin wire (a large number of windings). High voltage that is generated here is transformed into a low voltage, but strong current, in a small number of windings of a thick wire and the current is sent to a light bulb. The number of windings is proportional to the voltage and inversely proportional to the current. Of course this is only valid for AC.";
    [self.view addSubview:tekst];
    tekst.editable = NO;
    tekst.tag=1;
    valovi = [[UIImageView alloc]init];
    valovi.image = [UIImage imageNamed:@"radioVal1"];
    valovi.frame = CGRectMake(wire1.frame.origin.x+wire1.frame.size.width/1.4, wire1.frame.origin.y+wire1.frame.size.height/40, wire1.frame.size.width, wire1.frame.size.height/8);
    [self.view addSubview:valovi];
    valovi.animationImages=[NSArray arrayWithObjects:
                              [UIImage imageNamed: @"radioVal3.png"],
                              [UIImage imageNamed: @"radioVal2.png"],
                              [UIImage imageNamed: @"radioVal1.png"],
                             
                              nil];
    valovi.animationDuration=0.50;
    valovi.animationRepeatCount=0;
    [valovi startAnimating];
    valovi.tag=1;
    podloga = [[UIImageView alloc]init];
    podloga.image = [UIImage imageNamed:@"US645576-0"];
    podloga.frame = CGRectMake(0, 0, velicina.width, velicina.height);
    [self.view addSubview:podloga];
    podloga.tag=1;
    podloga.alpha =0;
    [self.view bringSubviewToFront:navBar];


}
- (IBAction)infoD:(id)sender {
    if (podloga.alpha==0) {
        podloga.alpha=1;
    }
    else{
        podloga.alpha=0;
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

-(void)rotacija{
    kutp+=pomak;

    CGAffineTransform rotate1 = CGAffineTransformMakeRotation(kutp);
    [rotor setTransform:rotate1];
}

- (IBAction)vratiSe:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
