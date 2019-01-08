//
//  ViewController.m
//  FreeLoop
//
//  Created by HFY on 2019/1/8.
//  Copyright © 2019年 nsblacker. All rights reserved.
//

#import "ViewController.h"
#import <libavformat/avformat.h>
#import <libavcodec/avcodec.h>
#import <libswscale/swscale.h>
#import <libavutil/avutil.h>
#import <libswresample/swresample.h>
//#import <libavdevice/avdevice.h>
#import <libavfilter/avfilter.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *doc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *file = [[doc objectAtIndex:0] stringByAppendingPathComponent:@"4.mp4"];
    
    av_register_all();
    avcodec_register_all();
    avformat_network_init();
    AVFormatContext *avFormatContext = avformat_alloc_context();
    
    NSString *url = @"rtmp://live.hkstv.hk.lxdns.com/live/hks";
    if (avformat_open_input(&avFormatContext, [file UTF8String], NULL, NULL) != 0) {
        av_log(NULL, AV_LOG_ERROR, "Couldn't open file");
    }
    
    if (avformat_find_stream_info(avFormatContext, NULL) < 0) {
        av_log(NULL, AV_LOG_ERROR, "Couldn't find stream information");
    } else {
        av_dump_format(avFormatContext, 0, [url cStringUsingEncoding:NSUTF8StringEncoding], NO);
    }
}


@end
