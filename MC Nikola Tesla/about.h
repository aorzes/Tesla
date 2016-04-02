//
//  about.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface about : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
     CGSize velicina;

    __weak IBOutlet UINavigationBar *navBar;
}

@property (weak, nonatomic) IBOutlet UITableView *tablica;

@end
