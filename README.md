# Vivaldi Sync Preferences (linux only)

# Use Case
I use a _lot_ of profiles, largely to keep my multiple work environments separate from one another.  I also have a 2-3 different machines that I typically work from.  

Vivaldi Sync does not support synchronizing certain key preferences, which means each time I create a new profile, I have to adjust the toolbars, web panels, etc. to my preferences.
Then, I have to do it again on each of the different machines I use.  I find this extremely annoying, thus VSP was born.

VSP assumes you have configured one profile "perfectly" and want to make all other profiles look like that one.  This defaults to your Default profile, but you can 
override that either via a command line flag (-M) or via the $master_profile variable in the script itself.

# Usage

vsp will update vivaldi-specific preferences, which are not currently supported by Vivaldi sync.

***close out of vivaldi before running this script or it may (will) overwrite your changes***

Currently supports:

* navigation toolbar
* panels toolbar
* custom web panels in the panel toolbar

```
Usage: vsp [-s] [-v] [-M <value>]

Options:

  -s           Run silently, with no confirmation
  
  -M <value>   Use this vivaldi profile as the master profile (overrides $master_profile in script)
  
  -v           Be verbose
```
vsp will pull the key value for the selected Preferences from the master profile,
as defined by -M <path> or by $master_profile in the script itself.

The master profile defaults to ~/.config/vivaldi/Default

Dependencies: [jq](https://jqlang.github.io/jq/) - the command-line JSON processor

# TODO
* Currently, this only works using a master profile.  Thus, it won't work to port preferences to a different machine.  I will be adding this functionality.
* Vivaldi appears to aggressively update the Preferences file when it is running.  I will eventually add the ability to detect if vivaldi is running and remind you to close it before updating profiles.
* It only supports specific preferences - largely the ones I care about.  If you care about others, let me know.  If there's enough demand, I will add them.
* Currently, it's all or nothing.  You either take all supported preferences from the master profile or you take none of them.  Not sure I plan to change this, honestly.  How many people really want a consistent navigation toolbar, but different panel toolbars?  If this really triggers you, you can fairly easily cobble this together by commenting lines out in the script.  It's not complicated.

# NOT_TODO
* port this to other platforms.  It should work on MacOS with limited tweaking (mostly to directory paths) and it *may* work on Windows with WSL installed (along with the same path tweaking), but I'm not planning to do that work.  You're welcome to do so if you'd like.

# Additional information
I had a hard time getting clear information on how Vivaldi stores its preferences.  So, for others who may be in the same boat:

* By default, Vivaldi stores almost all of its preferences in ~/.config/vivaldi/<profile dir>/Preferences
* Preferences is an unformatted JSON file
* Most (all?) of the vivaldi-specific preferences are stored under the .vivaldi key
* jq is your friend in terms of reading, modifying and deleting these values.  Don't try to use sed, awk, etc.  Just don't.
* Visual Studio Code will help you format this file easily (ctrl-shift-I)
* vim will help you format this file easily if you also have jq installed (:%!jq)
* I suspect this script would work well with minor modifications on any chromium-based browser - you're welcome to give it a go if you'd like.

# LICENSE
MIT, though an optional credit in any derivatives would be appreciated.
