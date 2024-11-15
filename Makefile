TEST_APP_BASENAME=app
TEST_APP_DIR?=tests/${TEST_APP_BASENAME}

.PHONY: create-test-application
create-test-application: remove-test-application install-skeleton add-requirements copy-recipe copy-tests-resources

.PHONY: remove-test-application
remove-test-application:
	(cd tests && rm -rf ${TEST_APP_BASENAME})

.PHONY: install-skeleton
install-skeleton:
	(cd tests && symfony new ${TEST_APP_BASENAME})

.PHONY: add-requirements
add-requirements:
	(cd ${TEST_APP_DIR} && composer require symfony/messenger phpunit/phpunit)

.PHONY: copy-recipe
copy-recipe:
	cp -R .recipe/* ${TEST_APP_DIR}

.PHONY: copy-tests-resources
copy-tests-resources:
	cp -R tests/Resources/* ${TEST_APP_DIR}
