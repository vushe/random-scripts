spotify_config=$HOME/.config/spotify/

grep -v 'app.window.position.saved' $spotify_config/prefs > $spotify_config/prefs_tmp
mv $spotify_config/prefs_tmp $spotify_config/prefs