
QUERY = "UPDATE ${TABLE_PREFIX}_options SET option_value = REPLACE(option_value, '//${OLD_SITE_URL}', '//${NEW_SITE_URL}') WHERE option_name = 'home' OR option_name = 'siteurl';"
QUERY += "UPDATE ${TABLE_PREFIX}_posts SET post_content = REPLACE (post_content, '//${OLD_SITE_URL}', '//${NEW_SITE_URL}');"
QUERY += "UPDATE ${TABLE_PREFIX}_postmeta SET meta_value = REPLACE (meta_value, '//${OLD_SITE_URL}','//${NEW_SITE_URL}');"
QUERY += "UPDATE ${TABLE_PREFIX}_comments SET comment_content = REPLACE (comment_content, '//${OLD_SITE_URL}', '//${NEW_SITE_URL}');"
QUERY += "UPDATE ${TABLE_PREFIX}_comments SET comment_author_url = REPLACE (comment_author_url, '//${OLD_SITE_URL}','//${NEW_SITE_URL}');"
QUERY += "UPDATE ${TABLE_PREFIX}_posts SET guid = REPLACE (guid, '//${OLD_SITE_URL}', '//${NEW_SITE_URL}') WHERE post_type = 'attachment';"

echo $QUERY
mysql -u root -p$MYSQL_ROOT_PASSWORD wordpress -Bse "${QUERY}"