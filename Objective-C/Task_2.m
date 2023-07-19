#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int num1, num2, num3;
        
        NSLog(@"Введите первое число:");
        scanf("%d", &num1);
        
        NSLog(@"Введите второе число:");
        scanf("%d", &num2);
        
        NSLog(@"Введите третье число:");
        scanf("%d", &num3);
        
        int maxNumber = num1;
        
        if (num2 > maxNumber) {
            maxNumber = num2;
        }
        
        if (num3 > maxNumber) {
            maxNumber = num3;
        }
        
        NSLog(@"Большее число: %d", maxNumber);
    }
    return 0;
}