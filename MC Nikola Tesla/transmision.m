//
//  transmision.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "transmision.h"

@interface transmision ()

@end

@implementation transmision

- (void)spremisve {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:brojPrelaza forKey:@"dalekovod"];
    [userDefaults synchronize];
}

- (void)ucitajsve {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    brojPrelaza=[userDefaults integerForKey:@"dalekovod"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    prvi=true;
    brk=0; //povezanih kucica
    stu=0; //stupova
    [self ucitajsve];
    maxbrojKuca=10;
    maxbrojStupova=15;
    [self odrediBrojKuca];
    NSURL *Zvuk = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"click1" ofType:@"mp3"]];
    zvuk1 = [[AVAudioPlayer alloc]initWithContentsOfURL:Zvuk error:nil];
    [zvuk1 setVolume: 1];
    [zvuk1 prepareToPlay];
}

- (void)viewDidAppear:(BOOL)animated {
    podloga =[[UIImageView alloc]init];
    podloga.image =[UIImage imageNamed:@"mapa"];
    podloga.frame = CGRectMake(0,0, 3000, 3000);
    [self.view addSubview:podloga];
    transformToX = self.view.frame.size.width/3000;
    transformToY = self.view.frame.size.height/3000;
    UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(skrolaj:)];
    [self.view addGestureRecognizer:panGesture];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    CGRect kv1 = CGRectMake(0, 336, 600, 270);
    CGRect kv2 = CGRectMake(601, 548, 600, 206);
    CGRect kv3 = CGRectMake(1201, 664, 600, 229);
    CGRect kv4 = CGRectMake(1801, 785, 600, 258);
    CGRect kv5 = CGRectMake(2401, 901, 600, 227);
    
    //drvece
    int n=0;
    while (n<200) {
        double xd= arc4random()%2950+30;
        double yd= arc4random()%2950+30;
        if (!CGRectContainsPoint(kv1, CGPointMake(xd, yd)) && !CGRectContainsPoint(kv2, CGPointMake(xd, yd)) &&
            !CGRectContainsPoint(kv3, CGPointMake(xd, yd)) && !CGRectContainsPoint(kv4, CGPointMake(xd, yd)) &&
            !CGRectContainsPoint(kv5, CGPointMake(xd, yd))) {
            NSString *imeDrveta=[NSString stringWithFormat:@"drvo%d",arc4random()%13+1];
            UIImageView *drvo=[[UIImageView alloc]init];
            drvo.image=[UIImage imageNamed:imeDrveta];
            drvo.frame=CGRectMake(xd, yd, 50, 50);
            drvo.layer.shadowColor=[UIColor blackColor].CGColor;
            drvo.layer.shadowOffset = CGSizeMake(-5, 0);
            drvo.layer.shadowOpacity = 0.6;
            drvo.layer.shadowRadius = 5.0;
            drvo.tag=1;
            [podloga addSubview:drvo];
            n++;
        }
    }
    //kucice
    n=0;
    while (n<100) {
        double xd= arc4random()%2800+100;
        double yd= arc4random()%2800+100;
        if (!CGRectContainsPoint(kv1, CGPointMake(xd, yd)) && !CGRectContainsPoint(kv2, CGPointMake(xd, yd)) &&
            !CGRectContainsPoint(kv3, CGPointMake(xd, yd)) && !CGRectContainsPoint(kv4, CGPointMake(xd, yd)) &&
            !CGRectContainsPoint(kv5, CGPointMake(xd, yd)) && ![self imaLiNatomMjestu:CGPointMake(xd, yd)]) {
            NSString *imeKuce=[NSString stringWithFormat:@"kucic%d",arc4random()%8+1];
            UIImageView *kuca=[[UIImageView alloc]init];
            kuca.image=[UIImage imageNamed:imeKuce];
            kuca.frame=CGRectMake(xd, yd, 70, 50);
            kuca.tag=2;
            [podloga addSubview:kuca];
            n++;
        }
    }
    
    drawImage =[[UIImageView alloc]init];
    drawImage.frame=CGRectMake(0, 0, podloga.frame.size.width, podloga.frame.size.height);
    [podloga addSubview:drawImage];
    
    zeleniKrug =[[UIImageView alloc]init];
    zeleniKrug.image = [UIImage imageNamed:@"zeleniKrug"];
    zeleniKrug.frame=CGRectMake(-400, -400, 300, 300);
    [podloga addSubview:zeleniKrug];
    zeleniKrug.transform = CGAffineTransformScale(zeleniKrug.transform, 0.1, 0.1);
    zeleniKrug.alpha=0;
    
    [self napraviStup:CGPointMake(270, 360)];
    [self crtajZice:CGPointMake(243, 412) kraj:CGPointMake(270, 360)];
    
    navBar.frame = CGRectMake(0, 20, self.view.frame.size.width, 44);
    labela =[[UILabel alloc]init];
    labela.frame = CGRectMake(0, 64, self.view.frame.size.width, 30);
    labela.backgroundColor=[UIColor colorWithRed:0.2 green:0.4 blue:0.0 alpha:0.6] ;
    [labela setFont:[UIFont systemFontOfSize:12]];
    labela.textColor = [UIColor whiteColor];
    labela.text = [NSString stringWithFormat:@"Connected:0/%d with:1 tower",maxbrojKuca];
    labela.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labela];
    
    [self.view bringSubviewToFront:navBar];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Double tap: add tower"
                                                                   message:[NSString stringWithFormat:
                                                                            @"Try to connect %d houses to the power line using %d or less towers.",maxbrojKuca,maxbrojStupova]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)odrediBrojKuca {
    switch (brojPrelaza) {
        case 0:
        {
            maxbrojKuca=10;
            maxbrojStupova=15;
        }
            break;
        case 1:
        {
            maxbrojKuca=20;
            maxbrojStupova=22;
        }
            break;
        case 2:
        {
            maxbrojKuca=40;
            maxbrojStupova=42;
        }
            break;
        case 3:
        {
            maxbrojKuca=60;
            maxbrojStupova=61;
        }
            break;
        case 4:
        {
            maxbrojKuca=80;
            maxbrojStupova=80;
        }
            break;
        case 5:
        {
            maxbrojKuca=100;
            maxbrojStupova=100;
        }
            break;

            
        default:
        {
            maxbrojKuca=100;
            maxbrojStupova=100;
        }
 
            break;
    }
}
- (void)uspjeh {
    brojPrelaza++;
    [self prikaziMapu2];
    [self spremisve];
    [self odrediBrojKuca];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Sucess!"
                                                                   message:[NSString stringWithFormat:
                                                                            @"Try to connect %d houses to the power line using %d or less towers.",maxbrojKuca,maxbrojStupova]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Try!"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             [self makniMapu2];
                             [self ponovoPokreni];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [self makniMapu2];
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self dismissViewControllerAnimated:YES completion:nil];
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)neuspjeh {
    [self prikaziMapu2];
    NSString *msg=[NSString stringWithFormat:@"You have no more towers\nConnected:%d tower:%d",brk,stu];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Fall"
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"New"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [self makniMapu2];
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             [self ponovoPokreni];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [self makniMapu2];
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self dismissViewControllerAnimated:YES completion:nil];
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)ponovoPokreni {
    [malamapa removeFromSuperview];
    [drawImage removeFromSuperview];
    drawImage =[[UIImageView alloc]init];
    drawImage.frame=CGRectMake(0, 0, podloga.frame.size.width, podloga.frame.size.height);
    [podloga addSubview:drawImage];
    for (UIView *kucica in podloga.subviews) {
        if (kucica.tag==1 || kucica.tag==2 || kucica.tag==3 || kucica.tag==4) {
            [kucica removeFromSuperview];
        }
    }
    prvi=true;
    brk=0; //povezanih kucica
    stu=0; //stupova
    CGRect kv1 = CGRectMake(0, 336, 600, 270);
    CGRect kv2 = CGRectMake(601, 548, 600, 206);
    CGRect kv3 = CGRectMake(1201, 664, 600, 229);
    CGRect kv4 = CGRectMake(1801, 785, 600, 258);
    CGRect kv5 = CGRectMake(2401, 901, 600, 227);
    //drvece
    int n=0;
    while (n<200) {
        double xd= arc4random()%2900+30;
        double yd= arc4random()%2900+30;
        if (!CGRectContainsPoint(kv1, CGPointMake(xd, yd)) && !CGRectContainsPoint(kv2, CGPointMake(xd, yd)) &&
            !CGRectContainsPoint(kv3, CGPointMake(xd, yd)) && !CGRectContainsPoint(kv4, CGPointMake(xd, yd)) &&
            !CGRectContainsPoint(kv5, CGPointMake(xd, yd))) {
            NSString *imeDrveta=[NSString stringWithFormat:@"drvo%d",arc4random()%13+1];
            UIImageView *drvo=[[UIImageView alloc]init];
            drvo.image=[UIImage imageNamed:imeDrveta];
            drvo.frame=CGRectMake(xd, yd, 30, 30);
            drvo.tag=1;
            [podloga addSubview:drvo];
            n++;
        }
    }
    //kucice
    n=0;
    while (n<100) {
        double xd= arc4random()%2900+50;
        double yd= arc4random()%2900+50;
        
        if (!CGRectContainsPoint(kv1, CGPointMake(xd, yd)) && !CGRectContainsPoint(kv2, CGPointMake(xd, yd)) &&
            !CGRectContainsPoint(kv3, CGPointMake(xd, yd)) && !CGRectContainsPoint(kv4, CGPointMake(xd, yd)) &&
            !CGRectContainsPoint(kv5, CGPointMake(xd, yd)) && ![self imaLiNatomMjestu:CGPointMake(xd, yd)]) {
            NSString *imeKuce=[NSString stringWithFormat:@"kucic%d",arc4random()%8+1];
            UIImageView *kuca=[[UIImageView alloc]init];
            kuca.image=[UIImage imageNamed:imeKuce];
            kuca.frame=CGRectMake(xd, yd, 50, 50);
            kuca.tag=2;
            [podloga addSubview:kuca];
            n++;
        }
    }
    [self napraviStup:CGPointMake(270, 360)];
    [self crtajZice:CGPointMake(243, 412) kraj:CGPointMake(270, 360)];
    [self.view bringSubviewToFront:navBar];
    [self.view bringSubviewToFront:labela];
    labela.text = [NSString stringWithFormat:@"Connected:%d/%d with:%d tower",brk,maxbrojKuca,stu];
    podloga.center=CGPointMake(1500, 1500);
}

