clean:
	@mvn clean
	@echo "Target has been Cleaned"

package:
	@mvn package

package-test: package
	@mvn test -q -DfailIfNoTests = false -Dtest=QuoteapiTests

docker-build:
	@docker build -t apiserver .

docker-run:
	@docker run -p 5001:5000 apiserver
