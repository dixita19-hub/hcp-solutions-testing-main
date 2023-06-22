import os
import requests
import json
from datetime import datetime

DEFAULT_WORKFLOW_LIST = ("UK Windows Edge", "UK Mac Firefox", "UK Galaxy regression tests on GH local",
                         "US Mac Firefox", "US Windows Edge", "US Galaxy regression tests on GH local",
                         "US Medical Galaxy regression tests on GH local", "US Medical Mac Firefox",
                         "US Medical Windows Edge")
gh_token = os.environ.get("GH_TOKEN")
repo_name = os.environ.get("REPOSITORY")
workflows = os.environ.get("WORKFLOW_NAME", "")  # workflow runs are removed based on the given workflow names list
workflows = workflows if len(workflows) else DEFAULT_WORKFLOW_LIST
if isinstance(workflows, str):
    workflows = (workflows,)
dry_run = os.environ.get("DRY_RUN", "false")  # If True - no workflow runs will be removed and only logs displayed
dry_run = True if dry_run == "true" else False
HEADERS = {"Accept": "application/vnd.github+json", "Authorization": f"Bearer {gh_token}", "X-GitHub-Api-Version": "2022-11-28"}
PER_PAGE = 30  # Number of workflows per page provided by one REST API call
NOW = datetime.now()
DAYS = 14  # Remove workflow runs older than given days
REQUEST_ENDPOINT = f"https://api.github.com/repos/{repo_name}/actions/runs"

print("💬 Workflows list:")
[print("-" + workflow) for workflow in workflows]
print(f"\n💬 Dry Run: {dry_run}")


def get_workflows(endpoint):
    response_ = requests.get(endpoint, headers=HEADERS, params={"per_page": f"{PER_PAGE}"})
    if response_.status_code != 200:
        raise Exception(f"❗️ Bad request: response code: {response_.status_code}")
    total_workflow_runs = response_.json().get("total_count", None)
    if not total_workflow_runs:
        raise Exception("❗️ No workflow runs found")
    print(f"\n💬 Total workflow runs: {total_workflow_runs}")

    return response_


def get_pages_number(gh_response):
    link_header = gh_response.headers.get("Link", None)
    if link_header:
        page_url = link_header.split(",")[-1].split(";")[0][1:-1]
        last_page_number = int(page_url.split("=")[-1])
    else:
        raise KeyError("❗️ No 'Link' header in the response")
    if not page_url and not last_page_number:
        raise Exception("❗️ No pages within response found")
    return last_page_number


def filter_workflows(endpoint, page_no):
    workflow_runs = []
    print("\n💬 Collecting workflows to delete...")
    for page in range(1, page_no + 1):
        page_response = requests.get(endpoint, headers=HEADERS, params={"per_page": f"{PER_PAGE}", "page": page})
        if page_response and page_response.status_code == 200:
            page_workflow_runs = json.loads(page_response.text).get("workflow_runs", "{}")
            if page_workflow_runs:
                for workflow_run in page_workflow_runs:
                    # Conditions based on which we will select required workflows to delete
                    started_at = datetime.strptime(workflow_run['run_started_at'], "%Y-%m-%dT%H:%M:%SZ")
                    started_delta = NOW - started_at
                    if workflow_run["name"] in workflows and workflow_run["display_title"] not in workflows and started_delta.days > DAYS:
                        print(f"💬 Found workflow run: {workflow_run['id']} -- Name: {workflow_run['name']} -- Display name: {workflow_run['display_title']} -- Triggered by: {workflow_run['event']} -- {started_delta.days} days ago at: {workflow_run['run_started_at']}")
                        workflow_runs.append(workflow_run)
        else:
            raise Exception(f"❗️ Bad request: response code: {response.status_code}")

    return workflow_runs


def delete_workflows(runs):
    if runs:
        print(f"\n💬 Found {len(runs)} workflow runs to delete")
    else:
        print("\n💬 No workflow runs found...")
    for workflow_run in runs:
        run_id = workflow_run["id"]
        delete_endpoint = f"https://api.github.com/repos/{repo_name}/actions/runs/{run_id}"
        if dry_run:
            print(f"[DRY RUN] -- 💬 Workflow run: {run_id} -- workflow name: {workflow_run['name']} -- display name: {workflow_run['display_title']} skipped")
        else:
            delete_response = requests.delete(delete_endpoint, headers=HEADERS)
            if delete_response.status_code == 204:
                print(f"❎ Workflow run id: {run_id} -- workflow name: {workflow_run['name']} -- display name: {workflow_run['display_title']} deleted successfully.")
            else:
                print(f"⚠️ Failed to delete workflow run with status code {response.status_code}: {response.text}")
    if not dry_run:
        print(f"\n💬 Deleted: {len(runs)} workflow runs")


# execute
response = get_workflows(REQUEST_ENDPOINT)
last_page_no = get_pages_number(response)
workflow_runs_to_delete = filter_workflows(REQUEST_ENDPOINT, last_page_no)
delete_workflows(workflow_runs_to_delete)
