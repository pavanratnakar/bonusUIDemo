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
    UIView *_pickerView;
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
    [self setupBonusUI];
    [self fillBonusUI];
}

- (void)setupBonusTitle
{
    self.bonusTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 100)];
    self.bonusTitle.textColor = [UIColor whiteColor];
    self.bonusTitle.font = [UIFont fontWithName:@"Arial" size:18];
    self.bonusTitle.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tweed.png"]]; // using placeholder image
    [self.view addSubview:self.bonusTitle];
}

- (void)setupBonusDescription
{
    self.bonusDescrption = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, 300, 200)];
    self.bonusDescrption.numberOfLines = 4;
    self.bonusDescrption.textColor = [UIColor whiteColor];
    self.bonusDescrption.font = [UIFont fontWithName:@"Arial" size:18];
    self.bonusDescrption.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tweed.png"]]; // using placeholder image
    // this will cause automatic vertical resize when the table is resized
    self.bonusDescrption.autoresizingMask = UIViewAutoresizingFlexibleHeight;;
    [self.view addSubview:self.bonusDescrption];
}

- (void)setUpBonusPicker
{
    self.bonusPicker = [[PickerViewController alloc] init];
    
    // TODO : MAKE THIS ARRAY BASED - IMPROVE THIS
    UIView* tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    NSString *iconFilePath = [[NSBundle mainBundle] pathForResource:@"blink" ofType:@"png"];
    UIImage *icon = [[UIImage alloc] initWithContentsOfFile:iconFilePath];
    [imageView setImage:icon];
    
    UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 100, 100)];
    date.text = @"Thurday";
    
    UILabel *number = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 100, 100)];
    number.text = @"1";
    
    [tempView addSubview:imageView];
    [tempView addSubview:date];
    [tempView addSubview:number];
    
    // SAMPLE PASSING MUTIPLE VIEWS
    NSMutableArray *views = [[NSMutableArray alloc] init];
    [views addObject:tempView];
    [views addObject:tempView];
    [views addObject:tempView];

//    // Initialize thumbnails
//    NSArray *column1 = [NSArray arrayWithObjects:@"blink", @"grin", @"love", @"hamburger.jpg", @"ham_and_egg_sandwich.jpg", @"creme_brelee.jpg", @"white_chocolate_donut.jpg", @"starbucks_coffee.jpg", @"vegetable_curry.jpg", @"instant_noodle_with_egg.jpg", @"noodle_with_bbq_pork.jpg", @"japanese_noodle_with_pork.jpg", @"green_tea.jpg", @"thai_shrimp_cake.jpg", @"angry_birds_cake.jpg", @"ham_and_cheese_panini.jpg", nil];
//
//	// Initialize table data
//    NSArray *column2 = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
//    
//    // Initialize Preparation Time
//    NSArray *column3 = [NSArray arrayWithObjects:@"30 min", @"30 min", @"20 min", @"30 min", @"10 min", @"1 hour", @"45 min", @"5 min", @"30 min", @"8 min", @"20 min", @"20 min", @"5 min", @"1.5 hour", @"4 hours", @"10 min", nil];
//    

    [self.bonusPicker setPickerDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:
                                           views, @"views",
                                           nil]];
    _pickerView = [self.bonusPicker tableView];
    _pickerView.frame = CGRectMake(300,300,400,400);
    _pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_pickerView];
    [[self.bonusPicker tableView] reloadData];
}

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
    [self setupBonusSubmitButton];
}

- (void)fillBonusUI
{
    self.bonusTitle.text = @"Daily Bonus";
    self.bonusDescrption.text = @"Complete a game today to get 4 pearls. Play every day to get bigger and bigger bonuses";
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
