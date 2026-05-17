CREATE OR REPLACE FILE FORMAT csv_format
TYPE = CSV
FIELD_DELIMITER = ','
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
SKIP_HEADER = 1
EMPTY_FIELD_AS_NULL = TRUE
NULL_IF = ('NULL', 'null', '')
ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;

CREATE OR REPLACE STORAGE INTEGRATION s3_integration
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::<aws-account-id>:role/<snowflake-s3-role-name>'
STORAGE_ALLOWED_LOCATIONS = ('s3://<your-bucket-name>/source/');

CREATE OR REPLACE STAGE snowstage
URL = 's3://<your-bucket-name>/source/'
STORAGE_INTEGRATION = s3_integration
FILE_FORMAT = csv_format;

COPY INTO raw_listings
FROM @snowstage
FILES = ('listings.csv')
ON_ERROR = CONTINUE;

COPY INTO raw_neighbourhoods
FROM @snowstage
FILES = ('neighbourhoods.csv')
ON_ERROR = CONTINUE;

COPY INTO raw_reviews
FROM @snowstage
FILES = ('reviews.csv')
ON_ERROR = CONTINUE;

COPY INTO raw_reviews_all
FROM @snowstage
FILES = ('reviews_All.csv')
ON_ERROR = CONTINUE;