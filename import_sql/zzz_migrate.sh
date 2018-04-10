#!/bin/sh
QUERY1="UPDATE ${TABLE_PREFIX}_options SET option_value = REPLACE(option_value, '//$OLD_SITE_URL$SUB_DIR', '//$NEW_SITE_URL') WHERE option_name = 'home' OR option_name = 'siteurl';"
QUERY2="UPDATE ${TABLE_PREFIX}_posts SET post_content = REPLACE (post_content, '//$OLD_SITE_URL$SUB_DIR', '//$NEW_SITE_URL');"
QUERY3="UPDATE ${TABLE_PREFIX}_postmeta SET meta_value = REPLACE (meta_value, '//$OLD_SITE_URL$SUB_DIR','//$NEW_SITE_URL');"
QUERY4="UPDATE ${TABLE_PREFIX}_comments SET comment_content = REPLACE (comment_content, '//$OLD_SITE_URL$SUB_DIR', '//$NEW_SITE_URL');"
QUERY5="UPDATE ${TABLE_PREFIX}_comments SET comment_author_url = REPLACE (comment_author_url, '//$OLD_SITE_URL$SUB_DIR','//$NEW_SITE_URL');"
echo $QUERY1$QUERY2$QUERY3$QUERY4$QUERY5 
mysql -u root -p$MYSQL_ROOT_PASSWORD wordpress -vBse "$QUERY1$QUERY2$QUERY3$QUERY4$QUERY5"