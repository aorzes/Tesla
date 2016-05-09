//
//  boat.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "boat.h"

@interface boat ()

@end

@implementation boat

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated{

    mk=10;
    mkd=0;
    zutaUklj=false;
    crvenaUklj=false;
    velicina = self.view.frame.size;
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    
    korito=[[UIImageView alloc]init];
    korito.image=[UIImage imageNamed:@"teslaBoatb"];
    korito.frame = CGRectMake(10, navBar.frame.origin.y+50, velicina.width/1.5, velicina.width/1.5*530/1152);
    korito.center = CGPointMake(velicina.width/2, korito.center.y);
    [self.view addSubview:korito];
    
    nebo=[[UIImageView alloc]init];
    nebo.image=[UIImage imageNamed:@"sky"];
    nebo.frame = CGRectMake(0, 0, velicina.width, korito.center.y);
    [self.view addSubview:nebo];

    more=[[UIImageView alloc]init];
    more.image=[UIImage imageNamed:@"moreab"];
    more.frame = CGRectMake(0, korito.center.y, velicina.width, velicina.height);
    [self.view addSubview:more];
    
    more1=[[UIImageView alloc]init];
    more1.image=[UIImage imageNamed:@"moreab"];
    more1.frame = CGRectMake(0, 0, more.frame.size.width, more.frame.size.height);
    more1.alpha=0.5;
    [more addSubview:more1];
    
    more2=[[UIImageView alloc]init];
    more2.image=[UIImage imageNamed:@"moreab"];
    more2.frame = CGRectMake( velicina.width,0, more.frame.size.width, more.frame.size.height);
    more2.alpha=0.5;
    [more addSubview:more2];
    
    [self.view bringSubviewToFront:korito];
    
    kormilo=[[UIImageView alloc]init];
    kormilo.image=[UIImage imageNamed:@"kormiloc0010"];
    kormilo.frame = CGRectMake(-korito.frame.size.width/13, korito.frame.size.width/6.4, korito.frame.size.width/2.5, korito.frame.size.width/2.5*200/280);
    [korito addSubview:kormilo];
    
    propeler=[[UIImageView alloc]init];
    propeler.image=[UIImage imageNamed:@"tboprop0000"];
    propeler.frame = CGRectMake(korito.frame.size.width/30, korito.frame.size.width/3.44, korito.frame.size.width/26, korito.frame.size.width/26*100/30);
    [korito addSubview:propeler];
    
    propeler.animationImages=[NSArray arrayWithObjects:
                              [UIImage imageNamed: @"tboprop0000"],
                              [UIImage imageNamed: @"tboprop0001"],
                              [UIImage imageNamed: @"tboprop0002"],
                              [UIImage imageNamed: @"tboprop0003"],
                              [UIImage imageNamed: @"tboprop0004"],
                              [UIImage imageNamed: @"tboprop0005"],
                              [UIImage imageNamed: @"tboprop0006"],
                              [UIImage imageNamed: @"tboprop0007"],
                              [UIImage imageNamed: @"tboprop0008"],
                              [UIImage imageNamed: @"tboprop0009"],
                              [UIImage imageNamed: @"tboprop0010"],
                              [UIImage imageNamed: @"tboprop0011"],
                              [UIImage imageNamed: @"tboprop0012"],
                              [UIImage imageNamed: @"tboprop0013"],
                              [UIImage imageNamed: @"tboprop0014"],
                              [UIImage imageNamed: @"tboprop0015"],
                              [UIImage imageNamed: @"tboprop0016"],
                              [UIImage imageNamed: @"tboprop0017"],
                              [UIImage imageNamed: @"tboprop0018"],
                              [UIImage imageNamed: @"tboprop0019"],
                              [UIImage imageNamed: @"tboprop0020"],
                              nil];
    propeler.animationDuration=1.5;
    propeler.animationRepeatCount=0;

    mjehurici=[[UIImageView alloc]init];
    mjehurici.image=[UIImage imageNamed:@"mjehurici0043"];
    mjehurici.frame = CGRectMake(-propeler.frame.size.width*4, 0, propeler.frame.size.width*4, propeler.frame.size.height);
    [propeler addSubview:mjehurici];
    mjehurici.animationImages=[NSArray arrayWithObjects:
                               [UIImage imageNamed: @"mjehurici0043.png"],
                               [UIImage imageNamed: @"mjehurici0044.png"],
                               [UIImage imageNamed: @"mjehurici0045.png"],
                               [UIImage imageNamed: @"mjehurici0046.png"],
                               [UIImage imageNamed: @"mjehurici0047.png"],
                               [UIImage imageNamed: @"mjehurici0048.png"],
                               [UIImage imageNamed: @"mjehurici0049.png"],
                               [UIImage imageNamed: @"mjehurici0050.png"],
                               [UIImage imageNamed: @"mjehurici0051.png"],
                               [UIImage imageNamed: @"mjehurici0052.png"],
                               [UIImage imageNamed: @"mjehurici0053.png"],
                               [UIImage imageNamed: @"mjehurici0054.png"],
                               [UIImage imageNamed: @"mjehurici0055.png"],
                               [UIImage imageNamed: @"mjehurici0056.png"],
                               [UIImage imageNamed: @"mjehurici0057.png"],
                               [UIImage imageNamed: @"mjehurici0058.png"],
                               [UIImage imageNamed: @"mjehurici0059.png"],
                               [UIImage imageNamed: @"mjehurici0060.png"],
                               [UIImage imageNamed: @"mjehurici0061.png"],
                               [UIImage imageNamed: @"mjehurici0062.png"],
                               [UIImage imageNamed: @"mjehurici0063.png"],
                               nil];
    mjehurici.animationDuration=1.50;
    mjehurici.animationRepeatCount=0;
    mjehurici.alpha=0;
    //komandna ploca
    komandna=[[UIImageView alloc]init];
    komandna.image=[UIImage imageNamed:@"komandnaBrod"];
    komandna.frame = CGRectMake(0, velicina.height-velicina.width/2, velicina.width, velicina.width/2);
    [self.view addSubview:komandna];
    
    tipkaL=[[UIImageView alloc]init];
    tipkaL.image=[UIImage imageNamed:@"zutaTipka"];
    tipkaL.frame = CGRectMake(komandna.frame.size.width/6.5, komandna.frame.size.height/4, komandna.frame.size.height/5, komandna.frame.size.height/5);
    [komandna addSubview:tipkaL];
    
    tipkaR=[[UIImageView alloc]init];
    tipkaR.image=[UIImage imageNamed:@"zutaTipka"];
    tipkaR.frame = CGRectMake(komandna.frame.size.width-komandna.frame.size.width/6.5-komandna.frame.size.height/5, komandna.frame.size.height/4, komandna.frame.size.height/5, komandna.frame.size.height/5);
    [komandna addSubview:tipkaR];


    tipkaOn=[[UIImageView alloc]init];
    tipkaOn.image=[UIImage imageNamed:@"crvenaTipka"];
    tipkaOn.frame = CGRectMake(tipkaL.frame.origin.x, komandna.frame.size.height/1.65, komandna.frame.size.height/5, komandna.frame.size.height/5);
    [komandna addSubview:tipkaOn];
    
    tipkaOff=[[UIImageView alloc]init];
    tipkaOff.image=[UIImage imageNamed:@"zelenaTipka"];
    tipkaOff.frame = CGRectMake(tipkaR.frame.origin.x, komandna.frame.size.height/1.65, komandna.frame.size.height/5, komandna.frame.size.height/5);
    [komandna addSubview:tipkaOff];
    
    brojcanik1=[[UIImageView alloc]init];
    brojcanik1.image=[UIImage imageNamed:@"brojcanik"];
    brojcanik1.frame = CGRectMake(velicina.width/2, komandna.frame.size.height/1.65, komandna.frame.size.height/3, komandna.frame.size.height/3);
    brojcanik1.center=CGPointMake(velicina.width/2, komandna.frame.size.height/1.3);
    [komandna addSubview:brojcanik1];

    brojcanik2=[[UIImageView alloc]init];
    brojcanik2.image=[UIImage imageNamed:@"brojcanik"];
    brojcanik2.frame = CGRectMake(velicina.width/2, komandna.frame.size.height/1.65, komandna.frame.size.height/3, komandna.frame.size.height/3);
    brojcanik2.center=CGPointMake(velicina.width/2, komandna.frame.size.height/3.5);
    [komandna addSubview:brojcanik2];
    
    osovina1=[[UIImageView alloc]init];
    osovina1.image=[UIImage imageNamed:@"bomba"];
    osovina1.frame = CGRectMake(0, 0, brojcanik1.frame.size.height/10, brojcanik1.frame.size.height/10);
    osovina1.center=CGPointMake(brojcanik1.frame.size.width/2, brojcanik1.frame.size.height/2);
    [brojcanik1 addSubview:osovina1];
    
    osovina2=[[UIImageView alloc]init];
    osovina2.image=[UIImage imageNamed:@"bomba"];
    osovina2.frame = CGRectMake(0, 0, brojcanik2.frame.size.height/10, brojcanik2.frame.size.height/10);
    osovina2.center=CGPointMake(brojcanik2.frame.size.width/2, brojcanik2.frame.size.height/2);
    [brojcanik2 addSubview:osovina2];
    
    instrument1=[[UIImageView alloc]init];
    instrument1.image=[UIImage imageNamed:@"instrument1"];
    instrument1.frame = CGRectMake(velicina.width/2, komandna.frame.size.height/1.65, komandna.frame.size.height/2.3, komandna.frame.size.height/2.3);
    instrument1.center=CGPointMake(velicina.width/2, komandna.frame.size.height/1.3);
    [komandna addSubview:instrument1];
    
    instrument2=[[UIImageView alloc]init];
    instrument2.image=[UIImage imageNamed:@"instrument1"];
    instrument2.frame = CGRectMake(velicina.width/2, komandna.frame.size.height/1.65, komandna.frame.size.height/2.3, komandna.frame.size.height/2.3);
    instrument2.center=CGPointMake(velicina.width/2, komandna.frame.size.height/3.5);
    [komandna addSubview:instrument2];
    
    kaza1=[[UIImageView alloc]init];
    kaza1.image=[UIImage imageNamed:@"kaza1"];
    kaza1.frame = CGRectMake(osovina1.frame.size.width/2, osovina1.frame.size.height/2, instrument1.frame.size.height/8, instrument1.frame.size.height/3);
    kaza1.center=CGPointMake(osovina1.frame.size.width/2, -kaza1.frame.size.height/2);
    [osovina1 addSubview:kaza1];
    
    kaza2=[[UIImageView alloc]init];
    kaza2.image=[UIImage imageNamed:@"kaza1"];
    kaza2.frame = CGRectMake(osovina1.frame.size.width/2, osovina1.frame.size.height/2, instrument1.frame.size.height/8, instrument1.frame.size.height/3);
    kaza2.center=CGPointMake(osovina1.frame.size.width/2, -kaza1.frame.size.height/2);
    [osovina2 addSubview:kaza2];
    
    osovina1.transform = CGAffineTransformMakeRotation(-M_PI/2);
    osovina2.transform = CGAffineTransformMakeRotation(0);

    [self.view bringSubviewToFront:navBar];
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(zoomMeIn:)];
    [self.view addGestureRecognizer:pinchGestureRecognizer];
    
    UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paneMe:)];
    [self.view addGestureRecognizer:panGesture];
    
    [self startMotionManager];
    [self startM];
}

