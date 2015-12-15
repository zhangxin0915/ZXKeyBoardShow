//
//  MyTableViewCell.m
//  ZXKeyBoardShow
//
//  Created by macmini on 15/12/15.
//  Copyright © 2015年 macmini. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell () <UITextFieldDelegate>

@end

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _textField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setData:(id)data
{
    NSString *temp = (NSString *)data;
    _nameLab.text = temp;
    
}

#pragma mark -UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    MyTableViewCell *cell =  (MyTableViewCell *)[[textField superview]superview];
    UITableView *tableView = (UITableView *)[[cell superview] superview];
    CGRect rect = [tableView rectForRowAtIndexPath:self.indexPath];
    if (rect.origin.y / 2 + rect.size.height>=[UIScreen mainScreen].bounds.size.height-216) {
        
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 216, 0);
        
        [tableView scrollToRowAtIndexPath:[tableView indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
    
    
//    if ([self respondsToSelector:@selector(MyTableViewCell:myTextField:isBeginEditing:)]) {
//        [self.myDelegate MyTableViewCell:self myTextField:textField isBeginEditing:YES];
//    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    MyTableViewCell *cell =  (MyTableViewCell *)[[textField superview]superview];
    UITableView *tableView = (UITableView *)[cell superview];
    tableView.contentOffset = CGPointZero;
//    [tableView scrollToRowAtIndexPath:[tableView indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionBottom animated:YES];

//    if ([self respondsToSelector:@selector(MyTableViewCell:myTextField:isDidEndEditing:)]) {
//        [self.myDelegate MyTableViewCell:self myTextField:textField isDidEndEditing:YES];
//    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_textField resignFirstResponder];
    return YES;
}


@end
