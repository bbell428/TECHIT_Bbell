//
//  main.m
//  HelloWorld
//
//  Created by Jongwook Park on 7/17/24.
//

/*
 다음의 Swift 코드를 Obejctive-C로 구현해봅시다
 
 class Person {
     var name: String
     var age: Int
     
     init(name: String, age: Int) {
         self.name = name
         self.age = age
     }
 }
 */

#import <Foundation/Foundation.h>

// Person.h
@interface Person : NSObject
{
    NSString *name;
    int age;
}

- (id)initWithName:(NSString *)aName age:(int)aAge;
- (void)dealloc;
- (void)printInfo;

@end

// Person.m
@implementation Person

- (id)initWithName:(NSString *)aName age:(int)aAge
{
    self = [super init];
    
    if (self) {
        name = aName;
        age = aAge;
    }
    
    return self;
}

- (void)dealloc
{
    [name release];
    [super dealloc];
}

- (void)printInfo
{
    NSLog(@"Name: %@, Age: %d", name, age);
}

@end



// main.m

int main(int argc, const char * argv[]) {
    /*
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    */
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    Person *person1 = [[Person alloc] initWithName:@"Ned" age:13];
    [person1 printInfo];
    
    Person *person2 = [person1 retain];
    [person2 printInfo];
    
    // 다음과 같은 release 코드들이 없다면
    // 메모리 낭비가 생길 것이다 (memory leak)
    [person2 release];
    [person1 release];
    [pool drain];
    
    return 0;
}


// -------------------------------------------------------------------------------------------

// 위 코드에서 ARC가 적용되는 Objective-C 2.0으로 다시 작성해봅시다

#import <Foundation/Foundation.h>

// Person.h
@interface Person : NSObject
{
    NSString *name;
    int age;
}

- (id)initWithName:(NSString *)aName age:(int)aAge;
- (void)printInfo;

@end

// Person.m
@implementation Person

- (id)initWithName:(NSString *)aName age:(int)aAge
{
    self = [super init];
    
    if (self) {
        name = aName;
        age = aAge;
    }
    
    return self;
}

- (void)printInfo
{
    NSLog(@"Name: %@, Age: %d", name, age);
}

@end

// main.m

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        Person *person1 = [[Person alloc] initWithName:@"Ned" age:13];
        [person1 printInfo];
        
        Person *person2 = person1;
        [person2 printInfo];
    }
    return 0;
}
