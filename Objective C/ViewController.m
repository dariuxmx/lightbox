//
//  ViewController.m
//  Objective C
//
//  Created by Edwin Dario Gutierrez Pech on 5/21/17.
//  Copyright © 2017 Darío Gutiérrez iOS Designer. All rights reserved.
//

#import "ViewController.h"

UITableView *table;

@interface ViewController ()

@end

@implementation ViewController

-(UITableView *)makeTableView
{
    CGFloat x = 0;
    CGFloat y = 50;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - 50;
    CGRect tableFrame = CGRectMake(x, y, width, height);
    
    table = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    
    table.rowHeight = 45;
    table.sectionFooterHeight = 22;
    table.sectionHeaderHeight = 22;
    table.scrollEnabled = YES;
    table.showsVerticalScrollIndicator = YES;
    table.userInteractionEnabled = YES;
    table.bounces = YES;
    
    table.delegate = self;
    table.dataSource = self;
    
    [self.view addSubview:table];
    
    return table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    table = [self makeTableView];

    //LightBox
//    lightBox = [[LightBoxView alloc]initWithFrame: CGRectZero];
//    [self.view addSubview:lightBox];
//    self->lightBox.hidden = YES;
}


#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Schedule %ld", (long)indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
    lightBox = [[LightBoxView alloc]initWithFrame: CGRectZero];
    [self.view addSubview:lightBox];
    [lightBox setNeedsDisplay];
    [lightBox setNeedsLayout];
    //Autolayout
    [lightBox autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [lightBox showLightBox];
    
}



@end
