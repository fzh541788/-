//
//  Model.m
//  Counter
//
//  Created by young_jerry on 2020/10/4.
//

#import "Model.h"

@implementation Model

-(void)numPushInn:(double)num {
    if (_numArray.count == 50) {
        return;
    }
    [_numArray insertObject:[NSString stringWithFormat:@"%f",num] atIndex:_numArray.count ];
    return;
}
-(void)sympolPushInn:(char)ch {
    if (_symbolArray.count == 50) {
        return;
    }
    [_symbolArray insertObject:[NSString stringWithFormat:@"%c",ch] atIndex:_symbolArray.count];
    return;
}
-(void)numOutInn:(NSMutableArray *)s {
    [_numArray removeObjectAtIndex:([_numArray count] - 1)];
}
-(void)sympolOutInn:(NSMutableArray *)s {
    [_symbolArray removeObjectAtIndex:([_symbolArray count] - 1)];
}
-(int)judge:(char)ch and:(char *)a {
    for (int i = 0; i < 7; i++) {
        if (ch == a[i]) {
            return 1;
        }
    }
    return 0;
}
-(char)compare:(char)ch1 {
    int first[7][7] = {
                { 2, 2, 1, 1, 1, 2, 2 },
                { 2, 2, 1, 1, 1, 2, 2 },
                { 2, 2, 2, 2, 1, 2, 2 },
                { 2, 2, 2, 2, 1, 2, 2 },
                { 1, 1, 1, 1, 1, 3, 0 },
                { 2, 2, 2, 2, 0, 2, 2 },
                { 1, 1, 1, 1, 1, 0, 3 }
    };
    NSMutableArray *a = [[NSMutableArray alloc] initWithObjects:@"+", @"-", @"x", @"/", @"(", @")",@"#", nil];
    char b[7] = {'+','-','x','/','(',')','#'};
    int m = 0, n = 0, i, targer;
    char ch = '\0';
    for (i = 0; i < 7; i++) {
        if (ch1 == b[i]) {
            m = i;
        }
        if ([_symbolArray[_symbolArray.count - 1] isEqual: a[i]]) {
            n = i;
        }
    }
    targer = first[n][m];
    NSLog(@"%d",targer);
    switch (targer) {
        case 1:
            return (char)('>');
        case 2:
            return (char)('<');
        case 3:
            return (char)('=');
        default:
            printf("表达式错误!\n");
            break;
    }
    return ch;
}

- (double)change:(NSMutableString *)s {
    int firstFlag = 0, secondFlag = 0;
    double sum = 0, num = 0;
    if ([s characterAtIndex:0] == '-') {
        firstFlag = 1;
    } else {//因为要考虑负号的情况 所以必须从第二个开始考虑 并且不能直接把值赋给sum 因为可能有两位数的情况如果直接赋值那么sum一加就出现两位数相加的情况
        num = [s characterAtIndex:0] - '0';
    }
    if (s.length > 1) {
        for (int i = 1; i < s.length; i++) {
            if ([s characterAtIndex:i] == '.') {
                sum += num;
                secondFlag = 1;
                //如果不这样写 不保存下一位的数字 通过下面的flag++的else的情况来进行保存 如果flag先自加后赋值 那么小数点后一位就没有了 如果先赋值后自加 循环第二次的flag会还是上一次的 当然也可以再加判断 如果第一次怎样第二次怎样 讨论的情况更多了 更麻烦了
                i++;
                num = 0.1 * ((double)[s characterAtIndex:i] - '0');
                continue;
            } else {
                if (secondFlag == 0) {
                    num = num * 10 + (double)[s characterAtIndex:i] - '0';
                } else {
                    secondFlag++;
                    num = num + ((double)[s characterAtIndex:i] - '0') * pow(10, -secondFlag);
                }
            }
        }
        sum += num;
    } else {
    //这个else感觉用不到 因为传进来的是char型的 长度一定大于1
        sum = [s characterAtIndex:0] - '0';
    }
    if (firstFlag) {
        sum *= -1;
    } else {
        sum = sum;
    }
    return sum;
}

-(double)calculate {
    double testResult = 0;
    double num1,num2;
    char ch = '\0';
    num1 = [self change:_numArray[_numArray.count - 2]];
    num2 = [self change:_numArray[_numArray.count - 1]];
    
    if ([_symbolArray[_symbolArray.count - 1] isEqual:@"+"]) {
        ch = '+';
    }
    
    if ([_symbolArray[_symbolArray.count - 1] isEqual:@"-"]) {
        ch = '-';
    }

    if ([_symbolArray[_symbolArray.count - 1] isEqual:@"x"]) {
        ch = '*';
    }

    if ([_symbolArray[_symbolArray.count - 1] isEqual:@"/"]) {
        ch = '/';
    }
    
    switch (ch) {
        case '+':
            testResult = num1 + num2;
            break;
        case '-':
            testResult = num1 - num2;
            break;
        case '*':
            testResult = num1 * num2;
            break;
        case '/':
            testResult = num1 / num2;
            break;
    }
    return testResult;
}
-(int)count:(char *)a {
    char ch;
    double data, result, i = 0, flag = 0, flag1 = 0,temp = 0;
    int index = 1;
    [self sympolPushInn:'#'];
    ch = [_test characterAtIndex:i];
    while (ch != '#' || ![_symbolArray[_symbolArray.count - 1]  isEqual: @"#"]) {
        if (![self judge:ch and:a] || (i == 0 && ch == '-')) {//如果读入数字
            index = 1;
            if ((i == 0 && ch == '-')) {
                flag = 1;
                i++;
                ch = [_test characterAtIndex:i];
                continue;
            }
            data = ch - '0';
            i++;
            ch = [_test characterAtIndex:i];
            while (![self judge:ch and:a]) {
                if (ch == '.') {
                    flag1 = 1;
                    i++;
                    ch = [_test characterAtIndex:i];
                    continue;
                }
                if (flag1 == 1) {
                   temp = (ch - '0') * pow(10, -index);
                    index++;
                    data += temp;
                } else {
                data = data * 10 + ch - '0';
              }
                i++;
                ch = [_test characterAtIndex:i];
            }
            if (flag == 1) {
                data *= -1;
                flag = 0;
            }
            flag1 = 0;
            [self numPushInn:data];
        } else {
            switch ([self compare:ch]) {
                case '>':
                    [self sympolPushInn:ch];
                    i++;
                    ch = [_test characterAtIndex:i];
                    break;
                case '=':
                    [self sympolOutInn:_symbolArray];
                    i++;
                    ch = [_test characterAtIndex:i];
                    break;
                case '<':
                    result = [self calculate];
                    [self sympolOutInn:_symbolArray];
                    [self numOutInn:_numArray];
                    [self numOutInn:_numArray];
                    [self numPushInn:result];
                    break;
            }
        }
    }
    NSLog(@"%@",_numArray);
    return 0;
}
@end
