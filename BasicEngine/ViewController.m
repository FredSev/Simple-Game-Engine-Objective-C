//  ViewController.m
//  BasicEngine
//
//  Created by admin on 5/4/16.
//  Copyright © 2016 admin. All rights reserved.


#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton* centerPlace;
@property (strong, nonatomic) UIButton* genStuff;

@property (strong, nonatomic) NSMutableArray* tapArr;
@property (strong, nonatomic) UIButton* tapOne;

@property (strong, nonatomic) UIButton* tapTwo;
@property (strong, nonatomic) UIButton* toonOne;
@property (strong, nonatomic) NSMutableArray* tOne;

@property (strong, nonatomic) UIButton* toonTwo;
@property (strong, nonatomic) NSMutableArray* tTwo;

@property (strong, nonatomic) UIButton* toonThree;
@property (strong, nonatomic) NSMutableArray* tThree;

@property (strong, nonatomic) UIButton* metroOne;
@property (strong, nonatomic) UIButton* metroTwo;

@property (strong, nonatomic) UIButton* enemieOne;
@property (strong, nonatomic) UIButton* enemieTwo;
@property (strong, nonatomic) UIButton* enemieThree;
@property (strong, nonatomic) UIButton* enemieFour;
@property (strong, nonatomic) UIButton* lastButton;

@property (strong, nonatomic) NSMutableArray* sequence;

@property bool metroSwitch;
@property bool toonActive;
@property bool animationDone;
@property int toonSelected;
@property int actionSelected;
@property int enemieSelected;

@property int actionSelectedCounter;
@property int enemieSelectedCounter;
@property int sequenceCounter;

@property UIColor* tapOnColor;
@property UIColor* tapOffColor;
@property UIColor* centerOnColor;
@property UIColor* centerOffColor;
@property UIColor* toonOnColor;
@property UIColor* toonOffColor;
@property UIColor* toonButtonColor;


