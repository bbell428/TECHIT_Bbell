#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableString *greet = [[NSMutableString alloc] initWithString:@"Hello"];
        
        NSLog(@"인삿말은: %@", greet);
        
        
         NSMutableString *greeting = [[NSMutableString alloc] initWithString:@"Hello"];
         NSMutableString *hello = [[NSMutableString alloc] initWithString:@"Hello"];
         
         /*
          그냥 greeting과 hello는 메모리 주소만을 나타내기 때문에
          그 안의 문자열 내용을 비교엔 특별한 메서드를 써야한다
          */
         if([greeting isEqualToString:hello]) {
             NSLog(@"인삿말은: %@", greeting);
         }
    }
    return 0;
}
