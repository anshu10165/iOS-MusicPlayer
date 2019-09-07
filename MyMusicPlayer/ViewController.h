//
//  ViewController.h
//  MyMusicPlayer
//
//  Created by Anshu Kumar Ray on 12/2/18.
//  Copyright © 2018 Anshu Kumar Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>

@protocol MYDamen <NSObject>

-(void) print;

@end

@interface ViewController : UIViewController

@property(nonatomic, strong) AVPlayer *myPlayer;
@property(nonatomic, strong) UIButton *myButton;
@property(nonatomic, weak) id<MYDamen> delegate;

@end

