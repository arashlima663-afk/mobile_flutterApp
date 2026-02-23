BASE_HREF = '/web_flutterApp/'
GITHUB_REPO ='https://github.com/9lima/web_flutterApp.git'
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:
	@echo "Clean existing repository"
	flutter clean


	@echo "get packages"
	flutter pub get

	@echo "building ...."
	flutter build web --base-href $(BASE_HREF) --release


	@echo "Deploying the repo"
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u -- force origin main

	cd ../..
	@echo "Deploying is finished"



