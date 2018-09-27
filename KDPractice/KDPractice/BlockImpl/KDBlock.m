//
//  KDBlock.m
//  KDPractice
//
//  Created by csyibei on 2018/9/27.
//  Copyright © 2018 KaiDiL. All rights reserved.
//

#import "KDBlock.h"
#import "KDTest.h"

@implementation KDBlock
- (instancetype)init
{
    self = [super init];
    if (self) {
        //在block中 如果捕获的是对象或__block修饰的变量（不管是不是对象） 那么在他的block_desc中就会出现copy和dispose方法 如果是__block修饰的对象那么还会在__block自己的结构体中出现copy和dispose方法（__block带基本变量类型不能用weak修饰 直接就是强引用）
        //desc中的copy和dispose是block在被拷贝移除堆上的时候调用的 用来对捕获的对象做内存管理
        //__Block_byref中的copy和dispose是为了block在copy或realease的 根据__Block_byref中那个对象A是weak or strong来对这个对象A进行内存管理
        //__block修饰的如果是对象类型 那么如果再加个weak 那么block结构体中的那个对象则会变成weak  但是不管是strong还是weak mainBlock引用__block结构体都是强引用
        //MRC下 mainBlock对__block结构体的引用就是weak 不管有无copy
        
        //总结一句话就是 __block变量修饰对象和其他对象的区别就是  mainblock捕获持有的是__block的结构体 而这个变量的内存管理则是交给这个结构体去管 而没有__block修饰的对象 他的内存管理则根据他自己是weak还是strong由mainBlock管理
        
        //    int dmy = 256;
        //    NSObject *a = [[NSObject alloc] init];
        //        __block int val = 10;
        //        const char *fmt = "val = %d\n";
//        __block __weak KDTest *test = [[KDTest alloc] init];
        __block KDTest *test = [[KDTest alloc] init];
        test.haha = 10;
        void (^blk)(void) = ^(){
            printf("%d",test.haha);
            //        val = 100;
            //        dmy = 200;
            //        printf(fmt,val);
        };
        
        blk();
    }
    return self;
}
@end
