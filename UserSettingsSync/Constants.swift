/*
// Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0.
 */

import Foundation
import AWSAppSync

// Cognito PoolId and Region are being pulled in from awsconfiguration.json file by the AWSMobileClient
let AppSyncRegion: AWSRegionType = AWSRegionType.USWest2
let AppSyncEndpointURL: URL = URL(string: "")!
let database_name = "appsync-local-db"
