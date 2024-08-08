//
//  main.m
//  ObjcNSNumber
//
//  Created by 김종혁 on 8/6/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        int origin = 123;
        
        // C언어의 int 타입으로부터 NSNumber 인스턴스 만들기
        NSNumber *number = [NSNumber numberWithInt:origin];
  
        // NSNumber 인스턴스로부터 C언어의 int 값 얻어내기
        int repack = [number intValue];
        int index = 0;
        
        for(index = 0; index < repack; index++) {
            NSLog(@"Hello");
        }
    }
    return 0;
}
