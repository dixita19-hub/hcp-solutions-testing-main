import os

from pytest_bdd import scenarios
from frontend.galaxy_project.step_definitions.shared_steps.common_steps import *
from bp_core.plugin import PROJECT_DIR

scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/unified_cart/us_samples/unified_cart_us.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/unified_cart/us_samples/samples_error_pages_us.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/unified_cart/us_samples/samples_order.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/unified_cart/us_samples/samples_esig.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/unified_cart/us_materials/materials_order.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/unified_cart/us_materials/materials_shipping_us.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/unified_cart/us_materials/materials_order_non_validated.feature"))
scenarios(os.path.join(PROJECT_DIR,"frontend/galaxy_project/features/unified_cart/us_order_history/us_order_history.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/unified_cart/uk_materials/materials_order_uk.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/unified_cart/uk_materials/materials_order_non_validated_uk.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/unified_cart/uk_materials/materials_shipping_uk.feature"))



