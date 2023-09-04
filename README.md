# Renovate - Hands On Tutorial

## Introduction

Welcome to the Renovate hands-on tutorial.

This tutorial is based on the Mend Renovate App.
You can also run Renovate as a CLI tool or a self-hosted application.

> **Note**
> Although this tutorial is based on the Mend Renovate App, the concepts discussed apply to all environments.

In this tutorial, you will learn how to configure Renovate and become familiar with some of the basic features.

What you will learn:

1. Installation
2. Onboarding
3. Getting to know Renovate’s update PRs
4. Dependency Dashboard 

We will begin this tutorial with configuring and installing the Mend Renovate App and an overview of the default settings and basic functionalities. 

Later, we will dive deeper into functional use-cases, advanced features, and `best practices` so you'll know how to leverage Renovate to its fullest.

## Part 1 - Installation

Let’s start by forking the tutorial repo to your account, installing the Mend Renovate App, and configuring it to your repo.
 
1. Make sure you are logged in to GitHub.com
1. Fork this repository. The tutorial instructions will be based on its contents.
1. The following instructions are directed at those that don’t have the Mend Renovate App installed:
    - Install the Mend Renovate App to your account by navigating to
      the [the Mend Renovate App installation page](https://github.com/apps/renovate) and select Install:
      ![image](/assets/app-installation-page.png)
1. If you do have the Mend Renovate App installed:
    - navigate to [the Mend Renovate App](https://github.com/apps/renovate) and select configure:
      ![image](/assets/app-configure-page.png)
1. You will reach an installation configuration page where you are asked to configure Repository Access.

> **Note**
> for existing users, installation configuration appears at the bottom of the page.

   - Mark `Only select repositories` and make sure to select the forked RenovateTutorial repo
   
       > **Note**
       > each selected repo gets an onboarding PR. 

       If you select `All repositories`, forked repos will be skipped by default (including RenovateTutorial). 
   - Click on `Install` (“Save” for existing users)

<img width="629" alt="configuration page" src="/assets/select-repositories-page.png">

For new installs:

- You will be redirected to our “Thank you for installing Renovate” page while we are setting up your account. 

![image](/assets/post-install-thank-you-page.png)

- After a few seconds, you will be automatically redirected to the Mend's developer portal where you can sign in and view the Renovate logs. We recommend saving this [link](https://developer.mend.io) for future use.

<img width="600" alt="sign in page" src="/assets/sign-in-page.png">

**Congratulations! You have successfully installed Renovate to your account.** 🎈

## Part 2 - Onboarding

Now you have installed the Mend Renovate App, we can begin onboarding.

Let’s review the concepts of the Onboarding PR and learn about Renovate’s initial settings.

> **Note**
> For your convenience, Renovate will not make any changes to your repo or raise PRs until after you finish onboarding.

- Upon installing Renovate, an onboarding PR will be automatically generated.
- This PR is there to help you understand Renovate and its default settings before Renovate starts running on your repository.
- The Onboarding PR creates a configuration file called `renovate.json`, which contains Renovate’s default settings and can be modified during onboarding.

Let’s review the onboarding PR:

1. Navigate to the `Pull Requests` section in GitHub, and open the newly generated PR - `Configure Renovate`

<img width="1500" alt="onboarding PR" src="/assets/onboarding-pr.png">

<img width="935" alt="onboarding content" src="/assets/onboarding-pr-content.png">

#### The onboarding PR contains:

   - **Detected Package Files** - All package files detected by Renovate in your code.
   - **Configuration Summary** - The default configuration settings that will be applied.
   - **What to Expect** - The dependency update PRs that Renovate is about to automatically create.
   - The link to Renovate’s official [documentation](https://docs.renovatebot.com/).
   - The link to review jobs logs in the [Renovate dashboard](https://app.renovatebot.com/dashboard).
   
> **Note**
> Renovate will not create dependency update PRs until the onboarding PR will be merged.

#### These are some of the default configurations of Renovate:

   - Enables creation of the “Dependency Dashboard” - a dashboard that shows an overview of the state of your repositories' dependencies.
   - PRs will be created at a rate of 2 PRs per hour.
   - The limit of simultaneous open Renovate PRs is set to 10.
   - Renovate automatically groups known monorepo packages to a single PR (example can be seen in the `date-io` PR under the **what to expect** section).

Renovate offers the ability to change configurations before merging the onboarding PR as well as preview the results of these changes.
At this point, Renovate has created a branch called renovate/configure which contains the `renovate.json` configuration file.
By default, Renovate limits branch creation to 2 per hour:

<img width="829" alt="onboarding warning hourly" src="/assets/onboarding-hourly-warning.png">

Example

As a user, despite Renovate’s suggestion to limit hourly PR creation to 2, we might want to increase the limit to a different number.
Let’s try changing this hourly limitation to 3:

1. Go to the newly created branch - `renovate/configure`:

<img width="763" alt="new branch" src="/assets/new-branch.png">

2. Go into the `renovate.json` file:

![image](/assets/project-root-renovate-json.png)

3. Add the following code segment:

```json
{
  "prHourlyLimit": 3
}
```

<img width="591" alt="change in config 1" src="/assets/change-in-config-1.png">

4. Commit the changes
5. Revisit the onboarding PR and notice how the onboarding PR automatically updates to reflect the changes you made to the configuration 

<img width="830" alt="onboarding warning hourly update" src="/assets/updated-onboarding-hourly-warning.png">

> **Note**
> May take a few moments to update.

6. Merge the onboarding pull request.

**Congratulations! You have successfully onboarded Renovate.** 🎈

## Part 3 - Getting to know Renovate’s update PRs

Now that you have merged the onboarding PR, Renovate will generate Update PRs to the most recent dependency version based on your configuration. 

> **Note**
> PRs may take a couple of minutes to appear

Here we will review the basic concepts of Renovate update PRs and merge it.

- By default, Renovate will create up to 2 update PRs per hour. However, if you completed the onboarding section of this tutorial, Renovate will now create 3 PRs.
- You should already see notifications for these pull requests in the `Pull Requests` section of the repo.

Let’s go ahead and take a look at a Renovate update PR:
1. Navigate to the `Pull requests` section and open - `Update dependency lodash to x.y.z`

<img width="1256" alt="open PRs" src="/assets/open-renovate-prs.png">

### Each update PR contains:

- Dependency information (name and version changes)
- [Merge Confidence](https://docs.renovatebot.com/merge-confidence/) values
- Up-to-date release notes
- Renovate configuration-related info
- Option to rebase PR
- Link to view Renovate logs

![image](/assets/dep-update-pr.png)

- Renovate’s update PRs will update the relevant dependency across your entire repo. In our RenovateTutorial repo, this will be both the `package.json` file and the `package-lock.json` file:

<img width="1488" alt="file diff lodash" src="/assets/git-diff-open-renovate-pr.png">

1. Merge this pull request

> **Note**
> Renovate is highly configurable and supports:
>
> - On-demand PR creation.
> - Automatic merging of PRs.
> - Settings for specific dependencies/package managers.
> - Scheduling.
> - Grouping. 
>
>  All the above and more will be discussed in future parts of the tutorial.

**Congratulations! You have now updated your first dependency with Renovate.** 🎈

## Part 4 - Dependency Dashboard

Renovate’s Dependency Dashboard is a GitHub Issue that enables you to manage and monitor Renovate’s activity in your repo.
In this section, we will go over some of its main functionalities and capabilities.

Let’s begin by creating and enabling the Dependency Dashboard.
Since GitHub defaults to disable `issues` on forked repositories, we need to enable it on the forked RenovateTutorial repo:

1. Go to the main page of the repo
1. Go to `settings` -> `general`
1. Check the `issues` checkbox under the Features section:

<img width="1284" alt="issues settings" src="/assets/github-issues-configuration.png">

- In order for the Dependency Dashboard to become available, we will need to re-run Renovate by triggering a webhook (for example, closing an update PR).
  
> **Note**
> This is usually done in a click via the Dependency Dashboard.

1. Go to the `Pull requests` section
2. Select `Update dependency php to v8.1` and select `Close pull request`

<img width="927" alt="close php" src="/assets/close-renovate-pr.png">

3. This will trigger Renovate to run and the Dependency Dashboard will appear under the `Issues` section - navigate to it

> **Note**
> It may take a minute to appear.

### The Dependency Dashboard includes:
  - Overview of all updates that are still to-do:

    - **Open** PRs
    - **Rate Limited** - PRs blocked by rate limit setting and will be opened based on preferences.
    - **Pending Approval** - PRs that require manual triggering based on configurations.
    - **Awaiting Schedule** - PRs creation blocked by Renovate scheduling settings.
    - **Pending Status Checks** - updates that await pending status checks in order to be created.

- Visibility into **rejected/deferred updates**.
- List of all the **detected dependencies** and **package managers** in your repository.

  <img width="942" alt="dependency dashboard" src="/assets/dependency-dashboard.png">

Users can manually trigger the creation of dependency updates directly from the dashboard. 

You can also re-run Renovate manually from the Dependency Dashboard by enabling the “Check this box to trigger a request Renovate to run again on this repository” option:

 <img width="867" alt="rerun renovate" src="/assets/request-rebase.png">

Let’s dive into one of the Dependency Dashboard capabilities - **the Pending Approval feature**.

Say we want to take extra measures before updating major versions of a package (either to reduce noise or to handle it more carefully).
Renovate offers an option to prevent automatic creation of major version update PRs and create such PRs only upon manual request from the Dependency Dashboard.

In the Dependency Dashboard, under the `Rate Limited` section, the `Update dependency commander to vX` is waiting to be created.

> **Note**
> Based on the previously set `prHourlyLimit` configuration, 3 PRs per hour in our case, this PR will be created within an hour.

<img width="928" alt="commander in Rate Limited" src="/assets/rate-limited.png">

Since we decided that we want to handle it manually, we will edit configurations and see how the Dependency Dashboard is affected by this change. 

In order to limit all `major` updates to on-demand creation:

1. Add this code segment to your `renovate.json` file:
```json
"packageRules": [
    {
      "matchUpdateTypes": ["major"],
      "dependencyDashboardApproval": true
    }
  ]
```

<img width="924" alt="change in config - pending approval" src="/assets/pending-approval-config.png">

2. Commit the changes

> **Note**
> Changing the `renovate.json` configuration file is a webhook that triggers Renovate to re-run.

3. Now go back to the Dependency Dashboard in the Issues section
4. As you can see, `commander` major update PR now appears under the **Pending Approval** section and **will not** be opened unless manually triggered

     > **Note**
     > it may take a minute to complete Renovate's run 

<img width="926" alt="commander in pending approval" src="/assets/pending-approval-dashboard.png">

5. You can now decide to manually open this PR by checking the box next to it
6. Navigate to the `Pull requests` section to review the generated PR and merge it to the repo.

**Congratulations! You are now familiar with Renovate’s Dependency Dashboard.** 🎈

## What you learned:

- How to install Renovate
- Onboarding Renovate by reviewing, configuring, and merging the onboarding PR
- How to update a dependency with Renovate
- How to utilize the Dependency Dashboard
  
### General Comments:

- Granting access to all repositories or change repo selections can be modified at any time on the [the Mend Renovate App GitHub page](https://github.com/apps/renovate).
- Renovate configuration can be modified by manual configurations, global organization configurations and existing Renovate presets.

### Congratulations!

You have successfully completed Renovate’s hands-on tutorial and have taken your first steps to automate dependency updates in your projects.
Now, it's time to configure Renovate on the rest of your repositories and let Renovate manage your dependencies' health.

### Upcoming Tutorials:

We're working on more advanced Renovate tutorials and will post updates when we publish new tutorials.

What’s coming next:

- Merge confidence
- Auto Merge
- Labeling
- Grouping
- Schedule
- Package Rules
- GitHub Actions
- PR Assignees and PR reviewers
- Regex Managers
