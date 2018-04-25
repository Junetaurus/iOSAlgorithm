
#import "InsertSort.h"

@implementation InsertSort

+ (void)insertSort:(NSMutableArray *)array {
    for (NSInteger i = 1; i < array.count; i++) {
        NSInteger j = i;
        NSInteger temp = [array[i] integerValue];
        while (j > 0 && temp < [array[j - 1] integerValue]) {
            [array replaceObjectAtIndex:j withObject:array[j - 1]];
            j--;
        }
        [array replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:temp]];
    }
}

+ (void)binaryInsertSort:(NSMutableArray *)array {
    for (NSInteger i = 1; i < array.count; i++) {
        NSInteger temp = [array[i] integerValue];
        NSInteger left = 0;
        NSInteger right = i - 1;
        while (left <= right) {
            NSInteger middle = (left + right) / 2;
            if (temp < [array[middle] integerValue]) {
                right = middle - 1;
            }else{
                left = middle + 1;
            }
        }
        for (NSInteger j = i; j > left; j--) {
            [array replaceObjectAtIndex:j withObject:array[j - 1]];
        }
        [array replaceObjectAtIndex:left withObject:[NSNumber numberWithInteger:temp]];
    }
}

@end
