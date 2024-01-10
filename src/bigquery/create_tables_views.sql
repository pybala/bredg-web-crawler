/*****************************************************************
TYPE: Table
NAME: crawled_data_raw_tb
DESCRIPTION: 
/*****************************************************************/
CREATE TABLE IF NOT EXISTS `poc-project-1-410316.be_seo_analysis_ds.crawled_data_raw_tb`
(
	domain				STRING,
	url					STRING,
	response_code		INT64,
	content_length 		INT64,
	is_html 			BOOL,
	response_body 		STRING,
	response_header 	STRING,
	crawl_duration		INT64,
	crawled_ts 			STRING,
	crawl_date 			DATE DEFAULT CURRENT_DATE(),
	created_at 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)
-- PARTITION BY <ingestion date>
-- CLUSTER BY <domain cleansed>
;


/*****************************************************************
TYPE: Table
NAME: web_cleansed_tb
DESCRIPTION: 
/*****************************************************************/
CREATE TABLE IF NOT EXISTS `poc-project-1-410316.be_seo_analysis_ds.web_cleansed_tb`
(
	domain_id			STRING,
	url_id				STRING,
	domain				STRING,
	url					STRING,
	site_category_id	STRING,

	crawl_date 			DATE DEFAULT CURRENT_DATE(),
	created_at 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)
;


/*****************************************************************
TYPE: Table
NAME: site_attr_store_tb
DESCRIPTION: 
/*****************************************************************/
CREATE TABLE IF NOT EXISTS `poc-project-1-410316.be_seo_analysis_ds.site_attr_store_tb`
(
	domain_id			STRING,
	url_id				STRING,
	attr_type			STRING, -- meta ENUM(core, meta)
	attr_key			STRING,
	attr_val			STRING,
	created_at 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	updated_at 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)
;


/*****************************************************************
TYPE: Table
NAME: site_categories_tb
DESCRIPTION: 
/*****************************************************************/
CREATE TABLE IF NOT EXISTS `poc-project-1-410316.be_seo_analysis_ds.site_categories_tb`
(
	category_id			INT64,
	category_name		STRING,
	parent_id			STRING,
	created_at 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	updated_at 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)
;


/*****************************************************************
TYPE: Table
NAME: brands_tb
DESCRIPTION: 
/*****************************************************************/
CREATE TABLE IF NOT EXISTS `poc-project-1-410316.be_seo_analysis_ds.brands_tb`
(
	brand_id			INT64,
	brand_name			STRING,
	created_at 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	updated_at 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)
;