//ovo služi samo za startanje motion kontrole i pokreće se iz viewDidLoad
- (void)startMotionManager{
    if (motionManager == nil) {
        motionManager = [[CMMotionManager alloc] init];
    }
    motionManager.deviceMotionUpdateInterval = 1/20.0;
    if (motionManager.deviceMotionAvailable) {//Device Motion Available
        [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue]
                                           withHandler: ^(CMDeviceMotion *motion, NSError *error){
                                               
                                               [self performSelectorOnMainThread:@selector(handleDeviceMotion:) withObject:motion waitUntilDone:YES];}];
        
    }
}

//ovo je kontrola micanja
- (void)handleDeviceMotion:(CMDeviceMotion*)motion{
    CMAttitude *currentAttitude = motion.attitude;
    double rr;
    CGPoint sloc =korito.center;
    //sloc pamti položaj slike tj. x,y;
    if((sloc.x>-200 && currentAttitude.roll<0) || (sloc.x<520 && currentAttitude.roll>0) )
    {   rr=currentAttitude.roll;
        if(rr>2) rr=2;
        if(rr<-2) rr=-2;
        sloc.x+=rr;
    }
    korito.center=sloc;
}

-(void)startM{
    if(!timerM)
    { timerM = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                target:self
                                              selector:@selector(prozirnost)
                                              userInfo:nil
                                               repeats:YES];
    }
}

