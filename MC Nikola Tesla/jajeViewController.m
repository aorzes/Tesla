//
//  GameViewController.m
//  jaje4_maze
//
//  Created by Anton Orzes on 12/04/16.
//  Copyright (c) 2016 Anton Orzes. All rights reserved.
//

#import "jajeViewController.h"


@interface jajeViewController ()

@end

@implementation jajeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    scene = [jajeScene nodeWithFileNamed:@"MyScene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    //ovo treba za velicinu
    scene.size=skView.bounds.size;
    // Present the scene.
    [skView presentScene:scene];
}
- (void)viewDidAppear:(BOOL)animated {
    CGSize velicina = self.view.frame.size;
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
}

- (IBAction)resetiranje:(id)sender {
    [scene obrisiSve];
}

- (IBAction)vratiSe:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
