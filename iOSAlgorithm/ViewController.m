//
//  ViewController.m
//  iOSAlgorithm
//
//  Created by Zhang on 2018/4/11.
//  Copyright © 2018年 ZCG. All rights reserved.
//

#import "ViewController.h"

#import "BubbleSort.h"
#import "SelectionSort.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array1 = [@[@6, @2, @4, @1, @5, @9] mutableCopy];
    [SelectionSort selectionSortWithArray:array1];
    NSLog(@"%@",array1);
    
    NSMutableArray *array2 = [@[@6, @2, @4, @1, @5, @9] mutableCopy];
    [BubbleSort bubbleSortWithArray:array2];
    NSLog(@"%@",array2);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
