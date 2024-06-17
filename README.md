# Loki Action

This GitHub Action synchronizes issues from JIRA to a specified GitHub repository using [Loki](https://github.com/aurora-labs-42/loki).

## Usage

To use this action, add the following step to your GitHub Actions workflow:

```yaml
- name: loki-sync-jira-to-github
  uses: aurora-labs-42/loki-action@0.0.3               
  with:
    from-jira: "<JIRA_BASE_URL>"
    to-repo: "<GITHUB_REPOSITORY>"
    jql: "<JIRA_QUERY_LANGUAGE>"
  env:
    GITHUB_ACCESS_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    JIRA_ACCESS_TOKEN: ${{ secrets.JIRA_ACCESS_TOKEN }}
```

### Parameters

- **from-jira**: The base URL of your JIRA instance where issues are located. Example: `"<JIRA_BASE_URL>"`
- **to-repo**: The GitHub repository where the JIRA issues will be synchronized. Example: `"<GITHUB_REPOSITORY>"`
- **jql**: The JIRA Query Language (JQL) statement to filter and find the issues to be synchronized. Example: `"<JIRA_QUERY_LANGUAGE>"`

### Environment Variables

- **GITHUB_ACCESS_TOKEN**: The GitHub access token to authenticate the action. This should be stored as a secret in your GitHub repository. Example: `${{ secrets.GITHUB_TOKEN }}`
- **JIRA_ACCESS_TOKEN**: The JIRA access token to authenticate the action. This should be stored as a secret in your GitHub repository. Example: `${{ secrets.JIRA_ACCESS_TOKEN }}`

### Example Workflow

Here's an example of a complete GitHub Actions workflow using this action:

```yaml
name: Sync JIRA Issues to GitHub

on:
  schedule:
    - cron: '0 * * * *'  # Runs every hour

jobs:
  sync-issues:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Get repository name
      id: repo-name
      run: echo "::set-output name=name::$(basename $GITHUB_REPOSITORY)"

    - name: loki-sync-jira-to-github
      uses: aurora-labs-42/loki-action@0.0.3
      with:
        from-jira: "<JIRA_BASE_URL>"
        to-repo: "<GITHUB_REPOSITORY>"
        jql: "<JIRA_QUERY_LANGUAGE>"
      env:
        GITHUB_ACCESS_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        JIRA_ACCESS_TOKEN: ${{ secrets.JIRA_ACCESS_TOKEN }}
```

### Notes

- Ensure that the `GITHUB_ACCESS_TOKEN` and `JIRA_ACCESS_TOKEN` are added to your repository secrets.
- Modify the `jql` parameter to suit your specific requirements for filtering JIRA issues.

## Contributing

If you have any questions or feedback, feel free to open an issue or submit a pull request.
