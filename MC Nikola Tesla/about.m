//
//  about.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "about.h"
#import "TableViewCell.h"

@interface about ()

@end

@implementation about{

    NSArray *arrayObjekata;
    NSArray *arraySlika;
    NSMutableArray *arrayBoolova;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tablica registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    
    arrayBoolova = [[NSMutableArray alloc]init];
    
    arrayObjekata = @[@"A Memorial Centre Nikola Tesla was opened on July 10, 2006, on the occasion of the 150th anniversary of Tesla's birth.", @"Tesla's center is located in the vicinity of a small village called Smiljan. Tesla's birth house and a small church where his father officiated are also located within the center. ", @"A small playground is there for the youngest visitors.", @"On a small stream you can see Tesla's turbine working.", @"There is also a test station with his transformer (coil) for wireless energy transfer experiments.", @"Today Tesla's house is a museum in which you can see replicas of his most important patents like a metallic egg that spins in a magnetic field and a lot more.", @"Biographical information and curiosities.", @"AC induction motor", @"Metallic egg that spins in a magnetic field.", @"Tesla's coil.", @"And a lot more...."];
    
    arraySlika = @[@"jedan", @"dva", @"tri", @"cetiri", @"pet", @"sest", @"sedam", @"osam", @"devet", @"deset", @"jedanaest"];
    
    for (int i = 0; i < arraySlika.count; i++) {
        
        [arrayBoolova addObject:[NSNumber numberWithBool:NO]];
        
        
    }

    
    
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{

    velicina = self.view.frame.size;
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    
    _tablica.frame = CGRectMake(0, 64, velicina.width, velicina.height-70);



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  arrayObjekata.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class]) forIndexPath:indexPath];
    cell.opisSlikeUCeliji.text = arrayObjekata[indexPath.row];
    cell.slikaUCeliji.image = [UIImage imageNamed:[arraySlika objectAtIndex:indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 300;



}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    CATransform3D trans = CATransform3DIdentity;

    int i = (int)indexPath.row;

    if ([[arrayBoolova objectAtIndex:i]boolValue] == NO) {
        
        arrayBoolova[i] = @YES;
        
        trans = CATransform3DTranslate(CATransform3DIdentity, -500, 30, 0);
        cell.layer.transform = trans;
        [UIView animateWithDuration:2 animations:^{
            cell.layer.transform = CATransform3DIdentity;
        }];
        
    }
}


- (IBAction)vratiSe:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}










@end
