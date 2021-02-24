set -eo pipefail

echo "--- :package: Build job checkout directory"

pwd
ls -la


echo "--- :evergreen_tree: Build job environment"

env


echo "+++ :hammer: Example tests"

echo -e "\033[33mCongratulations!\033[0m You've successfully run your first build on Buildkite! 👍


If you have any questions or need help email support@buildkite.com, we'd be happy to help!

\033[31m<3\033[0m Buildkite
"