@property CGPoint originalPos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sequence = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:5],[NSNumber numberWithInt:1],[NSNumber numberWithInt:3],[NSNumber numberWithInt:0],[NSNumber numberWithInt:4], nil];
    self.formation = 2;
    self.beatSpeed = 0.622;
    self.metroSpeed = self.beatSpeed;
    
    self.toonSelected = 0;
    self.actionSelected = 0;
    self.enemieSelected = 0;
    
    self.actionSelectedCounter = 0;
    self.enemieSelectedCounter = 0;
    
    self.metroSwitch = true;
    self.toonActive = false;
    self.animationDone = false;
    
    self.tapOffColor = [UIColor colorWithRed:0.85 green:0.34 blue:0.34 alpha:0.94];
    self.tapOnColor = [UIColor colorWithRed:0.28 green:0.624 blue:0.45 alpha:0.94];
    
    self.centerOffColor = [UIColor colorWithRed:0.421 green:0.476 blue:0.535 alpha:0.94];
    self.centerOnColor = [UIColor colorWithRed:0.625 green:0.428 blue:0.293 alpha:0.94];

    self.toonOnColor = [UIColor colorWithRed:0.421 green:0.476 blue:0.535 alpha:0.94];
    self.toonOffColor = [UIColor colorWithRed:0.25 green:0.47 blue:0.85 alpha:1.0];
    
    self.toonButtonColor = [UIColor colorWithRed:0.421 green:0.476 blue:0.535 alpha:1.0];
    
    ///
    // Background
    ///
    self.genStuff = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 500,(self.view.frame.size.height/2) - 500, 1000, 1000)];
    self.genStuff.layer.cornerRadius = 500;
    self.genStuff.backgroundColor = [UIColor colorWithRed:0.97 green:0.746 blue:0.23 alpha:0.40];
    [self.view addSubview:self.genStuff];

    ///
    // Center Circle
    ///
    self.centerPlace = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 160,(self.view.frame.size.height/2) - 160, 320,320)];
    self.centerPlace.layer.cornerRadius = 160;
    self.centerPlace.backgroundColor = self.centerOffColor;
    [self.view addSubview:self.centerPlace];
    
    ///
    // Metronome
    ///
    self.genStuff = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 30, 0, 60,25)];
    self.genStuff.layer.cornerRadius = 5;
    self.genStuff.backgroundColor = [UIColor colorWithRed:0.80 green:0.2 blue:0.2 alpha:0.60];
    [self.view addSubview:self.genStuff];
    
    self.metroOne = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 23,4, 16,16)];
    self.metroOne.layer.cornerRadius = 8;
    self.metroOne.backgroundColor = [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:0.60];
    [self.view addSubview:self.metroOne];
    
    self.metroTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) + 7,4, 16,16)];
    self.metroTwo.layer.cornerRadius = 8;
    self.metroTwo.backgroundColor = [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:0.60];
    [self.view addSubview:self.metroTwo];
    self.metroTwo.alpha = 0.0;
    
    ///
    // 6 Buttons
    ///
    self.tapArr = [NSMutableArray new];
    self.tapOne = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) +30,(self.view.frame.size.height/2) - 135, 60, 60)];
    self.tapOne.layer.cornerRadius = 30;
    self.tapOne.backgroundColor = self.tapOffColor;
    [self.view addSubview:self.tapOne];
    [self.tapOne addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.tapOne.tag = 101;
    [self.tapArr addObject:self.tapOne];
    
    self.tapOne = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) +90,(self.view.frame.size.height/2) - 30, 60, 60)];
    self.tapOne.layer.cornerRadius = 30;
    self.tapOne.backgroundColor = self.tapOffColor;
    [self.view addSubview:self.tapOne];
    [self.tapOne addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.tapOne.tag = 102;
    [self.tapArr addObject:self.tapOne];
    
    self.tapOne = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) + 30,(self.view.frame.size.height/2) + 75, 60, 60)];
    self.tapOne.layer.cornerRadius = 30;
    self.tapOne.backgroundColor = self.tapOffColor;
    [self.view addSubview:self.tapOne];
    [self.tapOne addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.tapOne.tag = 103;
    [self.tapArr addObject:self.tapOne];
    
    self.tapOne = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 90,(self.view.frame.size.height/2) + 75, 60, 60)];
    self.tapOne.layer.cornerRadius = 30;
    self.tapOne.backgroundColor = self.tapOffColor;
    [self.view addSubview:self.tapOne];
    [self.tapOne addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.tapOne.tag = 104;
    [self.tapArr addObject:self.tapOne];
    
    self.tapOne = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 150,(self.view.frame.size.height/2) - 30, 60, 60)];
    self.tapOne.layer.cornerRadius = 30;
    self.tapOne.backgroundColor = self.tapOffColor;
    [self.view addSubview:self.tapOne];
    [self.tapOne addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.tapOne.tag = 105;
    [self.tapArr addObject:self.tapOne];
    
    self.tapOne = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 90,(self.view.frame.size.height/2) - 135, 60, 60)];
    self.tapOne.layer.cornerRadius = 30;
    self.tapOne.backgroundColor = self.tapOffColor;
    [self.view addSubview:self.tapOne];
    [self.tapOne addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.tapOne.tag = 106;
    [self.tapArr addObject:self.tapOne];
    
    ///
    // Toon One
    ///
    self.tOne = [NSMutableArray new];
    self.toonOne = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -260,(self.view.frame.size.height/2) -160, 80, 90)];
    self.toonOne.layer.cornerRadius = 14;
    self.toonOne.backgroundColor = [UIColor colorWithRed:0.25 green:0.47 blue:0.85 alpha:1.0];
    self.toonOne.tag = 1;
    [self.toonOne addTarget:self action:@selector(toonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.toonOne];
    
//    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -275,(self.view.frame.size.height/2) -175, 36, 36)];
//    self.tapTwo.layer.cornerRadius = 18;
//    self.tapTwo.backgroundColor = self.toonButtonColor;
//    self.tapTwo.tag = 1001;
//    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.tapTwo];
//    [self.tOne addObject:self.tapTwo];
    
    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -275,(self.view.frame.size.height/2) -135, 36, 36)];
    self.tapTwo.layer.cornerRadius = 18;
    self.tapTwo.backgroundColor = self.toonButtonColor;
    self.tapTwo.tag = 1002;
    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapTwo];
    [self.tOne addObject:self.tapTwo];
    
