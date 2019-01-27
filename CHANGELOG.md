# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.4.1] - 2018-01-11

### Added
- `Blockstack.clearGaiaSession`

### Changed
- `Blockstack.putFile` has been modified to retry in the case of a configuration error. This may be the case if there have been any token revocations. This new logic will catch the first failed write, construct (and cache) a new Gaia token, and then attempt the write again. This allows tokens to be revoked without any hiccups from a user experience standpoint.


## [0.4.0] - 2018-10-29

### Added
- A lot more methods from Blockstack.js are now supported in Swift. Specifically...
- `Blockstack.encryptContent`
- `Blockstack.decryptContent`
- `Blockstack.extractProfile`
- `Blockstack.wrapProfileToken`
- `Blockstack.signProfileToken`
- `Blockstack.verifyProfileToken`
- `Blockstack.lookupProfile`
- `Blockstack.getUserAppFileURL`
- Objective-C bindings for all methods exposed by the SDK.

### Changed
- Vastly improved and much more detailed tutorial.
- Exposed key generation utilities, specifically: `Keys.getEntropy`, `Keys.getPublicKeyFromPrivate`, `Keys.makeECPrivateKey`
- The `Profile` object now supports an `image` field, which contains an object of type `Content`.
- `Blockstack.promptClearDeviceKeychain` has been simplified, no longer requiring a redirectURI or completion handler.
- `Blockstack.signOut` -> `Blockstack.signUserOut`
- `Blockstack.isSignedIn` -> `Blockstack.isUserSignedIn`
- Example app has been cleaned up, error states have been fixed, and shows off more functionality.

## [0.3.0] - 2018-08-27

### Added
- `Blockstack.getFile` with parameters username, app, and zoneFileLookupURL.
- `Blockstack.lookupProfile`
- `Gaia.getUserAppFileURL`
- `Blockstack.promptClearDeviceKeychain` to reset the user's local storage for auth.
- Descriptive comments that work with Xcode Quick Look

### Changed
- Non-JSON formats in getFile and putFile, specifically "text/plain" and "application/octet-stream" content types.
- `Profile` object now includes an "apps" property.
- Various fixes around sign in/sign out with the sample app.
- The sample app now showcases multiplayer get, along with encrypted putFile and getFile.
- `Blockstack.signOut` now just signs the user out and clears state for the current application.

## [0.2.0] - 2018-08-04

### Added
- This change log.
- Sign out functionality that allows clearing of SFAuthenticationSession browser storage. This allows users to use multiple accounts without having to reset the device/emulator. Also fixes an issue where users who get into a bad state during onboarding cannot recover.
- `EllipticJS` class which allows computing ECDH shared secret and getting a public key from private, on the secp256k1 curve.
- `Encryption.encryptECIES` and `Encryption.decryptECIES` methods which allow encryption/decryption of text or byte streams.
- Unit tests for Encryption via Quick/Nimble
- CircleCI integration for automated testing on all branches.
- `GaiaHubSession` has been added to allow multiple gaia connections. The shared `Gaia` object can hold numerous connections. It is not possible to create a `GaiaHubSession` object without a valid gaia config, fixing some error states. This object handles getting from and putting to a Gaia hub. 

### Changed
- Swift 4.0 syntax
- Removed secp256k1 pod. The functionality it was useful for is now covered by EllipticJS.
- Class extensions are all now in the "Extensions.swift" file, reducing project size.
- Crash-proofing and refactoring of code around the project for simplicity and separation.
- The included example app is functional (works for sign in and sign out)
- `Blockstack` and `BlockstackInstance` are merged.
- `Gaia` is now responsible for connecting to and managing `GaiaHubSessions`, along with saving and retrieving gaia configs, via static methods.
- `Gaia.getOrSetGaiaSession` is now `Gaia.ensureHubSession`.

## [0.1.3] - 2018-04-24
- Initial release.
