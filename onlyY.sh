awk '/ Y / {print $7,$9,$13;}' log.log | sed 's/simpledla(\([0-9]*,[0-9]*\))(.*)/\1/'
