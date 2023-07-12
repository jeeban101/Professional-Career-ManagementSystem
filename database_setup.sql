-- Admin table
CREATE TABLE Admin (
  admin_id VARCHAR(50),
  admin_password VARCHAR(25),
  admin_name VARCHAR(50),
  admin_type VARCHAR(25),
  CONSTRAINT admin_id_pk PRIMARY KEY (admin_id),
  CONSTRAINT admin_password_check CHECK (LENGTH(admin_password) > 5),
  CONSTRAINT admin_type_cc CHECK (admin_type IN ('applicant', 'company', 'owner'))
);

-- Company table
CREATE TABLE company (
  company_code VARCHAR(25),
  admin_id VARCHAR(50),
  company_name VARCHAR(50),
  location VARCHAR(50),
  establishment_date DATE,
  CEO VARCHAR(50),
  HR_head VARCHAR(50),
  CONSTRAINT company_code_pk PRIMARY KEY (company_code),
  CONSTRAINT company_admin_id_fk FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
);

-- Test table
CREATE TABLE test (
  test_code VARCHAR(25),
  company_code VARCHAR(25),
  test_date TIMESTAMP,
  test_location VARCHAR(50),
  test_type VARCHAR(50),
  test_for VARCHAR(50),
  job_code VARCHAR(25),
  CONSTRAINT test_code_pk PRIMARY KEY (test_code),
  CONSTRAINT test_company_code_fk FOREIGN KEY (company_code) REFERENCES company(company_code),
  CONSTRAINT test_job_fk FOREIGN KEY (job_code) REFERENCES job(job_code),
  CONSTRAINT test_type_cc CHECK (test_type IN ('written', 'interview', 'online', 'quiz', 'project_based'))
);

-- Degree table
CREATE TABLE degree (
  degree_code VARCHAR(25),
  duration_years NUMBER(5, 2),
  degree_name VARCHAR(50),
  CONSTRAINT degree_code_pk PRIMARY KEY (degree_code),
  CONSTRAINT degree_duration_years_cc CHECK (duration_years > 0)
);

-- Job table
CREATE TABLE job (
  job_code VARCHAR(25),
  company_code VARCHAR(25),
  job_name VARCHAR(50),
  skills VARCHAR(100),
  requirement VARCHAR(25),
  CONSTRAINT job_code_pk PRIMARY KEY (job_code),
  CONSTRAINT job_company_code_fk FOREIGN KEY (company_code) REFERENCES company(company_code),
  CONSTRAINT job_requirement_fk FOREIGN KEY (requirement) REFERENCES degree(degree_code)
);

-- Applicant table
CREATE TABLE applicant (
  citizenship_no NUMBER(8),
  admin_id VARCHAR(50),
  applicant_name VARCHAR(50),
  applicant_address VARCHAR(50),
  experience VARCHAR(100),
  DOB DATE,
  age NUMBER,
  education VARCHAR(25),
  CONSTRAINT applicant_citizenship_pk PRIMARY KEY (citizenship_no),
  CONSTRAINT applicant_admin_id_fk FOREIGN KEY (admin_id) REFERENCES Admin(admin_id),
  CONSTRAINT applicant_education_fk FOREIGN KEY (education) REFERENCES degree(degree_code),
  CONSTRAINT applicant_test_code_fk FOREIGN KEY (test_code) REFERENCES test(test_code),
  CONSTRAINT applicant_name_cc CHECK (applicant_name IS NOT NULL)
);

-- Applicant_job table
CREATE TABLE applicant_job (
  citizenship_no NUMBER(8),
  job_code VARCHAR(25),
  CONSTRAINT applicant_job_citizenship_fk FOREIGN KEY (citizenship_no) REFERENCES applicant(citizenship_no),
  CONSTRAINT applicant_job_code_fk FOREIGN KEY (job_code) REFERENCES job(job_code),
  CONSTRAINT applicant_job_pk PRIMARY KEY (citizenship_no, job_code)
);

-- Referral table
CREATE TABLE referral (
  reference_code VARCHAR(25),
  citizenship_no NUMBER(8),
  reference_name VARCHAR(50),
  email VARCHAR(50),
  working_company VARCHAR(50),
  designation VARCHAR(50),
  CONSTRAINT referral_citizenship_no_fk FOREIGN KEY (citizenship_no) REFERENCES applicant(citizenship_no),
  CONSTRAINT referral_reference_citizenship_pk PRIMARY KEY (reference_code, citizenship_no)
);