- (IBAction)prMapu:(id)sender {
    if(!timer){
        [self prikaziMapu];
        [self startT];
    }
}

-(void)startT{
    if(!timer)
    { timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                               target:self
                                             selector:@selector(makniMapu)
                                             userInfo:nil
                                              repeats:NO];
    }
}

- (void)makniMapu {
    [malamapa removeFromSuperview];
    [timer invalidate];
    timer=nil;
}

- (void)prikaziMapu2 {
    [UIView animateWithDuration:2 animations:^{
        podloga.transform = CGAffineTransformScale(podloga.transform, transformToX, transformToY);
        podloga.frame = CGRectMake(0, 0, podloga.frame.size.width, podloga.frame.size.height);
    }];
}

- (void)makniMapu2 {
    [UIView animateWithDuration:2 animations:^{
        podloga.transform = CGAffineTransformScale(podloga.transform, 1/transformToX, 1/transformToY);
        podloga.frame = CGRectMake(0, 0, podloga.frame.size.width, podloga.frame.size.height);
    }];
    [timer invalidate];
    timer=nil;
}

- (void)prikaziMapu {
    malamapa= [[UIImageView alloc]init];
    //malamapa.backgroundColor=[UIColor lightGrayColor];
    malamapa.image =[UIImage imageNamed:@"mapa"];
    malamapa.frame = self.view.frame;
    double propx=malamapa.frame.size.width/3000;
    double propy=malamapa.frame.size.height/3000;
    [self.view addSubview:malamapa];
    for (UIView *kucica in podloga.subviews) {
        if (kucica.tag==2) {
            UIImageView *kuc= [[UIImageView alloc]init];
            kuc.backgroundColor=[UIColor redColor];
            kuc.frame = CGRectMake(kucica.center.x*propx, kucica.center.y*propy, 5, 5);
            [malamapa addSubview:kuc];
        }
        if (kucica.tag==3) {
            UIImageView *kuc= [[UIImageView alloc]init];
            kuc.backgroundColor=[UIColor yellowColor];
            kuc.frame = CGRectMake(kucica.center.x*propx, kucica.center.y*propy, 5, 5);
            [malamapa addSubview:kuc];
        }
    }
}

