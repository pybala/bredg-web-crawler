import json
import aiohttp
import asyncio
import functions_framework
from google.cloud import storage

from utils import CommonUtil
#TODO: cloud storage helpers
#TODO: bigquery helpers


#TODO: Put all the methods in app related classes, keep main clean

async def read_web_page(session, url):
    async with session.get(url) as resp:
        status = resp.status
        headers = resp.raw_headers
        resp_body = await resp.text()
        
        #resp.status
        return {
            'body': resp_body,
            'code': status,
            'headers': headers
        }


async def crawl_web_async(urls_list):

    async with aiohttp.ClientSession() as session:

        tasks = []
        for url in urls_list:
            tasks.append(asyncio.ensure_future(read_web_page(session, url)))

        results = await asyncio.gather(*tasks)
        
        return results


def format_response(web_response):
    pass


            
@functions_framework.http
def app_main(request):

    request_json = request.get_json(silent=True)
    return_resp = {
        'status': 'success',
        'message': None
    }
    gcs_urls_loc = None
    ip_bucket = None
    ip_blob = None

    if request_json and 'ip_urls_gcs_path' in request_json:
        gcs_urls_loc = request_json['ip_urls_gcs_path']

    if not gcs_urls_loc:
        return_resp['status'] = 'failed'
        return_resp['message'] = 'Invalid path: ip_urls_gcs_path'
    
    gcs_path_info = CommonUtil.get_gcs_path_info(gcs_loc=gcs_urls_loc)
    
    #responses = asyncio.run(crawl_web_async(urls_list))

    urls_list1 = [
        "https://www.amazon.com/Cuisinart-CPT-122-Compact-2-Slice-Toaster/dp/B009GQ034C/ref=sr_1_1?s=kitchen&ie=UTF8&qid=1431620315&sr=1-1&keywords=toaster",
        "https://blog.rei.com/camp/how-to-introduce-your-indoorsy-friend-to-the-outdoors/",
        "https://www.cnn.com/2013/06/10/politics/edward-snowden-profile/"
    ]
    
    urls_list = [
        "https://www.amazon.com/Cuisinart-CPT-122-Compact-2-Slice-Toaster/dp/B009GQ034C/ref=sr_1_1?s=kitchen&ie=UTF8&qid=1431620315&sr=1-1&keywords=toaster"
    ]
    responses = asyncio.run(crawl_web_async(urls_list))
    
    #out = responses[0]['headers']

    return responses
