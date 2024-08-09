//
//  MixCalc.h
//  HelloMix
//
//  Created by Jongwook Park on 8/8/24.
//

#import <Foundation/Foundation.h>

@interface MixCalc : NSObject

- (int) plus: (int) number1 with: (int) number2;
- (int) minus: (int) number1 with: (int) number2;
- (int) multiply: (int) number1 with:(int) number2;
- (int) divide: (int) number1 with: (int) number2;

@end

