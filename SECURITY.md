# Security

iNir Movies ships as a single compiled executable. Application secrets
(such as third-party API keys) are not stored in plain text: they are
obfuscated and only reconstructed in memory at runtime. The interface
is compiled into a binary Qt resource bundle rather than shipped as
plain files, and the whole application is packaged into one
executable, so it is not meant to be readable or editable after
distribution.

## Reporting an issue

If you find a problem in the packaging (installer scripts, desktop
entry) rather than the app itself, please open an Issue.
For anything else, do not open a public issue; contact the maintainer
directly.
