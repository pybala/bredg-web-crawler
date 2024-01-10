import re

class CommonUtil:

    @staticmethod
    def get_gcs_path_info(gcs_loc):
        path_info = re.search('gs://([a-z0-9-_\.]+)/(.*)', gcs_loc)

        return {
            'bucket': path_info[1],
            'blob': path_info[2]
        }
