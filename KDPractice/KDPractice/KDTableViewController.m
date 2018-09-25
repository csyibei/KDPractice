//
//  KDTableViewController.m
//  KDPractice
//
//  Created by csyibei on 2017/3/30.
//  Copyright © 2017年 KaiDiL. All rights reserved.
//

#import "KDTableViewController.h"
#import "ViewController.h"
#import "ExplicitAnimationViewController.h"
#import "ImplicitAnimationViewController.h"
#import "LayerTimeViewController.h"
#import "EasingViewController.h"
#import "KDRegularExpressionViewController.h"

@interface KDTableViewController ()
@property (nonatomic,strong) NSArray *dataArr;
@end

@implementation KDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = @[@"method Swizzing",@"CABaseAnimation",@"ImplicitAnimation",@"LayerTime",@"Easing",@"RegularExpression"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ViewController *ctl = [[ViewController alloc] init];
        [self.navigationController  pushViewController:ctl animated:YES];
    }else if(indexPath.row == 1){
        ExplicitAnimationViewController *ctl = [[ExplicitAnimationViewController alloc] init];
        [self.navigationController pushViewController:ctl animated:YES];
    }else if (indexPath.row == 2){
        ImplicitAnimationViewController *ctl = [[ImplicitAnimationViewController alloc] init];
        [self.navigationController pushViewController:ctl animated:YES];
    }else if (indexPath.row == 3){
        LayerTimeViewController *ctl = [[LayerTimeViewController alloc] init];
        [self.navigationController pushViewController:ctl animated:YES];
    }else if (indexPath.row == 4){
        EasingViewController *ctl = [[EasingViewController alloc] init];
        [self.navigationController pushViewController:ctl animated:YES];
    }else if (indexPath.row == 5){
        KDRegularExpressionViewController *ctl = [[KDRegularExpressionViewController alloc] init];
        [self.navigationController pushViewController:ctl animated:YES];
    }
}

@end
