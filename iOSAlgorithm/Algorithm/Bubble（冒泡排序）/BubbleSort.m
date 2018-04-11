
#import "BubbleSort.h"

@implementation BubbleSort

/**
 比较相邻的元素。如果第一个比第二个大，就交换他们两个。
 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。在这一点，最后的元素应该会是最大的数。
 针对所有的元素重复以上的步骤，除了最后一个。
 持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
 
 时间复杂度为O(n2)
 */
+ (void)bubbleSortWithArray:(NSMutableArray *)array {
    for (int i = 0; i < array.count; i++) {
        for (int j = 0; j < array.count - i - 1; j++) {
            if (array[j] < array[j+1]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
}

@end
