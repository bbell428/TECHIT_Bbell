//
//  main.m
//  PointerObjc
//
//  Created by 김종혁 on 8/6/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int index = 0;
        
        // C언어에서 자동 int값 증가를 위해 ++ 연산자 활용 가능
        index++;
        NSLog(@"index: %d", index);
        
        // ++ 연산자는 앞에 붙여도 되는데, 뒤에 붙인것과 내부적인 처리는 다름!
        ++index;
        NSLog(@"index: %d", index);
        
        // 그럼 두가지가 그렇게 다르면 헷갈리니까
        // Swift는 ++ 연산자를 다 없애버리고 아래 방식만 두기로 함
        index += 1;
        NSLog(@"index: %d", index);
        
        int *p_index = &index;
        NSLog(@"index가 메모리 어디쯤 있을까요?: %d", p_index); // 1876947644 ??
    }
    return 0;
}
