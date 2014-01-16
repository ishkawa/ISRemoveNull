test:
	xcodebuild clean build test \
		-sdk iphonesimulator \
		-workspace ISRemoveNull.xcworkspace \
		-scheme ISRemoveNull \
		-configuration Debug \
		-destination "name=iPhone Retina (4-inch),OS=7.0" \
		OBJROOT=build \
		GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
		GCC_GENERATE_TEST_COVERAGE_FILES=YES

coveralls:
	coveralls -e UnitTests -e Pods

