
#import "MergeSort.h"

@implementation MergeSort

+ (NSMutableArray *)mergeSort:(NSMutableArray *)array withCapacity:(NSInteger)n {
    NSMutableArray *p = [NSMutableArray arrayWithCapacity:n];
    [self mergeSort:array withFirst:0 withLast:n-1 ResultAry:p];
    return p;
}

+ (void)mergeSort:(NSMutableArray *)array withFirst:(NSInteger)first withLast:(NSInteger)last ResultAry:(NSMutableArray *)temp{
    if (first < last) {
        NSInteger mid = (first + last) / 2;
        // 左边有序
        [self mergeSort:array withFirst:first withLast:mid ResultAry:temp];
        // 右边有序
        [self mergeSort:array withFirst:mid + 1 withLast:last ResultAry:temp];
        // 将二个有序数列合并
        [self mergearray:array withFirst:first withMid:mid withLast:last ResultAry:temp];
    }
}

+ (void)mergearray:(NSMutableArray *)array withFirst:(NSInteger)first withMid:(NSInteger)mid withLast:(NSInteger)last ResultAry:(NSMutableArray *)temp{
    NSInteger i = first, j = mid + 1;
    NSInteger m = mid ,n = last;
    NSInteger k = 0;
    
    while (i <= m && j <= n) {
        if (array[i] <= array[j])  temp[k++] = array[i++];
        else temp[k++] = array[j++];
    }
    
    while (i <= m) temp[k++] = array[i++];
    
    while (j <= n) temp[k++] = array[j++];
    
    for (i = 0; i < k; i++) array[first + i] = temp[i];
}

@end
