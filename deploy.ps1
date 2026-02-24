# deploy.ps1 - Automate Flutter web deploy to GitHub Pages

# CONFIG
$BASE_HREF = "/web_flutterApp/"
$GITHUB_REPO = "https://github.com/arashlima663-afk/web_flutterApp.git"
$BRANCH = "gh-pages"

# Step 1: Clean project
Write-Host "Cleaning Flutter project..."
flutter clean

# Step 2: Get dependencies
Write-Host "Getting packages..."
flutter pub get

# Step 3: Build web
Write-Host "Building web..."
flutter build web --base-href $BASE_HREF --release

# Step 4: Deploy build
Write-Host "Deploying to GitHub Pages..."

# Navigate to build folder
Push-Location build\web

# Initialize git (if needed)
if (-not (Test-Path ".git")) {
    git init
}

# Add, commit, and push
git add .
$commitMessage = "Deploy build $(Get-Date -Format yyyy-MM-dd_HH-mm-ss)"
git commit -m $commitMessage

# Set branch and remote
git branch -M $BRANCH
git remote remove origin -ErrorAction SilentlyContinue
git remote add origin $GITHUB_REPO

# Force push to GitHub Pages branch
git push -u --force origin $BRANCH

# Return to project root
Pop-Location

Write-Host "Deployment finished!"