//    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -275,(self.view.frame.size.height/2) -95, 36, 36)];
//    self.tapTwo.layer.cornerRadius = 18;
//    self.tapTwo.backgroundColor = self.toonButtonColor;
//    self.tapTwo.tag = 1003;
//    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.tapTwo];
//    [self.tOne addObject:self.tapTwo];
    
    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -200,(self.view.frame.size.height/2) -175, 36, 36)];
    self.tapTwo.layer.cornerRadius = 18;
    self.tapTwo.backgroundColor = self.toonButtonColor;
    self.tapTwo.tag = 1004;
    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapTwo];
    [self.tOne addObject:self.tapTwo];
    
//    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -200,(self.view.frame.size.height/2) -135, 36, 36)];
//    self.tapTwo.layer.cornerRadius = 18;
//    self.tapTwo.backgroundColor = self.toonButtonColor;
//    self.tapTwo.tag = 1005;
//    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.tapTwo];
//    [self.tOne addObject:self.tapTwo];
//    
    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -200,(self.view.frame.size.height/2) -95, 36, 36)];
    self.tapTwo.layer.cornerRadius = 18;
    self.tapTwo.backgroundColor = self.toonButtonColor;
    self.tapTwo.tag = 1006;
    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapTwo];
    [self.tOne addObject:self.tapTwo];
    
    ///
    // Toon Two
    ///
    self.tTwo = [NSMutableArray new];
    self.toonTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -300,(self.view.frame.size.height/2) -45, 80, 90)];
    self.toonTwo.layer.cornerRadius = 14;
    self.toonTwo.backgroundColor = [UIColor colorWithRed:0.25 green:0.47 blue:0.85 alpha:1.0];
    self.toonTwo.tag = 2;
    [self.toonTwo addTarget:self action:@selector(toonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.toonTwo];
    
//    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -315,(self.view.frame.size.height/2) -60, 36, 36)];
//    self.tapTwo.layer.cornerRadius = 18;
//    self.tapTwo.backgroundColor = self.toonButtonColor;
//    self.tapTwo.tag = 2001;
//    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.tapTwo];
//    [self.tTwo addObject:self.tapTwo];
    
    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -315,(self.view.frame.size.height/2) -20, 36, 36)];
    self.tapTwo.layer.cornerRadius = 18;
    self.tapTwo.backgroundColor = self.toonButtonColor;
    self.tapTwo.tag = 2002;
    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapTwo];
    [self.tTwo addObject:self.tapTwo];
    
//    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -315,(self.view.frame.size.height/2) +20, 36, 36)];
//    self.tapTwo.layer.cornerRadius = 18;
//    self.tapTwo.backgroundColor = self.toonButtonColor;
//    self.tapTwo.tag = 2003;
//    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.tapTwo];
//    [self.tTwo addObject:self.tapTwo];
//    
    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -240,(self.view.frame.size.height/2) -60, 36, 36)];
    self.tapTwo.layer.cornerRadius = 18;
    self.tapTwo.backgroundColor = self.toonButtonColor;
    self.tapTwo.tag = 2004;
    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapTwo];
    [self.tTwo addObject:self.tapTwo];
    
//    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -240,(self.view.frame.size.height/2) -20, 36, 36)];
//    self.tapTwo.layer.cornerRadius = 18;
//    self.tapTwo.backgroundColor = self.toonButtonColor;
//    self.tapTwo.tag = 2005;
//    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.tapTwo];
//    [self.tTwo addObject:self.tapTwo];
//    
    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -240,(self.view.frame.size.height/2) +20, 36, 36)];
    self.tapTwo.layer.cornerRadius = 18;
    self.tapTwo.backgroundColor = self.toonButtonColor;
    self.tapTwo.tag = 2006;
    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapTwo];
    [self.tTwo addObject:self.tapTwo];
    
    ///
    // Toon Three
    ///
    self.tThree = [NSMutableArray new];
    self.toonThree = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -260,(self.view.frame.size.height/2) + 70, 80, 90)];
    self.toonThree.layer.cornerRadius = 14;
    self.toonThree.backgroundColor = [UIColor colorWithRed:0.25 green:0.47 blue:0.85 alpha:1.0];
    self.toonThree.tag = 3;
    [self.toonThree addTarget:self action:@selector(toonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.toonThree];
    
    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -275,(self.view.frame.size.height/2) +55, 36, 36)];
    self.tapTwo.layer.cornerRadius = 18;
    self.tapTwo.backgroundColor = self.toonButtonColor;
    self.tapTwo.tag = 3001;
    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapTwo];
    [self.tThree addObject:self.tapTwo];
    
