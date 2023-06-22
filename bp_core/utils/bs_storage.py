import os.path
import pickle


class BPStorage:

    @staticmethod
    def is_api_testing():
        with open('api_testing.pickle', 'rb') as handle:
            return pickle.load(handle)

    @staticmethod
    def set_api_testing(x):
        with open('api_testing.pickle', 'wb') as handle:
            pickle.dump(x, handle, protocol=pickle.HIGHEST_PROTOCOL)

    @staticmethod
    def get_env_vars_for_html():
        if os.path.exists('html_env_vars.pickle'):
            with open('html_env_vars.pickle', 'rb') as handle:
                return pickle.load(handle)
        else:
            return None

    @staticmethod
    def save_env_vars_for_html(x):
        with open('html_env_vars.pickle', 'wb') as handle:
            pickle.dump(x, handle, protocol=pickle.HIGHEST_PROTOCOL)


    @staticmethod
    def store_api_bdd_response(response):
        with open('api_bdd_response.pickle', 'wb') as handle:
            pickle.dump(response, handle, protocol=pickle.HIGHEST_PROTOCOL)


    @staticmethod
    def get_api_bdd_response():
        if os.path.exists('api_bdd_response.pickle'):
            with open('api_bdd_response.pickle', 'rb') as handle:
                return pickle.load(handle)
        else:
            return None


    @staticmethod
    def store_analytics(response):
        with open('analytics.pickle', 'wb') as handle:
            pickle.dump(response, handle, protocol=pickle.HIGHEST_PROTOCOL)


    @staticmethod
    def get_analytics():
        if os.path.exists('analytics.pickle'):
            with open('analytics.pickle', 'rb') as handle:
                return pickle.load(handle)
        else:
            return None
