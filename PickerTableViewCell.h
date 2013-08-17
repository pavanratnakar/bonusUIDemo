//
//  PickerTableViewCell.h
//  bonusUI
//
//  Created by Pavan Ratnakar on 8/17/13.
//  Copyright (c) 2013 Pavan Ratnakar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *column1;
@property (nonatomic, weak) IBOutlet UILabel *column2;
@property (nonatomic, weak) IBOutlet UILabel *column3;

@end