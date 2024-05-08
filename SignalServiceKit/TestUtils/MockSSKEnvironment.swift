//
// Copyright 2022 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import GRDB
import SignalCoreKit

#if TESTABLE_BUILD

@objc
public class MockSSKEnvironment: NSObject {
    /// Set up a mock SSK environment as well as ``DependenciesBridge``.
    @objc
    public static func activate() {
        let testAppContext = TestAppContext()
        SetCurrentAppContext(testAppContext)

        let finalContinuation = AppSetup().start(
            appContext: testAppContext,
            databaseStorage: try! SDSDatabaseStorage(
                databaseFileUrl: SDSDatabaseStorage.grdbDatabaseFileUrl,
                keychainStorage: MockKeychainStorage()
            ),
            paymentsEvents: PaymentsEventsNoop(),
            mobileCoinHelper: MobileCoinHelperMock(),
            callMessageHandler: NoopCallMessageHandler(),
            currentCallThreadProvider: CurrentCallNoOpThreadProvider(),
            notificationPresenter: NoopNotificationPresenterImpl(),
            testDependencies: AppSetup.TestDependencies(
                accountServiceClient: FakeAccountServiceClient(),
                contactManager: FakeContactsManager(),
                groupV2Updates: MockGroupV2Updates(),
                groupsV2: MockGroupsV2(),
                keyValueStoreFactory: InMemoryKeyValueStoreFactory(),
                messageSender: FakeMessageSender(),
                modelReadCaches: ModelReadCaches(factory: TestableModelReadCacheFactory()),
                networkManager: OWSFakeNetworkManager(libsignalNet: nil),
                paymentsCurrencies: MockPaymentsCurrencies(),
                paymentsHelper: MockPaymentsHelper(),
                pendingReceiptRecorder: NoopPendingReceiptRecorder(),
                profileManager: OWSFakeProfileManager(),
                reachabilityManager: MockSSKReachabilityManager(),
                remoteConfigManager: StubbableRemoteConfigManager(),
                signalService: OWSSignalServiceMock(),
                storageServiceManager: FakeStorageServiceManager(),
                subscriptionManager: MockSubscriptionManager(),
                syncManager: OWSMockSyncManager(),
                systemStoryManager: SystemStoryManagerMock(),
                versionedProfiles: MockVersionedProfiles(),
                webSocketFactory: WebSocketFactoryMock()
            )
        ).prepareDatabase(
            backgroundScheduler: SyncScheduler(),
            mainScheduler: SyncScheduler()
        )
        owsAssert(finalContinuation.isSealed)
    }

    @objc
    public static func flushAndWait() {
        AssertIsOnMainThread()

        waitForMainQueue()

        // Wait for all pending readers/writers to finish.
        SSKEnvironment.shared.grdbStorageAdapter.pool.barrierWriteWithoutTransaction { _ in }

        // Wait for the main queue *again* in case more work was scheduled.
        waitForMainQueue()
    }

    private static func waitForMainQueue() {
        // Spin the main run loop to flush any remaining async work.
        var done = false
        DispatchQueue.main.async { done = true }
        while !done {
            CFRunLoopRunInMode(.defaultMode, 0.0, true)
        }
    }
}

#endif
