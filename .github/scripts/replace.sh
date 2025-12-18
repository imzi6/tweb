#!/bin/bash

UPSTREAM_BUILD=$(git log -1 --grep="^Build$" --pretty=%H upstream/master)
LOCAL_BUILD=$(git log -1 --grep="^Build$" --pretty=%H origin/master)
HEAD_HASH=$(git log -1 --pretty=%H)

echo "Upstream Build: $UPSTREAM_BUILD"
echo "Local Build: $LOCAL_BUILD"
echo "HEAD Build: $LOCAL_BUILD"

if [ "$UPSTREAM_BUILD" != "$LOCAL_BUILD" ]; then
	git reset --hard "${UPSTREAM_BUILD}"
	git cherry-pick "${LOCAL_BUILD}"..$(git log -2 --pretty=%H origin/master | tail -1)
	find . \( -path './.git' -o -path './.github' \) -prune -o -type f -print0 | xargs -0 sed -i 's/\.web.telegram.org/.web.imzi.us.kg/g'
	git add -A
	git commit -m "Replace Telegram Backend API"
	git push origin master --force-with-lease
fi
