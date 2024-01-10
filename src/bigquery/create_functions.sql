/*****************************************************************
TYPE: Function
NAME: crawled_data_raw_tb
DESCRIPTION: 
/*****************************************************************/
CREATE OR REPLACE FUNCTION `poc-project-1-410316.be_seo_analysis_ds.parse_html_fn`(html_str STRING)
RETURNS STRING
LANGUAGE js
OPTIONS (library = 'gs://bredg-web-crawl-store/bigquery-js-libs/cheerio.js')
AS r"""

let test_html = "\n\n\n\n\n\n<!DOCTYPE html>\n<html\n  lang=\"en\"\n  \n  \n  data-a11y-animated-images=\"system\" data-a11y-link-underlines=\"true\"\n  >\n\n\n\n\n  <head>\n<meta charset=\"utf-8\"><title>GitHub: Let’s build from here · GitHub</title><meta name=\"description\" content=\"GitHub is where over 100 million developers shape the future of software, together.\"></head>\n\n  <body><div id=\"js-global-screen-reader-notice-assertive\" class=\"sr-only\" aria-live=\"assertive\" aria-atomic=\"true\">test content</div>\n  </body>\n</html>"

let meta_info = {}
const html_obj = cheerio.load(html_str);

let title = html_obj('title').text();
let meta_desc = $('meta[name="description"]').attr('content');
let meta_viewport = $('meta[name="viewport"]').attr('content');
let canonical_url = $('link[rel="canonical"]').attr('href');

// Parse other tags and content and collect required attributes

return meta_info
""";

-- SELECT `poc-project-1-410316.be_seo_analysis_ds.parse_html_fn`("<html><title>fasafa</title></html>") AS tags;