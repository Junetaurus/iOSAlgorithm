
#import "HeapSort.h"

@implementation HeapSort

//堆排序time:O(nlgn)
+ (void)heapSort:(NSMutableArray *)array {
    NSInteger i , size;
    size = array.count/1.0;
    // 从子树开始整理树
    for (i = array.count/1.0 - 1; i >= 0; i--) {
        [self createBiggestHeap:array withSize:size beIndex:i];
    }
    //拆除树
    while (size > 0) {
        [array exchangeObjectAtIndex:size - 1 withObjectAtIndex:0];//将根（最小）与数组最末交换
        size--;//树大小减小
        [self createBiggestHeap:array withSize:size beIndex:0];//整理树
    }
}

/// 最大堆heap  最大／最小优先级队列
+ (void)createBiggestHeap:(NSMutableArray *)array withSize:(NSInteger)size beIndex:(NSInteger)element {
    NSInteger lchild = element * 2 + 1, rchild = lchild + 1;//左右子树
    while (rchild < size) {//子树均在范围内
        //如果比左右子树都小，完成整理
        if (array[element] <= array[lchild] && array[element] <= array[rchild]) return;
        //如果左边最小
        if(array[lchild] <= array[rchild]){
            [array exchangeObjectAtIndex:element withObjectAtIndex:lchild];//把左面的提到上面
            element = lchild;//循环时整理子树
        }else{
            //否则右面最小
            [array exchangeObjectAtIndex:element withObjectAtIndex:rchild];
            element = rchild;
        }
        lchild = element * 2 + 1;
        rchild = lchild + 1;//重新计算子树位置
    }
    //只有左子树且子树小于自己
    if (lchild < size && array[lchild] < array[element]) {
        [array exchangeObjectAtIndex:lchild withObjectAtIndex:element];
    }
}

@end