- (bool)imaLiNatomMjestu:(CGPoint)toMjesto {
    bool ima=false;
    for (UIView *kucica in podloga.subviews) {
        if (kucica.tag==2 && hypotf(kucica.center.x-toMjesto.x, kucica.center.y-toMjesto.y)<100) {
            ima=true;
            break;
        }
    }
    return ima;
}

- (void)skrolaj:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation=[recognizer translationInView:self.view];
    podloga.center=CGPointMake(podloga.center.x+translation.x,podloga.center.y+translation.y);
    CGPoint pp=podloga.center;
    if (podloga.center.x>1500) {
        pp.x=1500;
    }
    if (podloga.center.y>1500) {
        pp.y=1500;
    }
    
    if (podloga.center.x+1500<self.view.frame.size.width) {
        pp.x=self.view.frame.size.width-1500;
    }
    if (podloga.center.y+1500<self.view.frame.size.height) {
        pp.y=self.view.frame.size.height-1500;
    }
    podloga.center=pp;
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}

- (void)crtajZice:(CGPoint)pocetak kraj:(CGPoint)kraj {
    UIGraphicsBeginImageContext(podloga.frame.size);
    [drawImage.image drawInRect:drawImage.frame];
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0, 0, 0, 1);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1.0);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(),pocetak.x-stup.frame.size.width/3.6,pocetak.y-stup.frame.size.height/11);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(),kraj.x-stup.frame.size.width/3.6, kraj.y-stup.frame.size.height/11);
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(),pocetak.x+stup.frame.size.width/3.6,pocetak.y-stup.frame.size.height/11);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(),kraj.x+stup.frame.size.width/3.6, kraj.y-stup.frame.size.height/11);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)napraviStup:(CGPoint)polozaj {
    zeleniKrug.center=polozaj;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1.0];
    [UIView setAnimationDidStopSelector:@selector(myAnimationEnded)];
    [UIView setAnimationDelegate:self];
    zeleniKrug.transform = CGAffineTransformScale(zeleniKrug.transform, 15, 15);
    zeleniKrug.alpha=0.5;
    [UIView commitAnimations];
    
    double d=hypotf(prethodni.x-polozaj.x, prethodni.y -polozaj.y);
    if (d>300 && !prvi) {
        return;
    }
    stu++;
    for (UIView *kucica in podloga.subviews) {
        if (kucica.tag==2 && hypotf(kucica.center.x-polozaj.x, kucica.center.y -polozaj.y)<100) {
            kucica.backgroundColor=[UIColor colorWithRed:1.0 green:0.9 blue:0.0 alpha:0.7];
            kucica.layer.cornerRadius = 10;
            kucica.clipsToBounds = NO;
            kucica.tag=3;
            brk++;
        }
    }
    labela.text = [NSString stringWithFormat:@"Connected:%d/%d with:%d towers",brk,maxbrojKuca,stu];
    stup=[[UIImageView alloc]init];
    stup.image =[UIImage imageNamed:@"stup"];
    stup.frame = CGRectMake(polozaj.x,polozaj.y, 60, 70);
    stup.center = polozaj;
    stup.tag=4;
    [podloga addSubview:stup];
    [zvuk1 play];
    
    if(!prvi){
        [self crtajZice:prethodni kraj:polozaj];
        prethodni=polozaj;
    }
    else{
        prvi=false;
        prethodni=polozaj;
    }
    
    if (brk<maxbrojKuca && stu>maxbrojStupova) {
        [self neuspjeh];
    }else if (brk>=maxbrojKuca){
        [self uspjeh];
    }
}

- (void)myAnimationEnded {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 0.5];
    zeleniKrug.transform = CGAffineTransformScale(zeleniKrug.transform, 1.0/15.0, 1.0/15.0);
    zeleniKrug.alpha=0;
    [UIView commitAnimations];
}

- (void)doDoubleTap:(UITapGestureRecognizer *)gesture {
    CGPoint prstPt = [gesture locationInView:drawImage];
    [self napraviStup:prstPt];
}

- (IBAction)vratiSe:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
