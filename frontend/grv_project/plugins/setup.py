from setuptools import setup

NAME = "pytest-enhanced-reports"
VERSION = "1.2.2"

INSTALL_REQUIRES = [
    "selenium",
    "pytest",
    "pytest-bdd",
    "python-dotenv",
    "Pillow",
    "wrapt",
    "opencv-python",
]

setup(
    name=NAME,
    version=VERSION,
    description="Enhanced test reports for pytest",
    long_description="A enhanced-allure-report to improve allure report by adding screenshots, videos, browser's "
    "outputs",
    author="Muhammad Ibrahim",
    author_email="muhammad.ibraheem@pfizer.com",
    license="MIT",
    packages=["enhanced_reports", "enhanced_reports.report_libs"],
    install_requires=INSTALL_REQUIRES,
    entry_points={"pytest11": ["enhanced_reports = enhanced_reports.core"]},
    classifiers=["Framework :: Pytest"],
)
