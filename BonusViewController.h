//
//  BonusViewController.h
//  bonusUI
//
//  Created by Pavan Ratnakar on 8/17/13.
//  Copyright (c) 2013 Pavan Ratnakar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"

@interface BonusViewController : UIViewController

@property (nonatomic, strong) UILabel *bonusTitle;
@property (nonatomic, strong) UILabel *bonusDescrption;
@property (nonatomic, strong) UIButton *bonusSubmitButton;
@property (nonatomic, strong) PickerViewController *bonusPicker;

@end
