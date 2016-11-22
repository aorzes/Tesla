//
//  GameViewController.h
//  jaje4_maze
//

//  Copyright (c) 2016 Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "jajeScene.h"

@interface jajeViewController : UIViewController {
    jajeScene *scene;
    __weak IBOutlet UINavigationBar *navBar;
}

@end
