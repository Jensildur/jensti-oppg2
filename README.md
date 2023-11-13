# Assignment 2 vol 2 Jens Tingstad


## Current progress:

Have currently expanded to include a predefined backend store and added support for workspaces.
Storage accounts and resource group names derived from workspace. <br>

Current environment operating with develop, staging and production tiers. <br>
Configurations are working and credentials are updated to match ARM configuration. <br>
Assignment-1 Modules have been updated to handle multiple workspaces, and main branch has been locked for automatic merge.<br>
<br>

Currently we are operating with 3 different workspaces, mirroring three git-branches:

1. Develop:
   1. Used for development where feature, or personal dev-branches are to be deployed after merge by developer/team-lead.
2. Staging:
   1. Meant to be used for testing, after a feature is passed development it is merged to staging where required test-suites are run. If test results are acceptable, a merge request is created to main
3. Main
   1. Final step in the development pipeline - Production , should hold the "latest and greatest" source and deployments. 





Whats missing: Current CI/CD state is not good enough, there is no pull request implementation stopping for manual input for main merge. <br>
Current test-scope to small, limited to only terraform catching defined errors, any error in actual deployment is not caught. Should expand to some simple test-suites to run as part of develop->staging workflow. <br>

I know I am very late with delivery now, (excuses on request) but I will continue to improve this delivery this week since I did not have as much time available as initially intended. 