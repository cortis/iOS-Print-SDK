//
//  Modified MIT License
//
//  Copyright (c) 2010-2017 Kite Tech Ltd. https://www.kite.ly
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

#import <Foundation/Foundation.h>

#import "OLAddress+AddressBook.h"
#import "OLAddress.h"
#import "OLAddressPickerController.h"
#import "OLAnalytics.h"
#import "OLAsset.h"
#import "OLAssetUploadRequest.h"
#import "OLCheckoutDelegate.h"
#import "OLCheckoutViewController.h"
#import "OLConstants.h"
#import "OLCountry.h"
#import "OLCountryPickerController.h"
#import "OLImagePickerProviderCollection.h"
#import "OLKiteViewController.h"
#import "OLPayPalCard.h"
#import "OLPrintEnvironment.h"
#import "OLPrintJob.h"
#import "OLPrintOrder+History.h"
#import "OLPrintOrder.h"
#import "OLPrintOrderCost.h"
#import "OLProduct.h"
#import "OLProductPrintJob.h"
#import "OLProductTemplate.h"
#import "OLReceiptViewController.h"
#import "OLStripeCard.h"
#import "OLKiteUtils.h"
#import "OLUserSession.h"
#import "OLAddressEditViewController.h"
#import "OLProductOverviewViewController.h"
#import "OLProductDetailsViewController.h"
#import "OLKiteABTesting.h"
#import "NSObject+Utils.h"
#import "UIColor+OLHexString.h"
#import "UIView+AutoLayoutHelper.h"
#import "UIImage+OLUtils.h"
#import "OLKiteTheme.h"
#import "NSDecimalNumber+CostFormatter.h"
#import "UIView+RoundRect.h"
#import "OLPaymentViewController.h"
#import "OLPaymentLineItem.h"
#import "OLOrderHistoryViewController.h"
#import "OLImagePickerViewController.h"

extern NSString *_Nonnull const kOLKiteSDKErrorDomain;
extern NSString *_Nonnull const kOLKiteSDKErrorMessageMaintenanceMode;
extern NSString *_Nonnull const kOLKiteSDKErrorMessageRequestInProgress;
extern NSString *_Nonnull const kOLKiteSDKErrorMessageUnauthorized;
extern NSString *_Nonnull const kOLKiteSDKVersion;
extern const NSInteger kOLKiteSDKErrorCodeFullDetailsFetchFailed;
extern const NSInteger kOLKiteSDKErrorCodeImagesCorrupt;
extern const NSInteger kOLKiteSDKErrorCodeMaintenanceMode;
extern const NSInteger kOLKiteSDKErrorCodeOrderValidationFailed;
extern const NSInteger kOLKiteSDKErrorCodeProductNotAvailableInRegion;
extern const NSInteger kOLKiteSDKErrorCodeRegisteredAssetCountDiscrepency;
extern const NSInteger kOLKiteSDKErrorCodeRequestInProgress;
extern const NSInteger kOLKiteSDKErrorCodeServerFault;
extern const NSInteger kOLKiteSDKErrorCodeURLShorteningFailed;
extern const NSInteger kOLKiteSDKErrorCodeUnauthorized;
extern const NSInteger kOLKiteSDKErrorCodeUnexpectedResponse;

@interface OLConstants : NSObject

@end
