## Intro
This repo is intended to accompany the Join 2019 presentation 'Programmatically generation of LookML for Flexible Schemas

----
> Associated Libraries and Dependencies?
This library primarily uses the two LookML Generators [lookml](https://github.com/llooker/lookml),  [lkml](https://github.com/joshtemple/lkml) written by Josh Temple and [Henry](https://pypi.org/project/henry/#henry-a-looker-cleanup-tool) a lookml cleanup command line tool.

----
## Code Samples
These example code samples and outputs are meant to illustrate potential workflows that can exist when programatically generating LookML code for deployment to a Looker Instance.

####Example Snippets
1. Basic view generation using lookml library
2. Abstracting a custom analysis, in this case period over period analysis
3. Creating a  custom template from an api call to the information schema with hidden fields, extension required
4. EAV transformation using a derived table and api call to the information schema, with associated field level permissioning
5. LookML pruner assuming using Henry and lkml
