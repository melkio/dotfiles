# use run-parts to source every file in the session directory; we source
# instead of executing so that the variables and functions defined above
# are available to the scripts, and so that they can pass variables to each
# other
SESSIONFILES=$(run-parts --list $SYSSESSIONDIR)
if [ -n "$SESSIONFILES" ]; then
  set +e
  for SESSIONFILE in $SESSIONFILES; do
    . $SESSIONFILE
  done
  set -e
fi

#xsetroot -solid gray

# Start Compton
exec compton --config ~/.config/i3/compton.conf -b &

# Start window manager
exec i3 > ~/.config/i3/log 2>&1
