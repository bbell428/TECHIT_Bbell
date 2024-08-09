#import <Foundation/Foundation.h>

#define NUMBER_COUNT 10 // 전처리기로 상수 만들기

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int numbers[NUMBER_COUNT];
        int i;
        int *pNumbers = &numbers;
        
        for(i = 0; i < NUMBER_COUNT; i++) {
            numbers[i] = i * 2;
            NSLog(@"number의 %d번째 요소의 위치와 값: %x, %d", i, &numbers[i], numbers[i]);
        }
        
        NSLog(@"pNumbers 포인터 변수가 기억하는 numbers 배열의 첫번째 요소 위치: %x", pNumbers);
        
        for(i = 0; i < NUMBER_COUNT; i++) {
            NSLog(@"pNumbers 포인터 변수가 기억하는 위치와 값: %x, %d ", pNumbers, *pNumbers);
            pNumbers++; // pNumbers += 1;
        }
        
        /*
         number의 0번째 요소의 위치와 값: 6fdff290, 0
         number의 1번째 요소의 위치와 값: 6fdff294, 2
         number의 2번째 요소의 위치와 값: 6fdff298, 4
         number의 3번째 요소의 위치와 값: 6fdff29c, 6
         number의 4번째 요소의 위치와 값: 6fdff2a0, 8
         number의 5번째 요소의 위치와 값: 6fdff2a4, 10
         number의 6번째 요소의 위치와 값: 6fdff2a8, 12
         number의 7번째 요소의 위치와 값: 6fdff2ac, 14
         number의 8번째 요소의 위치와 값: 6fdff2b0, 16
         number의 9번째 요소의 위치와 값: 6fdff2b4, 18
         pNumbers 포인터 변수가 기억하는 numbers 배열의 첫번째 요소 위치: 6fdff290
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff290, 0
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff294, 2
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff298, 4
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff29c, 6
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff2a0, 8
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff2a4, 10
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff2a8, 12
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff2ac, 14
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff2b0, 16
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff2b4, 18
         pNumbers 포인터 변수가 기억하는 위치와 값: 6fdff2b8, 1772158987
         */
        
        
    }
    return 0;
}
