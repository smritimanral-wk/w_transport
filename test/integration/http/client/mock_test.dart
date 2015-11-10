// Copyright 2015 Workiva Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

@TestOn('browser || vm')
library w_transport.test.integration.http.client.mock_test;

import 'package:test/test.dart';
import 'package:w_transport/w_transport_mock.dart';

import '../../../naming.dart';
import '../mock_endpoints/ping.dart';
import '../mock_endpoints/reflect.dart';
import '../mock_endpoints/timeout.dart';
import '../../integration_paths.dart';
import 'suite.dart';

void main() {
  Naming naming = new Naming()
    ..platform = platformMock
    ..testType = testTypeIntegration
    ..topic = topicHttp;

  group(naming.toString(), () {
    setUp(() {
      configureWTransportForTest();
      mockPingEndpoint(IntegrationPaths.pingEndpointUri);
      mockReflectEndpoint(IntegrationPaths.reflectEndpointUri);
      mockTimeoutEndpoint(IntegrationPaths.timeoutEndpointUri);
    });

    runClientSuite();

    tearDown(() {
      MockTransports.verifyNoOutstandingExceptions();
    });
  });
}