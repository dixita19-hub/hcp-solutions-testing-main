import json
import os
from collections import deque
from glob import glob


class Analytics:

    def __init__(
        self,
        delimiter: str = " > "
    ):
        self.analytics_files = self.get_analytics_files()
        self.loaded_analytics = self.load_analytics()
        self.delimiter = delimiter

    @staticmethod
    def get_analytics_files():
        analytics_path = []
        analytics_files = []
        analytics_base_path = os.getcwd()
        analytics_path.extend(glob(analytics_base_path + "/**/analytics", recursive=True))
        for folder_path in analytics_path:
            for subdir, dirs, files in os.walk(folder_path):
                for file in files:
                    file_path = os.path.join(subdir, file)
                    analytics_files.append(file_path)
        return analytics_files

    @staticmethod
    def load_data_file(file_path: str):
        if file_path.endswith(".json"):
            with open(file_path, encoding='utf-8') as file:
                return json.load(file)

    def load_analytics(self):
        analytics_dict = dict()
        for file in self.analytics_files:
            analytics_dict.update(self.load_data_file(file))
        if not analytics_dict:
            raise Exception("Analytics files are missing!")
        return analytics_dict

    def parse_and_get(self, analytics_key: str):
        keys = deque(analytics_key.split(self.delimiter))
        analytics = self.load_analytics().get(keys.popleft())
        while keys:
            if analytics is None:
                raise Exception(f"The hierarchy path '{analytics_key}' is not present in the Analytics json files")
            analytics = analytics.get(keys.popleft())
        return analytics
