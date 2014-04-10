if declare -Ff after_install >/dev/null; then
  after_install gem_update_system
else
  echo "rbenv: rbenv-gem-update plugin requires ruby-build 20130129 or later" >&2
fi

gem_update_system() {
  # Exit if Ruby wasn't installed successfully
  [ "$STATUS" = "0" ] || return 0

  # Invoke `gem update --system` in the just-installed Ruby.
  RBENV_VERSION="$VERSION_NAME" rbenv-exec gem update --system
}
