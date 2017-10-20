//
//  OpenCVMethods.mm
//  UseOpenCVInSwiftDemo
//
//  Created by yangyang on 17/10/2017.
//  Copyright © 2017 yangguang. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "UseOpenCVInSwiftDemo-Bridging-Header.h"

@implementation ImageConverter : NSObject

+(UIImage *)getBinaryImage:(UIImage *)image {
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    cv::Mat gray;
    cv::cvtColor(mat, gray, CV_RGB2GRAY);
    
    cv::Mat bin;
    cv::threshold(gray, bin, 0, 255, cv::THRESH_BINARY | cv::THRESH_OTSU);
    
    UIImage *binImg = MatToUIImage(bin);
    return binImg;
}
@end
