//
//  BonusViewController.m
//  bonusUI
//
//  Created by Pavan Ratnakar on 8/17/13.
//  Copyright (c) 2013 Pavan Ratnakar. All rights reserved.
//

#import "BonusViewController.h"
#import "PickerViewController.h"

@interface BonusViewController ()

@end

@implementation BonusViewController{
    UIScrollView *_scrollView;
    UIView *_pickerView;
    UIView *_contentView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupBonus];
    [self setupBonusUI];
    [self fillBonusUI];
}

- (void)setupBonus
{
    // setup background image
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    self.view.contentMode = UIViewContentModeScaleAspectFit;
    
    // setup content background
    UIImageView *contentBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bonus_bg.png"]];
    NSInteger imageHeight = contentBackground.bounds.size.height;
    NSInteger imageWidth = contentBackground.bounds.size.width;
    NSLog(@"%f",self.view.bounds.size.height/2 - imageHeight/2);
    NSLog(@"%f",self.view.bounds.size.width);
    NSLog(@"%d",imageWidth);
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.height/2 - imageHeight/2, self.view.bounds.size.width/2 - imageWidth/2, imageWidth ,imageHeight)];
    [_contentView addSubview:contentBackground];
    [_contentView sendSubviewToBack:contentBackground];
    [self.view addSubview:_contentView];
}

- (void)setupBonusTitle
{
    self.bonusTitle = [[UILabel alloc] initWithFrame:CGRectMake(500, 0, 200, 200)];
    self.bonusTitle.textColor = [UIColor blackColor];
    self.bonusTitle.font = [UIFont fontWithName:@"Arial" size:30];
    self.bonusTitle.backgroundColor = [UIColor clearColor];
    [_contentView addSubview:self.bonusTitle];
}

- (void)setupBonusDescription
{
    // Assign Text
    self.bonusDescrption = [[UILabel alloc] initWithFrame:CGRectMake(500, 160, 200, 200)];
    self.bonusDescrption.numberOfLines = 5;
    self.bonusDescrption.textColor = [UIColor blackColor];
    self.bonusDescrption.font = [UIFont fontWithName:@"Arial" size:15];
    self.bonusDescrption.backgroundColor = [UIColor clearColor];
    [_contentView addSubview:self.bonusDescrption];
}

// TODO : add this to content view
- (void)setUpBonusPicker
{
    self.bonusPicker = [[PickerViewController alloc] init];

    int i,
        imageHeight,
        imageWidth;

    NSMutableArray *views = [[NSMutableArray alloc] init];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDate *startOfTheWeek;
    NSTimeInterval interval;
    [cal rangeOfUnit:NSWeekCalendarUnit
           startDate:&startOfTheWeek
            interval:&interval
             forDate:now];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    for (i = 1; i <= 7; i++) {
        UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"days_bg.jpg"]];
        imageHeight = background.bounds.size.height;
        imageWidth = background.bounds.size.width;
        UIView* tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, imageHeight)];
        [tempView addSubview:background];

        // Add smiley icon
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Days_Indicator_Done.png"]];
        iconView.frame = CGRectMake(10, 10, iconView.bounds.size.width, iconView.bounds.size.height);

        // Add day name
        UILabel *dayName = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, imageWidth/3, imageHeight/3)];
        dayName.backgroundColor = [UIColor clearColor];
        dayName.font = [UIFont boldSystemFontOfSize:20];
        dayName.textColor = [UIColor blackColor];
        [dateFormatter setDateFormat:@"EEEE"];
        dayName.text = [dateFormatter stringFromDate:[startOfTheWeek dateByAddingTimeInterval:(i *24 * 60 * 60)]];

        // Add date
        UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, imageWidth/3, imageHeight/3)];
        [dateFormatter setDateFormat:@"MMMM d"];
        date.backgroundColor = [UIColor clearColor];
        date.font = [UIFont systemFontOfSize:10];
        date.textColor = [UIColor blackColor];
        date.text = [dateFormatter stringFromDate:[startOfTheWeek dateByAddingTimeInterval:(i *24 * 60 * 60)]];

        // Add number
        UILabel *number = [[UILabel alloc] initWithFrame:CGRectMake(250, 20, imageWidth/3 + 40, imageHeight/3)];
        number.font = [UIFont boldSystemFontOfSize:25];
        number.textColor = [UIColor blackColor];
        number.backgroundColor = [UIColor clearColor];
        number.text =  [NSString stringWithFormat:@"%d", i];
        
        [tempView addSubview:iconView];
        [tempView addSubview:dayName];
        [tempView addSubview:date];
        [tempView addSubview:number];
        [views addObject:tempView];
    }
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"glass_cover_bg.png"]];
    imageHeight = background.bounds.size.height;
    imageWidth = background.bounds.size.width - 340;
    UIView* pickerContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageWidth,imageHeight)];
    
    [self.bonusPicker setPickerDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:views, @"views",nil]];
    _pickerView = [self.bonusPicker tableView];
    _pickerView.frame = CGRectMake(44,44,imageWidth-44,imageHeight-120);
    _pickerView.backgroundColor = [UIColor clearColor];
    //_pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [pickerContainer addSubview:_pickerView];
    [pickerContainer addSubview:background];
    [_contentView addSubview:pickerContainer];
    [[self.bonusPicker tableView] reloadData];
}

// TODO : add this to content view
- (void)setupBonusSubmitButton
{
    self.bonusSubmitButton = [BonusViewController newButtonWithTitle:
                                                        @"OK"
                                                        target:self
                                                        selector:@selector(action:)
                                                        frame:CGRectMake(20, 600, 40, 40)
                                                        image:[UIImage imageNamed:@"greenButton.png"]
                                                        imagePressed:[UIImage imageNamed:@"greenButtonHighlight.png"]
                                                        darkTextColor:NO];
    [self.view addSubview:self.bonusSubmitButton];
}

// Only would create the placeholders with positioning
- (void)setupBonusUI
{
    [self setupBonusTitle];
    [self setupBonusDescription];
    [self setUpBonusPicker];
//    [self setupBonusSubmitButton];
}

- (void)fillBonusUI
{
    self.bonusTitle.text = @"Daily Bonus";
    self.bonusDescrption.text = @"Complete a game today to get 4 pearls.\nPlay every day to get bigger and bigger bonuses";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO : Create a lib header file with generic app buttons
+ (UIButton *)newButtonWithTitle:(NSString *)title
                          target:(id)target
                        selector:(SEL)selector
                           frame:(CGRect)frame
                           image:(UIImage *)image
                    imagePressed:(UIImage *)imagePressed
                   darkTextColor:(BOOL)darkTextColor
{
	UIButton *button = [[UIButton alloc] initWithFrame:frame];
	// or you can do this:
	//		UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    
	button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
	[button setTitle:title forState:UIControlStateNormal];
	if (darkTextColor) {
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	} else {
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	}
    
	UIImage *newImage = [image stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[button setBackgroundImage:newImage forState:UIControlStateNormal];
    
	UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[button setBackgroundImage:newPressedImage forState:UIControlStateHighlighted];
    
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    // in case the parent view draws with a custom color or gradient, use a transparent color
	button.backgroundColor = [UIColor clearColor];
    
	return button;
}

// DO WE NEED DEALLOC?

@end
