//
//  Modified MIT License
//
//  Copyright (c) 2010-2016 Kite Tech Ltd. https://www.kite.ly
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The software MAY ONLY be used with the Kite Tech Ltd platform and MAY NOT be modified
//  to be used with any competitor platforms. This means the software MAY NOT be modified
//  to place orders with any competitors to Kite Tech Ltd, all orders MUST go through the
//  Kite Tech Ltd platform servers.
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "OLKiteUtils.h"
#import "OLKitePrintSDK.h"
#import "OLProductHomeViewController.h"
#ifdef OL_KITE_OFFER_APPLE_PAY
#import <Stripe/Stripe+ApplePay.h>
#endif
#import "OLPaymentViewController.h"
#import "OLKiteABTesting.h"
#import "OLCheckoutViewController.h"
#import "OLIntegratedCheckoutViewController.h"

@interface OLKitePrintSDK (Private)

+(NSString *)appleMerchantID;

@end

@implementation OLKiteUtils

+ (NSBundle *)kiteBundle{
    return [NSBundle bundleForClass:[OLKiteViewController class]];
}

+ (NSString *)userEmail:(UIViewController *)topVC {
    OLKiteViewController *kiteVC = [self kiteVcForViewController:topVC];
    OLProductHomeViewController *homeVC = [self homeViewControllerInNavStack:topVC.navigationController.viewControllers];
    if (kiteVC) {
        return kiteVC.userEmail;
    } else if (homeVC) {
        return homeVC.userEmail;
    }
    
    return nil;
}

+ (NSString *)userPhone:(UIViewController *)topVC {
    OLKiteViewController *kiteVC = [self kiteVcForViewController:topVC];
    OLProductHomeViewController *homeVC = [self homeViewControllerInNavStack:topVC.navigationController.viewControllers];
    if (kiteVC) {
        return kiteVC.userPhone;
    } else if (homeVC) {
        return homeVC.userPhone;
    }
    
    return nil;
}

+ (id<OLKiteDelegate>)kiteDelegate:(UIViewController *)topVC {
    OLKiteViewController *kiteVC = [self kiteVcForViewController:topVC];
    OLProductHomeViewController *homeVC = [self homeViewControllerInNavStack:topVC.navigationController.viewControllers];
    if (kiteVC) {
        return kiteVC.delegate;
    } else if (homeVC) {
        return homeVC.delegate;
    }
    
    return nil;
}

+ (OLProductHomeViewController *)homeViewControllerInNavStack:(NSArray *)viewControllers {
    for (UIViewController *vc in viewControllers) {
        if ([vc isMemberOfClass:[OLProductHomeViewController class]]) {
            return (OLProductHomeViewController *) vc;
        }
    }
    
    return nil;
}

#ifdef OL_KITE_OFFER_APPLE_PAY
+(BOOL)isApplePayAvailable{
    PKPaymentRequest *request = [Stripe paymentRequestWithMerchantIdentifier:[OLKitePrintSDK appleMerchantID]];
    
    return [Stripe canSubmitPaymentRequest:request];
}
#endif

+ (void)checkoutViewControllerForPrintOrder:(OLPrintOrder *)printOrder handler:(void(^)(id vc))handler{
    OLPaymentViewController *vc = [[OLPaymentViewController alloc] initWithPrintOrder:printOrder];
    handler(vc);
}

+ (void)shippingControllerForPrintOrder:(OLPrintOrder *)printOrder handler:(void(^)(OLCheckoutViewController *vc))handler{
    OLCheckoutViewController *vc;
    if ([[OLKiteABTesting sharedInstance].checkoutScreenType isEqualToString:@"Classic"]){
        vc = [[OLCheckoutViewController alloc] initWithPrintOrder:printOrder];
    }
    else{
        vc = [[OLIntegratedCheckoutViewController alloc] initWithPrintOrder:printOrder];
    }
    handler(vc);
}

+ (NSString *)reviewViewControllerIdentifierForProduct:(OLProduct *)product photoSelectionScreen:(BOOL)photoSelectionScreen{
    OLTemplateUI templateUI = product.productTemplate.templateUI;
    if (templateUI == kOLTemplateUICase){
        return @"OLCaseViewController";
    }
    else if (templateUI == kOLTemplateUIPostcard){
        return @"OLPostcardViewController";
    }
    else if (templateUI == kOLTemplateUIPoster && product.productTemplate.gridCountX == 1 && product.productTemplate.gridCountY == 1){
        return @"OLSingleImageProductReviewViewController";
    }
    else if (templateUI == kOLTemplateUIPhotobook){
        return @"OLEditPhotobookViewController";
    }
    else if (photoSelectionScreen){
        return @"PhotoSelectionViewController";
    }
    else if (templateUI == kOLTemplateUIPoster){
        return @"OLPosterViewController";
    }
    else if (templateUI == kOLTemplateUIFrame){
        return @"FrameOrderReviewViewController";
    }
    else{
        return @"OrderReviewViewController";
    }
}

+ (OLKiteViewController *)kiteVcForViewController:(UIViewController *)theVc{
    UIViewController *vc = theVc.parentViewController;
    while (vc) {
        if ([vc isKindOfClass:[OLKiteViewController class]]){
            return (OLKiteViewController *)vc;
            break;
        }
        else{
            vc = vc.parentViewController;
        }
    }
    vc = theVc.presentingViewController;
    while (vc) {
        if ([vc isKindOfClass:[OLKiteViewController class]]){
            return (OLKiteViewController *)vc;
            break;
        }
        else{
            vc = vc.presentingViewController;
        }
    }
    
    return nil;
}

@end
