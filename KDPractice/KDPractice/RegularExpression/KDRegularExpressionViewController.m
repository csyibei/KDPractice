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
    NSString *originStr = @"kaaa";
    l.text = originStr;
    [self.view addSubview:l];
    
    //1
    NSString *regular = @"k*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular];
    BOOL isValid = [predicate evaluateWithObject:originStr];
    NSLog(@"1------%d",isValid);
    
    //2
    NSRange range = [originStr rangeOfString:@"iamka+" options:NSRegularExpressionSearch];
    if (range.location != NSNotFound) {
        NSString *subStr = [originStr substringWithRange:range];
        NSLog(@"2------%@",subStr);
    }
    
    //3 这里有个重点 就是当pattern是ka+的时候  如果匹配的字符串是kaaaa 则结果就是kaaaa 而不是ka kaa kaaa kaaaa
    //^ka也是 只会匹配出ka
    //要注意 OC中的正则就是匹配出符合pattern的字符串的loction和lenght（也就是range）
    NSRegularExpression *regular1 = [NSRegularExpression regularExpressionWithPattern:@"^.{5}$" options:NSRegularExpressionCaseInsensitive | NSRegularExpressionAnchorsMatchLines error:nil];
    NSArray<NSTextCheckingResult *> *resultArr = [regular1 matchesInString:originStr options:NSMatchingReportProgress range:NSMakeRange(0, [originStr length])];
    for (NSTextCheckingResult *result in resultArr) {
        if (result.range.location != NSNotFound) {
            NSLog(@"3------%@",[originStr substringWithRange:result.range]);
        }
    }
    
    /*
     "ka*"：表示一个字符串有一个k后面跟着零个或若干个a
     "ka+"：表示一个字符串有一个k后面跟着至少一个a或者更多
     "ka?"：表示一个字符串有一个k后面跟着零个或者一个a
     "k?a+$"：表示字符串以零个或一个k跟着一个或几个a结尾
     
     可以用大括号括起来（{}），表示一个重复的具体范围。例如
     
     "ka{4}"：表示一个字符串有一个k跟着4个a（"kaaaa"）；
     "ka{1,}"：表示一个字符串有一个k跟着至少1个a（"ka","kaa","kaaa",……)；
     "ka{3,4}"：表示一个字符串有一个k跟着3到4个a（"kaaa","kaaaa")。
     
     那么，“*”可以用{0，}表示，“+”可以用{1，}表示，“?”可以用{0，1}表示 必须要有下限
     
     
     []表示一个（注意是一个）字符的范围 比如[a-z]表示一个字符处于a-z范围内
     "."匹配除“\r\n”之外的任何单个字符
     
     "^.{5}$"：表示任意1个长度为5的字符串 在上面的例子中 由于不是5位长度 所以匹配结果为nil
     
     
     */
    
    
    
   /*
    typedef NS_OPTIONS(NSUInteger, NSRegularExpressionOptions) {
        NSRegularExpressionCaseInsensitive             = 1 << 0, Match letters in the pattern independent of case. 匹配一个字母独立于大小写
            NSRegularExpressionAllowCommentsAndWhitespace  = 1 << 1,  Ignore whitespace and #-prefixed comments in the pattern. 忽略pattern中的空格和#
        NSRegularExpressionIgnoreMetacharacters        = 1 << 2,   Treat the entire pattern as a literal string. 将整个pattern当成一个string
        NSRegularExpressionDotMatchesLineSeparators    = 1 << 3,   Allow . to match any character, including line separators. 允许匹配任何字符包括行分割符
        NSRegularExpressionAnchorsMatchLines           = 1 << 4, Allow ^ and $ to match the start and end of lines. 允许在开头和结尾匹配^和$
        NSRegularExpressionUseUnixLineSeparators       = 1 << 5,   Treat only \n as a line separator (otherwise, all standard line separators are used).只将\n当作分割线（相反其他所有的标准行分割符都可以被使用）
        NSRegularExpressionUseUnicodeWordBoundaries    = 1 << 6  Use Unicode TR#29 to specify word boundaries (otherwise, traditional regular expression word boundaries are used).
    };
    */
    
}


@end
