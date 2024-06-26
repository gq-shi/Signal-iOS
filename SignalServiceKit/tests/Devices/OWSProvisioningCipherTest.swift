//
// Copyright 2023 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import LibSignalClient
import XCTest

@testable import SignalServiceKit

final class OWSProvisioningCipherTest: XCTestCase {
    private let knownInitializationVector = Data([
        0xec, 0x67, 0x0b, 0xb7,
        0x18, 0xe1, 0xe9, 0x0a,
        0xcc, 0x5e, 0xcb, 0x37,
        0xab, 0x79, 0xe0, 0x09
    ])

    private let knownPublicKey = try! PublicKey(keyData: Data([
        0x5e, 0x23, 0xe8, 0x49,
        0xb2, 0x23, 0x21, 0xdb,
        0x2e, 0x3a, 0x77, 0x74,
        0x6f, 0x3b, 0x44, 0x18,
        0xcc, 0x6c, 0x81, 0xce,
        0xd5, 0xc2, 0x91, 0xaf,
        0xed, 0xfb, 0x21, 0x4e,
        0x59, 0xcc, 0x19, 0xa4
    ]))

    private let knownKeyPair = try! ECKeyPair(
        publicKeyData: Data([
            0x02, 0x62, 0x7b, 0x5c,
            0x21, 0x15, 0x59, 0x1b,
            0x37, 0xd1, 0xfe, 0xeb,
            0x15, 0x5d, 0xd2, 0x95,
            0x0a, 0xce, 0xe8, 0xb2,
            0x1e, 0x8e, 0xc8, 0xd6,
            0x53, 0x4f, 0x1a, 0xcd,
            0xf2, 0x00, 0x98, 0x32
        ]),
        privateKeyData: Data([
            0x60, 0xfd, 0xc1, 0xeb,
            0x6a, 0x68, 0x3d, 0x2b,
            0x51, 0x23, 0x1f, 0xea,
            0x1a, 0x5e, 0x80, 0x88,
            0x0c, 0x65, 0x2d, 0x3d,
            0x47, 0x9e, 0x28, 0xc1,
            0x9f, 0x48, 0x2c, 0x66,
            0xde, 0x48, 0x5d, 0x57
        ])
    )

    private let knownData = Data([
        0x19, 0x33, 0x78, 0x64,
        0x96, 0x56, 0xa7, 0xd0,
        0x6e, 0xff, 0x37, 0x1d
    ])

    func testEncrypt() {
        let cipher = OWSProvisioningCipher(
            theirPublicKey: knownPublicKey,
            ourKeyPair: knownKeyPair,
            initializationVector: knownInitializationVector
        )

        let actualOutput = cipher.encrypt(knownData)

        let expectedOutput = Data([
            0x01, 0xec, 0x67, 0x0b,
            0xb7, 0x18, 0xe1, 0xe9,
            0x0a, 0xcc, 0x5e, 0xcb,
            0x37, 0xab, 0x79, 0xe0,
            0x09, 0xf7, 0x2b, 0xf7,
            0x14, 0x3d, 0x45, 0xd7,
            0x45, 0x79, 0x1e, 0x4f,
            0x9d, 0x34, 0x8a, 0x2d,
            0x43, 0x64, 0xd4, 0x7d,
            0x48, 0x9a, 0xdc, 0x5a,
            0xc3, 0x72, 0xfa, 0x63,
            0x41, 0x7a, 0xa8, 0x45,
            0x36, 0xe9, 0xc5, 0xcb,
            0xee, 0x9b, 0xc1, 0x1f,
            0xec, 0x31, 0x1e, 0xc2,
            0x33, 0x2d, 0x95, 0x54,
            0xcc
        ])

        XCTAssertEqual(actualOutput, expectedOutput)
    }

    func testPadding() {
        let count: UInt = 16
        for i in (0...count) {
            let cipher = OWSProvisioningCipher(
                theirPublicKey: knownPublicKey,
                ourKeyPair: knownKeyPair,
                initializationVector: knownInitializationVector
            )

            let encrypted = cipher.encrypt(Cryptography.generateRandomBytes(i))

            XCTAssertNotNil(encrypted, "failed for message length: \(i)")
        }
    }
}
