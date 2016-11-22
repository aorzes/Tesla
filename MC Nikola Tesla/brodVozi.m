//
//  brodVozi.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 01/04/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import "brodVozi.h"

@interface brodVozi ()

@end

@implementation brodVozi

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Dispose of any resources that can be recreated.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    scene = [scenaBrod nodeWithFileNamed:@"MyScene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    //ovo treba za velicinu
    scene.size=skView.bounds.size;
    // Present the scene.
    [skView presentScene:scene];
}

- (IBAction)povratak:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    
    CGSize velicina = self.view.frame.size;
    
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