//    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -275,(self.view.frame.size.height/2) +95, 36, 36)];
//    self.tapTwo.layer.cornerRadius = 18;
//    self.tapTwo.backgroundColor = self.toonButtonColor;
//    self.tapTwo.tag = 3002;
//    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.tapTwo];
//    [self.tThree addObject:self.tapTwo];
    
    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -275,(self.view.frame.size.height/2) +135, 36, 36)];
    self.tapTwo.layer.cornerRadius = 18;
    self.tapTwo.backgroundColor = self.toonButtonColor;
    self.tapTwo.tag = 3003;
    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapTwo];
    [self.tThree addObject:self.tapTwo];
    
    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -200,(self.view.frame.size.height/2) +55, 36, 36)];
    self.tapTwo.layer.cornerRadius = 18;
    self.tapTwo.backgroundColor = self.toonButtonColor;
    self.tapTwo.tag = 3004;
    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapTwo];
    [self.tThree addObject:self.tapTwo];
    
//    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -200,(self.view.frame.size.height/2) +95, 36, 36)];
//    self.tapTwo.layer.cornerRadius = 18;
//    self.tapTwo.backgroundColor = self.toonButtonColor;
//    self.tapTwo.tag = 3005;
//    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.tapTwo];
//    [self.tThree addObject:self.tapTwo];
//    
    self.tapTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) -200,(self.view.frame.size.height/2) +135, 36, 36)];
    self.tapTwo.layer.cornerRadius = 18;
    self.tapTwo.backgroundColor = self.toonButtonColor;
    self.tapTwo.tag = 3006;
    [self.tapTwo addTarget:self action:@selector(actionSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapTwo];
    [self.tThree addObject:self.tapTwo];
    
    ///
    // 3-4 Enemies
    ///
    if(self.formation == 1){
        self.enemieOne = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) +175,(self.view.frame.size.height/2) -170, 65, 70)];
        self.enemieOne.layer.cornerRadius = 14;
        self.enemieOne.backgroundColor = [UIColor colorWithRed:0.50 green:0.50 blue:0.50 alpha:1.0];
        self.enemieOne.tag = 10;
        [self.enemieOne addTarget:self action:@selector(enemieSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.enemieOne];
        
        self.enemieTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) +205,(self.view.frame.size.height/2) -82, 70, 80)];
        self.enemieTwo.layer.cornerRadius = 14;
        self.enemieTwo.backgroundColor = [UIColor colorWithRed:0.45 green:0.45 blue:0.45 alpha:1.0];
        self.enemieTwo.tag = 11;
        [self.enemieTwo addTarget:self action:@selector(enemieSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.enemieTwo];
        
        self.enemieThree = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)+205,(self.view.frame.size.height/2) +8, 70, 80)];
        self.enemieThree.layer.cornerRadius = 14;
        self.enemieThree.backgroundColor = [UIColor colorWithRed:0.45 green:0.45 blue:0.45 alpha:1.0];
        self.enemieThree.tag = 12;
        [self.enemieThree addTarget:self action:@selector(enemieSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.enemieThree];
        
        self.enemieFour = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)+175,(self.view.frame.size.height/2) +100, 65, 70)];
        self.enemieFour.layer.cornerRadius = 14;
        self.enemieFour.backgroundColor = [UIColor colorWithRed:0.50 green:0.50 blue:0.50 alpha:1.0];
        self.enemieFour.tag = 13;
        [self.enemieFour addTarget:self action:@selector(enemieSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.enemieFour];
    }else if(self.formation == 2){
        self.enemieOne = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) +170,(self.view.frame.size.height/2) -165, 70, 80)];
        self.enemieOne.layer.cornerRadius = 14;
        self.enemieOne.backgroundColor = [UIColor colorWithRed:0.50 green:0.50 blue:0.50 alpha:1.0];
        self.enemieOne.tag = 10;
        [self.enemieOne addTarget:self action:@selector(enemieSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.enemieOne];
        
        self.enemieTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) +190,(self.view.frame.size.height/2) -70, 120, 140)];
        self.enemieTwo.layer.cornerRadius = 14;
        self.enemieTwo.backgroundColor = [UIColor colorWithRed:0.40 green:0.40 blue:0.40 alpha:1.0];
        self.enemieTwo.tag = 11;
        [self.enemieTwo addTarget:self action:@selector(enemieSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.enemieTwo];
        
        self.enemieThree = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)+170,(self.view.frame.size.height/2) +85, 70, 80)];
        self.enemieThree.layer.cornerRadius = 14;
        self.enemieThree.backgroundColor = [UIColor colorWithRed:0.50 green:0.50 blue:0.50 alpha:1.0];
        self.enemieThree.tag = 12;
        [self.enemieThree addTarget:self action:@selector(enemieSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.enemieThree];
        
    }else if (self.formation == 3){
        self.enemieTwo = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) +205,(self.view.frame.size.height/2) -82, 70, 80)];
        self.enemieTwo.layer.cornerRadius = 14;
        self.enemieTwo.backgroundColor = [UIColor colorWithRed:0.45 green:0.45 blue:0.45 alpha:1.0];
        self.enemieTwo.tag = 10;
        [self.enemieTwo addTarget:self action:@selector(enemieSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.enemieTwo];
        
        self.enemieThree = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)+205,(self.view.frame.size.height/2) +8, 70, 80)];
        self.enemieThree.layer.cornerRadius = 14;
        self.enemieThree.backgroundColor = [UIColor colorWithRed:0.45 green:0.45 blue:0.45 alpha:1.0];
        self.enemieThree.tag = 11;
        [self.enemieThree addTarget:self action:@selector(enemieSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.enemieThree];
    }
    
    NSTimer *metroTimer = [NSTimer scheduledTimerWithTimeInterval:self.metroSpeed target:self selector:@selector(metroKeeper) userInfo:nil repeats:true];
    [metroTimer fire];
    
    NSTimer *beatTimer = [NSTimer scheduledTimerWithTimeInterval:self.beatSpeed target:self selector:@selector(beatKeeper) userInfo:nil repeats:true];
    [beatTimer fire];
    
    [self removeButtons];
}

