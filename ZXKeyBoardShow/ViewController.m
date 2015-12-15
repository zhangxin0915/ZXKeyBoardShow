//
//  ViewController.m
//  ZXKeyBoardShow
//
//  Created by macmini on 15/12/15.
//  Copyright © 2015年 macmini. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource,MyTableViewCellDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *myData;
@property (strong, nonatomic) UITextField *selectTextField;
@property (assign, nonatomic) CGFloat initialTVHeight;

@end

@implementation ViewController
#pragma mark - Keyboard notification
- (void)KeyboardWillShow:(NSNotification *)notification
{
   UITableViewCell *cell = (UITableViewCell *)_selectTextField.superview.superview;
    CGRect rc = [cell convertRect:_selectTextField.frame toView:_myTableView];
    CGFloat y = _myTableView.frame.size.height - 216 - 40;
    if (rc.origin.y + 40 > y ) {
//        _myTableView.contentOffset = CGPointMake(0, 216 + 40);
        _myTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 216 - 40);
    }
}
- (void)KeyboardWillHide:(NSNotification *)notification
{
//    _myTableView.contentOffset = CGPointZero;
    _myTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

}


- (void)viewDidLoad {
    [super viewDidLoad];

    _myTableView.scrollEnabled = YES;
    _myData = [NSMutableArray array];
    for (int i = 0 ; i < 40; i ++) {
        NSString *temp = [NSString stringWithFormat:@"%d",i + 1];
        [_myData addObject:temp];
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _myData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//   static NSString *identifier = @"Cell";
//    MyTableViewCell *cell = (MyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell" owner:self options:nil] objectAtIndex:0];
//        cell.myDelegate = self;
//    }
//    cell.indexPath = indexPath;
//    cell.data = _myData[indexPath.row];
//    return cell;
    
       static NSString *identifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
            UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(80, 5, 200, 30)];
            text.backgroundColor = [UIColor orangeColor];
            text.delegate = self;
            [cell.contentView addSubview:text];
        }
        cell.textLabel.text = _myData[indexPath.row];
        return cell;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    _selectTextField = textField;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    _selectTextField = textField;

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
//#pragma mark - myDelegate
//-(void)MyTableViewCell:(MyTableViewCell *)myTableViewCell myTextField:(UITextField *)myTextField isBeginEditing:(BOOL)isBeginEditing
//{
//    CGRect rectInTableView = [_myTableView rectForRowAtIndexPath:myTableViewCell.indexPath];
//    _myTableView.contentOffset = CGPointMake(0,200);
//    
//    
//}
//
//- (void)MyTableViewCell:(MyTableViewCell *)myTableViewCell myTextField:(UITextField *)myTextField isDidEndEditing:(BOOL)isDidEndEditing
//{
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
