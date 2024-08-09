//
//  MixCalc.h
//  HelloMix
//
//  Created by Jongwook Park on 8/8/24.
//

#import <Foundation/Foundation.h>

@interface MixCalc : NSObject

// greetingMessage이라는 인스턴스 메서드를 호출하면
// 참조타입(*)인 NSString 값을 하나 return해줄 것이다
- (NSString *)greetingMessage;

// int는 값타입이라 *가 불필요
// 특정 숫자에 +1한 값을 돌려주는 int 메서드
- (int)addOne:(int)number;

@end

