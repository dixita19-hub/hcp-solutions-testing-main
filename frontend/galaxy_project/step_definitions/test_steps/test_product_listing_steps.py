import os

from pytest_bdd import scenarios
from frontend.galaxy_project.step_definitions.shared_steps.common_steps import *
from bp_core.plugin import PROJECT_DIR

scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/product_listing/product_listing_uk.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/product_listing/product_listing_us.feature"))
