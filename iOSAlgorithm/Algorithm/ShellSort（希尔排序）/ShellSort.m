
#import "ShellSort.h"

@implementation ShellSort

+ (void)shellSort:(NSMutableArray *)array {
    NSInteger gap = array.count / 2;
    while (gap >= 1) {
        for (NSInteger i = gap ; i < array.count; i++) {
            NSInteger temp = [array[i] integerValue];
            NSInteger j = i;
            while (j >= gap && temp < [array[j - gap] integerValue]) {
                [array replaceObjectAtIndex:j withObject:array[j - gap]];
                j -= gap;
            }
            [array replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:temp]];
        }
        gap = gap / 2;
    }
}

@end