-(void) toonSelected:(UIButton*)button{
    if(self.toonSelected == 0){
        self.toonSelected = (int)button.tag;
    }
}

-(void) actionSelected:(UIButton*)button{
    if(self.actionSelected == 0){
        self.actionSelected = (int)button.tag;
        self.actionSelectedCounter = 4;
        self.sequenceCounter = (int)self.sequence.count -1;
        
        [self removeActionButtons];
    }
}

-(void) buttonTapped:(UIButton*)button{
    [button removeFromSuperview];
}

-(void) enemieSelected:(UIButton*)button{
    if(self.actionSelected != 0){
        if(self.enemieSelected == 0){
            self.enemieSelected = (int)button.tag;
            //[self showButtons];
        }
    }
}

-(void) metroKeeper{
    if(self.metroSwitch == true){
        self.metroSwitch = false;
        self.metroOne.alpha = 1.0;
        self.metroTwo.alpha = 0.0;
    }else{
        self.metroSwitch = true;
        self.metroOne.alpha = 0.0;
        self.metroTwo.alpha = 1.0;
    }
}

-(void) showButtons{
    for(int i = 0; i < self.tapArr.count; ++i){
        [self.view addSubview:self.tapArr[i]];
    }
}

-(void) removeButtons{
    for(int i = 0; i < self.tapArr.count; ++i){
        [self.tapArr[i] removeFromSuperview];
    }
}

