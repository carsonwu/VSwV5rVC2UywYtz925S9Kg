# AftershipSDK - iOS

[![Build Status](https://travis-ci.org/carsonwu/VSwV5rVC2UywYtz925S9Kg.svg?branch=master)](https://travis-ci.org/carsonwu/VSwV5rVC2UywYtz925S9Kg)

AftershipSDK enables you to conveniently call Aftership's API after integtation.

# Requirement

Xcode 7.2 <br>
AFNetworking 3.0 or later is required.

#Installation

As this is not a cocoapods SDK, you need to download the SDK and copy `Aftership-SDK-iOS` folder into your project. Then everything is ready for you!

#Usage

Before you start, you should generate an API key for your project at [Aftership website](https://www.aftership.com/apps/api).
<br>
During implementation, import the following head file into the class where you want to call api:
```
#impoort "AftershipSDK.h"
```
And init an instance of `AftershipApiManager` with your API key:
```
AftershipApiManager *manager = [AftershipApiManager managerWithApiKey:@"Your API key"];
```
Then, create a request base on the API you want to call, eg, get a tracking:
```
AftershipGetTrackingRequest *request = [AftershipGetTrackingRequest requestWithTrackingNumber:trackingNumber slug:Slug
                                                                              completionBlock:^(AftershipGetTrackingRequest *, id nullable, NSError *) {
    //handle response
                                                                              }];
```
Last step, perform the request with the API manager above:
```
[manager performRequest:request];
```

#Unit Test
There are two test cases in this SDK for testing create tracking & get tracking API. It will firstly create a tracking and then get that tracking.
<br>
Find `Aftership_SDK_iOSTests.m` and you may test it yourself, but please note that you have to modify the tracking number in
`- (void)setUp` method every time you test, or you may get error in your response due to the duplicate tracking number.
<br>
:+1: :+1: :+1:

















