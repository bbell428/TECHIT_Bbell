#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 값을 할당하진 않았지만, 이 코드만으로도
        // 메모리에 공간을 차지할 준비는 끝납니다.
        // 그러니까 어딘가 위치는 잡혀있겠죠?
        int var1;
        
        // 이렇게 배열로 변수를 만들면
        // 그 배열의 위치는 첫번째 배열 데이터의 위치라고
        // 말할 수 있습니다.
        char var2[10];
        
        // 그럼 위 변수들의 위치를 확인해봅시다.
        // %x는 16진수를 나타내기위함입니다.
        NSLog(@"var1의 위치: %x", &var1);
        NSLog(@"var2의 위치: %x", &var2);
        NSLog(@"var2의 첫번째 요소 위치: %x", &var2[0]);
        NSLog(@"var2의 두번째 요소 위치: %x", &var2[1]);
        NSLog(@"var2의 세번째 요소 위치: %x", &var2[2]);
        
        /*
         var1의 위치: 6fdff294
         var2의 위치: 6fdff2ae
         var2의 첫번째 요소 위치: 6fdff2ae
         var2의 두번째 요소 위치: 6fdff2af
         var2의 세번째 요소 위치: 6fdff2b0
         */

        // ----------------------------------------------------------
        
        int var = 20;
        
        // var 변수의 위치를
        // int값들의 위치를 기록 가능한
        // ip라는 포인터 변수에 할당한다. (참조타입!!)
        int* ip = &var;
        
        // 위와 같이 만들어도 되고, 다음도 가능하다.
        // '*' 기호의 위치를 잘 보세요!
        // int *ip = &var;
        
        NSLog(@"var에 담긴 값: %d", var);
        NSLog(@"var의 위치: %x", &var);
        NSLog(@"ip가 기록한 위치: %x", ip);
        NSLog(@"ip 위치가 가면 있을 데이터: %d", *ip);
        
        /*
         var에 담긴 값: 20
         var의 위치: 6fdff2ac
         ip가 기록한 위치: 6fdff2ac
         ip 위치가 가면 있을 데이터: 20
         */
        
    }
    return 0;
}
