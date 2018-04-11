
#import "SelectionSort.h"

@implementation SelectionSort

/**
 对比数组中前一个元素跟后一个元素的大小，如果后面的元素比前面的元素小则用一个变量k来记住他的位置，接着第二次比较，前面“后一个元素”现变成了“前一个元素”，继续跟他的“后一个元素”进行比较如果后面的元素比他要小则用变量k记住它在数组中的位置(下标)，等到循环结束的时候，我们应该找到了最小的那个数的下标了，然后进行判断，如果这个元素的下标不是第一个元素的下标，就让第一个元素跟他交换一下值，这样就找到整个数组中最小的数了。然后找到数组中第二小的数，让他跟数组中第二个元素交换一下值，以此类推。

 */
+ (void)selectionSortWithArray:(NSMutableArray *)array {
    for (NSInteger i = 0; i < array.count; i ++) {
        for (NSInteger j = i + 1; j < array.count; j ++) {
            if (array[i] < array[j]) {
                [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
}

@end
