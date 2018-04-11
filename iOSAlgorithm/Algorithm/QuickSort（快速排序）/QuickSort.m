
#import "QuickSort.h"

@implementation QuickSort

/**
 设置两个变量i、j，排序开始的时候：i=0，j=N-1；
 2）以第一个数组元素作为关键数据，赋值给key，即key=A[0]；
 3）从j开始向前搜索，即由后开始向前搜索(j--)，找到第一个小于key的值A[j]，将A[j]和A[i]互换；
 4）从i开始向后搜索，即由前开始向后搜索(i++)，找到第一个大于key的A[i]，将A[i]和A[j]互换；
 5）重复第3、4步，直到i=j； (3,4步中，没找到符合条件的值，即3中A[j]不小于key,4中A[i]不大于key的时候改变j、i的值，使得j=j-1，i=i+1，直至找到为止。找到符合条件的值，进行交换的时候i， j指针位置不变。另外，i==j这一过程一定正好是i+或j-完成的时候，此时令循环结束）。
 
 时间复杂度为O(nlogn)
 */
+ (void)quickSortWithArray:(NSMutableArray *)array withLeft:(NSInteger)left andRight:(NSInteger)right {
    if (left >= right) return; /*如果左边索引大于或者等于右边的索引就代表已经整理完成一个组了*/
    
    NSInteger i = left;
    NSInteger j = right;
    NSInteger key = [array[left] integerValue];
    
    while (i < j) { /*控制在当组内寻找一遍*/
        while (i < j && key <= [array[j] integerValue]) {
            /*而寻找结束的条件就是，1，找到一个小于或者大于key的数（大于或小于取决于你想升
             序还是降序）2，没有符合条件1的，并且i与j的大小没有反转*/
            j--;/*向前寻找*/
        }
        array[i] = array[j]; /*找到一个这样的数后就把它赋给前面的被拿走的i的值*/
        while (i < j && key >= [array[i] integerValue]) {
            /*这是i在当组内向前寻找，同上，不过注意与key的大小关系停止循环和上面相反，
             因为排序思想是把数往两边扔，所以左右两边的数大小与key的关系相反*/
            i++;/*向后寻找*/
        }
        array[j] = array[i];
    }
    array[i] = [NSNumber numberWithInteger:key];
    
    [[self class] quickSortWithArray:array withLeft:left andRight:i - 1];
    [[self class] quickSortWithArray:array withLeft:i + 1 andRight:right];
}

@end
