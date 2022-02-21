#!/usr/bin/env python3

import iterm2, sys, os

async def main(connection):
    app = await iterm2.async_get_app(connection)
    #  os.environ["ITERM_PROFILE"] = sys.argv[1]
    #  print(os.environ["ITERM_PROFILE"])

    # Query for the list of profiles so we can search by name. This returns a
    # subset of the full profiles so it's fast.
    partialProfiles = await iterm2.PartialProfile.async_query(connection)
    # Iterate over each partial profile
    for partial in partialProfiles:
        if partial.name == sys.argv[1]:
            full = await partial.async_get_full_profile()
            #  print(full)
            await app.current_terminal_window.current_tab.current_session.async_set_profile(full)
            return

if len(sys.argv) == 2:
    iterm2.run_until_complete(main)
else:
    print("Exiting: please pass the name of an iTerm2 profile to this script.")
