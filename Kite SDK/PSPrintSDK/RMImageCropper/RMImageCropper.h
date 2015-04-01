#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, RMImageCropperMode) {
    RMImageCropperModeAspectFill,
    RMImageCropperModeAspectFit
};

@class RMImageCropper;

@protocol RMImageCropperDelegate <NSObject>
- (void)imageCropperDidTransformImage:(RMImageCropper *)imageCropper;
@end

@interface RMImageCropper : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, weak) id<RMImageCropperDelegate> delegate;
@property (nonatomic, assign) NSInteger minimum;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, readonly) UIImage * editedImage;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, assign) RMImageCropperMode initialScale;
@property (nonatomic, assign) RMImageCropperMode minimumScale;
@property (nonatomic, copy) void (^tapped)();

- (void)editedImageAsync:(void (^)(UIImage *image))complete;

@end

