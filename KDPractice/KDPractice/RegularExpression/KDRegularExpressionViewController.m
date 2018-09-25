//
//  KDRegularExpressionViewController.m
//  KDPractice
//
//  Created by csyibei on 2018/9/25.
//  Copyright © 2018 KaiDiL. All rights reserved.
//

#import "KDRegularExpressionViewController.h"

@interface KDRegularExpressionViewController ()

@end

@implementation KDRegularExpressionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    NSString *str = @"i am kaidi";
    l.text = str;
    [self.view addSubview:l];
    
    //1
    NSString *regular = @"k*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular];
    BOOL isValid = [predicate evaluateWithObject:l.text];
    
    //2
    NSRange range = [str rangeOfString:@"" options:NSRegularExpressionSearch];
    if (range.location != NSNotFound) {
        NSString *subStr = [str substringWithRange:range];
    }
    
    //3
    NSRegularExpression *regular1 = [NSRegularExpression regularExpressionWithPattern:@"" options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *resu = [regular1 matchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, [str length])];
    
    
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
