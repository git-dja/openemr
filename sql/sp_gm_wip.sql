--
-- Database: `openemr`
--
-----------------------------------------------------------
-----------------------------------------------------------
-- create ]todo[ de-identification exports
-- create ]todo[ ml et nlp library integration
-- create ]todo[ dm feed for daily cash flow forecasting
-- create ]todo[ dm feed for monthly ar assessment
-- create ]todo[ dm feed for monthly rvu productivity
-- create ]todo[ dm feed for monthly metric summary trending
-- create ]todo[ dm feed for daily operational prioritization
-- create ]todo[ dm feed for daily operational productivity
-- create ]todo[ quick list of frequent use tables
-----------------------------------------------------------

-----------------------------------------------------------
-- DM Feed for Metric Summary Trending
-- created ]2020-02-02[ initial script
-- scale ]3pro=; 50pro=; 900pro=[ expected runtimes
-- add ]todo[ void, payment, and ar activity
-- add ]todo[ provider, category, and other groupings
-----------------------------------------------------------
DROP PROCEDURE IF EXISTS 'sp_dm_metricsummary'
CREATE STORED PROCEDURE 'sp_dm_metricsummary'
AS
SELECT
  t.id, t.date
FROM 'transactions' as t
WHERE t.date between @month_start and @month_end


-----------------------------------------------------------
-- Frequent Use Tables
-- created ]2020-02-02[ initial script
-----------------------------------------------------------
-- LEFT JOIN 'transactions'         as t
-- LEFT JOIN 'payments'             as pmt
-- LEFT JOIN 'categories'           as cat
-- LEFT JOIN 'billing'              as b
-- LEFT JOIN 'claims'               as c
-- LEFT JOIN 'users'                as u
-- LEFT JOIN 'voids'                as v
-- LEFT JOIN 'patient_data'         as pat
-- LEFT JOIN 'ar_session'           as ar_s
-- LEFT JOIN 'ar_activity'          as ar_a
-- LEFT JOIN 'users_facility'       as u_f
-- LEFT JOIN 'procedure_type'       as p_t
-- LEFT JOIN 'icd9_dx_code'         as dx_c_09
-- LEFT JOIN 'icd10_dx_code'        as dx_c_10
-- LEFT JOIN 'icd9_sg_code'         as sg_c_09
-- LEFT JOIN 'icd10_sg_code'        as sg_c_10
-- LEFT JOIN 'icd10_dx_order_code'  as dx_oc_10
-- LEFT JOIN 'insurance_companies'  as ins_c
-- LEFT JOIN 'insurance_data'       as ins_d
-- LEFT JOIN 'insurance_numbers'    as ins_n
-- LEFT JOIN 'notes'                as n
-- LEFT JOIN 'onotes'               as on
-- LEFT JOIN 'lists'                as li