-(void)prozirnost{

    
    CGPoint pp=more1.center;
    pp.x--;
    more1.center=pp;
    pp=more2.center;
    pp.x--;
    more2.center=pp;
    if (more1.center.x<-velicina.width/2) {
        pp.x=more2.center.x+velicina.width;
        more1.center=pp;
    }
    if (more2.center.x<-velicina.width/2) {
        pp.x=more1.center.x+velicina.width;
        more2.center=pp;
    }


}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:komandna];
    if (CGRectContainsPoint(tipkaL.frame, currentPoint)){
        tipkaL.image=[UIImage imageNamed:@"zutaTipkaS"];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration: 2.0];
        [UIView setAnimationDelegate:self];
        osovina2.transform = CGAffineTransformRotate(osovina2.transform, -M_PI/1.4);
        [UIView commitAnimations];
        zutaUklj=true;
        mkd=1;
        [self miciKormilo];
    }
    if (CGRectContainsPoint(tipkaR.frame, currentPoint)){
        tipkaR.image=[UIImage imageNamed:@"zutaTipkaS"];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration: 2.0];
        [UIView setAnimationDelegate:self];
        osovina2.transform = CGAffineTransformRotate(osovina2.transform, M_PI/1.4);
        [UIView commitAnimations];
        zutaUklj=true;
        mkd=-1;
        [self miciKormilo];
    }
    if (CGRectContainsPoint(tipkaOn.frame, currentPoint) && !crvenaUklj){
        tipkaOn.image=[UIImage imageNamed:@"crvenaTipkaS"];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration: 2.0];
        [UIView setAnimationDelegate:self];
        osovina1.transform = CGAffineTransformRotate(osovina1.transform, M_PI/1.2);
        [UIView commitAnimations];
        crvenaUklj=true;
        [propeler startAnimating];
        [mjehurici startAnimating];
        [UILabel beginAnimations:NULL context:nil];
        [UILabel setAnimationDuration:2.0];
        mjehurici.alpha=1;
        [UIView commitAnimations];
    }
    if (CGRectContainsPoint(tipkaOff.frame, currentPoint) && crvenaUklj){
        tipkaOff.image=[UIImage imageNamed:@"zelenaTipkaS"];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration: 1.0];
        [UIView setAnimationDelegate:self];
        osovina1.transform = CGAffineTransformRotate(osovina1.transform, -M_PI/1.2);
        [UIView commitAnimations];
        crvenaUklj=false;
        tipkaOn.image=[UIImage imageNamed:@"crvenaTipka"];
        [propeler stopAnimating];
        [mjehurici stopAnimating];
        mjehurici.alpha=0;
        
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (zutaUklj) {
        zutaUklj=false;
        tipkaL.image=[UIImage imageNamed:@"zutaTipka"];
        tipkaR.image=[UIImage imageNamed:@"zutaTipka"];
        [osovina2 stopAnimating];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration: 1.0];
        [UIView setAnimationDelegate:self];
        osovina2.transform = CGAffineTransformMakeRotation(0);
        [UIView commitAnimations];
    }
    else
    {
        tipkaOff.image=[UIImage imageNamed:@"zelenaTipka"];
    }
    if(crvenaUklj){
    
    }
    

}


