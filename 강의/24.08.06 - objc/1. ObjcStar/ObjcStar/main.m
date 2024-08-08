//
//  main.m
//  ObjcStar
//
//  Created by 김종혁 on 8/6/24.
//

#import <Foundation/Foundation.h>

// Swift에서 이렇게 썼을 코드를
// func printStart() -> Void { ...
// C 언어의 함수로 만들면..
void printStars(int max) {
    int index = 0;
    int index_in = 0;
    
    for (index = 0; index < max; index++) {
        for (index_in = 0; index_in < (index + 1); index_in++) {
            printf("*");
        }
        
        printf("\n");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         별 모양 출력하기
         
         *
         **
         ***
         ****
         *****
         
         */
        printStars(7);
        
    }
    return 0;
}
