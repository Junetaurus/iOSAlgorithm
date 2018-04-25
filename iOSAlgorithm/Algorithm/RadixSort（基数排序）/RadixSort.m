
#import "RadixSort.h"

@implementation RadixSort

+ (void)radixAscendingOrderSort:(NSMutableArray *)array {
    //创建空桶
    NSMutableArray *buckt = [self createBucket];
    //待排数组的最大数值
    NSNumber *maxnumber = [self listMaxItem:array];
    //最大数值的数字位数
    NSInteger maxLength = [self numberLength:maxnumber];
    // 按照从低位到高位的顺序执行排序过程
    for (int digit = 1; digit <= maxLength; digit++) {
        // 入桶
        for (NSNumber *item in array) {
            //确定item 归属哪个桶 以digit位数为基数
            NSInteger baseNumber = [self fetchBaseNumber:item digit:digit];
            NSMutableArray *mutArray = buckt[baseNumber];
            //将数据放入空桶上
            [mutArray addObject:item];
        }
        NSInteger index = 0;
        //出桶
        for (int i = 0; i < buckt.count; i++) {
            NSMutableArray *array = buckt[i];
            //将桶的数据放回待排数组中
            while (array.count != 0) {
                
                NSNumber *number = [array objectAtIndex:0];
                array[index] = number;
                [array removeObjectAtIndex:0];
                index++;
            }
        }
    }
}

//创建空桶
+ (NSMutableArray *)createBucket {
    NSMutableArray *bucket = [NSMutableArray array];
    for (int index = 0; index < 10; index++) {
        NSMutableArray *array = [NSMutableArray array];
        [bucket addObject:array];
    }
    return bucket;
}

//数据最大值
+ (NSNumber *)listMaxItem:(NSArray *)list {
    NSNumber *maxNumber = list[0];
    for (NSNumber *number in list) {
        if ([maxNumber integerValue] < [number integerValue]) {
            maxNumber = number;
        }
    }
    return maxNumber;
}

//数字的位数
+ (NSInteger)numberLength:(NSNumber *)number {
    NSString *string = [NSString stringWithFormat:@"%ld", (long)[number integerValue]];
    return string.length;
}

+ (NSInteger)fetchBaseNumber:(NSNumber *)number digit:(NSInteger)digit {
    //digit为基数位数
    if (digit > 0 && digit <= [self numberLength:number]) {
        NSMutableArray *numbersArray = [NSMutableArray array];
        //        number的位数确定
        NSString *string = [NSString stringWithFormat:@"%ld", [number integerValue]];
        for (int index = 0; index < [self numberLength:number]; index++) {
            [numbersArray addObject:[string substringWithRange:NSMakeRange(index, 1)]];
        }
        //        number的位数 是几位数的
        NSString *str = numbersArray[numbersArray.count - digit];
        return [str integerValue];
    }
    return 0;
}

@end
