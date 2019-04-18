# Launch options
HOSTNAME=localhost
PORT=8080

# Paths
WORKSPACE_PATH=./
SERVER_PATH=./Server/servo/
CLIENT_PATH=./Client/ServoClient/
SIMULATOR_PATH=./build/Build/Products/Debug-iphonesimulator/

# Names
WORKSPACE_NAME=SwiftyServoControl
SERVER_NAME=servo
CLIENT_NAME=ServoClient

# File extensions
WORKSPACE_EXTENSION=.xcworkspace
IOS_APP_EXTENSION=.app

# Commands
SWIFT_COMMAND=sudo swift
XCODE_COMMAND=xcodebuild
IOS_SIMULATOR_COMMAND=ios-sim
HOMEBREW_COMMAND=brew
APT_COMMAND=sudo apt

# Schemes
SCHEME_SERVER=servo
SCHEME_CLIENT=ServoClient

# Definition
WORKSPACE=$(WORKSPACE_PATH)$(WORKSPACE_NAME)$(WORKSPACE_EXTENSION)
SERVER=$(SERVER_PATH)


# Open
open:
	open $(WORKSPACE)


# Dependencies
deps-macos:
	$(HOMEBREW_COMMAND) install libressl ios-sim
deps-debian:
	$(APT_COMMAND) install libssl-dev

# Install



# Build
build-server:
	$(SWIFT_COMMAND) build --package-path $(SERVER_PATH)
build-client:
	$(XCODE_COMMAND) \
		-workspace $(WORKSPACE) \
		-configuration Debug \
		-verbose \
		-scheme "$(CLIENT_NAME)"
# Run
run-server:
	cd $(SERVER_PATH) \
		&& $(SWIFT_COMMAND) run Run --hostname $(HOSTNAME) --port $(PORT)
run-client:
	$(XCODE_COMMAND) \
		-workspace $(WORKSPACE) \
		-configuration Debug \
		-scheme "$(SCHEME_CLIENT)" \
		-destination "platform=iOS Simulator,OS=12.2,name=iPhone XS Max" \
		-derivedDataPath \
		build
	$(IOS_SIMULATOR_COMMAND) launch $(SIMULATOR_PATH)$(CLIENT_NAME)$(IOS_APP_EXTENSION)/ \
		--devicetypeid "iPhone-XS-Max, 12.2"

# Test
test-server:
	$(SWIFT_COMMAND) test --package-path $(SERVER_PATH)
test-client:
	set -o pipefail
	$(XCODE_COMMAND) test \
		-workspace $(WORKSPACE) \
		-configuration Release \
		-verbose \
		-scheme "$(SCHEME_CLIENT)" \
		-destination "platform=iOS Simulator,OS=12.2,name=iPhone XS Max" \
		ONLY_ACTIVE_ARCH=NO | xcpretty

# Clean
clean:
	make clean-all
clean-all:
	make clean-server
	make clean-client
clean-server:
	cd $(SERVER_PATH) \
		$(SWIFT_COMMAND) package clean
clean-client:
	cd $(SERVER_PATH) \
		$(XCODE_COMMAND) clean

# Debug
find-simulators:
	xcrun simctl list
