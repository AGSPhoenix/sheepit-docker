#!/bin/bash

groupadd --gid $user_GID sheepit
useradd --no-create-home \
        --home-dir /sheep \
        --uid $user_UID \
        --gid $user_GID \
        --inactive 0 \
        sheepit
# Adding a sheepit group and user

chown sheepit:sheepit /sheep/startrenderer.sh
chmod ug+x /sheep/startrenderer.sh
chown -R sheepit:sheepit /sheep/
# Setting file and dir permissions and ownerships
# Makes sure the renderer can even operate

su --command "/sheep/startrenderer.sh" \
        --preserve-environment \
        sheepit
# Running sheepit as the configured user with the env preserved because the startrenderer script depends on it
