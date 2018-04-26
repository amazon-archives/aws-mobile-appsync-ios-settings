/*
 Copyright 2018 Amazon.com, Inc. and its affiliates. All Rights Reserved.
 
 Licensed under the Amazon Software License (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at
 
 http://aws.amazon.com/asl/
 
 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

import Foundation
import AWSAppSync

// Cognito PoolId and Region are being pulled in from awsconfiguration.json file by the AWSMobileClient
let AppSyncRegion: AWSRegionType = AWSRegionType.USWest2
let AppSyncEndpointURL: URL = URL(string: "")!
let database_name = "appsync-local-db"
