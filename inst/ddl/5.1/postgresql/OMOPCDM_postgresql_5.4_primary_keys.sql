/*********************************************************************************
# Copyright 2014 Observational Health Data Sciences and Informatics
#
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
********************************************************************************/

/************************

 ####### #     # ####### ######      #####  ######  #     #           #######       #         ###       #####                                                                 
 #     # ##   ## #     # #     #    #     # #     # ##   ##    #    # #            ##        #   #     #     #  ####  #    #  ####  ##### #####    ##   # #    # #####  ####  
 #     # # # # # #     # #     #    #       #     # # # # #    #    # #           # #       #     #    #       #    # ##   # #        #   #    #  #  #  # ##   #   #   #      
 #     # #  #  # #     # ######     #       #     # #  #  #    #    # ######        #       #     #    #       #    # # #  #  ####    #   #    # #    # # # #  #   #    ####  
 #     # #     # #     # #          #       #     # #     #    #    #       # ###   #   ### #     #    #       #    # #  # #      #   #   #####  ###### # #  # #   #        # 
 #     # #     # #     # #          #     # #     # #     #     #  #  #     # ###   #   ###  #   #     #     # #    # #   ## #    #   #   #   #  #    # # #   ##   #   #    # 
 ####### #     # ####### #           #####  ######  #     #      ##    #####  ### ##### ###   ###       #####   ####  #    #  ####    #   #    # #    # # #    #   #    ####
                                                                              

script to create constraints within OMOP common data model, version 5.1.0 for PostgreSQL database

last revised: 12 Oct 2014

author:  Patrick Ryan


*************************/


/************************
*************************
*************************
*************************

Primary key constraints

*************************
*************************
*************************
************************/



/************************

Standardized vocabulary

************************/



ALTER TABLE concept ADD CONSTRAINT xpk_concept PRIMARY KEY (concept_id);

ALTER TABLE vocabulary ADD CONSTRAINT xpk_vocabulary PRIMARY KEY (vocabulary_id);

ALTER TABLE domain ADD CONSTRAINT xpk_domain PRIMARY KEY (domain_id);

ALTER TABLE concept_class ADD CONSTRAINT xpk_concept_class PRIMARY KEY (concept_class_id);

ALTER TABLE concept_relationship ADD CONSTRAINT xpk_concept_relationship PRIMARY KEY (concept_id_1,concept_id_2,relationship_id);

ALTER TABLE relationship ADD CONSTRAINT xpk_relationship PRIMARY KEY (relationship_id);

ALTER TABLE concept_ancestor ADD CONSTRAINT xpk_concept_ancestor PRIMARY KEY (ancestor_concept_id,descendant_concept_id);

ALTER TABLE source_to_concept_map ADD CONSTRAINT xpk_source_to_concept_map PRIMARY KEY (source_vocabulary_id,target_concept_id,source_code,valid_end_date);

ALTER TABLE drug_strength ADD CONSTRAINT xpk_drug_strength PRIMARY KEY (drug_concept_id, ingredient_concept_id);

ALTER TABLE cohort_definition ADD CONSTRAINT xpk_cohort_definition PRIMARY KEY (cohort_definition_id);

ALTER TABLE attribute_definition ADD CONSTRAINT xpk_attribute_definition PRIMARY KEY (attribute_definition_id);


/**************************

Standardized meta-data

***************************/









/************************

Standardized clinical data

************************/


/**PRIMARY KEY NONCLUSTERED constraints**/

ALTER TABLE person ADD CONSTRAINT xpk_person PRIMARY KEY ( person_id ) ;

ALTER TABLE observation_period ADD CONSTRAINT xpk_observation_period PRIMARY KEY ( observation_period_id ) ;

ALTER TABLE specimen ADD CONSTRAINT xpk_specimen PRIMARY KEY ( specimen_id ) ;

ALTER TABLE death ADD CONSTRAINT xpk_death PRIMARY KEY ( person_id ) ;

ALTER TABLE visit_occurrence ADD CONSTRAINT xpk_visit_occurrence PRIMARY KEY ( visit_occurrence_id ) ;

ALTER TABLE procedure_occurrence ADD CONSTRAINT xpk_procedure_occurrence PRIMARY KEY ( procedure_occurrence_id ) ;

ALTER TABLE drug_exposure ADD CONSTRAINT xpk_drug_exposure PRIMARY KEY ( drug_exposure_id ) ;

ALTER TABLE device_exposure ADD CONSTRAINT xpk_device_exposure PRIMARY KEY ( device_exposure_id ) ;

ALTER TABLE condition_occurrence ADD CONSTRAINT xpk_condition_occurrence PRIMARY KEY ( condition_occurrence_id ) ;

ALTER TABLE measurement ADD CONSTRAINT xpk_measurement PRIMARY KEY ( measurement_id ) ;

ALTER TABLE note ADD CONSTRAINT xpk_note PRIMARY KEY ( note_id ) ;

ALTER TABLE observation  ADD CONSTRAINT xpk_observation PRIMARY KEY ( observation_id ) ;




/************************

Standardized health system data

************************/


ALTER TABLE location ADD CONSTRAINT xpk_location PRIMARY KEY ( location_id ) ;

ALTER TABLE care_site ADD CONSTRAINT xpk_care_site PRIMARY KEY ( care_site_id ) ;

ALTER TABLE provider ADD CONSTRAINT xpk_provider PRIMARY KEY ( provider_id ) ;



/************************

Standardized health economics

************************/


ALTER TABLE payer_plan_period ADD CONSTRAINT xpk_payer_plan_period PRIMARY KEY ( payer_plan_period_id ) ;

ALTER TABLE cost ADD CONSTRAINT xpk_visit_cost PRIMARY KEY ( cost_id ) ;


/************************

Standardized derived elements

************************/

ALTER TABLE cohort ADD CONSTRAINT xpk_cohort PRIMARY KEY ( cohort_definition_id, subject_id, cohort_start_date, cohort_end_date  ) ;

ALTER TABLE cohort_attribute ADD CONSTRAINT xpk_cohort_attribute PRIMARY KEY ( cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id ) ;

ALTER TABLE drug_era ADD CONSTRAINT xpk_drug_era PRIMARY KEY ( drug_era_id ) ;

ALTER TABLE dose_era  ADD CONSTRAINT xpk_dose_era PRIMARY KEY ( dose_era_id ) ;

ALTER TABLE condition_era ADD CONSTRAINT xpk_condition_era PRIMARY KEY ( condition_era_id ) ;
