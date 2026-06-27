git update-ref -d HEAD
git rm --cached -r .
Remove-Item -Path app\.git -Recurse -Force -ErrorAction SilentlyContinue

$files = Get-ChildItem -File -Recurse | Where-Object { $_.FullName -notmatch "\\.git\\" }

foreach ($f in $files) {
    $filepath = $f.FullName
    $basename = $f.Name
    git add $filepath
    git commit -m "add $basename"
}

git push -u origin main --force
