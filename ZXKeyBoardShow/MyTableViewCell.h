//
//  MyTableViewCell.h
//  ZXKeyBoardShow
//
//  Created by macmini on 15/12/15.
//  Copyright © 2015年 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyTableViewCell;
@protocol MyTableViewCellDelegate <NSObject>

- (void)MyTableViewCell:(MyTableViewCell *)myTableViewCell myTextField:(UITextField *)myTextField  isBeginEditing:(BOOL)isBeginEditing;

- (void)MyTableViewCell:(MyTableViewCell *)myTableViewCell myTextField:(UITextField *)myTextField  isDidEndEditing:(BOOL)isDidEndEditing;


@end

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) id data;

@property (weak, nonatomic) id <MyTableViewCellDelegate> myDelegate;

@property (strong, nonatomic) NSIndexPath *indexPath;
@end