-(void)zoomMeIn:(UIPinchGestureRecognizer *)pinchGestureRecognizer{
    
    if (pinchGestureRecognizer.state==UIGestureRecognizerStateEnded) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        korito.center = CGPointMake(korito.center.x, navBar.center.y+navBar.frame.size.height/2+korito.frame.size.height/2);
        more.frame = CGRectMake(0, korito.center.y, more.frame.size.width, more.frame.size.height);
        nebo.frame = CGRectMake(0, 0, velicina.width, korito.center.y);
        [UIView commitAnimations];
    }

    if ((pinchGestureRecognizer.scale>1 && korito.frame.size.height>self.view.frame.size.height) || (pinchGestureRecognizer.scale<1 && korito.frame.size.height<50)) {
        return;
    }
    
    korito.transform = CGAffineTransformScale(korito.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
    [pinchGestureRecognizer setScale:1.0];

    
}


-(void)paneMe:(UIPanGestureRecognizer *)recognizer{
    
    CGPoint translation=[recognizer translationInView:self.view];
    korito.center=CGPointMake(korito.center.x+translation.x,korito.center.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
}

-(void)miciKormilo{
    mk+=mkd;
    if (mk>20) {mk=20;}
    if (mk<0) {mk=0;}
    switch(mk)
    {
        case 0: kormilo.image= [UIImage imageNamed:@"kormiloc0000.png"];break;
        case 1: kormilo.image= [UIImage imageNamed:@"kormiloc0001.png"];break;
        case 2: kormilo.image= [UIImage imageNamed:@"kormiloc0002.png"];break;
        case 3: kormilo.image= [UIImage imageNamed:@"kormiloc0003.png"];break;
        case 4: kormilo.image= [UIImage imageNamed:@"kormiloc0004.png"];break;
        case 5: kormilo.image= [UIImage imageNamed:@"kormiloc0005.png"];break;
        case 6: kormilo.image= [UIImage imageNamed:@"kormiloc0006.png"];break;
        case 7: kormilo.image= [UIImage imageNamed:@"kormiloc0007.png"];break;
        case 8: kormilo.image= [UIImage imageNamed:@"kormiloc0008.png"];break;
        case 9: kormilo.image= [UIImage imageNamed:@"kormiloc0009.png"];break;
        case 10: kormilo.image= [UIImage imageNamed:@"kormiloc0010.png"];break;
        case 11: kormilo.image= [UIImage imageNamed:@"kormiloc0011.png"];break;
        case 12: kormilo.image= [UIImage imageNamed:@"kormiloc0012.png"];break;
        case 13: kormilo.image= [UIImage imageNamed:@"kormiloc0013.png"];break;
        case 14: kormilo.image= [UIImage imageNamed:@"kormiloc0014.png"];break;
        case 15: kormilo.image= [UIImage imageNamed:@"kormiloc0015.png"];break;
        case 16: kormilo.image= [UIImage imageNamed:@"kormiloc0016.png"];break;
        case 17: kormilo.image= [UIImage imageNamed:@"kormiloc0017.png"];break;
        case 18: kormilo.image= [UIImage imageNamed:@"kormiloc0018.png"];break;
        case 19: kormilo.image= [UIImage imageNamed:@"kormiloc0019.png"];break;
        case 20: kormilo.image= [UIImage imageNamed:@"kormiloc0020.png"];break;
            
        default:kormilo.image= [UIImage imageNamed:@"kormiloa0010.png"];
            
    }
    
}

- (IBAction)vratiSe:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
