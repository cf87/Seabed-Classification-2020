git checkout -b dev master
git filter-branch --tree-filter "python3 -m nbconvert --ClearOutputPreprocessor.enabled=True --inplace *.ipynb **/*.ipynb || true"
git push --set-upstream origin dev
git checkout master
git branch backup
git reset dev --hard
git checkout backup .
git commit -m "Execute notebooks"
git push --forc
git reset dev --hard
git checkout backup .
git commit -m "Execute notebooks"
git push --force
