//
//  ViewController.m
//  MyMusicPlayer
//
//  Created by Anshu Kumar Ray on 12/2/18.
//  Copyright © 2018 Anshu Kumar Ray. All rights reserved.
//

#import "ViewController.h"
@import MediaPlayer;



@interface ViewController () <MYDamen>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //[self setSession];
    //[[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
    NSURL *url = [[NSURL alloc] initWithString:@"https://s3-eu-west-1.amazonaws.com/alf-proeysen/Bakvendtland-MASTER.mp4"];
    _myPlayer = [[AVPlayer alloc] initWithURL:url];
    
    
    //[_myPlayer pause];
    [_myPlayer play];
    // _myButton = [[UIButton alloc] init];
//    AVPlayerViewController *myController = [[AVPlayerViewController alloc] init];
//    [self addChildViewController:myController];
//    [self.view addSubview:myController.view];
//    myController.view.frame = CGRectMake(20, 100, 380, 200);
//    myController.player = _myPlayer;
    
    //[self setUpViews];
    [self setPlayingScreen:@"https://s3-eu-west-1.amazonaws.com/alf-proeysen/Bakvendtland-MASTER.mp4"];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void) setPlayingScreen: (NSString *)url {
    NSArray *ary = [url componentsSeparatedByString:@"/"];
    NSString *mystriong = [ary objectAtIndex: 4];
    NSDictionary *mydic = @{MPMediaItemPropertyTitle: mystriong, MPMediaItemPropertyArtist: @"ANSHU"};
    [MPNowPlayingInfoCenter defaultCenter].nowPlayingInfo = mydic;
}

-(BOOL) canBecomeFirstResponder {
    return true;
}

-(void) setSession {
    NSError *error = nil;
    if (![[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error]) {
        NSLog(@"%@", nil);
    }
}

-(void)setUpViews {
    
    UIImage *myImage = [UIImage imageNamed:@"Image"];
    [_myButton setImage:myImage forState:UIControlStateNormal];
    [_myButton addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    UIView *myBottomView = [[UIView alloc] init];
    [myBottomView addSubview:_myButton];
    _myButton.translatesAutoresizingMaskIntoConstraints = false;
    myBottomView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:myBottomView];
    myBottomView.backgroundColor = UIColor.orangeColor;
    [[[myBottomView bottomAnchor] constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor] setActive:true];
    [[[myBottomView topAnchor] constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant:-80.0] setActive:true];
    [[[myBottomView leadingAnchor] constraintEqualToAnchor:self.view.leadingAnchor] setActive:true];
    [[[myBottomView trailingAnchor] constraintEqualToAnchor:self.view.trailingAnchor] setActive:true];
    [[[_myButton centerXAnchor ] constraintEqualToAnchor:myBottomView.centerXAnchor] setActive:true];
    [[[_myButton centerYAnchor ] constraintEqualToAnchor:myBottomView.centerYAnchor] setActive:true];
    [[[_myButton heightAnchor] constraintEqualToConstant:48.0] setActive:true];
    [[[_myButton widthAnchor] constraintEqualToConstant:48.0] setActive:true];
}

-(void)clickMe: (UIButton *) sender {
    if (_myPlayer.rate > 0 ) {
        [_myPlayer pause];
        UIImage *myImage = [UIImage imageNamed:@"Image"];
        [_myButton setImage:myImage forState:UIControlStateNormal];
    } else {
        [_myPlayer play];
        UIImage *myImage = [UIImage imageNamed:@"Pause"];
        [_myButton setImage:myImage forState:UIControlStateNormal];
    }
}

-(void) remoteControlReceivedWithEvent:(UIEvent *)event {
    if (event.type == UIEventTypeRemoteControl) {
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlPause:
                if (_myPlayer.rate > 0 ) {
                    [_myPlayer pause];
//                    UIImage *myImage = [UIImage imageNamed:@"Image"];
//                    [_myButton setImage:myImage forState:UIControlStateNormal];
                } else {
                    [_myPlayer play];
//                    UIImage *myImage = [UIImage imageNamed:@"Pause"];
//                    [_myButton setImage:myImage forState:UIControlStateNormal];
                }
                break;
            case UIEventSubtypeRemoteControlPlay:
                if (_myPlayer.rate > 0 ) {
                    [_myPlayer pause];
                } else {
                    [_myPlayer play];
                }
                break;
            default:
                break;
        }
    }
}


@end
