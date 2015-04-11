REPORTER=junit:test-reports/xctest-report.xml
DST_OS=8.2
DST_NAME=iPhone 4s

test:
	xctool -workspace RealmInMemoryStoreExample.xcworkspace \
		-scheme RealmInMemoryStoreExample \
		-sdk iphonesimulator \
		-destination "platform=iOS Simulator,OS=${DST_OS},name=${DST_NAME}" \
		-reporter ${REPORTER} \
		GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
		GCC_GENERATE_TEST_COVERAGE_FILES=YES \
		OTHER_CFLAGS="-DUSE_GCOV_FLUSH" \
		OBJROOT=build \
		clean test

send-to-coveralls:
	coveralls \
		--exclude Pods --exclude-pattern ".*Tests" --exclude-pattern ".*\.h" \