-(void) buttonColorClear{
    for(int i = 0; i < self.tapArr.count; ++i){
        [self.tapArr[i] setBackgroundColor:self.tapOffColor];
    }
}

-(void) showActionButtons{
    
    for(int i = 0; i < self.tOne.count; ++i){
        [self.view addSubview:self.tOne[i]];
    }
    
    for(int i = 0; i < self.tTwo.count; ++i){
        [self.view addSubview:self.tTwo[i]];
    }
    
    for(int i = 0; i < self.tThree.count; ++i){
        [self.view addSubview:self.tThree[i]];
    }
}

-(void) removeActionButtons{
    
    for(int i = 0; i < self.tOne.count; ++i){
        [self.tOne[i] removeFromSuperview];
    }
    
    for(int i = 0; i < self.tTwo.count; ++i){
        [self.tTwo[i] removeFromSuperview];
    }
    
    for(int i = 0; i < self.tThree.count; ++i){
        [self.tThree[i] removeFromSuperview];
    }
}

-(void) beatKeeper{
    if(self.actionSelected != 0){

        if(self.enemieSelected != 0){
            if(self.sequenceCounter >= 0){
                [self.tapArr[[self.sequence[self.sequenceCounter] intValue]] setBackgroundColor:self.tapOnColor];
                [self.view addSubview:self.tapArr[[self.sequence[self.sequenceCounter] intValue]]];
                self.sequenceCounter--;
            }else{

                self.enemieSelected = 0;
                self.actionSelected = 0;
                self.sequenceCounter = 0;
                [self showActionButtons];
                [self buttonColorClear];
                [self removeButtons];
            }
        }else{
            self.actionSelectedCounter--;
            if(self.actionSelectedCounter == 0){
                self.actionSelected = 0;
                [self showActionButtons];
            }
        }
    }
}

@end





//
//if(self.toonActive == true){
//    [self removeButtons];
//    self.toonActive = false;
//}else{
//    [self showButtons];
//    self.toonActive = true;
//}

//if(self.tapKeeper == 6){
//    self.tapKeeper = 1;
//    if(self.toonActive == false && self.toonSelected != 0){
//        if(self.animationDone == true){
//            self.toonActive = true;
//            self.toonActiveCount = 2;
//            self.tapOne.backgroundColor = self.tapOnColor;
//            self.tapTwo.backgroundColor = self.tapOnColor;
//            self.tapThree.backgroundColor = self.tapOnColor;
//            self.tapFour.backgroundColor = self.tapOnColor;
//            self.tapFive.backgroundColor = self.tapOnColor;
//            self.tapSix.backgroundColor = self.tapOnColor;
//            self.centerPlace.backgroundColor = self.centerOnColor;
//            
//            if(self.toonSelected == 1){
//                self.toonOne.backgroundColor = self.toonOnColor;
//            }else if(self.toonSelected == 2){
//                self.toonTwo.backgroundColor = self.toonOnColor;
//            }else if(self.toonSelected == 3){
//                self.toonThree.backgroundColor = self.toonOnColor;
//            }
//        }
//    }else{
//        if(self.toonActiveCount == 0){
//            self.tapOne.backgroundColor = self.tapOffColor;
//            self.tapTwo.backgroundColor = self.tapOffColor;
//            self.tapThree.backgroundColor = self.tapOffColor;
//            self.tapFour.backgroundColor = self.tapOffColor;
//            self.tapFive.backgroundColor = self.tapOffColor;
//            self.tapSix.backgroundColor = self.tapOffColor;
//            self.centerPlace.backgroundColor = self.centerOffColor;
//            
//            if(self.toonSelected == 1){
//                self.toonOne.layer.position = self.originalPos;
//                self.toonOne.backgroundColor = self.toonOffColor;
//            }else if(self.toonSelected == 2){
//                self.toonTwo.layer.position = self.originalPos;
//                self.toonTwo.backgroundColor = self.toonOffColor;
//            }else if(self.toonSelected == 3){
//                self.toonThree.layer.position = self.originalPos;
//                self.toonThree.backgroundColor = self.toonOffColor;
//            }
//            self.toonActive = false;
//            self.toonSelected = 0;
//            self.animationDone = false;
//        }else{
//            self.toonActiveCount--;
//        }
//    }
//    
//}else if (self.tapKeeper == 5){
//    if(self.toonActive == false && self.toonSelected != 0){
//        UIButton* tempButton = [UIButton new];
//        
//        if(self.toonSelected == 1){
//            tempButton = self.toonOne;
//            self.originalPos = CGPointMake(self.toonOne.layer.position.x, self.toonOne.layer.position.y);
//        }else if(self.toonSelected == 2){
//            tempButton = self.toonTwo;
//            self.originalPos = CGPointMake(self.toonTwo.layer.position.x, self.toonTwo.layer.position.y);
//        }else if(self.toonSelected == 3){
//            tempButton = self.toonThree;
//            self.originalPos = CGPointMake(self.toonThree.layer.position.x, self.toonThree.layer.position.y);
//        }
//        CABasicAnimation *moveToon = [CABasicAnimation animationWithKeyPath:@"position"];
//        moveToon.fromValue = [NSValue valueWithCGPoint:CGPointMake(tempButton.layer.position.x, tempButton.layer.position.y)];
//        moveToon.toValue = [NSValue valueWithCGPoint:CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height/2))];
//        moveToon.duration = self.beatSpeed;
//        moveToon.beginTime = 0.0;
//        tempButton.layer.position = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height/2));
//        [tempButton.layer addAnimation:moveToon forKey:@"stuff"];
//        
//        self.animationDone = true;
//    }
//    self.tapKeeper++;
//}else{
//    self.tapKeeper++;
//}




