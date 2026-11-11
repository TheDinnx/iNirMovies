#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

repo="${1:-TheDinnx/iNirMovies}"
branch="main"

for tool in git gh; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "Missing required tool: $tool" >&2
        exit 1
    fi
done

if ! gh auth status >/dev/null 2>&1; then
    gh auth login
fi
gh auth setup-git

login="$(gh api user --jq .login)"
userId="$(gh api user --jq .id)"

if [ ! -d .git ]; then
    git init -q -b "$branch"
fi
git checkout -q -B "$branch"
git config user.name >/dev/null 2>&1 || git config user.name "$login"
git config user.email >/dev/null 2>&1 || git config user.email "$userId+$login@users.noreply.github.com"

if ! gh repo view "$repo" >/dev/null 2>&1; then
    gh repo create "$repo" --public --description "iNir Movies - Cinemana client for Earthlink users on Windows and Linux"
fi

if git remote get-url origin >/dev/null 2>&1; then
    git remote set-url origin "https://github.com/$repo.git"
else
    git remote add origin "https://github.com/$repo.git"
fi

commits=(
    ".gitignore|chore(git): ignore build output and release binaries"
    "VERSION|chore(release): bump version to 7.8.6-1"
    "LICENSE|docs(license): scope license to GitHub Releases distribution"
    "assets/icons/appIcon.svg|feat(assets): add application icon"
    "assets/screenshots/.gitkeep|chore(assets): add screenshots directory"
    "dist/.gitkeep|chore(dist): add directory for compiled release binaries"
    "packaging/linux/io.inirmovies.app.desktop|feat(linux): add desktop entry"
    "packaging/linux/installApp.sh|feat(linux): add user-level install script"
    "packaging/linux/uninstallApp.sh|feat(linux): add uninstall script"
    "packaging/windows/installApp.ps1|feat(windows): add a Launch switch so updates can restart the app"
    "packaging/windows/uninstallApp.ps1|feat(windows): add uninstaller with Apps and Features entry"
    "packaging/windows/Install.bat|feat(windows): add double-click install launcher"
    "packaging/windows/Uninstall.bat|feat(windows): add double-click uninstall launcher"
    "scripts/makeRelease.sh|feat(release): build and upload the pacman package with every release"
    "scripts/makePacman.sh|feat(release): add the pacman package and repository database step"
    "publish.sh|chore(release): update commit messages for 7.8.6-1"
    ".github/workflows/releaseChecks.yml|ci: lint shell scripts, desktop entry and PowerShell scripts"
    ".github/ISSUE_TEMPLATE/bugReport.md|docs(github): add bug report template with platform and ISP fields"
    ".github/ISSUE_TEMPLATE/featureRequest.md|docs(github): add feature request template"
    ".github/PULL_REQUEST_TEMPLATE.md|docs(github): add pull request template"
    "SECURITY.md|docs(security): add security policy"
    "CONTRIBUTING.md|docs(contributing): describe repository layout and contribution rules"
    "docs/FAQ.md|fix(docs): update Windows playback answer for the bundled mpv"
    "docs/CHANGELOG.md|docs(changelog): add 7.8.6-1 release notes"
    "README.md|docs(readme): describe the bundled Windows tools and fix the install steps"
)

for entry in "${commits[@]}"; do
    file="${entry%%|*}"
    message="${entry#*|}"
    if [ -e "$file" ]; then
        git add -- "$file"
        if ! git diff --cached --quiet; then
            git commit -q -m "$message"
            echo "$message"
        fi
    fi
done

git add -A
if ! git diff --cached --quiet; then
    git commit -q -m "chore: sync remaining files"
fi

git fetch -q origin "$branch" 2>/dev/null || true
if git rev-parse -q --verify "refs/remotes/origin/$branch" >/dev/null; then
    if ! git merge-base --is-ancestor "refs/remotes/origin/$branch" HEAD; then
        printf 'origin/%s already has different history and will be replaced. Continue? [y/N] ' "$branch"
        read -r answer
        case "$answer" in
            y|Y) ;;
            *) echo "Aborted."; exit 1 ;;
        esac
        git push -u origin "$branch" --force-with-lease="$branch"
    else
        git push -u origin "$branch"
    fi
else
    git push -u origin "$branch"
fi

./scripts/makeRelease.sh
