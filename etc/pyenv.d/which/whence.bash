if [ -n "$PYENV_COMMAND" ] && [ ! -x "$PYENV_COMMAND_PATH" ]; then
  versions=($(pyenv-whence "${PYENV_COMMAND}" 2>/dev/null || true))
  if [ -n "${versions}" ]; then
    if [ "${#versions[@]}" -gt 1 ]; then
      echo "pyenv-implicit: found multiple ${PYENV_COMMAND} in pyenv. Use version ${versions[-1]}." 1>&2
    fi
    PYENV_COMMAND_PATH="${PYENV_ROOT}/versions/${versions[-1]}/bin/${PYENV_COMMAND}"
  fi
fi