//if(self.toonActive == false){
    //        if(self.tapKeeper == 1){
    //            self.tapOne.backgroundColor = self.tapOnColor;
    //            self.tapSix.backgroundColor = self.tapOffColor;
    //        }else if(self.tapKeeper == 2){
    //            self.tapTwo.backgroundColor = self.tapOnColor;
    //            self.tapOne.backgroundColor = self.tapOffColor;
    //        }else if(self.tapKeeper == 3){
    //            self.tapThree.backgroundColor = self.tapOnColor;
    //            self.tapTwo.backgroundColor = self.tapOffColor;
    //        }else if(self.tapKeeper == 4){
    //            self.tapFour.backgroundColor = self.tapOnColor;
    //            self.tapThree.backgroundColor = self.tapOffColor;
    //        }else if(self.tapKeeper == 5){
    //            self.tapFive.backgroundColor = self.tapOnColor;
    //            self.tapFour.backgroundColor = self.tapOffColor;
    //        }else if(self.tapKeeper == 6){
    //            self.tapSix.backgroundColor = self.tapOnColor;
    //            self.tapFive.backgroundColor = self.tapOffColor;
    //        }
//}else{
    //        if(self.tapKeeper == 1){
    //            self.tapOne.backgroundColor = self.tapOffColor;
    //            self.tapSix.backgroundColor = self.tapOnColor;
    //        }else if(self.tapKeeper == 2){
    //            self.tapTwo.backgroundColor = self.tapOffColor;
    //            self.tapOne.backgroundColor = self.tapOnColor;
    //        }else if(self.tapKeeper == 3){
    //            self.tapThree.backgroundColor = self.tapOffColor;
    //            self.tapTwo.backgroundColor = self.tapOnColor;
    //        }else if(self.tapKeeper == 4){
    //            self.tapFour.backgroundColor = self.tapOffColor;
    //            self.tapThree.backgroundColor = self.tapOnColor;
    //        }else if(self.tapKeeper == 5){
    //            self.tapFive.backgroundColor = self.tapOffColor;
    //            self.tapFour.backgroundColor = self.tapOnColor;
    //        }else if(self.tapKeeper == 6){
    //            self.tapSix.backgroundColor = self.tapOffColor;
    //            self.tapFive.backgroundColor = self.tapOnColor;
    //        }
//}
