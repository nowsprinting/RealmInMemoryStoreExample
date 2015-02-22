DST_OS=8.1
DST_NAME=iPhone 4s

test:
	xctool -workspace RealmInMemoryStoreExample.xcworkspace \
		-scheme RealmInMemoryStoreExample \
		-sdk iphonesimulator \
		-destination "platform=iOS Simulator,OS=${DST_OS},name=${DST_NAME}" \
		-reporter junit:test-reports/xctest-report.xml \
		clean test

