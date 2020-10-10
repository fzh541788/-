//
//  ViewController.m
//  Counter
//
//  Created by young_jerry on 2020/10/4.
//

#import "ViewController.h"
#import "View.h"
#import "Model.h"

@interface ViewController ()<ViewDelegate>
@property (nonatomic,strong)View *firstView;
@property (nonatomic,strong)Model *model;
@property (nonatomic,strong)NSMutableString *formula;
@property (nonatomic,strong)NSMutableString *test;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _firstView = [[View alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_firstView];
    _formula = [[NSMutableString alloc]init];
    _model = [[Model alloc]init];
    _test = [[NSMutableString alloc]init];
    _firstView.delegate = self;
}
-(void)click:(UIButton *)button {
    if (button.tag <= 9 && button.tag >= 0) {
        [_test appendString:[NSString stringWithFormat:@"%ld",button.tag]];
        [_formula appendString:[NSString stringWithFormat:@"%ld",button.tag]];
    }
    else if (button.tag == 12) {
        if (_test.length == 0) {
            _firstView.textView.text = @"格式有误";
            return ;
        } else {
        NSString *lastStr = [_test substringFromIndex:_test.length - 1];
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"("]]) {
                _firstView.textView.text = @"格式有误";
                return ;
            }
        }
        [_test appendString:[NSString stringWithFormat:@"+"]];
        [_formula appendString:[NSString stringWithFormat:@"+"]];
    }
    else if (button.tag == 13) {
        if (_test.length != 0) {
        NSString *lastStr = [_test substringFromIndex:_test.length - 1];
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"("]]) {
                _firstView.textView.text = @"格式有误";
                return ;
        }
        }
        [_test appendString:[NSString stringWithFormat:@"-"]];
        [_formula appendString:[NSString stringWithFormat:@"-"]];
    }
    else if (button.tag == 14) {
        if (_test.length == 0) {
            _firstView.textView.text = @"格式有误";
            return ;
        } else {
        NSString *lastStr = [_test substringFromIndex:_test.length - 1];
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"("]]) {
                _firstView.textView.text = @"格式有误";
                return ;
            }
        }
        [_test appendString:[NSString stringWithFormat:@"x"]];
        [_formula appendString:[NSString stringWithFormat:@"x"]];
}
    else if (button.tag == 15) {
        if (_test.length == 0) {
            _firstView.textView.text = @"格式有误";
            return ;
        } else {
        NSString *lastStr = [_test substringFromIndex:_test.length - 1];
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"("]]) {
                _firstView.textView.text = @"格式有误";
                return ;
            }
        }
        [_test appendString:[NSString stringWithFormat:@"/"]];
        [_formula appendString:[NSString stringWithFormat:@"/"]];
    }
    else if (button.tag == 16) {
        if (_test.length >= 1) {
        NSString *lastStr = [_test substringFromIndex:_test.length - 1];
        for (int i = 0; i <= 10; i++) {
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"%c",i + '0' ] ]) {
                _firstView.textView.text = @"格式有误";
                return ;
            }
        }
        }
        [_test appendString:[NSString stringWithFormat:@"("]];
        [_formula appendString:[NSString stringWithFormat:@"("]];
    }
    else if (button.tag == 17) {
        [_test appendString:[NSString stringWithFormat:@")"]];
        [_formula appendString:[NSString stringWithFormat:@")"]];
    }
    else if (button.tag == 10) {
        if (_test.length <= 1 ) {
            [_test insertString:@"0" atIndex:0];
        }
        else if (_test.length > 1 && (([[_formula substringFromIndex:_formula.length - 1]  isEqual: @"+"]) || ([[_formula substringFromIndex:_formula.length - 1]  isEqual: @"-"]) || ([[_formula substringFromIndex:_formula.length - 1]  isEqual: @"x"]) || ([[_formula substringFromIndex:_formula.length - 1]  isEqual: @"/"]))) {
            [_test appendFormat:@"0"];
        }
        [_test appendString:[NSString stringWithFormat:@"."]];
        [_formula appendString:[NSString stringWithFormat:@"."]];
    }
    else if (button.tag == 18) {
        [_test setString:@""];
        [_formula setString:@""];
    }
    else if (button.tag == 11) {
        char a[7] = {'+','-','x','/','(',')','#'};
        int testFlag = 0;
        for (int i = 0; i < _test.length; i++) {
            int secondTestFlag = 0, thirdTestFlag = 0;
            if ([_test characterAtIndex:i] == '(') {
                testFlag++;
            }
            if ([_test characterAtIndex:i] == ')') {
                testFlag--;
            }
            for (int j = 0; j < 4; j++) {
                if (i != _test.length - 1 ) {
                    if ([_test characterAtIndex:i] == a[j] && [_test characterAtIndex:0] != a[1]) {
                        secondTestFlag = 1;
                    }
                    if ([_test characterAtIndex:i + 1] == a[j]) {
                        thirdTestFlag = 1;
                    }
                }
            }
            if (secondTestFlag == 1 && thirdTestFlag == 1) {
                _firstView.textView.text = @"格式有误11";
                return ;
            }
        }
        if (testFlag != 0) {
            _firstView.textView.text = @"格式有误";
            return ;
        }
        [_test appendString:@"#"];
        _model.test = _test;
        _model.numArray = [[NSMutableArray alloc]init];
        _model.symbolArray = [[NSMutableArray alloc]init];
        [_model count:a];
        [_formula setString:[NSString stringWithFormat:@"%@", [self removeFloatAllZeroByString:_model.numArray[0]]]];
    }
    _firstView.textView.text = _formula;
}
//去除多余0的操作
- (NSString*)removeFloatAllZeroByString:(NSString *)testNumber {
    
    NSString * outNumber = [NSString stringWithFormat:@"%@",@(testNumber.floatValue)];
    return outNumber;
}

@end
