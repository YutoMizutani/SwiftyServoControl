# SwiftyServoControl

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![platform](https://img.shields.io/badge/platform-RaspberryPi%20%20%7C%20iOS-333333.svg)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/YutoMizutani/SushiWallet/blob/master/LICENSE)

Servo control IoT server using Raspberry Pi and client using iPhone developed only Swift.
[See movie](https://twitter.com/EXPENSIVE_MAN/status/1118320693358153728)

<img src="https://raw.githubusercontent.com/YutoMizutani/SwiftyServoControl/master/pic/photo.jpg" width="300">

## For Developers

Written all options in `./Makefile`.

## Open

#### Open workspace (only macOS)
```
$ make open
```

## Install Swift for Raspberry Pi

#### For Raspberry Pi Zero
Install Swift 4 (Swift 5 is not released yet)

See [Official Swift-Arm Community Releases - swift-arm](https://packagecloud.io/swift-arm/release)

```
$ make install-swift-raspberry-pi-zero
```

#### For Raspberry Pi (without Zero; e.g. 3B+)
Install Swift 5

```
$ make install-swift-raspberry-pi-without-zero
```


## Install Vapor dependencies
#### For Debian
Install `libssl-dev`

```
$ make deps-debian
```

#### For macOS
Install `libressl` `ios-sim`

```
$ make deps-macos
```

## Install Vapor CLI tools

#### For Debian
Not supported (Only macOS and Ubuntu)

See [Vapor Docs #Install](https://docs.vapor.codes/3.0/install/ubuntu/)

#### For macOS
```
$ make deps-macos
```

## Build

#### Server
```
$ make build-server
```

#### Client (iOS)
```
$ make build-client
```

## Run

#### Server
```
$ make run-server
```

##### Set your own hostname and port number,
```
$ make run-server --hostname localhost --port 8080
```

HOSTNAME: (detault: localhost)

PORT:     (detault: 8080)

#### Client (iOS)
Open workspace and Run on Xcode (Not work ios-sim on Xcode 10.2)

See [List empty of devices simulator with Xcode 10 #234 - ios-control/ios-sim](https://github.com/ios-control/ios-sim/issues/234)

##### Set your own hostname and port number,
`Xcode > Edit Scheme... > Run - Arguments > Environment Variables`

HOSTNAME: (detault: localhost)

PORT:     (detault: 8080)

<img src="https://raw.githubusercontent.com/YutoMizutani/SwiftyServoControl/master/pic/xcode-screenshot.png" width="800">

## Test

#### Server
```
$ make test-server
```

#### Client (iOS)
```
$ make test-client
```