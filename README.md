# Assignment 2 vol 2 Jens Tingstad


## Current progress:

Have currently expanded to include a predefined backend store and added support for workspaces. Storage accounts and resource group names derived from workspace. <br>

Current environment operating with develop, staging and production tiers. <br>
At this point the configurations are the same, but workflows have been initiated but does not pass as credential JSON parser is not recognizing JSON object with multiple params (will need to switch to individual secrets here). <br>

Whats missing: Current CI/CD state is not good enough, there is no pull request implementation stopping for manual input for main merge. <br>
Current test-scope to small, limited to only terraform catching defined errors, any error in actual deployment is not caught. Should expand to some simple test-suites to run as part of develop->staging workflow. <br>

I know I am very late with delivery now, (excuses on request) but I will continue to improve this delivery this week since I did not have as much time available as initially intended. 