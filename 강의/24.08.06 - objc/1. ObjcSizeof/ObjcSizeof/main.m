//
//  main.m
//  ObjcSizeof
//
//  Created by 김종혁 on 8/6/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"저장 크기 확인!");
        // byte
        // 1btye = 8 bit
        NSLog(@"sizeof char = %lu", sizeof(char));
        NSLog(@"sizeof unsigned char = %lu", sizeof(unsigned char));
        NSLog(@"sizeof signed char = %lu", sizeof(signed char));
        NSLog(@"sizeof unsigned int = %lu", sizeof(unsigned int));
        NSLog(@"sizeof short = %lu", sizeof(short));
        NSLog(@"sizeof unsigned short = %lu", sizeof(unsigned short));
        NSLog(@"sizeof long = %lu", sizeof(long));
        NSLog(@"sizeof unsigned long = %lu", sizeof(unsigned long));
        NSLog(@"sizeof float = %lu", sizeof(float));
        NSLog(@"sizeof double = %lu", sizeof(double));
        NSLog(@"sizeof long double = %lu", sizeof(long double));
    }
    return 0;
}
