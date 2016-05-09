//
//  coil.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "coil.h"

@interface coil ()

@end

@implementation coil

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

float sgn(float n) { return (n < 0.0) ? -1.0 : (n > 0.0) ? 1.0 : 0.0; }

-(void) viewDidAppear:(BOOL)animated{

    velicina = self.view.frame.size;
    
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    drawImage = [[UIImageView alloc]init];
    drawImage.frame = CGRectMake(0, 0, velicina.width, velicina.height);
    drawImage.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    drawImage.tag =1;
    [self.view addSubview:drawImage];
    
    centar = CGPointMake(velicina.width/2, velicina.width/1.6);
    
    coilImage = [[UIImageView alloc]init];
    coilImage.image = [UIImage imageNamed:@"coil"];
    coilImage.frame = CGRectMake(velicina.width/6, velicina.width/2, velicina.width/1.52, velicina.width);
    coilImage.tag=1;
    [self.view addSubview:coilImage];
    navBar.tag = 1;
    [self.view bringSubviewToFront:navBar];
    [self startT];


}
-(void)startT{
    
    if(!timerT)
    { timerT = [NSTimer scheduledTimerWithTimeInterval:0.25
                                                target:self
                                              selector:@selector(brisanje)
                                              userInfo:nil
                                               repeats:YES];
        
    }
    
    
}
-(void)brisanje{
    NSArray *subviews = [self.view subviews];
    for (UIView *subview in subviews)
        if(subview.tag == 0)
            [subview removeFromSuperview];
}

-(void)crtaj{
    //priprema
    UIGraphicsBeginImageContext(drawImage.frame.size);
    
    CGRect myImageRect = CGRectMake(0, 0, velicina.width, velicina.height);//NAPRAVI kvadrat za sliku
    drawImage=[[UIImageView alloc] initWithFrame:myImageRect];//alociraj memoriju
    [self.view addSubview:drawImage];
    
    //osobina crte
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1, 1, 1, 1.0);
    
    //crtanje crte
    int crtica = 10; //duzina pojedine crtice
    double xs = centar.x;
    double ys = centar.y;
    double dx = currentPoint.x - xs;
    double dy = currentPoint.y - ys;
    if (fabs(dx) > fabs(dy)) {
        if( dx != 0){ dy =fabs(dy / dx) * sgn(dy);}  else {dy = 0;}
        dx = sgn(dx);}
    else {
        if (dy!= 0){ dx = fabs(dx / dy) * sgn(dx);} else {dx = 0;}
        dy = sgn(dy);}
    
    double d = sqrt(pow((xs - currentPoint.x), 2) + pow((ys - currentPoint.y),2));
    
    double asmanji = 0.4;
    double a = 6;
    int i;
    xs = xs + dx * (arc4random() % 10+5);
    ys = ys + dy * (arc4random() % 10+5);
    double xss = xs;
    double yss = ys;
    
    for(i = 0;i<(d / (crtica / 2));i++){
        a = a - asmanji;
        if(a<=0.2)a=0.4;
        xss = xs;
        yss = ys;
        xs = xs + dx * (arc4random() % crtica);
        ys = ys + dy * (arc4random() % crtica);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 20);//debljina crte
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.2, 0, 1, 0.06);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), xss, yss);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), xs,ys);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(),10);//debljina crte
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1, 0, 1, 0.09);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), xss, yss);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), xs,ys);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), a);//debljina crte
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1, 1, 1, 1.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), xss, yss);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), xs,ys);
        
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        //if(i==3) AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        
    }
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    currentPoint = [touch locationInView:drawImage];
    
    [self crtaj];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    currentPoint = [touch locationInView:drawImage];
    
    [self crtaj];
    
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self brisanje];
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
