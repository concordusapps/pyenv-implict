if [ -n "$PYENV_COMMAND" ] && [ ! -x "$PYENV_COMMAND_PATH" ]; then
  versions=($(pyenv-whence "${PYENV_COMMAND}" 2>/dev/null || true))
  if [ -n "${versions}" ]; then
    if [ "${#versions[@]}" -gt 2 ]; then
      echo "pyenv-implicit1: found multiple ${PYENV_COMMAND} in pyenv. Use version ${versions[0]}." 1>&2
    elif [ "${#versions[@]}" -gt 1 ]; then
      pattern0="[1-9][0-9]*\.[0-9]*\.[0-9]*/envs/${versions[0]}$"
      pattern1="[1-9][0-9]*\.[0-9]*\.[0-9]*/envs/${versions[1]}$"
      # Commands in virtualenvs are always listed twice.  Ignore this warning if both versions are the same virtualenv
      if ! [[ "${versions[0]}" =~ $pattern1 ]] && ! [[ "${versions[1]}" =~ $pattern0 ]]; then
        echo "pyenv-implicit2: found multiple ${PYENV_COMMAND} in pyenv. Use version ${versions[0]}." 1>&2
      fi
    fi
    PYENV_COMMAND_PATH="${PYENV_ROOT}/versions/${versions[0]}/bin/${PYENV_COMMAND}"
  fi
fi
