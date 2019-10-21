FROM postgres:9.6
COPY ./common_oltp/01_common_oltp_main_schema.sql /docker-entrypoint-initdb.d/01_01_common_oltp_main_schema.sql
COPY ./common_oltp/02_common_oltp_data_setup.sql /docker-entrypoint-initdb.d/02_02_common_oltp_data_setup.sql
COPY ./common_oltp/03_common_oltp_constraints_and_indexes.sql /docker-entrypoint-initdb.d/03_03_common_oltp_constraints_and_indexes.sql
COPY ./common_oltp/04_common_oltp_synonyms_procedures_and_triggers.sql /docker-entrypoint-initdb.d/04_04_common_oltp_synonyms_procedures_and_triggers.sql
COPY ./common_oltp/05_common_oltp_test_data.sql /docker-entrypoint-initdb.d/05_05_common_oltp_test_data.sql
COPY ./tcs_catalog/01_tcs_catalog_main_schema.sql /docker-entrypoint-initdb.d/06_01_tcs_catalog_main_schema.sql
COPY ./tcs_catalog/02_tcs_catalog_data_setup.sql /docker-entrypoint-initdb.d/07_02_tcs_catalog_data_setup.sql
COPY ./tcs_catalog/03_tcs_catalog_constraints_and_indexes.sql /docker-entrypoint-initdb.d/08_03_tcs_catalog_constraints_and_indexes.sql
COPY ./jive/01_jive_main_schema.sql /docker-entrypoint-initdb.d/09_01_jive_main_schema.sql
COPY ./jive/02_jive_data_setup.sql /docker-entrypoint-initdb.d/10_02_jive_data_setup.sql
COPY ./jive/03_jive_constraints_and_indexes.sql /docker-entrypoint-initdb.d/11_03_jive_constraints_and_indexes.sql
COPY ./jive/04_jive_synonyms_procedures_and_triggers.sql /docker-entrypoint-initdb.d/12_04_jive_synonyms_procedures_and_triggers.sql
COPY ./informixoltp/01_informixoltp_main_schema.sql /docker-entrypoint-initdb.d/13_01_informixoltp_main_schema.sql
COPY ./informixoltp/02_informixoltp_data_setup.sql /docker-entrypoint-initdb.d/14_02_informixoltp_data_setup.sql
COPY ./informixoltp/03_informixoltp_constraints_and_indexes.sql /docker-entrypoint-initdb.d/15_03_informixoltp_constraints_and_indexes.sql
COPY ./informixoltp/04_informixoltp_synonyms_procedures_and_triggers.sql /docker-entrypoint-initdb.d/16_04_informixoltp_synonyms_procedures_and_triggers.sql
COPY ./informixoltp/05_informixoltp_test_data.sql /docker-entrypoint-initdb.d/17_05_informixoltp_test_data.sql
      # The script '04_tcs_catalog_synonyms_procedures_and_triggers.sql' depends on tables from 'jive', 'informixoltp' and 'corporate_oltp' and should be executed later.
COPY ./tcs_catalog/04_tcs_catalog_synonyms_procedures_and_triggers.sql /docker-entrypoint-initdb.d/18_04_tcs_catalog_synonyms_procedures_and_triggers.sql
COPY ./corporate_oltp/01_corporate_oltp_main_schema.sql /docker-entrypoint-initdb.d/19_01_corporate_oltp_main_schema.sql
COPY ./corporate_oltp/02_corporate_oltp_data_setup.sql /docker-entrypoint-initdb.d/20_02_corporate_oltp_data_setup.sql
COPY ./corporate_oltp/03_corporate_oltp_constraints_and_indexes.sql /docker-entrypoint-initdb.d/21_03_corporate_oltp_constraints_and_indexes.sql
COPY ./corporate_oltp/04_corporate_oltp_synonyms_procedures_and_triggers.sql /docker-entrypoint-initdb.d/22_04_corporate_oltp_synonyms_procedures_and_triggers.sql
COPY ./time_oltp/01_time_oltp_main_schema.sql /docker-entrypoint-initdb.d/23_01_time_oltp_main_schema.sql
COPY ./time_oltp/02_time_oltp_data_setup.sql /docker-entrypoint-initdb.d/24_02_time_oltp_data_setup.sql
COPY ./time_oltp/03_time_oltp_constraints_and_indexes.sql /docker-entrypoint-initdb.d/25_03_time_oltp_constraints_and_indexes.sql
COPY ./time_oltp/04_time_oltp_synonyms_procedures_and_triggers.sql /docker-entrypoint-initdb.d/26_04_time_oltp_synonyms_procedures_and_triggers.sql
COPY ./time_oltp/05_time_oltp_test_data.sql /docker-entrypoint-initdb.d/27_05_time_oltp_test_data.sql
# The script '05_tcs_catalog_views_dependencies.sql' depends on tables from 'jive', 'informixoltp', 'time_oltp' and 'corporate_oltp' 
COPY ./tcs_catalog/05_tcs_catalog_views_dependencies.sql /docker-entrypoint-initdb.d/28_05_tcs_catalog_views_dependencies.sql
