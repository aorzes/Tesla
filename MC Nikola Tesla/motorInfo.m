//
//  motorInfo.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 18/02/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import "motorInfo.h"

@interface motorInfo ()

@end

@implementation motorInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{

    CGSize velicina = self.view.frame.size;
    UIImageView *stator =[[UIImageView alloc]init];
    stator.image =[UIImage imageNamed:@"stator3"];
    stator.frame = CGRectMake(velicina.width/6, velicina.height/2, velicina.width/1.5, velicina.width/1.5);
    [self.view addSubview:stator];

    UIImageView *trigonom =[[UIImageView alloc]init];
    trigonom.image =[UIImage imageNamed:@"trigonom1"];
    trigonom.frame = CGRectMake(velicina.width/10, stator.center.y+stator.frame.size.height/2+velicina.width/30, velicina.width/1.25, velicina.width/3.75);
    trigonom.center = CGPointMake(stator.center.x + velicina.width/3.7, stator.center.y) ;
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
    trigonom.animationDuration=2.5;
    trigonom.animationRepeatCount=0;
    [trigonom startAnimating];
    trigonom.layer.shadowColor = [UIColor blackColor].CGColor;
    trigonom.layer.shadowOffset = CGSizeMake(-3, 3);
    trigonom.layer.shadowOpacity = 0.6;
    trigonom.layer.shadowRadius = 1.0;
    
    trigonom.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paneMe:)];
    [trigonom addGestureRecognizer:panGesture];
    [self.view bringSubviewToFront:stator];


}

-(IBAction)paneMe:(UIPanGestureRecognizer *)recognizer{
    
    CGPoint translation=[recognizer translationInView:self.view];
    recognizer.view.center=CGPointMake(recognizer.view.center.x+translation.x,recognizer.view.center.y+translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
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
