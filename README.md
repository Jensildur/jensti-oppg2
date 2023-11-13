# Assignment 2 vol 2 Jens Tingstad


## Current state:

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



## CI/CD pipeline

Current CI/CD workflow works like this: 

1. Development branch is updated with new source or new infrastructure code.
2. Branch is pushed to github repository
3. Two hooks notice activity and two workflows are started:
   1. Validate, runs terraform validation (validate, fmt)
   2. Workspace workflow initiates, creating and deploying configuration matching the workspace specification (ensures the infrastructure code actually works).
4. Branch is the merged to staging
   1. In theory this is where more strategic testing happend, but none is implemented. This would be; unit testing, regression testing, manual inspections, etc.
5. Assuming tests passed:
   1. Create a pull request to main
      1. Must be manually approved
6. Created a workflow for destroying azure resources which is **manually invoked** when needed


**Whats missing:**<br>
- More in-depth testing and development on different workflow configs. 
- Would have liked to experiment with different branches and non-defaul entrypoints. 
- More complex webpages (IaC would be same...)
- Different Azure resource deployments
