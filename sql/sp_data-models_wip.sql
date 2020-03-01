--
-- Database: `openemr`
--
-----------------------------------------------------------
-----------------------------------------------------------
-- create ]todo[ de-identification exports
-- create ]todo[ ml et nlp library integration
-- create ]todo[ dm feed for daily cash flow forecasting
-- create ]todo[ dm feed for monthly ar assessment
-- create ]todo[ dm feed for daily operational prioritization
-- create ]todo[ dm feed for daily operational productivity
-- created ]2020-02-02[ quick list of frequent use tables
-- created ]2020-02-02[ dm feed for monthly metric summary trending
-- created ]2020-03-01[ dm feed for monthly rvu productivity
-----------------------------------------------------------


-----------------------------------------------------------
-- DM Feed for Monthly RVU Productivity
-- created ]2020-03-01[ initial script
-- scale ]3pro=#s; 50pro=#s; 900pro=#s[ expected runtimes
-----------------------------------------------------------
DROP PROCEDURE IF EXISTS 'sp_dm_rvuproductivity'
CREATE STORED PROCEDRUE 'sp_dm_rvuproductivity'
    @date-end       datetime    = null
    @range-months   int         = null
AS
SELECT l.date-post, l.date-service
        , l.id-provider, l.id-group-provider, l.id-group-department
        , l.id-carirer, l.id-group-carrier
        , l.amount-rvu-work, l.amount-rvu-total, l.amount-charges
FROM 'lilith' l
WHERE l.date-post <= ISNULL(@date-end, getdate())
    AND l.date-post >= DATEADD(month,-1*ISNULL(@range-months,1),ISNULL(@date-end,getdate())

-----------------------------------------------------------
-- DM Feed for Metric Summary Trending
-- created ]2020-02-02[ initial script
-- scale ]3pro=1s; 50pro=3s; 900pro=5s[ expected runtimes
-- add ]todo[ provider, category, and other groupings
-- added ]2020-03-01[ void, payment, and ar activity
-----------------------------------------------------------
DROP PROCEDURE IF EXISTS 'sp_dm_metricsummary'
CREATE STORED PROCEDURE 'sp_dm_metricsummary'
    @date-end       datetime    = null
    @range-months   int         = null
AS
SELECT
  l.date-post, l.amount-charge, l.amount-adjust-contract, l.amount-payment, l.amount-adjust-refund, l.amount-ar-open
  
FROM 'lilith' l
    LEFT JOIN 'transactions'    as t    on l.id_transaction = t.id
    LEFT JOIN 'payments'        as p    on l.id_payment = p.id
    LEFT JOIN 'voids'           as v    on l.id_void = v.id
    
WHERE l.date-post <= ISNULL(@date-end, getdate())
    AND l.date-post >= DATEADD(month,-1*ISNULL(@range-months,36),ISNULL(@date-end,getdate())


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






