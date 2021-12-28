--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: academic_ledger; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.academic_ledger (
    id integer NOT NULL,
    student_id integer,
    department_program_id integer,
    start_academic_term_id integer,
    end_academic_term_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    regular character(1),
    stud_yearlevel integer
);


ALTER TABLE public.academic_ledger OWNER TO dbasevisor;

--
-- Name: academic_ledger_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.academic_ledger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_ledger_id_seq OWNER TO dbasevisor;

--
-- Name: academic_ledger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.academic_ledger_id_seq OWNED BY public.academic_ledger.id;


--
-- Name: account; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.account (
    id integer NOT NULL,
    student_id integer,
    group_id integer,
    academic_term_id integer,
    status_id integer,
    remarks character varying(512),
    cleared_on timestamp without time zone,
    cleared_by integer,
    cancelled_on timestamp without time zone,
    cancelled_by integer,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    cancel_remarks character varying(512),
    date_accounted timestamp without time zone,
    date_cleared timestamp without time zone
);


ALTER TABLE public.account OWNER TO dbasevisor;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO dbasevisor;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- Name: accounts_fees; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.accounts_fees (
    id integer NOT NULL,
    chart_of_accounts_id integer,
    fee_amount numeric(10,2),
    effectivity_date date,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.accounts_fees OWNER TO dbasevisor;

--
-- Name: accounts_fees_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.accounts_fees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_fees_id_seq OWNER TO dbasevisor;

--
-- Name: accounts_fees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.accounts_fees_id_seq OWNED BY public.accounts_fees.id;


--
-- Name: assessment_items; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.assessment_items (
    id integer NOT NULL,
    assessment_of_fees_id integer,
    account_fees_id integer,
    item_fee_amount numeric(10,2),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.assessment_items OWNER TO dbasevisor;

--
-- Name: assessment_items_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.assessment_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessment_items_id_seq OWNER TO dbasevisor;

--
-- Name: assessment_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.assessment_items_id_seq OWNED BY public.assessment_items.id;


--
-- Name: assessment_of_fees; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.assessment_of_fees (
    id integer NOT NULL,
    template_code character varying(30),
    description character varying(100),
    year_level integer,
    term_id integer,
    remarks character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    program_id integer,
    department_program_id integer
);


ALTER TABLE public.assessment_of_fees OWNER TO dbasevisor;

--
-- Name: assessment_of_fees_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.assessment_of_fees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessment_of_fees_id_seq OWNER TO dbasevisor;

--
-- Name: assessment_of_fees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.assessment_of_fees_id_seq OWNED BY public.assessment_of_fees.id;


--
-- Name: auth_cas; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.auth_cas (
    id integer NOT NULL,
    user_id integer,
    created_on timestamp without time zone,
    service character varying(512),
    ticket character varying(512),
    renew character(1)
);


ALTER TABLE public.auth_cas OWNER TO dbasevisor;

--
-- Name: auth_cas_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.auth_cas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_cas_id_seq OWNER TO dbasevisor;

--
-- Name: auth_cas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.auth_cas_id_seq OWNED BY public.auth_cas.id;


--
-- Name: auth_event; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.auth_event (
    id integer NOT NULL,
    time_stamp timestamp without time zone,
    client_ip character varying(512),
    user_id integer,
    origin character varying(512),
    description text
);


ALTER TABLE public.auth_event OWNER TO dbasevisor;

--
-- Name: auth_event_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.auth_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_event_id_seq OWNER TO dbasevisor;

--
-- Name: auth_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.auth_event_id_seq OWNED BY public.auth_event.id;


--
-- Name: auth_extension; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.auth_extension (
    id integer NOT NULL,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.auth_extension OWNER TO dbasevisor;

--
-- Name: auth_extension_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.auth_extension_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_extension_id_seq OWNER TO dbasevisor;

--
-- Name: auth_extension_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.auth_extension_id_seq OWNED BY public.auth_extension.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    role character varying(512),
    description text
);


ALTER TABLE public.auth_group OWNER TO dbasevisor;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO dbasevisor;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_membership; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.auth_membership (
    id integer NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public.auth_membership OWNER TO dbasevisor;

--
-- Name: auth_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.auth_membership_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_membership_id_seq OWNER TO dbasevisor;

--
-- Name: auth_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.auth_membership_id_seq OWNED BY public.auth_membership.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    group_id integer,
    name character varying(512),
    table_name character varying(512),
    record_id integer
);


ALTER TABLE public.auth_permission OWNER TO dbasevisor;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO dbasevisor;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    first_name character varying(128),
    last_name character varying(128),
    email character varying(512),
    password character varying(512),
    registration_key character varying(512),
    reset_password_key character varying(512),
    registration_id character varying(512),
    signatory_id integer,
    active character(1)
);


ALTER TABLE public.auth_user OWNER TO dbasevisor;

--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO dbasevisor;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: bank_payment; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.bank_payment (
    id integer NOT NULL,
    reference_no character varying(40),
    amount numeric(12,2) DEFAULT 0.00 NOT NULL,
    payment_date date,
    payment_time time without time zone
);


ALTER TABLE public.bank_payment OWNER TO dbasevisor;

--
-- Name: bank_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.bank_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_payment_id_seq OWNER TO dbasevisor;

--
-- Name: bank_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.bank_payment_id_seq OWNED BY public.bank_payment.id;


--
-- Name: barangay_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.barangay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barangay_id_seq OWNER TO dbasevisor;

--
-- Name: barangay; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.barangay (
    id integer DEFAULT nextval('public.barangay_id_seq'::regclass) NOT NULL,
    name character varying(512),
    city_municipality_id integer,
    keyword_matches character varying(512),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    is_active character(1),
    has_own_zipcode character(1),
    is_in_poblacion character(1)
);


ALTER TABLE public.barangay OWNER TO dbasevisor;

--
-- Name: barangay_zipcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.barangay_zipcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barangay_zipcodes_id_seq OWNER TO dbasevisor;

--
-- Name: barangay_zipcodes; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.barangay_zipcodes (
    barangay_id integer,
    zipcode integer,
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    id integer DEFAULT nextval('public.barangay_zipcodes_id_seq'::regclass) NOT NULL,
    is_active character(1)
);


ALTER TABLE public.barangay_zipcodes OWNER TO dbasevisor;

--
-- Name: block; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.block (
    id integer NOT NULL,
    department_program_id integer,
    block_code character varying(50),
    year_level character varying(20),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    college_department_id integer,
    academic_term_id integer,
    block_size integer,
    block_size_limit integer,
    year_term_id integer,
    block character varying(25),
    block_type integer DEFAULT 0,
    holder character(1)
);


ALTER TABLE public.block OWNER TO dbasevisor;

--
-- Name: block_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.block_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.block_id_seq OWNER TO dbasevisor;

--
-- Name: block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.block_id_seq OWNED BY public.block.id;


--
-- Name: building; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.building (
    id integer NOT NULL,
    building_code character varying(50),
    building_name character varying(100),
    college_id integer,
    campus_id integer,
    remarks character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    floors character varying(100),
    building_shortname character varying(100),
    building_description character varying(200)
);


ALTER TABLE public.building OWNER TO dbasevisor;

--
-- Name: building_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.building_id_seq OWNER TO dbasevisor;

--
-- Name: building_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.building_id_seq OWNED BY public.building.id;


--
-- Name: campus; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.campus (
    id integer NOT NULL,
    campus_code character varying(15),
    campus_shortname character varying(20),
    campus_name character varying(100),
    campus_address character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.campus OWNER TO dbasevisor;

--
-- Name: campus_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.campus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campus_id_seq OWNER TO dbasevisor;

--
-- Name: campus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.campus_id_seq OWNED BY public.campus.id;


--
-- Name: chart_of_accounts; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.chart_of_accounts (
    id integer NOT NULL,
    account_code character varying(30),
    account_name character varying(100),
    short_name character varying(100),
    fixed_amount character(1),
    accounts_group_id integer,
    accounts_classification_id integer,
    accounts_category_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    accounts_set_id integer
);


ALTER TABLE public.chart_of_accounts OWNER TO dbasevisor;

--
-- Name: chart_of_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.chart_of_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_of_accounts_id_seq OWNER TO dbasevisor;

--
-- Name: chart_of_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.chart_of_accounts_id_seq OWNED BY public.chart_of_accounts.id;


--
-- Name: check_table; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.check_table (
    id integer NOT NULL,
    check_no character varying(50),
    check_amount numeric(20,2),
    check_bank character varying(100),
    check_date timestamp without time zone,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    remarks character varying(200)
);


ALTER TABLE public.check_table OWNER TO dbasevisor;

--
-- Name: check_table_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.check_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.check_table_id_seq OWNER TO dbasevisor;

--
-- Name: check_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.check_table_id_seq OWNED BY public.check_table.id;


--
-- Name: city_municipality_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.city_municipality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_municipality_id_seq OWNER TO dbasevisor;

--
-- Name: city_municipality; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.city_municipality (
    id integer DEFAULT nextval('public.city_municipality_id_seq'::regclass) NOT NULL,
    name character varying(512),
    keyword_matches character varying(512),
    is_active character(1),
    modified_on timestamp without time zone,
    modified_by integer,
    created_on timestamp without time zone,
    created_by integer,
    province_id integer,
    zipcode integer,
    correct_num_barangays integer,
    classification character varying(512)
);


ALTER TABLE public.city_municipality OWNER TO dbasevisor;

--
-- Name: class_event; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.class_event (
    id integer NOT NULL,
    class_event character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.class_event OWNER TO dbasevisor;

--
-- Name: class_event_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.class_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.class_event_id_seq OWNER TO dbasevisor;

--
-- Name: class_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.class_event_id_seq OWNED BY public.class_event.id;


--
-- Name: class_schedule; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.class_schedule (
    id integer NOT NULL,
    course_schedule_id integer,
    class_event_id integer,
    schedule_name character varying(100),
    room_id integer,
    remarks character varying(100),
    no_of_units text,
    faculty_in_charge_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    day integer,
    min_students integer,
    max_students integer,
    "time" character varying(100),
    start_time integer,
    end_time integer,
    elective_course_title character varying(500),
    is_elective character(1) DEFAULT 'F'::bpchar,
    lec_units numeric(3,2),
    lab_units numeric(3,2)
);


ALTER TABLE public.class_schedule OWNER TO dbasevisor;

--
-- Name: class_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.class_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.class_schedule_id_seq OWNER TO dbasevisor;

--
-- Name: class_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.class_schedule_id_seq OWNED BY public.class_schedule.id;


--
-- Name: clearance_status; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.clearance_status (
    id integer NOT NULL,
    status character varying(50),
    description character varying(100),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.clearance_status OWNER TO dbasevisor;

--
-- Name: clearance_status_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.clearance_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clearance_status_id_seq OWNER TO dbasevisor;

--
-- Name: clearance_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.clearance_status_id_seq OWNED BY public.clearance_status.id;


--
-- Name: college; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.college (
    id integer NOT NULL,
    college_code character varying(15),
    college_shortname character varying(20),
    college_name character varying(200),
    year_established date,
    campus_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    old_index integer,
    allow_to_enrol character(1),
    allow_to_self_enrol character(1)
);


ALTER TABLE public.college OWNER TO dbasevisor;

--
-- Name: college_department; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.college_department (
    id integer NOT NULL,
    college_id integer,
    department_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.college_department OWNER TO dbasevisor;

--
-- Name: college_department_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.college_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.college_department_id_seq OWNER TO dbasevisor;

--
-- Name: college_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.college_department_id_seq OWNED BY public.college_department.id;


--
-- Name: college_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.college_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.college_id_seq OWNER TO dbasevisor;

--
-- Name: college_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.college_id_seq OWNED BY public.college.id;


--
-- Name: cor_assessment; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.cor_assessment (
    id integer NOT NULL,
    student_id integer,
    assessment_number integer,
    fee_code character varying(512),
    fee_name character varying(512),
    fee_amount numeric(7,2),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.cor_assessment OWNER TO dbasevisor;

--
-- Name: cor_assessment_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.cor_assessment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cor_assessment_id_seq OWNER TO dbasevisor;

--
-- Name: cor_assessment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.cor_assessment_id_seq OWNED BY public.cor_assessment.id;


--
-- Name: cor_schedule; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.cor_schedule (
    id integer NOT NULL,
    student_id integer,
    course_id integer,
    year_block character varying(512),
    days character varying(512),
    times character varying(512),
    faculty_in_charge_id integer,
    faculty_lname integer,
    faculty_fname integer,
    faculty_mname integer,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.cor_schedule OWNER TO dbasevisor;

--
-- Name: cor_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.cor_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cor_schedule_id_seq OWNER TO dbasevisor;

--
-- Name: cor_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.cor_schedule_id_seq OWNED BY public.cor_schedule.id;


--
-- Name: cor_student_registration; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.cor_student_registration (
    id integer NOT NULL,
    stud_registration_number character varying(15),
    stud_id integer,
    stud_num character varying(50),
    stud_lname character varying(50),
    stud_fname character varying(50),
    stud_mname character varying(50),
    dateofbirth date,
    gender character varying(512),
    age integer,
    curriculum_id integer,
    curriculum_code character varying(512),
    program_id integer,
    program_code character varying(512),
    college_id integer,
    college_name character varying(512),
    program_major_id integer,
    program_major character varying(512),
    scholarship_id integer,
    scholarship_codestring character varying(512),
    school_year character varying(512),
    term character varying(512),
    year_term integer,
    year_term_description character varying(50),
    block integer,
    actual_payment numeric(20,2),
    outstanding_balance numeric(20,2),
    additional_balance numeric(20,2),
    academicterm_id integer,
    primary_refno character varying(9),
    transaction_date timestamp without time zone,
    cor_signatory_id integer,
    cor_signatory character varying(150),
    regular character(1),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.cor_student_registration OWNER TO dbasevisor;

--
-- Name: cor_student_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.cor_student_registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cor_student_registration_id_seq OWNER TO dbasevisor;

--
-- Name: cor_student_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.cor_student_registration_id_seq OWNED BY public.cor_student_registration.id;


--
-- Name: cor_subject_list; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.cor_subject_list (
    id integer NOT NULL,
    student_id integer,
    course_id integer,
    course_title character varying(512),
    credit_units integer,
    lec_units integer,
    lab_units integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.cor_subject_list OWNER TO dbasevisor;

--
-- Name: cor_subject_list_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.cor_subject_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cor_subject_list_id_seq OWNER TO dbasevisor;

--
-- Name: cor_subject_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.cor_subject_list_id_seq OWNED BY public.cor_subject_list.id;


--
-- Name: course; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.course (
    id integer NOT NULL,
    credit_units numeric(5,2),
    lec_units numeric(5,2),
    lab_units numeric(5,2),
    lec_hours numeric(5,2),
    lab_hours numeric(5,2),
    pending character(1),
    locked character(1),
    course_level_id integer,
    course_area_id integer,
    course_mode_id integer,
    course_equivalency_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    college_id integer,
    course_description text,
    remarks character varying(200),
    course_title character varying(200),
    course_code_old character varying(30),
    course_code character varying(30),
    service_college_id integer,
    offered_in_college_id integer,
    credit_hours numeric(5,2),
    gwa_excluded boolean[]
);


ALTER TABLE public.course OWNER TO dbasevisor;

--
-- Name: course_equivalency; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.course_equivalency (
    id integer NOT NULL,
    course_id integer,
    course_equivalency_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.course_equivalency OWNER TO dbasevisor;

--
-- Name: course_equivalency_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.course_equivalency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_equivalency_id_seq OWNER TO dbasevisor;

--
-- Name: course_equivalency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.course_equivalency_id_seq OWNED BY public.course_equivalency.id;


--
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_id_seq OWNER TO dbasevisor;

--
-- Name: course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;


--
-- Name: course_requisite; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.course_requisite (
    id integer NOT NULL,
    course_id integer,
    course_requisite_id integer,
    course_type integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.course_requisite OWNER TO dbasevisor;

--
-- Name: course_requisite_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.course_requisite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_requisite_id_seq OWNER TO dbasevisor;

--
-- Name: course_requisite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.course_requisite_id_seq OWNED BY public.course_requisite.id;


--
-- Name: course_schedule; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.course_schedule (
    id integer NOT NULL,
    course_id integer,
    faculty_in_charge_id integer,
    remarks character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    academic_term_id integer,
    block_id integer,
    summary_schedule character varying(1000),
    islocked character(1),
    title character varying(75),
    min_size integer,
    max_size integer,
    class_name character varying(50)
);


ALTER TABLE public.course_schedule OWNER TO dbasevisor;

--
-- Name: course_schedule_block_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.course_schedule_block_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_schedule_block_seq OWNER TO dbasevisor;

--
-- Name: course_schedule_block; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.course_schedule_block (
    id integer DEFAULT nextval('public.course_schedule_block_seq'::regclass) NOT NULL,
    course_schedule_id integer,
    block_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.course_schedule_block OWNER TO dbasevisor;

--
-- Name: course_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.course_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_schedule_id_seq OWNER TO dbasevisor;

--
-- Name: course_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.course_schedule_id_seq OWNED BY public.course_schedule.id;


--
-- Name: course_special_fee; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.course_special_fee (
    id integer NOT NULL,
    course_id integer,
    account_fee_id integer,
    course_fee numeric(10,2),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.course_special_fee OWNER TO dbasevisor;

--
-- Name: course_special_fee_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.course_special_fee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_special_fee_id_seq OWNER TO dbasevisor;

--
-- Name: course_special_fee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.course_special_fee_id_seq OWNED BY public.course_special_fee.id;


--
-- Name: curriculum; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.curriculum (
    id integer NOT NULL,
    curriculum_code character varying(100),
    curriculum_description character varying(200),
    total_units numeric(5,2),
    academic_term_id integer,
    locked character(1),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    educational_level integer
);


ALTER TABLE public.curriculum OWNER TO dbasevisor;

--
-- Name: curriculum_course; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.curriculum_course (
    id integer NOT NULL,
    curriculum_id integer NOT NULL,
    course_id integer NOT NULL,
    year_term_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    fees_id integer,
    qualified_year_standing integer
);


ALTER TABLE public.curriculum_course OWNER TO dbasevisor;

--
-- Name: curriculum_course_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.curriculum_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_course_id_seq OWNER TO dbasevisor;

--
-- Name: curriculum_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.curriculum_course_id_seq OWNED BY public.curriculum_course.id;


--
-- Name: curriculum_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.curriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_id_seq OWNER TO dbasevisor;

--
-- Name: curriculum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.curriculum_id_seq OWNED BY public.curriculum.id;


--
-- Name: default_assessment; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.default_assessment (
    id integer NOT NULL,
    degree character varying(30),
    assessment_of_fees_id integer,
    transaction_type_id integer,
    enrollment_transaction character varying(10),
    remarks character varying(100),
    accounts_fees_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.default_assessment OWNER TO dbasevisor;

--
-- Name: default_assessment_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.default_assessment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.default_assessment_id_seq OWNER TO dbasevisor;

--
-- Name: default_assessment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.default_assessment_id_seq OWNED BY public.default_assessment.id;


--
-- Name: department; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.department (
    id integer NOT NULL,
    department_code character varying(15),
    department_shortname character varying(200),
    department_name character varying(200),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.department OWNER TO dbasevisor;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_id_seq OWNER TO dbasevisor;

--
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.department_id_seq OWNED BY public.department.id;


--
-- Name: department_program; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.department_program (
    id integer NOT NULL,
    college_department_id integer,
    program_id integer,
    date_recognized date,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    curriculum_id integer
);


ALTER TABLE public.department_program OWNER TO dbasevisor;

--
-- Name: department_program_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.department_program_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_program_id_seq OWNER TO dbasevisor;

--
-- Name: department_program_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.department_program_id_seq OWNED BY public.department_program.id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    employee_no character varying(20),
    employee_lname character varying(50),
    employee_fname character varying(50),
    employee_mname character varying(50),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    employee_academic_rank character varying(250),
    employee_gender character varying(2),
    college_id integer
);


ALTER TABLE public.employee OWNER TO dbasevisor;

--
-- Name: employee_designation; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.employee_designation (
    designation_name character varying(512) DEFAULT NULL::character varying,
    designation_shortname character varying(200) DEFAULT NULL::character varying,
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    id integer NOT NULL,
    active character(1),
    is_active character(1),
    wec numeric(10,2)
);


ALTER TABLE public.employee_designation OWNER TO dbasevisor;

--
-- Name: employee_designation_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.employee_designation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_designation_id_seq OWNER TO dbasevisor;

--
-- Name: employee_designation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.employee_designation_id_seq OWNED BY public.employee_designation.id;


--
-- Name: employee_faculty_designation; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.employee_faculty_designation (
    id integer NOT NULL,
    employee_id integer,
    employee_designation_id integer,
    academic_term_id integer,
    wec_units numeric(10,2),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    employee_designation_title character varying(300)
);


ALTER TABLE public.employee_faculty_designation OWNER TO dbasevisor;

--
-- Name: employee_faculty_designation_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.employee_faculty_designation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_faculty_designation_id_seq OWNER TO dbasevisor;

--
-- Name: employee_faculty_designation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.employee_faculty_designation_id_seq OWNED BY public.employee_faculty_designation.id;


--
-- Name: employee_faculty_wec; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.employee_faculty_wec (
    id integer NOT NULL,
    employee_id integer,
    total_wec numeric(10,2),
    academic_term_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp with time zone,
    modified_by integer
);


ALTER TABLE public.employee_faculty_wec OWNER TO dbasevisor;

--
-- Name: employee_faculty_wec_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.employee_faculty_wec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_faculty_wec_id_seq OWNER TO dbasevisor;

--
-- Name: employee_faculty_wec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.employee_faculty_wec_id_seq OWNED BY public.employee_faculty_wec.id;


--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO dbasevisor;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- Name: employee_profile; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.employee_profile (
    id integer NOT NULL,
    employee_id integer,
    emp_date_of_employment timestamp without time zone,
    emp_maiden_name character varying(512) DEFAULT NULL::character varying,
    emp_suffix character varying(512) DEFAULT NULL::character varying,
    emp_gender character varying(512) DEFAULT NULL::character varying,
    emp_birth_date timestamp without time zone,
    emp_civil_status character varying(512) DEFAULT NULL::character varying,
    emp_religion character varying(512) DEFAULT NULL::character varying,
    emp_nationality character varying(512) DEFAULT NULL::character varying,
    emp_height character varying(512) DEFAULT NULL::character varying,
    emp_weight character varying(512) DEFAULT NULL::character varying,
    emp_bloodtype character varying(512) DEFAULT NULL::character varying,
    emp_current_houseno_street character varying(512) DEFAULT NULL::character varying,
    emp_current_barangay character varying(512) DEFAULT NULL::character varying,
    emp_current_town_city character varying(512) DEFAULT NULL::character varying,
    emp_current_zipcode character varying(512) DEFAULT NULL::character varying,
    emp_current_province character varying(512) DEFAULT NULL::character varying,
    emp_permanent_houseno_street character varying(512) DEFAULT NULL::character varying,
    emp_permanent_barangay character varying(512) DEFAULT NULL::character varying,
    emp_permanent_town_city character varying(512) DEFAULT NULL::character varying,
    emp_permanent_zipcode character varying(512) DEFAULT NULL::character varying,
    emp_permanent_province character varying(512) DEFAULT NULL::character varying,
    emp_mobile_no character varying(512) DEFAULT NULL::character varying,
    emp_telephone_no character varying(512) DEFAULT NULL::character varying,
    emp_fax_no character varying(512) DEFAULT NULL::character varying,
    emp_primary_email_address character varying(512) DEFAULT NULL::character varying,
    emp_alternate_email_address character varying(512) DEFAULT NULL::character varying,
    emp_father_name character varying(512) DEFAULT NULL::character varying,
    emp_father_birthdate timestamp without time zone,
    emp_father_educ_attainment character varying(512) DEFAULT NULL::character varying,
    emp_father_occupation character varying(512) DEFAULT NULL::character varying,
    emp_father_company character varying(512) DEFAULT NULL::character varying,
    emp_father_company_address character varying(512) DEFAULT NULL::character varying,
    emp_father_mobile_no character varying(512) DEFAULT NULL::character varying,
    emp_father_email_address character varying(512) DEFAULT NULL::character varying,
    emp_mother_name character varying(512) DEFAULT NULL::character varying,
    emp_mother_birthdate timestamp without time zone,
    emp_mother_educ_attainment character varying(512) DEFAULT NULL::character varying,
    emp_mother_occupation character varying(512) DEFAULT NULL::character varying,
    emp_mother_company character varying(512) DEFAULT NULL::character varying,
    emp_mother_company_address character varying(512) DEFAULT NULL::character varying,
    emp_mother_mobile_no character varying(512) DEFAULT NULL::character varying,
    emp_mother_email_address character varying(512) DEFAULT NULL::character varying,
    emp_num_brothers integer,
    emp_num_sisters integer
);


ALTER TABLE public.employee_profile OWNER TO dbasevisor;

--
-- Name: employee_user; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.employee_user (
    id integer NOT NULL,
    employee_id integer,
    email character varying(512) DEFAULT NULL::character varying,
    password character varying(32) DEFAULT NULL::character varying
);


ALTER TABLE public.employee_user OWNER TO dbasevisor;

--
-- Name: enrollment_settings; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.enrollment_settings (
    id integer NOT NULL,
    setting_name character varying(100),
    setting_value character varying(50),
    remarks character varying(200),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.enrollment_settings OWNER TO dbasevisor;

--
-- Name: enrollment_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.enrollment_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrollment_settings_id_seq OWNER TO dbasevisor;

--
-- Name: enrollment_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.enrollment_settings_id_seq OWNED BY public.enrollment_settings.id;


--
-- Name: ep_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ep_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ep_payment_id_seq OWNER TO dbasevisor;

--
-- Name: ep_payment; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ep_payment (
    id integer DEFAULT nextval('public.ep_payment_id_seq'::regclass) NOT NULL,
    merchant_ref_no character varying(50),
    amount numeric(20,2),
    student_registration_id integer
);


ALTER TABLE public.ep_payment OWNER TO dbasevisor;

--
-- Name: evaluation; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.evaluation (
    id integer NOT NULL,
    student_id integer,
    course_id integer,
    grade numeric(3,1),
    academic_term_id integer,
    remarks character varying(512),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    locked character(1),
    title character varying(512),
    academic_ledger_id integer
);


ALTER TABLE public.evaluation OWNER TO dbasevisor;

--
-- Name: evaluation_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.evaluation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluation_id_seq OWNER TO dbasevisor;

--
-- Name: evaluation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.evaluation_id_seq OWNED BY public.evaluation.id;


--
-- Name: evaluation_sheets; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.evaluation_sheets (
    id integer NOT NULL,
    academic_ledger_id integer,
    course_id integer,
    grade numeric(2,2),
    academic_term_id integer,
    remarks character varying(200),
    active character(1),
    locked character(1),
    title character varying(500),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.evaluation_sheets OWNER TO dbasevisor;

--
-- Name: evaluation_sheets_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.evaluation_sheets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluation_sheets_id_seq OWNER TO dbasevisor;

--
-- Name: evaluation_sheets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.evaluation_sheets_id_seq OWNED BY public.evaluation_sheets.id;


--
-- Name: import_upload; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.import_upload (
    id integer NOT NULL,
    file_name character varying(512),
    import_csv character varying(512),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    import_type integer
);


ALTER TABLE public.import_upload OWNER TO dbasevisor;

--
-- Name: COLUMN import_upload.import_type; Type: COMMENT; Schema: public; Owner: dbasevisor
--

COMMENT ON COLUMN public.import_upload.import_type IS '1 for bucet and 2 for portal accounts';


--
-- Name: import_upload_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.import_upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_upload_id_seq OWNER TO dbasevisor;

--
-- Name: import_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.import_upload_id_seq OWNED BY public.import_upload.id;


--
-- Name: office; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.office (
    id integer NOT NULL,
    college_id integer,
    office_name character varying(20),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.office OWNER TO dbasevisor;

--
-- Name: office_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.office_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.office_id_seq OWNER TO dbasevisor;

--
-- Name: office_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.office_id_seq OWNED BY public.office.id;


--
-- Name: or_printlogs; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.or_printlogs (
    id integer NOT NULL,
    primary_refno character varying(9),
    actual_payment numeric(20,2),
    print_date timestamp without time zone,
    ipaddress character varying(15),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.or_printlogs OWNER TO dbasevisor;

--
-- Name: or_printlogs_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.or_printlogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.or_printlogs_id_seq OWNER TO dbasevisor;

--
-- Name: or_printlogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.or_printlogs_id_seq OWNED BY public.or_printlogs.id;


--
-- Name: ors_settings; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ors_settings (
    id integer NOT NULL,
    setting_name character varying(100),
    setting_value character varying(50),
    remarks character varying(200),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ors_settings OWNER TO dbasevisor;

--
-- Name: ors_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ors_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ors_settings_id_seq OWNER TO dbasevisor;

--
-- Name: ors_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ors_settings_id_seq OWNED BY public.ors_settings.id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    primary_refno character varying(9),
    secondary_refno character varying(20),
    student_no integer,
    cashier_id integer,
    term_id integer,
    year_term_id integer,
    transaction_date timestamp without time zone,
    payment_mode_id integer,
    transaction_type_id integer,
    active character(1),
    isvoid character(1),
    or_signatory integer,
    enrollment_id integer,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    server_date timestamp without time zone,
    payment_amount numeric(20,2),
    payor_name character varying,
    cash_tendered numeric(20,2),
    change numeric(20,2)
);


ALTER TABLE public.payment OWNER TO dbasevisor;

--
-- Name: payment_details; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.payment_details (
    id integer NOT NULL,
    payment_id integer,
    student_no integer,
    account_id integer,
    debit numeric(20,2),
    credit numeric(20,2),
    active character(1),
    discount numeric(20,2),
    payment_discount numeric(20,2),
    first_payment numeric(20,2),
    second_payment numeric(20,2),
    third_payment numeric(20,2),
    fourth_payment numeric(20,2),
    fifth_payment numeric(20,2),
    actual_payment numeric(20,2),
    server_date timestamp without time zone,
    transaction_date timestamp without time zone,
    primary_refno character varying(9),
    secondary_refno character varying(9),
    payor character varying(100),
    term_id integer,
    remarks character varying(200),
    year_term_id integer,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    student_registration_id integer
);


ALTER TABLE public.payment_details OWNER TO dbasevisor;

--
-- Name: payment_details_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.payment_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_details_id_seq OWNER TO dbasevisor;

--
-- Name: payment_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.payment_details_id_seq OWNED BY public.payment_details.id;


--
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_id_seq OWNER TO dbasevisor;

--
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- Name: payment_mode; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.payment_mode (
    id integer NOT NULL,
    payment_mode character varying(50),
    description character varying(100),
    shortname character varying(10),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.payment_mode OWNER TO dbasevisor;

--
-- Name: payment_mode_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.payment_mode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_mode_id_seq OWNER TO dbasevisor;

--
-- Name: payment_mode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.payment_mode_id_seq OWNED BY public.payment_mode.id;


--
-- Name: preregistration_subjects; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.preregistration_subjects (
    id integer NOT NULL,
    course_schedule_id integer,
    student_id integer,
    enrollment_id integer,
    year_term_id integer,
    academicterm_id integer,
    course_id integer,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.preregistration_subjects OWNER TO dbasevisor;

--
-- Name: preregistration_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.preregistration_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preregistration_subjects_id_seq OWNER TO dbasevisor;

--
-- Name: preregistration_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.preregistration_subjects_id_seq OWNED BY public.preregistration_subjects.id;


--
-- Name: program; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.program (
    id integer NOT NULL,
    program_code character varying(20),
    program_name character varying(200),
    program_description character varying(500),
    no_of_years integer,
    total_no_of_terms integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    year_implemented integer,
    program_term_id integer,
    college_id integer,
    old_index integer,
    program_shortname character varying(100),
    program_major character varying(200),
    separate_assessment character(1)
);


ALTER TABLE public.program OWNER TO dbasevisor;

--
-- Name: program_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.program_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.program_id_seq OWNER TO dbasevisor;

--
-- Name: program_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.program_id_seq OWNED BY public.program.id;


--
-- Name: program_major; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.program_major (
    id integer NOT NULL,
    program_id integer,
    program_major_discipline character varying(200),
    program_major_description character varying(500),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    program_major_shortname character varying(100),
    program_major_code character varying(100)
);


ALTER TABLE public.program_major OWNER TO dbasevisor;

--
-- Name: program_major_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.program_major_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.program_major_id_seq OWNER TO dbasevisor;

--
-- Name: program_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.program_major_id_seq OWNED BY public.program_major.id;


--
-- Name: province; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.province (
    id integer NOT NULL,
    name character varying(512),
    keyword_matches character varying(512),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    correct_num_towns integer
);


ALTER TABLE public.province OWNER TO dbasevisor;

--
-- Name: questionnaire_category; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.questionnaire_category (
    id integer NOT NULL,
    category_num integer,
    description character varying(512),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.questionnaire_category OWNER TO dbasevisor;

--
-- Name: questionnaire_category_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.questionnaire_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionnaire_category_id_seq OWNER TO dbasevisor;

--
-- Name: questionnaire_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.questionnaire_category_id_seq OWNED BY public.questionnaire_category.id;


--
-- Name: questionnaire_comments; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.questionnaire_comments (
    id integer NOT NULL,
    evaluated_id integer,
    comment text,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.questionnaire_comments OWNER TO dbasevisor;

--
-- Name: questionnaire_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.questionnaire_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionnaire_comments_id_seq OWNER TO dbasevisor;

--
-- Name: questionnaire_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.questionnaire_comments_id_seq OWNED BY public.questionnaire_comments.id;


--
-- Name: questionnaire_evaluated; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.questionnaire_evaluated (
    id integer NOT NULL,
    subject_list_id integer,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    course_id integer,
    faculty_id integer,
    academic_term_id integer,
    student_id integer
);


ALTER TABLE public.questionnaire_evaluated OWNER TO dbasevisor;

--
-- Name: questionnaire_evaluated_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.questionnaire_evaluated_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionnaire_evaluated_id_seq OWNER TO dbasevisor;

--
-- Name: questionnaire_evaluated_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.questionnaire_evaluated_id_seq OWNED BY public.questionnaire_evaluated.id;


--
-- Name: questionnaire_results; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.questionnaire_results (
    id integer NOT NULL,
    evaluated_id integer,
    question character varying(512),
    rating integer,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.questionnaire_results OWNER TO dbasevisor;

--
-- Name: questionnaire_results_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.questionnaire_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionnaire_results_id_seq OWNER TO dbasevisor;

--
-- Name: questionnaire_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.questionnaire_results_id_seq OWNED BY public.questionnaire_results.id;


--
-- Name: ref_academic_term; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_academic_term (
    id integer NOT NULL,
    school_year character varying(50),
    semester character varying(50),
    start_ay date,
    end_ay date,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    startdate_grade_submission date,
    enddate_grade_submission date,
    chronological_order integer,
    enrollment_start_date date,
    enrollment_end_date date,
    adc_start_date date,
    adc_end_date date,
    self_enrol_start_date date,
    self_enrol_end_date date
);


ALTER TABLE public.ref_academic_term OWNER TO dbasevisor;

--
-- Name: ref_academic_term_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_academic_term_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_academic_term_id_seq OWNER TO dbasevisor;

--
-- Name: ref_academic_term_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_academic_term_id_seq OWNED BY public.ref_academic_term.id;


--
-- Name: ref_accounts_category; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_accounts_category (
    id integer NOT NULL,
    category_code character varying(15),
    category_name character varying(30),
    category_short_name character varying(30),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ref_accounts_category OWNER TO dbasevisor;

--
-- Name: ref_accounts_category_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_accounts_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_accounts_category_id_seq OWNER TO dbasevisor;

--
-- Name: ref_accounts_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_accounts_category_id_seq OWNED BY public.ref_accounts_category.id;


--
-- Name: ref_accounts_classification; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_accounts_classification (
    id integer NOT NULL,
    classification_code character varying(15),
    classification_name character varying(30),
    classification_short_name character varying(30),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ref_accounts_classification OWNER TO dbasevisor;

--
-- Name: ref_accounts_classification_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_accounts_classification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_accounts_classification_id_seq OWNER TO dbasevisor;

--
-- Name: ref_accounts_classification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_accounts_classification_id_seq OWNED BY public.ref_accounts_classification.id;


--
-- Name: ref_accounts_group; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_accounts_group (
    id integer NOT NULL,
    group_code character varying(15),
    group_name character varying(30),
    group_short_name character varying(30),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ref_accounts_group OWNER TO dbasevisor;

--
-- Name: ref_accounts_group_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_accounts_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_accounts_group_id_seq OWNER TO dbasevisor;

--
-- Name: ref_accounts_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_accounts_group_id_seq OWNED BY public.ref_accounts_group.id;


--
-- Name: ref_accounts_set; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_accounts_set (
    id integer NOT NULL,
    set_code character varying(15),
    set_name character varying(30),
    set_short_name character varying(30),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ref_accounts_set OWNER TO dbasevisor;

--
-- Name: ref_accounts_set_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_accounts_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_accounts_set_id_seq OWNER TO dbasevisor;

--
-- Name: ref_accounts_set_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_accounts_set_id_seq OWNED BY public.ref_accounts_set.id;


--
-- Name: ref_course_area; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_course_area (
    id integer NOT NULL,
    course_area character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ref_course_area OWNER TO dbasevisor;

--
-- Name: ref_course_area_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_course_area_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_course_area_id_seq OWNER TO dbasevisor;

--
-- Name: ref_course_area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_course_area_id_seq OWNED BY public.ref_course_area.id;


--
-- Name: ref_course_level; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_course_level (
    id integer NOT NULL,
    course_level character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ref_course_level OWNER TO dbasevisor;

--
-- Name: ref_course_level_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_course_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_course_level_id_seq OWNER TO dbasevisor;

--
-- Name: ref_course_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_course_level_id_seq OWNED BY public.ref_course_level.id;


--
-- Name: ref_course_mode; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_course_mode (
    id integer NOT NULL,
    course_mode character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ref_course_mode OWNER TO dbasevisor;

--
-- Name: ref_course_mode_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_course_mode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_course_mode_id_seq OWNER TO dbasevisor;

--
-- Name: ref_course_mode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_course_mode_id_seq OWNED BY public.ref_course_mode.id;


--
-- Name: ref_course_type; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_course_type (
    id integer NOT NULL,
    course_type character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ref_course_type OWNER TO dbasevisor;

--
-- Name: ref_course_type_course; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_course_type_course (
    id integer NOT NULL,
    course_id integer,
    ref_course_type_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ref_course_type_course OWNER TO dbasevisor;

--
-- Name: ref_course_type_course_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_course_type_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_course_type_course_id_seq OWNER TO dbasevisor;

--
-- Name: ref_course_type_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_course_type_course_id_seq OWNED BY public.ref_course_type_course.id;


--
-- Name: ref_course_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_course_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_course_type_id_seq OWNER TO dbasevisor;

--
-- Name: ref_course_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_course_type_id_seq OWNED BY public.ref_course_type.id;


--
-- Name: ref_degree; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_degree (
    id integer NOT NULL,
    degree_code character varying,
    degree_name character varying,
    degree_short_name character varying,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    fees_template_id integer,
    close_course_term character(1),
    add_change_fees_id integer
);


ALTER TABLE public.ref_degree OWNER TO dbasevisor;

--
-- Name: ref_degree_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_degree_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_degree_id_seq OWNER TO dbasevisor;

--
-- Name: ref_degree_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_degree_id_seq OWNED BY public.ref_degree.id;


--
-- Name: ref_program_term; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_program_term (
    id integer NOT NULL,
    remarks character varying(50),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    program_term character varying(200)
);


ALTER TABLE public.ref_program_term OWNER TO dbasevisor;

--
-- Name: ref_program_term_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_program_term_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_program_term_id_seq OWNER TO dbasevisor;

--
-- Name: ref_program_term_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_program_term_id_seq OWNED BY public.ref_program_term.id;


--
-- Name: ref_room_type; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_room_type (
    id integer NOT NULL,
    room_type character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.ref_room_type OWNER TO dbasevisor;

--
-- Name: ref_room_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_room_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_room_type_id_seq OWNER TO dbasevisor;

--
-- Name: ref_room_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_room_type_id_seq OWNED BY public.ref_room_type.id;


--
-- Name: ref_shifter_transferee_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_shifter_transferee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_shifter_transferee_seq OWNER TO dbasevisor;

--
-- Name: ref_shifter_transferee; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_shifter_transferee (
    id integer DEFAULT nextval('public.ref_shifter_transferee_seq'::regclass) NOT NULL,
    student_id integer,
    academic_term_id integer,
    department_program_id integer,
    old_student_no character varying(20),
    st_type character varying(20),
    curriculum_id integer,
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    is_active character(1),
    has_new_student_no character(1)
);


ALTER TABLE public.ref_shifter_transferee OWNER TO dbasevisor;

--
-- Name: ref_year_term; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.ref_year_term (
    id integer NOT NULL,
    year_level integer,
    year_level_description character varying(100),
    year_term_description character varying(100),
    remarks character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    semester integer,
    semester_code integer,
    educational_level integer,
    chronological_order integer
);


ALTER TABLE public.ref_year_term OWNER TO dbasevisor;

--
-- Name: ref_year_term_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.ref_year_term_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_year_term_id_seq OWNER TO dbasevisor;

--
-- Name: ref_year_term_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.ref_year_term_id_seq OWNED BY public.ref_year_term.id;


--
-- Name: registrar_unit; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.registrar_unit (
    id integer NOT NULL,
    auth_user_id integer,
    college_id integer,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.registrar_unit OWNER TO dbasevisor;

--
-- Name: registrar_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.registrar_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registrar_unit_id_seq OWNER TO dbasevisor;

--
-- Name: registrar_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.registrar_unit_id_seq OWNED BY public.registrar_unit.id;


--
-- Name: room; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.room (
    id integer NOT NULL,
    room_code character varying(20),
    room_name character varying(50),
    room_shortname character varying(50),
    building_id integer,
    capacity integer,
    remarks character varying(100),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    room_type integer
);


ALTER TABLE public.room OWNER TO dbasevisor;

--
-- Name: room_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_id_seq OWNER TO dbasevisor;

--
-- Name: room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.room_id_seq OWNED BY public.room.id;


--
-- Name: sc_error_report; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.sc_error_report (
    id integer NOT NULL
);


ALTER TABLE public.sc_error_report OWNER TO dbasevisor;

--
-- Name: sc_error_report_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.sc_error_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sc_error_report_id_seq OWNER TO dbasevisor;

--
-- Name: sc_error_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.sc_error_report_id_seq OWNED BY public.sc_error_report.id;


--
-- Name: scholarship; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship (
    id integer NOT NULL,
    scholarship_name character varying(512),
    scholarship_shortname character varying(100),
    scholarship_provider_id integer,
    remarks character varying(200),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    scholarship_category_id integer
);


ALTER TABLE public.scholarship OWNER TO dbasevisor;

--
-- Name: scholarship_application; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_application (
    id integer NOT NULL,
    student_id integer,
    scholarship_subtype_id integer,
    has_itr_or_cert_tax_exemption character(1),
    has_cert_adviser character(1),
    has_affidavit_no_scholarships character(1),
    has_cert_bu_hrmo character(1),
    has_cog character(1),
    is_active character(1),
    has_cert_or_recom_dean character(1),
    has_performing_arts_contract character(1),
    has_cert_benefactor character(1),
    has_cert_buufa_or_buants character(1),
    has_cert_buipesr character(1),
    has_contract_of_scholarship character(1),
    has_cor_or_preassessment_form character(1),
    has_cert_mayor_or_dilg character(1),
    academic_term_id integer,
    status character varying(512),
    date_action_taken date,
    date_submitted date
);


ALTER TABLE public.scholarship_application OWNER TO dbasevisor;

--
-- Name: scholarship_application_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_application_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_application_id_seq OWNED BY public.scholarship_application.id;


--
-- Name: scholarship_application_newapplicant; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_application_newapplicant (
    id integer NOT NULL,
    scholarship_application_id integer,
    has_hs_report_card character(1),
    has_bucet_result character(1),
    has_birth_cert character(1),
    is_active character(1),
    has_cert_good_moral character(1)
);


ALTER TABLE public.scholarship_application_newapplicant OWNER TO dbasevisor;

--
-- Name: scholarship_application_newapplicant_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_application_newapplicant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_application_newapplicant_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_application_newapplicant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_application_newapplicant_id_seq OWNED BY public.scholarship_application_newapplicant.id;


--
-- Name: scholarship_category; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_category (
    id integer NOT NULL,
    remarks character varying(512),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    category_name character varying(200)
);


ALTER TABLE public.scholarship_category OWNER TO dbasevisor;

--
-- Name: scholarship_category_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_category_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_category_id_seq OWNED BY public.scholarship_category.id;


--
-- Name: scholarship_grant_template; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_grant_template (
    id integer NOT NULL,
    scholarship_provider_id integer,
    account_fees_id integer,
    description character varying(200),
    type integer,
    remarks character varying(200),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.scholarship_grant_template OWNER TO dbasevisor;

--
-- Name: scholarship_grant_template_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_grant_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_grant_template_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_grant_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_grant_template_id_seq OWNED BY public.scholarship_grant_template.id;


--
-- Name: scholarship_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_id_seq OWNED BY public.scholarship.id;


--
-- Name: scholarship_provider; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_provider (
    id integer NOT NULL,
    provider_code character varying(50),
    provider_name character varying(100),
    remarks character varying(200),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.scholarship_provider OWNER TO dbasevisor;

--
-- Name: scholarship_provider_group; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_provider_group (
    id integer NOT NULL,
    provider_group_code character varying(50),
    provider_group_name character varying(100),
    remarks character varying(200),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.scholarship_provider_group OWNER TO dbasevisor;

--
-- Name: scholarship_provider_group_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_provider_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_provider_group_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_provider_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_provider_group_id_seq OWNED BY public.scholarship_provider_group.id;


--
-- Name: scholarship_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_provider_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_provider_id_seq OWNED BY public.scholarship_provider.id;


--
-- Name: scholarship_provider_level; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_provider_level (
    id integer NOT NULL,
    provider_level_code character varying(50),
    provider_level_name character varying(100),
    remarks character varying(200),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.scholarship_provider_level OWNER TO dbasevisor;

--
-- Name: scholarship_provider_level_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_provider_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_provider_level_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_provider_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_provider_level_id_seq OWNED BY public.scholarship_provider_level.id;


--
-- Name: scholarship_provider_type; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_provider_type (
    id integer NOT NULL,
    provider_type_code character varying(50),
    provider_type_name character varying(100),
    remarks character varying(200),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.scholarship_provider_type OWNER TO dbasevisor;

--
-- Name: scholarship_provider_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_provider_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_provider_type_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_provider_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_provider_type_id_seq OWNED BY public.scholarship_provider_type.id;


--
-- Name: scholarship_subtype; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_subtype (
    id integer NOT NULL,
    scholarship_id integer,
    scholarship_subtype_code character varying(512),
    scholarship_transaction_type character varying(512),
    remarks character varying(512),
    active character varying(512),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    scholarship_subtype_description character varying(500),
    scholarship_subtype_name character varying(512)
);


ALTER TABLE public.scholarship_subtype OWNER TO dbasevisor;

--
-- Name: scholarship_subtype_billing; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_subtype_billing (
    id integer NOT NULL,
    scholarship_subtype_id integer,
    amount numeric(7,2),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.scholarship_subtype_billing OWNER TO dbasevisor;

--
-- Name: scholarship_subtype_billing_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_subtype_billing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_subtype_billing_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_subtype_billing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_subtype_billing_id_seq OWNED BY public.scholarship_subtype_billing.id;


--
-- Name: scholarship_subtype_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_subtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_subtype_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_subtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_subtype_id_seq OWNED BY public.scholarship_subtype.id;


--
-- Name: scholarship_subtype_tfdiscount; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_subtype_tfdiscount (
    id integer NOT NULL,
    scholarship_subtype_id integer,
    scholarship_coverage_type character varying(512),
    percentage integer,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.scholarship_subtype_tfdiscount OWNER TO dbasevisor;

--
-- Name: scholarship_subtype_tfdiscount_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_subtype_tfdiscount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_subtype_tfdiscount_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_subtype_tfdiscount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_subtype_tfdiscount_id_seq OWNED BY public.scholarship_subtype_tfdiscount.id;


--
-- Name: scholarship_tagging; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_tagging (
    id integer NOT NULL,
    student_id integer,
    scholarship_subtype_id integer,
    academic_term_id integer,
    remarks character varying(512),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    actual_payment numeric(20,2),
    student_registration_id integer
);


ALTER TABLE public.scholarship_tagging OWNER TO dbasevisor;

--
-- Name: scholarship_tagging_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_tagging_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_tagging_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_tagging_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_tagging_id_seq OWNED BY public.scholarship_tagging.id;


--
-- Name: scholarship_untag_request; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.scholarship_untag_request (
    id integer NOT NULL,
    scholarship_tagging_id integer,
    untag_request_by integer,
    untag_request_on date,
    untag_request_remarks character varying(512),
    untag_confirmed_by integer,
    untag_confirmed_on date,
    untag_confirmed_remarks character varying(512)
);


ALTER TABLE public.scholarship_untag_request OWNER TO dbasevisor;

--
-- Name: scholarship_untag_request_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.scholarship_untag_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholarship_untag_request_id_seq OWNER TO dbasevisor;

--
-- Name: scholarship_untag_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.scholarship_untag_request_id_seq OWNED BY public.scholarship_untag_request.id;


--
-- Name: signatories; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.signatories (
    id integer NOT NULL,
    last_name character varying(50),
    first_name character varying(50),
    middle_initial character varying(5),
    "position" character varying(50),
    unit character varying(100),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    print_type character varying(5)
);


ALTER TABLE public.signatories OWNER TO dbasevisor;

--
-- Name: signatories_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.signatories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.signatories_id_seq OWNER TO dbasevisor;

--
-- Name: signatories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.signatories_id_seq OWNED BY public.signatories.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.student (
    id integer NOT NULL,
    stud_lname character varying(50),
    stud_fname character varying(50),
    stud_mname character varying(50),
    dateofbirth date,
    college_id integer,
    active character(1),
    userlogin_id integer,
    curriculum_id integer,
    new_curriculum_id integer,
    program_id integer,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    stud_yearlevel integer,
    old_stud_num character varying(30),
    stud_mi character varying(3),
    program_major_id integer,
    stud_num character varying(30),
    stud_code character(20),
    stud_password character varying(40),
    year_level integer,
    email_address character varying(100),
    department_program_id integer,
    gender character varying,
    academic_term_id integer,
    regular character(1),
    default_password character varying(40),
    monthly_family_income_id integer,
    stud_degree integer,
    stud_email character varying(128),
    stud_yearoflastschool integer,
    stud_lrn character varying(50),
    stud_hs_gwa numeric(20,2)
);


ALTER TABLE public.student OWNER TO dbasevisor;

--
-- Name: student_assessment; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.student_assessment (
    id integer NOT NULL,
    assessment_of_fees_id integer,
    account_fees_id integer,
    fee_amount numeric(10,2),
    student_id integer,
    term_id integer,
    year_term_id integer,
    reference_no integer,
    active character(1),
    isadditional character(1),
    enrollment_id integer,
    transaction_type_id integer,
    enrollment_transaction character varying(2),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    student_registration_id integer
);


ALTER TABLE public.student_assessment OWNER TO dbasevisor;

--
-- Name: student_assessment_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.student_assessment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_assessment_id_seq OWNER TO dbasevisor;

--
-- Name: student_assessment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.student_assessment_id_seq OWNED BY public.student_assessment.id;


--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO dbasevisor;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- Name: student_ledger; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.student_ledger (
    id integer NOT NULL,
    student_no integer,
    primary_refno character varying(9),
    transaction_date timestamp without time zone,
    debit numeric(20,2),
    credit numeric(20,2),
    balance numeric(20,2),
    isposted character(1),
    posted_date timestamp without time zone,
    postedby_id integer,
    term_id integer,
    secondary_refno character varying(9),
    transaction_code character varying(5),
    remarks character varying(200),
    forwarded_balance numeric(20,2),
    assessment_refno character varying(9),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.student_ledger OWNER TO dbasevisor;

--
-- Name: student_ledger_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.student_ledger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_ledger_id_seq OWNER TO dbasevisor;

--
-- Name: student_ledger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.student_ledger_id_seq OWNED BY public.student_ledger.id;


--
-- Name: student_monthly_family_income; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.student_monthly_family_income (
    id integer NOT NULL,
    monthly_income character varying(100),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.student_monthly_family_income OWNER TO dbasevisor;

--
-- Name: student_monthly_family_income_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.student_monthly_family_income_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_monthly_family_income_id_seq OWNER TO dbasevisor;

--
-- Name: student_monthly_family_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.student_monthly_family_income_id_seq OWNED BY public.student_monthly_family_income.id;


--
-- Name: student_profile; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.student_profile (
    id integer NOT NULL,
    student_id integer,
    studp_suffix character varying(512),
    studp_maiden_name character varying(512),
    studp_place_of_birth character varying(512),
    studp_civil_status character varying(512),
    studp_nationality character varying(512),
    studp_height_ft character varying(512),
    studp_weight_kg integer,
    studp_bloodtype character varying(512),
    studp_current_houseno_street character varying(512),
    studp_current_barangay character varying(512),
    studp_current_town_city character varying(512),
    studp_current_zipcode character varying(512),
    studp_current_province character varying(512),
    studp_permanent_houseno_street character varying(512),
    studp_permanent_barangay character varying(512),
    studp_permanent_town_city character varying(512),
    studp_permanent_zipcode character varying(512),
    studp_permanent_province character varying(512),
    studp_mobile_no character varying(512),
    studp_telephone_no character varying(512),
    studp_bu_email_address character varying(512),
    studp_alternate_email_address character varying(512),
    studp_father_name character varying(512),
    studp_father_birthdate timestamp without time zone,
    studp_father_occupation character varying(512),
    studp_father_company character varying(512),
    studp_father_company_address character varying(512),
    studp_father_telephone_no character varying(512),
    studp_father_mobile_no character varying(512),
    studp_mother_name character varying(512),
    studp_mother_birthdate timestamp without time zone,
    studp_mother_occupation character varying(512),
    studp_mother_company character varying(512),
    studp_mother_company_address character varying(512),
    studp_mother_telephone_no character varying(512),
    studp_mother_mobile_no character varying(512),
    studp_num_brothers integer,
    studp_num_sisters integer,
    studp_guardian_name character varying(512),
    studp_guardian_relationship character varying(512),
    studp_guardian_houseno_street character varying(512),
    studp_guardian_barangay character varying(512),
    studp_guardian_town_city character varying(512),
    studp_guardian_province character varying(512),
    studp_guardian_zipcode character varying(512),
    studp_guardian_occupation character varying(512),
    studp_guardian_company character varying(512),
    studp_guardian_company_address character varying(512),
    studp_guardian_mobile_no character varying(512),
    studp_guardian_telephone_no character varying(512),
    studp_guardian_email_address character varying(512),
    studp_emergency_contact_name character varying(512),
    studp_emergency_contact_address character varying(512),
    studp_emergency_mobile_no character varying(512),
    studp_emergency_telephone_no character varying(512),
    studp_elemschool_name character varying(512),
    studp_elemschool_address character varying(512),
    studp_elemschool_start_date timestamp without time zone,
    studp_elemschool_end_date timestamp without time zone,
    studp_elemschool_awards_honors character varying(512),
    studp_highschool_name character varying(512),
    studp_highschool_address character varying(512),
    studp_highschool_start_date timestamp without time zone,
    studp_highschool_end_date timestamp without time zone,
    studp_highschool_awards_honors character varying(512),
    studp_vocational_name character varying(512),
    studp_vocational_address character varying(512),
    studp_vocational_degree character varying(512),
    studp_vocational_start_date timestamp without time zone,
    studp_vocational_end_date timestamp without time zone,
    studp_college_name character varying(512),
    studp_college_address character varying(512),
    studp_college_degree character varying(512),
    studp_college_start_date timestamp without time zone,
    studp_college_end_date timestamp without time zone,
    studp_college_awards_honors character varying(512),
    studp_masters_name character varying(512),
    studp_masters_address character varying(512),
    studp_masters_degree character varying(512),
    studp_masters_start_date timestamp without time zone,
    studp_masters_end_date timestamp without time zone,
    studp_doctoral_name character varying(512),
    studp_doctoral_address character varying(512),
    studp_doctoral_degree character varying(512),
    studp_doctoral_start_date timestamp without time zone,
    studp_doctoral_end_date timestamp without time zone,
    active character(1),
    remarks character varying(512),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    is_active character(1),
    studp_date_of_birth date
);


ALTER TABLE public.student_profile OWNER TO dbasevisor;

--
-- Name: student_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.student_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_profile_id_seq OWNER TO dbasevisor;

--
-- Name: student_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.student_profile_id_seq OWNED BY public.student_profile.id;


--
-- Name: student_registration; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.student_registration (
    id integer NOT NULL,
    student_no integer,
    account_fees_id integer,
    registration_code character varying(15),
    assess_fee numeric(20,2),
    actual_payment numeric(20,2),
    outstanding_balance numeric(20,2),
    additional_balance numeric(20,2),
    transaction_date timestamp without time zone,
    server_date timestamp without time zone,
    term_id integer,
    year_term_id integer,
    isfullypaid character(1),
    ispartiallypaid character(1),
    isofficiallyenrolled character(1),
    program_id integer,
    college_id integer,
    active character(1),
    cor_signatory integer,
    or_signatory integer,
    transaction_type_id integer,
    enrollment_id integer,
    enrollment_transaction character varying(2),
    payment_refno character varying(9),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    curriculum_id integer,
    regular character(1),
    status character varying(20),
    department_program_id integer,
    semester_code integer,
    block_id integer,
    isvalidated character(1),
    validation_date timestamp without time zone,
    validation_type character varying(10),
    validated_by integer,
    year_level integer,
    officially_enrolled_date timestamp without time zone
);


ALTER TABLE public.student_registration OWNER TO dbasevisor;

--
-- Name: student_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.student_registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_registration_id_seq OWNER TO dbasevisor;

--
-- Name: student_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.student_registration_id_seq OWNED BY public.student_registration.id;


--
-- Name: student_userinfo; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.student_userinfo (
    id integer NOT NULL,
    student_id integer,
    first_name character varying(128),
    last_name character varying(128),
    email character varying(128),
    username character varying(100),
    password character varying(512),
    registration_key character varying(512),
    reset_password_key character varying(512),
    registration_id character varying(512),
    first_login character(1)
);


ALTER TABLE public.student_userinfo OWNER TO dbasevisor;

--
-- Name: student_userinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.student_userinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_userinfo_id_seq OWNER TO dbasevisor;

--
-- Name: student_userinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.student_userinfo_id_seq OWNED BY public.student_userinfo.id;


--
-- Name: studentuser_event; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.studentuser_event (
    id integer NOT NULL,
    time_stamp timestamp without time zone,
    client_ip character varying(512),
    user_id integer,
    origin character varying(512),
    description text
);


ALTER TABLE public.studentuser_event OWNER TO dbasevisor;

--
-- Name: studentuser_event_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.studentuser_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studentuser_event_id_seq OWNER TO dbasevisor;

--
-- Name: studentuser_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.studentuser_event_id_seq OWNED BY public.studentuser_event.id;


--
-- Name: studentuser_group; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.studentuser_group (
    id integer NOT NULL,
    role character varying(512),
    description text
);


ALTER TABLE public.studentuser_group OWNER TO dbasevisor;

--
-- Name: studentuser_group_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.studentuser_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studentuser_group_id_seq OWNER TO dbasevisor;

--
-- Name: studentuser_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.studentuser_group_id_seq OWNED BY public.studentuser_group.id;


--
-- Name: studentuser_membership; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.studentuser_membership (
    id integer NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public.studentuser_membership OWNER TO dbasevisor;

--
-- Name: studentuser_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.studentuser_membership_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studentuser_membership_id_seq OWNER TO dbasevisor;

--
-- Name: studentuser_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.studentuser_membership_id_seq OWNED BY public.studentuser_membership.id;


--
-- Name: studentuser_permission; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.studentuser_permission (
    id integer NOT NULL,
    group_id integer,
    name character varying(512),
    table_name character varying(512),
    record_id integer
);


ALTER TABLE public.studentuser_permission OWNER TO dbasevisor;

--
-- Name: studentuser_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.studentuser_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studentuser_permission_id_seq OWNER TO dbasevisor;

--
-- Name: studentuser_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.studentuser_permission_id_seq OWNED BY public.studentuser_permission.id;


--
-- Name: subject_list; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.subject_list (
    id integer NOT NULL,
    course_schedule_id integer,
    student_id integer,
    year_term_id integer,
    encoded_by integer,
    active character(1),
    isadditional character(1),
    enrollment_id integer,
    ischanged character(1),
    isdropped character(1),
    isreplacement character(1),
    isaddedcourse character(1),
    transaction character varying(1),
    drop_reason character varying(200),
    academicterm_id integer,
    replaced_course_id integer,
    midterm_grade character varying(5),
    tentative_grade character varying(5),
    final_grade character varying(5),
    note character varying(100),
    remarks character varying(20),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    student_registration_id integer,
    course_id integer,
    is_posted boolean,
    date_posted timestamp without time zone
);


ALTER TABLE public.subject_list OWNER TO dbasevisor;

--
-- Name: subject_list_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.subject_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_list_id_seq OWNER TO dbasevisor;

--
-- Name: subject_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.subject_list_id_seq OWNED BY public.subject_list.id;


--
-- Name: temp_student_curriculum; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.temp_student_curriculum (
    id integer NOT NULL,
    student_no integer,
    curriculum_id integer,
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.temp_student_curriculum OWNER TO dbasevisor;

--
-- Name: temp_student_curriculum_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.temp_student_curriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_student_curriculum_id_seq OWNER TO dbasevisor;

--
-- Name: temp_student_curriculum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.temp_student_curriculum_id_seq OWNED BY public.temp_student_curriculum.id;


--
-- Name: tmp_account_finance; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.tmp_account_finance (
    id integer NOT NULL,
    stud_num character varying(15),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    academic_term_id integer,
    include character(1),
    program_id integer,
    stud_yearlevel integer,
    college_id integer,
    balance character varying(512),
    is_imported character(1)
);


ALTER TABLE public.tmp_account_finance OWNER TO dbasevisor;

--
-- Name: tmp_account_finance_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.tmp_account_finance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tmp_account_finance_id_seq OWNER TO dbasevisor;

--
-- Name: tmp_account_finance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.tmp_account_finance_id_seq OWNED BY public.tmp_account_finance.id;


--
-- Name: tmp_import_students; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.tmp_import_students (
    id integer NOT NULL,
    college_id integer,
    course_id integer,
    line character varying(512),
    remarks character varying(512),
    stud_num character varying(15),
    stud_lname character varying(100),
    stud_fname character varying(100),
    stud_mname character varying(100),
    gender character varying(512),
    dateofbirth date,
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.tmp_import_students OWNER TO dbasevisor;

--
-- Name: tmp_import_students_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.tmp_import_students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tmp_import_students_id_seq OWNER TO dbasevisor;

--
-- Name: tmp_import_students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.tmp_import_students_id_seq OWNED BY public.tmp_import_students.id;


--
-- Name: transaction_logs; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.transaction_logs (
    id integer NOT NULL,
    email character varying(40),
    ipaddress character varying(20),
    event_date timestamp without time zone,
    which_module character varying(100),
    action character varying(100),
    parameters character varying(2000),
    active character(1),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.transaction_logs OWNER TO dbasevisor;

--
-- Name: transaction_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.transaction_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_logs_id_seq OWNER TO dbasevisor;

--
-- Name: transaction_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.transaction_logs_id_seq OWNED BY public.transaction_logs.id;


--
-- Name: transaction_type; Type: TABLE; Schema: public; Owner: dbasevisor
--

CREATE TABLE public.transaction_type (
    id integer NOT NULL,
    transaction_type character varying(50),
    description character varying(100),
    shortname character varying(10),
    is_active character(1),
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.transaction_type OWNER TO dbasevisor;

--
-- Name: transaction_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dbasevisor
--

CREATE SEQUENCE public.transaction_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_type_id_seq OWNER TO dbasevisor;

--
-- Name: transaction_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbasevisor
--

ALTER SEQUENCE public.transaction_type_id_seq OWNED BY public.transaction_type.id;


--
-- Name: academic_ledger id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.academic_ledger ALTER COLUMN id SET DEFAULT nextval('public.academic_ledger_id_seq'::regclass);


--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- Name: accounts_fees id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.accounts_fees ALTER COLUMN id SET DEFAULT nextval('public.accounts_fees_id_seq'::regclass);


--
-- Name: assessment_items id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_items ALTER COLUMN id SET DEFAULT nextval('public.assessment_items_id_seq'::regclass);


--
-- Name: assessment_of_fees id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_of_fees ALTER COLUMN id SET DEFAULT nextval('public.assessment_of_fees_id_seq'::regclass);


--
-- Name: auth_cas id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_cas ALTER COLUMN id SET DEFAULT nextval('public.auth_cas_id_seq'::regclass);


--
-- Name: auth_event id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_event ALTER COLUMN id SET DEFAULT nextval('public.auth_event_id_seq'::regclass);


--
-- Name: auth_extension id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_extension ALTER COLUMN id SET DEFAULT nextval('public.auth_extension_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_membership id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_membership ALTER COLUMN id SET DEFAULT nextval('public.auth_membership_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: bank_payment id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.bank_payment ALTER COLUMN id SET DEFAULT nextval('public.bank_payment_id_seq'::regclass);


--
-- Name: block id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.block ALTER COLUMN id SET DEFAULT nextval('public.block_id_seq'::regclass);


--
-- Name: building id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.building ALTER COLUMN id SET DEFAULT nextval('public.building_id_seq'::regclass);


--
-- Name: campus id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.campus ALTER COLUMN id SET DEFAULT nextval('public.campus_id_seq'::regclass);


--
-- Name: chart_of_accounts id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.chart_of_accounts ALTER COLUMN id SET DEFAULT nextval('public.chart_of_accounts_id_seq'::regclass);


--
-- Name: check_table id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.check_table ALTER COLUMN id SET DEFAULT nextval('public.check_table_id_seq'::regclass);


--
-- Name: class_event id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_event ALTER COLUMN id SET DEFAULT nextval('public.class_event_id_seq'::regclass);


--
-- Name: class_schedule id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_schedule ALTER COLUMN id SET DEFAULT nextval('public.class_schedule_id_seq'::regclass);


--
-- Name: clearance_status id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.clearance_status ALTER COLUMN id SET DEFAULT nextval('public.clearance_status_id_seq'::regclass);


--
-- Name: college id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college ALTER COLUMN id SET DEFAULT nextval('public.college_id_seq'::regclass);


--
-- Name: college_department id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college_department ALTER COLUMN id SET DEFAULT nextval('public.college_department_id_seq'::regclass);


--
-- Name: cor_assessment id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_assessment ALTER COLUMN id SET DEFAULT nextval('public.cor_assessment_id_seq'::regclass);


--
-- Name: cor_schedule id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_schedule ALTER COLUMN id SET DEFAULT nextval('public.cor_schedule_id_seq'::regclass);


--
-- Name: cor_student_registration id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_student_registration ALTER COLUMN id SET DEFAULT nextval('public.cor_student_registration_id_seq'::regclass);


--
-- Name: cor_subject_list id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_subject_list ALTER COLUMN id SET DEFAULT nextval('public.cor_subject_list_id_seq'::regclass);


--
-- Name: course id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);


--
-- Name: course_equivalency id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_equivalency ALTER COLUMN id SET DEFAULT nextval('public.course_equivalency_id_seq'::regclass);


--
-- Name: course_requisite id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_requisite ALTER COLUMN id SET DEFAULT nextval('public.course_requisite_id_seq'::regclass);


--
-- Name: course_schedule id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule ALTER COLUMN id SET DEFAULT nextval('public.course_schedule_id_seq'::regclass);


--
-- Name: course_special_fee id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_special_fee ALTER COLUMN id SET DEFAULT nextval('public.course_special_fee_id_seq'::regclass);


--
-- Name: curriculum id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum ALTER COLUMN id SET DEFAULT nextval('public.curriculum_id_seq'::regclass);


--
-- Name: curriculum_course id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum_course ALTER COLUMN id SET DEFAULT nextval('public.curriculum_course_id_seq'::regclass);


--
-- Name: default_assessment id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.default_assessment ALTER COLUMN id SET DEFAULT nextval('public.default_assessment_id_seq'::regclass);


--
-- Name: department id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department ALTER COLUMN id SET DEFAULT nextval('public.department_id_seq'::regclass);


--
-- Name: department_program id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department_program ALTER COLUMN id SET DEFAULT nextval('public.department_program_id_seq'::regclass);


--
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: employee_designation id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_designation ALTER COLUMN id SET DEFAULT nextval('public.employee_designation_id_seq'::regclass);


--
-- Name: employee_faculty_designation id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_designation ALTER COLUMN id SET DEFAULT nextval('public.employee_faculty_designation_id_seq'::regclass);


--
-- Name: employee_faculty_wec id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_wec ALTER COLUMN id SET DEFAULT nextval('public.employee_faculty_wec_id_seq'::regclass);


--
-- Name: enrollment_settings id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.enrollment_settings ALTER COLUMN id SET DEFAULT nextval('public.enrollment_settings_id_seq'::regclass);


--
-- Name: evaluation id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation ALTER COLUMN id SET DEFAULT nextval('public.evaluation_id_seq'::regclass);


--
-- Name: evaluation_sheets id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation_sheets ALTER COLUMN id SET DEFAULT nextval('public.evaluation_sheets_id_seq'::regclass);


--
-- Name: import_upload id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.import_upload ALTER COLUMN id SET DEFAULT nextval('public.import_upload_id_seq'::regclass);


--
-- Name: office id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.office ALTER COLUMN id SET DEFAULT nextval('public.office_id_seq'::regclass);


--
-- Name: or_printlogs id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.or_printlogs ALTER COLUMN id SET DEFAULT nextval('public.or_printlogs_id_seq'::regclass);


--
-- Name: ors_settings id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ors_settings ALTER COLUMN id SET DEFAULT nextval('public.ors_settings_id_seq'::regclass);


--
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- Name: payment_details id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_details ALTER COLUMN id SET DEFAULT nextval('public.payment_details_id_seq'::regclass);


--
-- Name: payment_mode id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_mode ALTER COLUMN id SET DEFAULT nextval('public.payment_mode_id_seq'::regclass);


--
-- Name: preregistration_subjects id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects ALTER COLUMN id SET DEFAULT nextval('public.preregistration_subjects_id_seq'::regclass);


--
-- Name: program id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program ALTER COLUMN id SET DEFAULT nextval('public.program_id_seq'::regclass);


--
-- Name: program_major id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program_major ALTER COLUMN id SET DEFAULT nextval('public.program_major_id_seq'::regclass);


--
-- Name: questionnaire_category id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_category ALTER COLUMN id SET DEFAULT nextval('public.questionnaire_category_id_seq'::regclass);


--
-- Name: questionnaire_comments id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_comments ALTER COLUMN id SET DEFAULT nextval('public.questionnaire_comments_id_seq'::regclass);


--
-- Name: questionnaire_evaluated id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_evaluated ALTER COLUMN id SET DEFAULT nextval('public.questionnaire_evaluated_id_seq'::regclass);


--
-- Name: questionnaire_results id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_results ALTER COLUMN id SET DEFAULT nextval('public.questionnaire_results_id_seq'::regclass);


--
-- Name: ref_academic_term id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_academic_term ALTER COLUMN id SET DEFAULT nextval('public.ref_academic_term_id_seq'::regclass);


--
-- Name: ref_accounts_category id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_category ALTER COLUMN id SET DEFAULT nextval('public.ref_accounts_category_id_seq'::regclass);


--
-- Name: ref_accounts_classification id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_classification ALTER COLUMN id SET DEFAULT nextval('public.ref_accounts_classification_id_seq'::regclass);


--
-- Name: ref_accounts_group id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_group ALTER COLUMN id SET DEFAULT nextval('public.ref_accounts_group_id_seq'::regclass);


--
-- Name: ref_accounts_set id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_set ALTER COLUMN id SET DEFAULT nextval('public.ref_accounts_set_id_seq'::regclass);


--
-- Name: ref_course_area id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_area ALTER COLUMN id SET DEFAULT nextval('public.ref_course_area_id_seq'::regclass);


--
-- Name: ref_course_level id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_level ALTER COLUMN id SET DEFAULT nextval('public.ref_course_level_id_seq'::regclass);


--
-- Name: ref_course_mode id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_mode ALTER COLUMN id SET DEFAULT nextval('public.ref_course_mode_id_seq'::regclass);


--
-- Name: ref_course_type id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_type ALTER COLUMN id SET DEFAULT nextval('public.ref_course_type_id_seq'::regclass);


--
-- Name: ref_course_type_course id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_type_course ALTER COLUMN id SET DEFAULT nextval('public.ref_course_type_course_id_seq'::regclass);


--
-- Name: ref_degree id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_degree ALTER COLUMN id SET DEFAULT nextval('public.ref_degree_id_seq'::regclass);


--
-- Name: ref_program_term id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_program_term ALTER COLUMN id SET DEFAULT nextval('public.ref_program_term_id_seq'::regclass);


--
-- Name: ref_room_type id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_room_type ALTER COLUMN id SET DEFAULT nextval('public.ref_room_type_id_seq'::regclass);


--
-- Name: ref_year_term id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_year_term ALTER COLUMN id SET DEFAULT nextval('public.ref_year_term_id_seq'::regclass);


--
-- Name: registrar_unit id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.registrar_unit ALTER COLUMN id SET DEFAULT nextval('public.registrar_unit_id_seq'::regclass);


--
-- Name: room id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.room ALTER COLUMN id SET DEFAULT nextval('public.room_id_seq'::regclass);


--
-- Name: sc_error_report id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.sc_error_report ALTER COLUMN id SET DEFAULT nextval('public.sc_error_report_id_seq'::regclass);


--
-- Name: scholarship id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship ALTER COLUMN id SET DEFAULT nextval('public.scholarship_id_seq'::regclass);


--
-- Name: scholarship_application id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_application ALTER COLUMN id SET DEFAULT nextval('public.scholarship_application_id_seq'::regclass);


--
-- Name: scholarship_application_newapplicant id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_application_newapplicant ALTER COLUMN id SET DEFAULT nextval('public.scholarship_application_newapplicant_id_seq'::regclass);


--
-- Name: scholarship_category id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_category ALTER COLUMN id SET DEFAULT nextval('public.scholarship_category_id_seq'::regclass);


--
-- Name: scholarship_grant_template id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_grant_template ALTER COLUMN id SET DEFAULT nextval('public.scholarship_grant_template_id_seq'::regclass);


--
-- Name: scholarship_provider id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider ALTER COLUMN id SET DEFAULT nextval('public.scholarship_provider_id_seq'::regclass);


--
-- Name: scholarship_provider_group id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_group ALTER COLUMN id SET DEFAULT nextval('public.scholarship_provider_group_id_seq'::regclass);


--
-- Name: scholarship_provider_level id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_level ALTER COLUMN id SET DEFAULT nextval('public.scholarship_provider_level_id_seq'::regclass);


--
-- Name: scholarship_provider_type id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_type ALTER COLUMN id SET DEFAULT nextval('public.scholarship_provider_type_id_seq'::regclass);


--
-- Name: scholarship_subtype id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype ALTER COLUMN id SET DEFAULT nextval('public.scholarship_subtype_id_seq'::regclass);


--
-- Name: scholarship_subtype_billing id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype_billing ALTER COLUMN id SET DEFAULT nextval('public.scholarship_subtype_billing_id_seq'::regclass);


--
-- Name: scholarship_subtype_tfdiscount id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype_tfdiscount ALTER COLUMN id SET DEFAULT nextval('public.scholarship_subtype_tfdiscount_id_seq'::regclass);


--
-- Name: scholarship_tagging id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_tagging ALTER COLUMN id SET DEFAULT nextval('public.scholarship_tagging_id_seq'::regclass);


--
-- Name: scholarship_untag_request id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_untag_request ALTER COLUMN id SET DEFAULT nextval('public.scholarship_untag_request_id_seq'::regclass);


--
-- Name: signatories id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.signatories ALTER COLUMN id SET DEFAULT nextval('public.signatories_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- Name: student_assessment id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment ALTER COLUMN id SET DEFAULT nextval('public.student_assessment_id_seq'::regclass);


--
-- Name: student_ledger id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_ledger ALTER COLUMN id SET DEFAULT nextval('public.student_ledger_id_seq'::regclass);


--
-- Name: student_monthly_family_income id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_monthly_family_income ALTER COLUMN id SET DEFAULT nextval('public.student_monthly_family_income_id_seq'::regclass);


--
-- Name: student_profile id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_profile ALTER COLUMN id SET DEFAULT nextval('public.student_profile_id_seq'::regclass);


--
-- Name: student_registration id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration ALTER COLUMN id SET DEFAULT nextval('public.student_registration_id_seq'::regclass);


--
-- Name: student_userinfo id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_userinfo ALTER COLUMN id SET DEFAULT nextval('public.student_userinfo_id_seq'::regclass);


--
-- Name: studentuser_event id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_event ALTER COLUMN id SET DEFAULT nextval('public.studentuser_event_id_seq'::regclass);


--
-- Name: studentuser_group id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_group ALTER COLUMN id SET DEFAULT nextval('public.studentuser_group_id_seq'::regclass);


--
-- Name: studentuser_membership id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_membership ALTER COLUMN id SET DEFAULT nextval('public.studentuser_membership_id_seq'::regclass);


--
-- Name: studentuser_permission id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_permission ALTER COLUMN id SET DEFAULT nextval('public.studentuser_permission_id_seq'::regclass);


--
-- Name: subject_list id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list ALTER COLUMN id SET DEFAULT nextval('public.subject_list_id_seq'::regclass);


--
-- Name: temp_student_curriculum id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.temp_student_curriculum ALTER COLUMN id SET DEFAULT nextval('public.temp_student_curriculum_id_seq'::regclass);


--
-- Name: tmp_account_finance id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_account_finance ALTER COLUMN id SET DEFAULT nextval('public.tmp_account_finance_id_seq'::regclass);


--
-- Name: tmp_import_students id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_import_students ALTER COLUMN id SET DEFAULT nextval('public.tmp_import_students_id_seq'::regclass);


--
-- Name: transaction_logs id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.transaction_logs ALTER COLUMN id SET DEFAULT nextval('public.transaction_logs_id_seq'::regclass);


--
-- Name: transaction_type id; Type: DEFAULT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.transaction_type ALTER COLUMN id SET DEFAULT nextval('public.transaction_type_id_seq'::regclass);


--
-- Data for Name: academic_ledger; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.academic_ledger (id, student_id, department_program_id, start_academic_term_id, end_academic_term_id, active, is_active, created_on, created_by, modified_on, modified_by, regular, stud_yearlevel) FROM stdin;
\.


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.account (id, student_id, group_id, academic_term_id, status_id, remarks, cleared_on, cleared_by, cancelled_on, cancelled_by, is_active, created_on, created_by, modified_on, modified_by, cancel_remarks, date_accounted, date_cleared) FROM stdin;
\.


--
-- Data for Name: accounts_fees; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.accounts_fees (id, chart_of_accounts_id, fee_amount, effectivity_date, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: assessment_items; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.assessment_items (id, assessment_of_fees_id, account_fees_id, item_fee_amount, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: assessment_of_fees; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.assessment_of_fees (id, template_code, description, year_level, term_id, remarks, active, is_active, created_on, created_by, modified_on, modified_by, program_id, department_program_id) FROM stdin;
\.


--
-- Data for Name: auth_cas; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.auth_cas (id, user_id, created_on, service, ticket, renew) FROM stdin;
\.


--
-- Data for Name: auth_event; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.auth_event (id, time_stamp, client_ip, user_id, origin, description) FROM stdin;
\.


--
-- Data for Name: auth_extension; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.auth_extension (id, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.auth_group (id, role, description) FROM stdin;
\.


--
-- Data for Name: auth_membership; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.auth_membership (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.auth_permission (id, group_id, name, table_name, record_id) FROM stdin;
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.auth_user (id, first_name, last_name, email, password, registration_key, reset_password_key, registration_id, signatory_id, active) FROM stdin;
\.


--
-- Data for Name: bank_payment; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.bank_payment (id, reference_no, amount, payment_date, payment_time) FROM stdin;
\.


--
-- Data for Name: barangay; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.barangay (id, name, city_municipality_id, keyword_matches, created_on, created_by, modified_on, modified_by, is_active, has_own_zipcode, is_in_poblacion) FROM stdin;
\.


--
-- Data for Name: barangay_zipcodes; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.barangay_zipcodes (barangay_id, zipcode, created_on, created_by, modified_on, modified_by, id, is_active) FROM stdin;
\.


--
-- Data for Name: block; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.block (id, department_program_id, block_code, year_level, active, is_active, created_on, created_by, modified_on, modified_by, college_department_id, academic_term_id, block_size, block_size_limit, year_term_id, block, block_type, holder) FROM stdin;
\.


--
-- Data for Name: building; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.building (id, building_code, building_name, college_id, campus_id, remarks, active, is_active, created_on, created_by, modified_on, modified_by, floors, building_shortname, building_description) FROM stdin;
\.


--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.campus (id, campus_code, campus_shortname, campus_name, campus_address, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: chart_of_accounts; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.chart_of_accounts (id, account_code, account_name, short_name, fixed_amount, accounts_group_id, accounts_classification_id, accounts_category_id, active, is_active, created_on, created_by, modified_on, modified_by, accounts_set_id) FROM stdin;
\.


--
-- Data for Name: check_table; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.check_table (id, check_no, check_amount, check_bank, check_date, is_active, created_on, created_by, modified_on, modified_by, remarks) FROM stdin;
\.


--
-- Data for Name: city_municipality; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.city_municipality (id, name, keyword_matches, is_active, modified_on, modified_by, created_on, created_by, province_id, zipcode, correct_num_barangays, classification) FROM stdin;
\.


--
-- Data for Name: class_event; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.class_event (id, class_event, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: class_schedule; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.class_schedule (id, course_schedule_id, class_event_id, schedule_name, room_id, remarks, no_of_units, faculty_in_charge_id, active, is_active, created_on, created_by, modified_on, modified_by, day, min_students, max_students, "time", start_time, end_time, elective_course_title, is_elective, lec_units, lab_units) FROM stdin;
1	13	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	2	\N	\N	01:00 PM - 02:30 PM	\N	\N	\N	F	\N	\N
2	13	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	4	\N	\N	01:00 PM - 02:30 PM	\N	\N	\N	F	\N	\N
3	14	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	2	\N	\N	07:30 AM - 09:00 AM	\N	\N	\N	F	\N	\N
4	14	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	4	\N	\N	07:30 AM - 09:00 AM	\N	\N	\N	F	\N	\N
6	15	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	1	\N	\N	09:00 AM- 12:00 PM	\N	\N	\N	F	\N	\N
7	15	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	3	\N	\N	09:00 AM- 12:00 PM	\N	\N	\N	F	\N	\N
8	15	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	5	\N	\N	10:00 AM- 12:00 PM	\N	\N	\N	F	\N	\N
9	16	\N	\N	\N	\N	\N	4	\N	\N	\N	\N	\N	\N	2	\N	\N	02:30 PM - 04: 00 PM	\N	\N	\N	F	\N	\N
10	16	\N	\N	\N	\N	\N	4	\N	\N	\N	\N	\N	\N	4	\N	\N	02:30 PM - 04: 00 PM	\N	\N	\N	F	\N	\N
11	17	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	1	\N	\N	07:30 AM - 09:00 AM	\N	\N	\N	F	\N	\N
12	17	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	3	\N	\N	07:30 AM - 09:00 AM	\N	\N	\N	F	\N	\N
13	18	\N	\N	\N	\N	\N	6	\N	\N	\N	\N	\N	\N	6	\N	\N	01:00 PM - 04:00 PM	\N	\N	\N	F	\N	\N
14	19	\N	\N	\N	\N	\N	7	\N	\N	\N	\N	\N	\N	5	\N	\N	03:00 PM - 05:00 PM	\N	\N	\N	F	\N	\N
15	20	\N	\N	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	1	\N	\N	01:00 PM - 04:00 PM	\N	\N	\N	F	\N	\N
16	20	\N	\N	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	3	\N	\N	01:00 PM  -04:00 PM	\N	\N	\N	F	\N	\N
17	20	\N	\N	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	5	\N	\N	03:00 PM - 05:00 PM	\N	\N	\N	F	\N	\N
18	1	\N	\N	\N	\N	\N	9	\N	\N	\N	\N	\N	\N	2	\N	\N	07:30 AM - 09:00 AM	\N	\N	\N	F	\N	\N
19	1	\N	\N	\N	\N	\N	9	\N	\N	\N	\N	\N	\N	4	\N	\N	07:30 AM - 09:00 AM	\N	\N	\N	F	\N	\N
20	2	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	1	\N	\N	08:00 AM - 09:00 AM	\N	\N	\N	F	\N	\N
21	2	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	5	\N	\N	04:00 PM - 07:00 PM	\N	\N	\N	F	\N	\N
22	3	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	\N	1	\N	\N	01:00 PM - 03:00 PM	\N	\N	\N	F	\N	\N
23	3	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	\N	2	\N	\N	01:00 PM - 04:00 PM	\N	\N	\N	F	\N	\N
24	3	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	\N	3	\N	\N	01:00 PM - 04:00 PM	\N	\N	\N	F	\N	\N
25	4	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	\N	\N	3	\N	\N	08:00 AM - 10:00 AM	\N	\N	\N	F	\N	\N
26	4	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	\N	\N	1	\N	\N	09:00 AM - 12:00 PM	\N	\N	\N	F	\N	\N
27	4	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	\N	\N	5	\N	\N	09:00 AM - 12:00 PM	\N	\N	\N	F	\N	\N
28	5	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	2	\N	\N	09:00 AM - 12:00 PM	\N	\N	\N	F	\N	\N
29	5	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	3	\N	\N	10:00 AM - 12:00 PM	\N	\N	\N	F	\N	\N
30	5	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	4	\N	\N	09:00 AM - 12:00 PM	\N	\N	\N	F	\N	\N
31	6	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	\N	6	\N	\N	09:00 AM - 12:00 PM	\N	\N	\N	F	\N	\N
32	7	\N	\N	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	2	\N	\N	04:00 PM - 07:00 PM	\N	\N	\N	F	\N	\N
33	7	\N	\N	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	3	\N	\N	04:00 PM - 06:00 PM	\N	\N	\N	F	\N	\N
34	7	\N	\N	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	4	\N	\N	04:00 PM - 07:00 PM	\N	\N	\N	F	\N	\N
35	8	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	1	\N	\N	09:00 AM - 12:00 PM	\N	\N	\N	F	\N	\N
36	8	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	2	\N	\N	08:00 AM - 10:00 AM	\N	\N	\N	F	\N	\N
37	8	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	3	\N	\N	09:00 AM - 12:00 PM	\N	\N	\N	F	\N	\N
38	9	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	2	\N	\N	04:00 PM - 08:30 PM	\N	\N	\N	F	\N	\N
39	9	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	4	\N	\N	04:00 PM - 08:30 PM	\N	\N	\N	F	\N	\N
40	10	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	3	\N	\N	05:00 PM - 08:00 PM	\N	\N	\N	F	\N	\N
41	11	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	1	\N	\N	07:30 AM - 09:00 AM	\N	\N	\N	F	\N	\N
42	11	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	5	\N	\N	07:30 AM - 09:00 AM	\N	\N	\N	F	\N	\N
43	12	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	6	\N	\N	07:30 AM - 09:00 AM	\N	\N	\N	F	\N	\N
44	12	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	6	\N	\N	10:30 AM - 12:00 PM	\N	\N	\N	F	\N	\N
\.


--
-- Data for Name: clearance_status; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.clearance_status (id, status, description, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: college; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.college (id, college_code, college_shortname, college_name, year_established, campus_id, active, is_active, created_on, created_by, modified_on, modified_by, old_index, allow_to_enrol, allow_to_self_enrol) FROM stdin;
\.


--
-- Data for Name: college_department; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.college_department (id, college_id, department_id, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: cor_assessment; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.cor_assessment (id, student_id, assessment_number, fee_code, fee_name, fee_amount, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: cor_schedule; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.cor_schedule (id, student_id, course_id, year_block, days, times, faculty_in_charge_id, faculty_lname, faculty_fname, faculty_mname, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: cor_student_registration; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.cor_student_registration (id, stud_registration_number, stud_id, stud_num, stud_lname, stud_fname, stud_mname, dateofbirth, gender, age, curriculum_id, curriculum_code, program_id, program_code, college_id, college_name, program_major_id, program_major, scholarship_id, scholarship_codestring, school_year, term, year_term, year_term_description, block, actual_payment, outstanding_balance, additional_balance, academicterm_id, primary_refno, transaction_date, cor_signatory_id, cor_signatory, regular, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
1	215165498713	\N	2018-CS-100199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-2019	\N	\N	1st Semester	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	215164684665	\N	2018-CS-100199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-2021	\N	\N	2nd Semester	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	215164469879	\N	2018-CS-100199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-2022	\N	\N	1st Semester	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	215112368713	\N	2018-CS-100173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-2019	\N	\N	1st Semester	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	215142664665	\N	2018-CS-100173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-2021	\N	\N	2nd Semester	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	215154679879	\N	2018-CS-100173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-2022	\N	\N	1st Semester	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: cor_subject_list; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.cor_subject_list (id, student_id, course_id, course_title, credit_units, lec_units, lab_units, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.course (id, credit_units, lec_units, lab_units, lec_hours, lab_hours, pending, locked, course_level_id, course_area_id, course_mode_id, course_equivalency_id, active, is_active, created_on, created_by, modified_on, modified_by, college_id, course_description, remarks, course_title, course_code_old, course_code, service_college_id, offered_in_college_id, credit_hours, gwa_excluded) FROM stdin;
13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mathematics in the Modern World	\N	GEC 14	\N	\N	\N	\N
14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Understanding the Self	\N	GEC 11	\N	\N	\N	\N
15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Introduction to Computing	\N	IT 101	\N	\N	\N	\N
16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kontekstwalisadong Komunikasyon sa Filipino (KomFil)	\N	Fil 21	\N	\N	\N	\N
17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Physics for Computing	\N	Phys 1	\N	\N	\N	\N
18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	CWTS/LTS/ROTC	\N	NSTP 11	\N	\N	\N	\N
19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Physical Fitness and Gymnastics	\N	PE 11	\N	\N	\N	\N
20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Computer Programming 1	\N	IT 102	\N	\N	\N	\N
1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Readings In Philippine History	\N	GEC 12	\N	\N	\N	\N
2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Multi Media Design	\N	IT Elect 3	\N	\N	\N	\N
3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Application Development And Emerging Technologies	\N	IT 106	\N	\N	\N	\N
4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Information Assurance Security 1	\N	IT 119	\N	\N	\N	\N
5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Event Driven Programming	\N	IT 120	\N	\N	\N	\N
6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Capstone Project 1	\N	IT 121	\N	\N	\N	\N
7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Big Data Analysis	\N	IT Elect 2	\N	\N	\N	\N
8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	System Administration And Maintenance	\N	IT 123	\N	\N	\N	\N
9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Capstone Project 2	\N	IT 124	\N	\N	\N	\N
10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Social And Professional Issues	\N	IT 126	\N	\N	\N	\N
11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Great Books 	\N	GEC Elect 22.1	\N	\N	\N	\N
12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Life And Works Of Rizal	\N	GEC 19	\N	\N	\N	\N
\.


--
-- Data for Name: course_equivalency; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.course_equivalency (id, course_id, course_equivalency_id, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: course_requisite; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.course_requisite (id, course_id, course_requisite_id, course_type, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: course_schedule; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.course_schedule (id, course_id, faculty_in_charge_id, remarks, active, is_active, created_on, created_by, modified_on, modified_by, academic_term_id, block_id, summary_schedule, islocked, title, min_size, max_size, class_name) FROM stdin;
13	13	1	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
14	14	2	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
15	15	3	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
16	16	4	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
17	17	5	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
18	18	6	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
19	19	7	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
20	20	8	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
1	1	9	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N
2	2	10	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N
3	3	11	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N
4	4	12	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N
5	5	13	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N
6	6	14	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N
7	7	15	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N
8	8	16	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N
9	9	17	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N
10	10	18	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N
11	11	19	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N
12	12	20	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: course_schedule_block; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.course_schedule_block (id, course_schedule_id, block_id, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: course_special_fee; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.course_special_fee (id, course_id, account_fee_id, course_fee, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: curriculum; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.curriculum (id, curriculum_code, curriculum_description, total_units, academic_term_id, locked, active, is_active, created_on, created_by, modified_on, modified_by, educational_level) FROM stdin;
\.


--
-- Data for Name: curriculum_course; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.curriculum_course (id, curriculum_id, course_id, year_term_id, active, is_active, created_on, created_by, modified_on, modified_by, fees_id, qualified_year_standing) FROM stdin;
\.


--
-- Data for Name: default_assessment; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.default_assessment (id, degree, assessment_of_fees_id, transaction_type_id, enrollment_transaction, remarks, accounts_fees_id, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.department (id, department_code, department_shortname, department_name, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: department_program; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.department_program (id, college_department_id, program_id, date_recognized, active, is_active, created_on, created_by, modified_on, modified_by, curriculum_id) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.employee (id, employee_no, employee_lname, employee_fname, employee_mname, active, is_active, created_on, created_by, modified_on, modified_by, employee_academic_rank, employee_gender, college_id) FROM stdin;
1	\N	LOLA	First	M.	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	\N	RABELAS	Second	M.	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	\N	BALILO	Third	B.	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	\N	NAPOCAO	Fourth	A.	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	\N	CORDOVILLA	Fifth	J.	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	\N	PROF E	Sixth	T.	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	\N	OLIQUINO	Seventh	F.	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	\N	CANON	Eight	M.	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	\N	MILITANTE	Ninth	C.	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	\N	RAMOS	Tenth	J.	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	\N	VIBAR	Eleventh	J.	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	\N	PAJE	Twelveth	R.	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	\N	BROGADA	Thirteenth	M.	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	\N	ORDOÑEZ	Fourteenth	A.	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	\N	LLOVIDO	Fifteenth	J.	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	\N	ZABALLA	Sixteenth	J.	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	\N	ORDOÑEZ	Seventeenth	A.	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	\N	ENGAY	Eigthteenth	A.	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	\N	MORCOZO	Ninteenth	V.	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	\N	MAYOR	Twentieth	N.	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: employee_designation; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.employee_designation (designation_name, designation_shortname, created_on, created_by, modified_on, modified_by, id, active, is_active, wec) FROM stdin;
\.


--
-- Data for Name: employee_faculty_designation; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.employee_faculty_designation (id, employee_id, employee_designation_id, academic_term_id, wec_units, active, is_active, created_on, created_by, modified_on, modified_by, employee_designation_title) FROM stdin;
\.


--
-- Data for Name: employee_faculty_wec; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.employee_faculty_wec (id, employee_id, total_wec, academic_term_id, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: employee_profile; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.employee_profile (id, employee_id, emp_date_of_employment, emp_maiden_name, emp_suffix, emp_gender, emp_birth_date, emp_civil_status, emp_religion, emp_nationality, emp_height, emp_weight, emp_bloodtype, emp_current_houseno_street, emp_current_barangay, emp_current_town_city, emp_current_zipcode, emp_current_province, emp_permanent_houseno_street, emp_permanent_barangay, emp_permanent_town_city, emp_permanent_zipcode, emp_permanent_province, emp_mobile_no, emp_telephone_no, emp_fax_no, emp_primary_email_address, emp_alternate_email_address, emp_father_name, emp_father_birthdate, emp_father_educ_attainment, emp_father_occupation, emp_father_company, emp_father_company_address, emp_father_mobile_no, emp_father_email_address, emp_mother_name, emp_mother_birthdate, emp_mother_educ_attainment, emp_mother_occupation, emp_mother_company, emp_mother_company_address, emp_mother_mobile_no, emp_mother_email_address, emp_num_brothers, emp_num_sisters) FROM stdin;
\.


--
-- Data for Name: employee_user; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.employee_user (id, employee_id, email, password) FROM stdin;
\.


--
-- Data for Name: enrollment_settings; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.enrollment_settings (id, setting_name, setting_value, remarks, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ep_payment; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ep_payment (id, merchant_ref_no, amount, student_registration_id) FROM stdin;
\.


--
-- Data for Name: evaluation; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.evaluation (id, student_id, course_id, grade, academic_term_id, remarks, active, is_active, created_on, created_by, modified_on, modified_by, locked, title, academic_ledger_id) FROM stdin;
\.


--
-- Data for Name: evaluation_sheets; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.evaluation_sheets (id, academic_ledger_id, course_id, grade, academic_term_id, remarks, active, locked, title, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: import_upload; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.import_upload (id, file_name, import_csv, is_active, created_on, created_by, modified_on, modified_by, import_type) FROM stdin;
\.


--
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.office (id, college_id, office_name, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: or_printlogs; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.or_printlogs (id, primary_refno, actual_payment, print_date, ipaddress, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ors_settings; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ors_settings (id, setting_name, setting_value, remarks, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.payment (id, primary_refno, secondary_refno, student_no, cashier_id, term_id, year_term_id, transaction_date, payment_mode_id, transaction_type_id, active, isvoid, or_signatory, enrollment_id, is_active, created_on, created_by, modified_on, modified_by, server_date, payment_amount, payor_name, cash_tendered, change) FROM stdin;
\.


--
-- Data for Name: payment_details; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.payment_details (id, payment_id, student_no, account_id, debit, credit, active, discount, payment_discount, first_payment, second_payment, third_payment, fourth_payment, fifth_payment, actual_payment, server_date, transaction_date, primary_refno, secondary_refno, payor, term_id, remarks, year_term_id, is_active, created_on, created_by, modified_on, modified_by, student_registration_id) FROM stdin;
\.


--
-- Data for Name: payment_mode; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.payment_mode (id, payment_mode, description, shortname, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: preregistration_subjects; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.preregistration_subjects (id, course_schedule_id, student_id, enrollment_id, year_term_id, academicterm_id, course_id, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.program (id, program_code, program_name, program_description, no_of_years, total_no_of_terms, active, is_active, created_on, created_by, modified_on, modified_by, year_implemented, program_term_id, college_id, old_index, program_shortname, program_major, separate_assessment) FROM stdin;
\.


--
-- Data for Name: program_major; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.program_major (id, program_id, program_major_discipline, program_major_description, active, is_active, created_on, created_by, modified_on, modified_by, program_major_shortname, program_major_code) FROM stdin;
\.


--
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.province (id, name, keyword_matches, is_active, created_on, created_by, modified_on, modified_by, correct_num_towns) FROM stdin;
\.


--
-- Data for Name: questionnaire_category; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.questionnaire_category (id, category_num, description, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: questionnaire_comments; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.questionnaire_comments (id, evaluated_id, comment, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: questionnaire_evaluated; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.questionnaire_evaluated (id, subject_list_id, is_active, created_on, created_by, modified_on, modified_by, course_id, faculty_id, academic_term_id, student_id) FROM stdin;
\.


--
-- Data for Name: questionnaire_results; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.questionnaire_results (id, evaluated_id, question, rating, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_academic_term; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_academic_term (id, school_year, semester, start_ay, end_ay, active, is_active, created_on, created_by, modified_on, modified_by, startdate_grade_submission, enddate_grade_submission, chronological_order, enrollment_start_date, enrollment_end_date, adc_start_date, adc_end_date, self_enrol_start_date, self_enrol_end_date) FROM stdin;
1	2018-2019	1st Semester	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	2020-2021	2nd Semester	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	2021-2022	1st Semester	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: ref_accounts_category; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_accounts_category (id, category_code, category_name, category_short_name, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_accounts_classification; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_accounts_classification (id, classification_code, classification_name, classification_short_name, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_accounts_group; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_accounts_group (id, group_code, group_name, group_short_name, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_accounts_set; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_accounts_set (id, set_code, set_name, set_short_name, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_course_area; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_course_area (id, course_area, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_course_level; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_course_level (id, course_level, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_course_mode; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_course_mode (id, course_mode, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_course_type; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_course_type (id, course_type, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_course_type_course; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_course_type_course (id, course_id, ref_course_type_id, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_degree; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_degree (id, degree_code, degree_name, degree_short_name, active, is_active, created_on, created_by, modified_on, modified_by, fees_template_id, close_course_term, add_change_fees_id) FROM stdin;
\.


--
-- Data for Name: ref_program_term; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_program_term (id, remarks, active, is_active, created_on, created_by, modified_on, modified_by, program_term) FROM stdin;
\.


--
-- Data for Name: ref_room_type; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_room_type (id, room_type, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: ref_shifter_transferee; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_shifter_transferee (id, student_id, academic_term_id, department_program_id, old_student_no, st_type, curriculum_id, created_on, created_by, modified_on, modified_by, is_active, has_new_student_no) FROM stdin;
\.


--
-- Data for Name: ref_year_term; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.ref_year_term (id, year_level, year_level_description, year_term_description, remarks, active, is_active, created_on, created_by, modified_on, modified_by, semester, semester_code, educational_level, chronological_order) FROM stdin;
1	1	First Year	First Year - First Semester	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	3	Third Year	Third Year - Second Semester	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	4	Fourth Year	Fourth Year - First Semester	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: registrar_unit; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.registrar_unit (id, auth_user_id, college_id, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.room (id, room_code, room_name, room_shortname, building_id, capacity, remarks, active, is_active, created_on, created_by, modified_on, modified_by, room_type) FROM stdin;
\.


--
-- Data for Name: sc_error_report; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.sc_error_report (id) FROM stdin;
\.


--
-- Data for Name: scholarship; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship (id, scholarship_name, scholarship_shortname, scholarship_provider_id, remarks, active, is_active, created_on, created_by, modified_on, modified_by, scholarship_category_id) FROM stdin;
\.


--
-- Data for Name: scholarship_application; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_application (id, student_id, scholarship_subtype_id, has_itr_or_cert_tax_exemption, has_cert_adviser, has_affidavit_no_scholarships, has_cert_bu_hrmo, has_cog, is_active, has_cert_or_recom_dean, has_performing_arts_contract, has_cert_benefactor, has_cert_buufa_or_buants, has_cert_buipesr, has_contract_of_scholarship, has_cor_or_preassessment_form, has_cert_mayor_or_dilg, academic_term_id, status, date_action_taken, date_submitted) FROM stdin;
\.


--
-- Data for Name: scholarship_application_newapplicant; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_application_newapplicant (id, scholarship_application_id, has_hs_report_card, has_bucet_result, has_birth_cert, is_active, has_cert_good_moral) FROM stdin;
\.


--
-- Data for Name: scholarship_category; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_category (id, remarks, active, is_active, created_on, created_by, modified_on, modified_by, category_name) FROM stdin;
\.


--
-- Data for Name: scholarship_grant_template; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_grant_template (id, scholarship_provider_id, account_fees_id, description, type, remarks, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: scholarship_provider; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_provider (id, provider_code, provider_name, remarks, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: scholarship_provider_group; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_provider_group (id, provider_group_code, provider_group_name, remarks, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: scholarship_provider_level; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_provider_level (id, provider_level_code, provider_level_name, remarks, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: scholarship_provider_type; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_provider_type (id, provider_type_code, provider_type_name, remarks, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: scholarship_subtype; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_subtype (id, scholarship_id, scholarship_subtype_code, scholarship_transaction_type, remarks, active, is_active, created_on, created_by, modified_on, modified_by, scholarship_subtype_description, scholarship_subtype_name) FROM stdin;
\.


--
-- Data for Name: scholarship_subtype_billing; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_subtype_billing (id, scholarship_subtype_id, amount, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: scholarship_subtype_tfdiscount; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_subtype_tfdiscount (id, scholarship_subtype_id, scholarship_coverage_type, percentage, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: scholarship_tagging; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_tagging (id, student_id, scholarship_subtype_id, academic_term_id, remarks, active, is_active, created_on, created_by, modified_on, modified_by, actual_payment, student_registration_id) FROM stdin;
\.


--
-- Data for Name: scholarship_untag_request; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.scholarship_untag_request (id, scholarship_tagging_id, untag_request_by, untag_request_on, untag_request_remarks, untag_confirmed_by, untag_confirmed_on, untag_confirmed_remarks) FROM stdin;
\.


--
-- Data for Name: signatories; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.signatories (id, last_name, first_name, middle_initial, "position", unit, is_active, created_on, created_by, modified_on, modified_by, print_type) FROM stdin;
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.student (id, stud_lname, stud_fname, stud_mname, dateofbirth, college_id, active, userlogin_id, curriculum_id, new_curriculum_id, program_id, is_active, created_on, created_by, modified_on, modified_by, stud_yearlevel, old_stud_num, stud_mi, program_major_id, stud_num, stud_code, stud_password, year_level, email_address, department_program_id, gender, academic_term_id, regular, default_password, monthly_family_income_id, stud_degree, stud_email, stud_yearoflastschool, stud_lrn, stud_hs_gwa) FROM stdin;
1	Alberto	Kenneth	Zamudio	2000-05-20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	Z	\N	2018-CS-100199	\N	pass100199	4	kennethzamudio.alberto@bicol-u.edu.ph	\N	Male	\N	\N	\N	\N	\N	kennethzamudio.alberto@bicol-u.edu.ph	\N	8906582154692	\N
2	Mayor	Ian Andrew	Seva	1999-11-30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	S	\N	2018-CS-100173	\N	pass100173	4	ianandrewseva.mayor@bicol-u.edu.ph	\N	Male	\N	\N	\N	\N	\N	ianandrewseva.mayor@bicol-u.edu.ph	\N	5412789532157	\N
\.


--
-- Data for Name: student_assessment; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.student_assessment (id, assessment_of_fees_id, account_fees_id, fee_amount, student_id, term_id, year_term_id, reference_no, active, isadditional, enrollment_id, transaction_type_id, enrollment_transaction, is_active, created_on, created_by, modified_on, modified_by, student_registration_id) FROM stdin;
\.


--
-- Data for Name: student_ledger; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.student_ledger (id, student_no, primary_refno, transaction_date, debit, credit, balance, isposted, posted_date, postedby_id, term_id, secondary_refno, transaction_code, remarks, forwarded_balance, assessment_refno, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: student_monthly_family_income; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.student_monthly_family_income (id, monthly_income, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: student_profile; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.student_profile (id, student_id, studp_suffix, studp_maiden_name, studp_place_of_birth, studp_civil_status, studp_nationality, studp_height_ft, studp_weight_kg, studp_bloodtype, studp_current_houseno_street, studp_current_barangay, studp_current_town_city, studp_current_zipcode, studp_current_province, studp_permanent_houseno_street, studp_permanent_barangay, studp_permanent_town_city, studp_permanent_zipcode, studp_permanent_province, studp_mobile_no, studp_telephone_no, studp_bu_email_address, studp_alternate_email_address, studp_father_name, studp_father_birthdate, studp_father_occupation, studp_father_company, studp_father_company_address, studp_father_telephone_no, studp_father_mobile_no, studp_mother_name, studp_mother_birthdate, studp_mother_occupation, studp_mother_company, studp_mother_company_address, studp_mother_telephone_no, studp_mother_mobile_no, studp_num_brothers, studp_num_sisters, studp_guardian_name, studp_guardian_relationship, studp_guardian_houseno_street, studp_guardian_barangay, studp_guardian_town_city, studp_guardian_province, studp_guardian_zipcode, studp_guardian_occupation, studp_guardian_company, studp_guardian_company_address, studp_guardian_mobile_no, studp_guardian_telephone_no, studp_guardian_email_address, studp_emergency_contact_name, studp_emergency_contact_address, studp_emergency_mobile_no, studp_emergency_telephone_no, studp_elemschool_name, studp_elemschool_address, studp_elemschool_start_date, studp_elemschool_end_date, studp_elemschool_awards_honors, studp_highschool_name, studp_highschool_address, studp_highschool_start_date, studp_highschool_end_date, studp_highschool_awards_honors, studp_vocational_name, studp_vocational_address, studp_vocational_degree, studp_vocational_start_date, studp_vocational_end_date, studp_college_name, studp_college_address, studp_college_degree, studp_college_start_date, studp_college_end_date, studp_college_awards_honors, studp_masters_name, studp_masters_address, studp_masters_degree, studp_masters_start_date, studp_masters_end_date, studp_doctoral_name, studp_doctoral_address, studp_doctoral_degree, studp_doctoral_start_date, studp_doctoral_end_date, active, remarks, created_on, created_by, modified_on, modified_by, is_active, studp_date_of_birth) FROM stdin;
2	2	\N	\N	Tagas, Albayyyyyyy	\N	Filipino	\N	\N	\N	#12, Purok 3	Brgy. Sain	Daraga	4501	Albay	\N	\N	\N	\N	\N	09879456587	\N	\N	mayorngalbay@yahoo.com	Father Name	\N	\N	\N	\N	\N	09565248752	Mother Name	\N	Secret	\N	\N	\N	09621547856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	1	\N	\N	Virac, Catanduanesssss ssss sss	\N	Filipino	\N	\N	\N	#420, Purok 6	Brgy. Nasaan	Legazpi City	4500	Albay	\N	\N	\N	\N	\N	09123456789	\N	\N	myalternateemail@gmail.com	\N	\N	\N	\N	\N	\N	\N	Maureen Alberto	\N	Nurse	\N	\N	\N	09987654321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: student_registration; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.student_registration (id, student_no, account_fees_id, registration_code, assess_fee, actual_payment, outstanding_balance, additional_balance, transaction_date, server_date, term_id, year_term_id, isfullypaid, ispartiallypaid, isofficiallyenrolled, program_id, college_id, active, cor_signatory, or_signatory, transaction_type_id, enrollment_id, enrollment_transaction, payment_refno, is_active, created_on, created_by, modified_on, modified_by, curriculum_id, regular, status, department_program_id, semester_code, block_id, isvalidated, validation_date, validation_type, validated_by, year_level, officially_enrolled_date) FROM stdin;
1	1	\N	215165498713	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	1	\N	215164684665	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	1	\N	215164469879	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	2	\N	215112368713	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	2	\N	215142664665	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	2	\N	215154679879	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: student_userinfo; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.student_userinfo (id, student_id, first_name, last_name, email, username, password, registration_key, reset_password_key, registration_id, first_login) FROM stdin;
\.


--
-- Data for Name: studentuser_event; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.studentuser_event (id, time_stamp, client_ip, user_id, origin, description) FROM stdin;
\.


--
-- Data for Name: studentuser_group; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.studentuser_group (id, role, description) FROM stdin;
\.


--
-- Data for Name: studentuser_membership; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.studentuser_membership (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: studentuser_permission; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.studentuser_permission (id, group_id, name, table_name, record_id) FROM stdin;
\.


--
-- Data for Name: subject_list; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.subject_list (id, course_schedule_id, student_id, year_term_id, encoded_by, active, isadditional, enrollment_id, ischanged, isdropped, isreplacement, isaddedcourse, transaction, drop_reason, academicterm_id, replaced_course_id, midterm_grade, tentative_grade, final_grade, note, remarks, is_active, created_on, created_by, modified_on, modified_by, student_registration_id, course_id, is_posted, date_posted) FROM stdin;
1	13	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2.4	\N	\N	\N	\N	\N	\N	\N	1	13	t	\N
2	14	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1.7	\N	\N	\N	\N	\N	\N	\N	1	14	t	\N
3	15	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1.70	\N	\N	\N	\N	\N	\N	\N	1	15	t	\N
4	16	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2.1	\N	\N	\N	\N	\N	\N	\N	1	16	t	\N
5	17	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2.60	\N	\N	\N	\N	\N	\N	\N	1	17	t	\N
6	18	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1.3	\N	\N	\N	\N	\N	\N	\N	1	18	t	\N
7	19	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1.4	\N	\N	\N	\N	\N	\N	\N	1	19	t	\N
8	20	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2.5	\N	\N	\N	\N	\N	\N	\N	1	20	t	\N
9	1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	2.5	\N	\N	\N	\N	\N	\N	\N	2	1	t	\N
10	2	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.3	\N	\N	\N	\N	\N	\N	\N	2	2	t	\N
11	3	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.1	\N	\N	\N	\N	\N	\N	\N	2	3	t	\N
12	4	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.0	\N	\N	\N	\N	\N	\N	\N	2	4	t	\N
13	5	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.60	\N	\N	\N	\N	\N	\N	\N	2	5	t	\N
14	6	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.35	\N	\N	\N	\N	\N	\N	\N	2	6	t	\N
15	7	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.11	\N	\N	\N	\N	\N	\N	\N	2	7	t	\N
16	8	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	1.1	\N	\N	\N	\N	\N	\N	\N	3	8	t	\N
17	9	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	1.0	\N	\N	\N	\N	\N	\N	\N	3	9	t	\N
18	10	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	1.2	\N	\N	\N	\N	\N	\N	\N	3	10	t	\N
19	11	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	1.3	\N	\N	\N	\N	\N	\N	\N	3	11	t	\N
20	12	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	1.10	\N	\N	\N	\N	\N	\N	\N	3	12	f	\N
21	13	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1.4	\N	\N	\N	\N	\N	\N	\N	4	13	t	\N
22	14	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2.7	\N	\N	\N	\N	\N	\N	\N	4	14	t	\N
23	15	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1.8	\N	\N	\N	\N	\N	\N	\N	4	15	t	\N
24	16	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2.1	\N	\N	\N	\N	\N	\N	\N	4	16	t	\N
25	17	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2.8	\N	\N	\N	\N	\N	\N	\N	4	17	t	\N
26	18	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1.4	\N	\N	\N	\N	\N	\N	\N	4	18	t	\N
27	19	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1.8	\N	\N	\N	\N	\N	\N	\N	4	19	t	\N
28	20	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2.9	\N	\N	\N	\N	\N	\N	\N	4	20	t	\N
29	1	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	3.0	\N	\N	\N	\N	\N	\N	\N	5	1	t	\N
30	2	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.8	\N	\N	\N	\N	\N	\N	\N	5	2	t	\N
31	3	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.95	\N	\N	\N	\N	\N	\N	\N	5	3	t	\N
32	4	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.35	\N	\N	\N	\N	\N	\N	\N	5	4	t	\N
33	5	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.7	\N	\N	\N	\N	\N	\N	\N	5	5	t	\N
34	6	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	1.8	\N	\N	\N	\N	\N	\N	\N	5	6	t	\N
35	7	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	2.5	\N	\N	\N	\N	\N	\N	\N	5	7	t	\N
36	8	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	2.6	\N	\N	\N	\N	\N	\N	\N	6	8	t	\N
37	9	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	2.7	\N	\N	\N	\N	\N	\N	\N	6	9	t	\N
38	10	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	1.8	\N	\N	\N	\N	\N	\N	\N	6	10	t	\N
39	11	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	1.7	\N	\N	\N	\N	\N	\N	\N	6	11	t	\N
40	12	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	1.5	\N	\N	\N	\N	\N	\N	\N	6	12	t	\N
\.


--
-- Data for Name: temp_student_curriculum; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.temp_student_curriculum (id, student_no, curriculum_id, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: tmp_account_finance; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.tmp_account_finance (id, stud_num, is_active, created_on, created_by, modified_on, modified_by, academic_term_id, include, program_id, stud_yearlevel, college_id, balance, is_imported) FROM stdin;
\.


--
-- Data for Name: tmp_import_students; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.tmp_import_students (id, college_id, course_id, line, remarks, stud_num, stud_lname, stud_fname, stud_mname, gender, dateofbirth, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: transaction_logs; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.transaction_logs (id, email, ipaddress, event_date, which_module, action, parameters, active, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Data for Name: transaction_type; Type: TABLE DATA; Schema: public; Owner: dbasevisor
--

COPY public.transaction_type (id, transaction_type, description, shortname, is_active, created_on, created_by, modified_on, modified_by) FROM stdin;
\.


--
-- Name: academic_ledger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.academic_ledger_id_seq', 1, false);


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.account_id_seq', 1, false);


--
-- Name: accounts_fees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.accounts_fees_id_seq', 1, false);


--
-- Name: assessment_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.assessment_items_id_seq', 1, false);


--
-- Name: assessment_of_fees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.assessment_of_fees_id_seq', 1, false);


--
-- Name: auth_cas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.auth_cas_id_seq', 1, false);


--
-- Name: auth_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.auth_event_id_seq', 1, false);


--
-- Name: auth_extension_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.auth_extension_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.auth_membership_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: bank_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.bank_payment_id_seq', 1, false);


--
-- Name: barangay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.barangay_id_seq', 1, false);


--
-- Name: barangay_zipcodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.barangay_zipcodes_id_seq', 1, false);


--
-- Name: block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.block_id_seq', 1, false);


--
-- Name: building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.building_id_seq', 1, false);


--
-- Name: campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.campus_id_seq', 1, false);


--
-- Name: chart_of_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.chart_of_accounts_id_seq', 1, false);


--
-- Name: check_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.check_table_id_seq', 1, false);


--
-- Name: city_municipality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.city_municipality_id_seq', 1, false);


--
-- Name: class_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.class_event_id_seq', 1, false);


--
-- Name: class_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.class_schedule_id_seq', 1, false);


--
-- Name: clearance_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.clearance_status_id_seq', 1, false);


--
-- Name: college_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.college_department_id_seq', 1, false);


--
-- Name: college_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.college_id_seq', 1, false);


--
-- Name: cor_assessment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.cor_assessment_id_seq', 1, false);


--
-- Name: cor_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.cor_schedule_id_seq', 1, false);


--
-- Name: cor_student_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.cor_student_registration_id_seq', 1, true);


--
-- Name: cor_subject_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.cor_subject_list_id_seq', 1, false);


--
-- Name: course_equivalency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.course_equivalency_id_seq', 1, false);


--
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.course_id_seq', 1, false);


--
-- Name: course_requisite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.course_requisite_id_seq', 1, false);


--
-- Name: course_schedule_block_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.course_schedule_block_seq', 1, false);


--
-- Name: course_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.course_schedule_id_seq', 1, false);


--
-- Name: course_special_fee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.course_special_fee_id_seq', 1, false);


--
-- Name: curriculum_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.curriculum_course_id_seq', 1, false);


--
-- Name: curriculum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.curriculum_id_seq', 1, false);


--
-- Name: default_assessment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.default_assessment_id_seq', 1, false);


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.department_id_seq', 1, false);


--
-- Name: department_program_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.department_program_id_seq', 1, false);


--
-- Name: employee_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.employee_designation_id_seq', 1, false);


--
-- Name: employee_faculty_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.employee_faculty_designation_id_seq', 1, false);


--
-- Name: employee_faculty_wec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.employee_faculty_wec_id_seq', 1, false);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.employee_id_seq', 1, false);


--
-- Name: enrollment_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.enrollment_settings_id_seq', 1, false);


--
-- Name: ep_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ep_payment_id_seq', 1, false);


--
-- Name: evaluation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.evaluation_id_seq', 1, false);


--
-- Name: evaluation_sheets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.evaluation_sheets_id_seq', 1, false);


--
-- Name: import_upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.import_upload_id_seq', 1, false);


--
-- Name: office_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.office_id_seq', 1, false);


--
-- Name: or_printlogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.or_printlogs_id_seq', 1, false);


--
-- Name: ors_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ors_settings_id_seq', 1, false);


--
-- Name: payment_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.payment_details_id_seq', 1, false);


--
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.payment_id_seq', 1, false);


--
-- Name: payment_mode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.payment_mode_id_seq', 1, false);


--
-- Name: preregistration_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.preregistration_subjects_id_seq', 1, false);


--
-- Name: program_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.program_id_seq', 1, false);


--
-- Name: program_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.program_major_id_seq', 1, false);


--
-- Name: questionnaire_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.questionnaire_category_id_seq', 1, false);


--
-- Name: questionnaire_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.questionnaire_comments_id_seq', 1, false);


--
-- Name: questionnaire_evaluated_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.questionnaire_evaluated_id_seq', 1, false);


--
-- Name: questionnaire_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.questionnaire_results_id_seq', 1, false);


--
-- Name: ref_academic_term_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_academic_term_id_seq', 1, false);


--
-- Name: ref_accounts_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_accounts_category_id_seq', 1, false);


--
-- Name: ref_accounts_classification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_accounts_classification_id_seq', 1, false);


--
-- Name: ref_accounts_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_accounts_group_id_seq', 1, false);


--
-- Name: ref_accounts_set_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_accounts_set_id_seq', 1, false);


--
-- Name: ref_course_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_course_area_id_seq', 1, false);


--
-- Name: ref_course_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_course_level_id_seq', 1, false);


--
-- Name: ref_course_mode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_course_mode_id_seq', 1, false);


--
-- Name: ref_course_type_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_course_type_course_id_seq', 1, false);


--
-- Name: ref_course_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_course_type_id_seq', 1, false);


--
-- Name: ref_degree_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_degree_id_seq', 1, false);


--
-- Name: ref_program_term_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_program_term_id_seq', 1, false);


--
-- Name: ref_room_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_room_type_id_seq', 1, false);


--
-- Name: ref_shifter_transferee_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_shifter_transferee_seq', 1, false);


--
-- Name: ref_year_term_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.ref_year_term_id_seq', 1, false);


--
-- Name: registrar_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.registrar_unit_id_seq', 1, false);


--
-- Name: room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.room_id_seq', 1, false);


--
-- Name: sc_error_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.sc_error_report_id_seq', 1, false);


--
-- Name: scholarship_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_application_id_seq', 1, false);


--
-- Name: scholarship_application_newapplicant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_application_newapplicant_id_seq', 1, false);


--
-- Name: scholarship_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_category_id_seq', 1, false);


--
-- Name: scholarship_grant_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_grant_template_id_seq', 1, false);


--
-- Name: scholarship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_id_seq', 1, false);


--
-- Name: scholarship_provider_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_provider_group_id_seq', 1, false);


--
-- Name: scholarship_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_provider_id_seq', 1, false);


--
-- Name: scholarship_provider_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_provider_level_id_seq', 1, false);


--
-- Name: scholarship_provider_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_provider_type_id_seq', 1, false);


--
-- Name: scholarship_subtype_billing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_subtype_billing_id_seq', 1, false);


--
-- Name: scholarship_subtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_subtype_id_seq', 1, false);


--
-- Name: scholarship_subtype_tfdiscount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_subtype_tfdiscount_id_seq', 1, false);


--
-- Name: scholarship_tagging_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_tagging_id_seq', 1, false);


--
-- Name: scholarship_untag_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.scholarship_untag_request_id_seq', 1, false);


--
-- Name: signatories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.signatories_id_seq', 1, false);


--
-- Name: student_assessment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.student_assessment_id_seq', 1, false);


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.student_id_seq', 2, true);


--
-- Name: student_ledger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.student_ledger_id_seq', 1, false);


--
-- Name: student_monthly_family_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.student_monthly_family_income_id_seq', 1, false);


--
-- Name: student_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.student_profile_id_seq', 2, true);


--
-- Name: student_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.student_registration_id_seq', 1, false);


--
-- Name: student_userinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.student_userinfo_id_seq', 1, false);


--
-- Name: studentuser_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.studentuser_event_id_seq', 1, false);


--
-- Name: studentuser_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.studentuser_group_id_seq', 1, false);


--
-- Name: studentuser_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.studentuser_membership_id_seq', 1, false);


--
-- Name: studentuser_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.studentuser_permission_id_seq', 1, false);


--
-- Name: subject_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.subject_list_id_seq', 1, true);


--
-- Name: temp_student_curriculum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.temp_student_curriculum_id_seq', 1, false);


--
-- Name: tmp_account_finance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.tmp_account_finance_id_seq', 1, false);


--
-- Name: tmp_import_students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.tmp_import_students_id_seq', 1, false);


--
-- Name: transaction_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.transaction_logs_id_seq', 1, false);


--
-- Name: transaction_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbasevisor
--

SELECT pg_catalog.setval('public.transaction_type_id_seq', 1, false);


--
-- Name: academic_ledger academic_ledger_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.academic_ledger
    ADD CONSTRAINT academic_ledger_pkey PRIMARY KEY (id);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: accounts_fees accounts_fees_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.accounts_fees
    ADD CONSTRAINT accounts_fees_pkey PRIMARY KEY (id);


--
-- Name: assessment_items assessment_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_items
    ADD CONSTRAINT assessment_items_pkey PRIMARY KEY (id);


--
-- Name: assessment_of_fees assessment_of_fees_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_of_fees
    ADD CONSTRAINT assessment_of_fees_pkey PRIMARY KEY (id);


--
-- Name: assessment_of_fees assessment_of_fees_template_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_of_fees
    ADD CONSTRAINT assessment_of_fees_template_code_key UNIQUE (template_code);


--
-- Name: auth_cas auth_cas_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_cas
    ADD CONSTRAINT auth_cas_pkey PRIMARY KEY (id);


--
-- Name: auth_event auth_event_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_event
    ADD CONSTRAINT auth_event_pkey PRIMARY KEY (id);


--
-- Name: auth_extension auth_extension_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_extension
    ADD CONSTRAINT auth_extension_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_membership auth_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_membership
    ADD CONSTRAINT auth_membership_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: bank_payment bank_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.bank_payment
    ADD CONSTRAINT bank_payment_pkey PRIMARY KEY (id);


--
-- Name: barangay barangay_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.barangay
    ADD CONSTRAINT barangay_pkey PRIMARY KEY (id);


--
-- Name: barangay_zipcodes barangay_zipcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.barangay_zipcodes
    ADD CONSTRAINT barangay_zipcodes_pkey PRIMARY KEY (id);


--
-- Name: block block_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT block_pkey PRIMARY KEY (id);


--
-- Name: building building_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_pkey PRIMARY KEY (id);


--
-- Name: campus campus_campus_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_campus_code_key UNIQUE (campus_code);


--
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (id);


--
-- Name: campus campus_unique; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_unique UNIQUE (campus_code, campus_name);


--
-- Name: chart_of_accounts chart_of_accounts_account_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_account_code_key UNIQUE (account_code);


--
-- Name: chart_of_accounts chart_of_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_pkey PRIMARY KEY (id);


--
-- Name: check_table check_table_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.check_table
    ADD CONSTRAINT check_table_pkey PRIMARY KEY (id);


--
-- Name: city_municipality city_municipality_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.city_municipality
    ADD CONSTRAINT city_municipality_pkey PRIMARY KEY (id);


--
-- Name: class_event class_event_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_event
    ADD CONSTRAINT class_event_pkey PRIMARY KEY (id);


--
-- Name: class_schedule class_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_schedule
    ADD CONSTRAINT class_schedule_pkey PRIMARY KEY (id);


--
-- Name: clearance_status clearance_status_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.clearance_status
    ADD CONSTRAINT clearance_status_pkey PRIMARY KEY (id);


--
-- Name: college college_college_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_college_code_key UNIQUE (college_code);


--
-- Name: college_department college_department_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college_department
    ADD CONSTRAINT college_department_pkey PRIMARY KEY (id);


--
-- Name: college college_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_pkey PRIMARY KEY (id);


--
-- Name: cor_assessment cor_assessment_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_assessment
    ADD CONSTRAINT cor_assessment_pkey PRIMARY KEY (id);


--
-- Name: cor_schedule cor_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_schedule
    ADD CONSTRAINT cor_schedule_pkey PRIMARY KEY (id);


--
-- Name: cor_student_registration cor_student_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_student_registration
    ADD CONSTRAINT cor_student_registration_pkey PRIMARY KEY (id);


--
-- Name: cor_subject_list cor_subject_list_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_subject_list
    ADD CONSTRAINT cor_subject_list_pkey PRIMARY KEY (id);


--
-- Name: course course_course_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_course_code_key UNIQUE (course_code);


--
-- Name: course_equivalency course_equivalency_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_equivalency
    ADD CONSTRAINT course_equivalency_pkey PRIMARY KEY (id);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- Name: course_requisite course_requisite_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_requisite
    ADD CONSTRAINT course_requisite_pkey PRIMARY KEY (id);


--
-- Name: course_schedule course_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule
    ADD CONSTRAINT course_schedule_pkey PRIMARY KEY (id);


--
-- Name: course_special_fee course_special_fee_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_special_fee
    ADD CONSTRAINT course_special_fee_pkey PRIMARY KEY (id);


--
-- Name: curriculum_course curriculum_course_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum_course
    ADD CONSTRAINT curriculum_course_pkey PRIMARY KEY (id);


--
-- Name: curriculum curriculum_curriculum_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum
    ADD CONSTRAINT curriculum_curriculum_code_key UNIQUE (curriculum_code);


--
-- Name: curriculum curriculum_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum
    ADD CONSTRAINT curriculum_pkey PRIMARY KEY (id);


--
-- Name: default_assessment default_assessment_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.default_assessment
    ADD CONSTRAINT default_assessment_pkey PRIMARY KEY (id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: department_program department_program_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department_program
    ADD CONSTRAINT department_program_pkey PRIMARY KEY (id);


--
-- Name: employee_designation employee_designation_pk; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_designation
    ADD CONSTRAINT employee_designation_pk PRIMARY KEY (id);


--
-- Name: employee_faculty_designation employee_faculty_designation_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_designation
    ADD CONSTRAINT employee_faculty_designation_pkey PRIMARY KEY (id);


--
-- Name: employee_faculty_wec employee_faculty_wec_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_wec
    ADD CONSTRAINT employee_faculty_wec_pkey PRIMARY KEY (id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: employee_profile employee_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_pkey PRIMARY KEY (id);


--
-- Name: employee_user employee_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_user
    ADD CONSTRAINT employee_user_pkey PRIMARY KEY (id);


--
-- Name: enrollment_settings enrollment_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.enrollment_settings
    ADD CONSTRAINT enrollment_settings_pkey PRIMARY KEY (id);


--
-- Name: ep_payment ep_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ep_payment
    ADD CONSTRAINT ep_payment_pkey PRIMARY KEY (id);


--
-- Name: evaluation evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_pkey PRIMARY KEY (id);


--
-- Name: evaluation_sheets evaluation_sheets_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation_sheets
    ADD CONSTRAINT evaluation_sheets_pkey PRIMARY KEY (id);


--
-- Name: import_upload import_upload_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.import_upload
    ADD CONSTRAINT import_upload_pkey PRIMARY KEY (id);


--
-- Name: office office_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_pkey PRIMARY KEY (id);


--
-- Name: or_printlogs or_printlogs_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.or_printlogs
    ADD CONSTRAINT or_printlogs_pkey PRIMARY KEY (id);


--
-- Name: ors_settings ors_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ors_settings
    ADD CONSTRAINT ors_settings_pkey PRIMARY KEY (id);


--
-- Name: payment_details payment_details_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_pkey PRIMARY KEY (id);


--
-- Name: payment_mode payment_mode_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_mode
    ADD CONSTRAINT payment_mode_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: payment payment_primary_refno_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_primary_refno_key UNIQUE (primary_refno);


--
-- Name: preregistration_subjects preregistration_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects
    ADD CONSTRAINT preregistration_subjects_pkey PRIMARY KEY (id);


--
-- Name: program_major program_major_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program_major
    ADD CONSTRAINT program_major_pkey PRIMARY KEY (id);


--
-- Name: program program_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (id);


--
-- Name: program program_program_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_program_code_key UNIQUE (program_code);


--
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);


--
-- Name: questionnaire_category questionnaire_category_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_category
    ADD CONSTRAINT questionnaire_category_pkey PRIMARY KEY (id);


--
-- Name: questionnaire_comments questionnaire_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_comments
    ADD CONSTRAINT questionnaire_comments_pkey PRIMARY KEY (id);


--
-- Name: questionnaire_evaluated questionnaire_evaluated_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_evaluated
    ADD CONSTRAINT questionnaire_evaluated_pkey PRIMARY KEY (id);


--
-- Name: questionnaire_results questionnaire_results_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_results
    ADD CONSTRAINT questionnaire_results_pkey PRIMARY KEY (id);


--
-- Name: ref_academic_term ref_academic_term_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_academic_term
    ADD CONSTRAINT ref_academic_term_pkey PRIMARY KEY (id);


--
-- Name: ref_academic_term ref_academic_term_unique; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_academic_term
    ADD CONSTRAINT ref_academic_term_unique UNIQUE (school_year, semester);


--
-- Name: ref_accounts_category ref_accounts_category_category_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_category
    ADD CONSTRAINT ref_accounts_category_category_code_key UNIQUE (category_code);


--
-- Name: ref_accounts_category ref_accounts_category_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_category
    ADD CONSTRAINT ref_accounts_category_pkey PRIMARY KEY (id);


--
-- Name: ref_accounts_classification ref_accounts_classification_classification_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_classification
    ADD CONSTRAINT ref_accounts_classification_classification_code_key UNIQUE (classification_code);


--
-- Name: ref_accounts_classification ref_accounts_classification_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_classification
    ADD CONSTRAINT ref_accounts_classification_pkey PRIMARY KEY (id);


--
-- Name: ref_accounts_group ref_accounts_group_group_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_group
    ADD CONSTRAINT ref_accounts_group_group_code_key UNIQUE (group_code);


--
-- Name: ref_accounts_group ref_accounts_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_group
    ADD CONSTRAINT ref_accounts_group_pkey PRIMARY KEY (id);


--
-- Name: ref_accounts_set ref_accounts_set_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_set
    ADD CONSTRAINT ref_accounts_set_pkey PRIMARY KEY (id);


--
-- Name: ref_accounts_set ref_accounts_set_set_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_set
    ADD CONSTRAINT ref_accounts_set_set_code_key UNIQUE (set_code);


--
-- Name: ref_course_area ref_course_area_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_area
    ADD CONSTRAINT ref_course_area_pkey PRIMARY KEY (id);


--
-- Name: ref_course_level ref_course_level_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_level
    ADD CONSTRAINT ref_course_level_pkey PRIMARY KEY (id);


--
-- Name: ref_course_mode ref_course_mode_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_mode
    ADD CONSTRAINT ref_course_mode_pkey PRIMARY KEY (id);


--
-- Name: ref_course_type_course ref_course_type_course_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_type_course
    ADD CONSTRAINT ref_course_type_course_pkey PRIMARY KEY (id);


--
-- Name: ref_course_type ref_course_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_type
    ADD CONSTRAINT ref_course_type_pkey PRIMARY KEY (id);


--
-- Name: ref_degree ref_degree_degree_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_degree
    ADD CONSTRAINT ref_degree_degree_code_key UNIQUE (degree_code);


--
-- Name: ref_degree ref_degree_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_degree
    ADD CONSTRAINT ref_degree_pkey PRIMARY KEY (id);


--
-- Name: ref_program_term ref_program_term_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_program_term
    ADD CONSTRAINT ref_program_term_pkey PRIMARY KEY (id);


--
-- Name: ref_room_type ref_room_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_room_type
    ADD CONSTRAINT ref_room_type_pkey PRIMARY KEY (id);


--
-- Name: ref_shifter_transferee ref_shifter_transferee_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_shifter_transferee
    ADD CONSTRAINT ref_shifter_transferee_pkey PRIMARY KEY (id);


--
-- Name: ref_year_term ref_year_term_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_year_term
    ADD CONSTRAINT ref_year_term_pkey PRIMARY KEY (id);


--
-- Name: registrar_unit registrar_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.registrar_unit
    ADD CONSTRAINT registrar_unit_pkey PRIMARY KEY (id);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- Name: sc_error_report sc_error_report_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.sc_error_report
    ADD CONSTRAINT sc_error_report_pkey PRIMARY KEY (id);


--
-- Name: scholarship_application_newapplicant scholarship_application_newapplicant_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_application_newapplicant
    ADD CONSTRAINT scholarship_application_newapplicant_pkey PRIMARY KEY (id);


--
-- Name: scholarship_application scholarship_application_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_application
    ADD CONSTRAINT scholarship_application_pkey PRIMARY KEY (id);


--
-- Name: scholarship_category scholarship_category_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_category
    ADD CONSTRAINT scholarship_category_pkey PRIMARY KEY (id);


--
-- Name: scholarship_grant_template scholarship_grant_template_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_grant_template
    ADD CONSTRAINT scholarship_grant_template_pkey PRIMARY KEY (id);


--
-- Name: scholarship scholarship_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship
    ADD CONSTRAINT scholarship_pkey PRIMARY KEY (id);


--
-- Name: scholarship_provider_group scholarship_provider_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_group
    ADD CONSTRAINT scholarship_provider_group_pkey PRIMARY KEY (id);


--
-- Name: scholarship_provider_level scholarship_provider_level_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_level
    ADD CONSTRAINT scholarship_provider_level_pkey PRIMARY KEY (id);


--
-- Name: scholarship_provider scholarship_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider
    ADD CONSTRAINT scholarship_provider_pkey PRIMARY KEY (id);


--
-- Name: scholarship_provider_type scholarship_provider_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_type
    ADD CONSTRAINT scholarship_provider_type_pkey PRIMARY KEY (id);


--
-- Name: scholarship_subtype_billing scholarship_subtype_billing_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype_billing
    ADD CONSTRAINT scholarship_subtype_billing_pkey PRIMARY KEY (id);


--
-- Name: scholarship_subtype scholarship_subtype_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype
    ADD CONSTRAINT scholarship_subtype_pkey PRIMARY KEY (id);


--
-- Name: scholarship_subtype_tfdiscount scholarship_subtype_tfdiscount_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype_tfdiscount
    ADD CONSTRAINT scholarship_subtype_tfdiscount_pkey PRIMARY KEY (id);


--
-- Name: scholarship_tagging scholarship_tagging_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_tagging
    ADD CONSTRAINT scholarship_tagging_pkey PRIMARY KEY (id);


--
-- Name: scholarship_untag_request scholarship_untag_request_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_untag_request
    ADD CONSTRAINT scholarship_untag_request_pkey PRIMARY KEY (id);


--
-- Name: signatories signatories_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.signatories
    ADD CONSTRAINT signatories_pkey PRIMARY KEY (id);


--
-- Name: student_assessment student_assessment_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment
    ADD CONSTRAINT student_assessment_pkey PRIMARY KEY (id);


--
-- Name: student_ledger student_ledger_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_ledger
    ADD CONSTRAINT student_ledger_pkey PRIMARY KEY (id);


--
-- Name: student_monthly_family_income student_monthly_family_income_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_monthly_family_income
    ADD CONSTRAINT student_monthly_family_income_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: student_profile student_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_profile
    ADD CONSTRAINT student_profile_pkey PRIMARY KEY (id);


--
-- Name: student_registration student_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_pkey PRIMARY KEY (id);


--
-- Name: student_registration student_registration_registration_code_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_registration_code_key UNIQUE (registration_code);


--
-- Name: student student_stud_num_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_stud_num_key UNIQUE (stud_num);


--
-- Name: student_userinfo student_userinfo_email_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_userinfo
    ADD CONSTRAINT student_userinfo_email_key UNIQUE (email);


--
-- Name: student_userinfo student_userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_userinfo
    ADD CONSTRAINT student_userinfo_pkey PRIMARY KEY (id);


--
-- Name: student_userinfo student_userinfo_username_key; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_userinfo
    ADD CONSTRAINT student_userinfo_username_key UNIQUE (username);


--
-- Name: studentuser_event studentuser_event_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_event
    ADD CONSTRAINT studentuser_event_pkey PRIMARY KEY (id);


--
-- Name: studentuser_group studentuser_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_group
    ADD CONSTRAINT studentuser_group_pkey PRIMARY KEY (id);


--
-- Name: studentuser_membership studentuser_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_membership
    ADD CONSTRAINT studentuser_membership_pkey PRIMARY KEY (id);


--
-- Name: studentuser_permission studentuser_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_permission
    ADD CONSTRAINT studentuser_permission_pkey PRIMARY KEY (id);


--
-- Name: subject_list subject_list_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list
    ADD CONSTRAINT subject_list_pkey PRIMARY KEY (id);


--
-- Name: temp_student_curriculum temp_student_curriculum_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.temp_student_curriculum
    ADD CONSTRAINT temp_student_curriculum_pkey PRIMARY KEY (id);


--
-- Name: tmp_account_finance tmp_account_finance_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_account_finance
    ADD CONSTRAINT tmp_account_finance_pkey PRIMARY KEY (id);


--
-- Name: tmp_import_students tmp_import_students_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_import_students
    ADD CONSTRAINT tmp_import_students_pkey PRIMARY KEY (id);


--
-- Name: transaction_logs transaction_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.transaction_logs
    ADD CONSTRAINT transaction_logs_pkey PRIMARY KEY (id);


--
-- Name: transaction_type transaction_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.transaction_type
    ADD CONSTRAINT transaction_type_pkey PRIMARY KEY (id);


--
-- Name: preregistration_subjects unique_key_student_id_course_id; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects
    ADD CONSTRAINT unique_key_student_id_course_id UNIQUE (student_id, course_id);


--
-- Name: ref_year_term year_term_description_U; Type: CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_year_term
    ADD CONSTRAINT "year_term_description_U" UNIQUE (year_term_description);


--
-- Name: academic_ledger academic_ledger_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.academic_ledger
    ADD CONSTRAINT academic_ledger_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: academic_ledger academic_ledger_department_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.academic_ledger
    ADD CONSTRAINT academic_ledger_department_program_id_fkey FOREIGN KEY (department_program_id) REFERENCES public.department_program(id) ON DELETE CASCADE;


--
-- Name: academic_ledger academic_ledger_end_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.academic_ledger
    ADD CONSTRAINT academic_ledger_end_academic_term_id_fkey FOREIGN KEY (end_academic_term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: academic_ledger academic_ledger_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.academic_ledger
    ADD CONSTRAINT academic_ledger_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: academic_ledger academic_ledger_start_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.academic_ledger
    ADD CONSTRAINT academic_ledger_start_academic_term_id_fkey FOREIGN KEY (start_academic_term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: academic_ledger academic_ledger_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.academic_ledger
    ADD CONSTRAINT academic_ledger_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: account account_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: account account_cancelled_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_cancelled_by_fkey FOREIGN KEY (cancelled_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: account account_cleared_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_cleared_by_fkey FOREIGN KEY (cleared_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: account account_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: account account_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id) ON DELETE CASCADE;


--
-- Name: account account_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: chart_of_accounts account_set_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT account_set_id_fkey FOREIGN KEY (accounts_set_id) REFERENCES public.ref_accounts_set(id);


--
-- Name: account account_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.clearance_status(id) ON DELETE CASCADE;


--
-- Name: account account_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: accounts_fees accounts_fees_chart_of_accounts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.accounts_fees
    ADD CONSTRAINT accounts_fees_chart_of_accounts_id_fkey FOREIGN KEY (chart_of_accounts_id) REFERENCES public.chart_of_accounts(id) ON DELETE CASCADE;


--
-- Name: accounts_fees accounts_fees_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.accounts_fees
    ADD CONSTRAINT accounts_fees_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: accounts_fees accounts_fees_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.accounts_fees
    ADD CONSTRAINT accounts_fees_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_degree add_change_fees_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_degree
    ADD CONSTRAINT add_change_fees_id_fk FOREIGN KEY (add_change_fees_id) REFERENCES public.assessment_of_fees(id);


--
-- Name: assessment_items assessment_items_account_fees_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_items
    ADD CONSTRAINT assessment_items_account_fees_id_fkey FOREIGN KEY (account_fees_id) REFERENCES public.accounts_fees(id) ON DELETE CASCADE;


--
-- Name: assessment_items assessment_items_assessment_of_fees_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_items
    ADD CONSTRAINT assessment_items_assessment_of_fees_id_fkey FOREIGN KEY (assessment_of_fees_id) REFERENCES public.assessment_of_fees(id) ON DELETE CASCADE;


--
-- Name: assessment_items assessment_items_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_items
    ADD CONSTRAINT assessment_items_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: assessment_items assessment_items_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_items
    ADD CONSTRAINT assessment_items_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: assessment_of_fees assessment_of_fees_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_of_fees
    ADD CONSTRAINT assessment_of_fees_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: assessment_of_fees assessment_of_fees_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_of_fees
    ADD CONSTRAINT assessment_of_fees_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: assessment_of_fees assessment_of_fees_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_of_fees
    ADD CONSTRAINT assessment_of_fees_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id) ON DELETE CASCADE;


--
-- Name: assessment_of_fees assessment_of_fees_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_of_fees
    ADD CONSTRAINT assessment_of_fees_term_id_fkey FOREIGN KEY (term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: assessment_of_fees assessment_of_fees_year_level_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_of_fees
    ADD CONSTRAINT assessment_of_fees_year_level_fkey FOREIGN KEY (year_level) REFERENCES public.ref_year_term(id) ON DELETE CASCADE;


--
-- Name: auth_cas auth_cas_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_cas
    ADD CONSTRAINT auth_cas_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_event auth_event_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_event
    ADD CONSTRAINT auth_event_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_extension auth_extension_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_extension
    ADD CONSTRAINT auth_extension_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_extension auth_extension_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_extension
    ADD CONSTRAINT auth_extension_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_membership auth_membership_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_membership
    ADD CONSTRAINT auth_membership_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id) ON DELETE CASCADE;


--
-- Name: auth_membership auth_membership_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_membership
    ADD CONSTRAINT auth_membership_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_permission auth_permission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id) ON DELETE CASCADE;


--
-- Name: employee_faculty_designation auth_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_designation
    ADD CONSTRAINT auth_user_id_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id);


--
-- Name: employee_faculty_wec auth_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_wec
    ADD CONSTRAINT auth_user_id_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id);


--
-- Name: employee_faculty_designation auth_user_id_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_designation
    ADD CONSTRAINT auth_user_id_fkey2 FOREIGN KEY (modified_by) REFERENCES public.auth_user(id);


--
-- Name: employee_faculty_wec auth_user_id_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_wec
    ADD CONSTRAINT auth_user_id_fkey2 FOREIGN KEY (modified_by) REFERENCES public.auth_user(id);


--
-- Name: barangay barangay_city_municipality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.barangay
    ADD CONSTRAINT barangay_city_municipality_id_fkey FOREIGN KEY (city_municipality_id) REFERENCES public.city_municipality(id);


--
-- Name: barangay barangay_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.barangay
    ADD CONSTRAINT barangay_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id);


--
-- Name: barangay barangay_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.barangay
    ADD CONSTRAINT barangay_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id);


--
-- Name: barangay_zipcodes barangay_zipcodes_barangay_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.barangay_zipcodes
    ADD CONSTRAINT barangay_zipcodes_barangay_id_fkey FOREIGN KEY (barangay_id) REFERENCES public.barangay(id);


--
-- Name: barangay_zipcodes barangay_zipcodes_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.barangay_zipcodes
    ADD CONSTRAINT barangay_zipcodes_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id);


--
-- Name: barangay_zipcodes barangay_zipcodes_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.barangay_zipcodes
    ADD CONSTRAINT barangay_zipcodes_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id);


--
-- Name: block block_college_department_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT block_college_department_fk FOREIGN KEY (college_department_id) REFERENCES public.college_department(id);


--
-- Name: block block_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT block_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: block block_department_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT block_department_program_id_fkey FOREIGN KEY (department_program_id) REFERENCES public.department_program(id) ON DELETE CASCADE;


--
-- Name: block block_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT block_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: block block_year_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT block_year_term_id_fkey FOREIGN KEY (year_term_id) REFERENCES public.ref_year_term(id) ON DELETE CASCADE;


--
-- Name: building building_campus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_campus_id_fkey FOREIGN KEY (campus_id) REFERENCES public.campus(id) ON DELETE CASCADE;


--
-- Name: building building_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: building building_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: building building_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: campus campus_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: campus campus_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: chart_of_accounts chart_of_accounts_accounts_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_accounts_category_id_fkey FOREIGN KEY (accounts_category_id) REFERENCES public.ref_accounts_category(id) ON DELETE CASCADE;


--
-- Name: chart_of_accounts chart_of_accounts_accounts_classification_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_accounts_classification_id_fkey FOREIGN KEY (accounts_classification_id) REFERENCES public.ref_accounts_classification(id) ON DELETE CASCADE;


--
-- Name: chart_of_accounts chart_of_accounts_accounts_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_accounts_group_id_fkey FOREIGN KEY (accounts_group_id) REFERENCES public.ref_accounts_group(id) ON DELETE CASCADE;


--
-- Name: chart_of_accounts chart_of_accounts_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: chart_of_accounts chart_of_accounts_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: check_table check_table_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.check_table
    ADD CONSTRAINT check_table_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: check_table check_table_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.check_table
    ADD CONSTRAINT check_table_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: city_municipality city_municipality_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.city_municipality
    ADD CONSTRAINT city_municipality_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id);


--
-- Name: city_municipality city_municipality_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.city_municipality
    ADD CONSTRAINT city_municipality_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id);


--
-- Name: city_municipality city_province_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.city_municipality
    ADD CONSTRAINT city_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province(id);


--
-- Name: class_event class_event_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_event
    ADD CONSTRAINT class_event_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: class_event class_event_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_event
    ADD CONSTRAINT class_event_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: class_schedule class_schedule_class_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_schedule
    ADD CONSTRAINT class_schedule_class_event_id_fkey FOREIGN KEY (class_event_id) REFERENCES public.class_event(id) ON DELETE CASCADE;


--
-- Name: class_schedule class_schedule_course_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_schedule
    ADD CONSTRAINT class_schedule_course_schedule_id_fkey FOREIGN KEY (course_schedule_id) REFERENCES public.course_schedule(id) ON DELETE CASCADE;


--
-- Name: class_schedule class_schedule_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_schedule
    ADD CONSTRAINT class_schedule_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: class_schedule class_schedule_faculty_in_charge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_schedule
    ADD CONSTRAINT class_schedule_faculty_in_charge_id_fkey FOREIGN KEY (faculty_in_charge_id) REFERENCES public.employee(id) ON DELETE CASCADE;


--
-- Name: class_schedule class_schedule_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_schedule
    ADD CONSTRAINT class_schedule_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: class_schedule class_schedule_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.class_schedule
    ADD CONSTRAINT class_schedule_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room(id) ON DELETE CASCADE;


--
-- Name: clearance_status clearance_status_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.clearance_status
    ADD CONSTRAINT clearance_status_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: clearance_status clearance_status_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.clearance_status
    ADD CONSTRAINT clearance_status_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: college college_campus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_campus_id_fkey FOREIGN KEY (campus_id) REFERENCES public.campus(id) ON DELETE CASCADE;


--
-- Name: college college_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: college_department college_department_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college_department
    ADD CONSTRAINT college_department_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: college_department college_department_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college_department
    ADD CONSTRAINT college_department_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: college_department college_department_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college_department
    ADD CONSTRAINT college_department_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id) ON DELETE CASCADE;


--
-- Name: college_department college_department_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college_department
    ADD CONSTRAINT college_department_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: college college_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: cor_assessment cor_assessment_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_assessment
    ADD CONSTRAINT cor_assessment_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: cor_assessment cor_assessment_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_assessment
    ADD CONSTRAINT cor_assessment_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: cor_assessment cor_assessment_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_assessment
    ADD CONSTRAINT cor_assessment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.cor_student_registration(id) ON DELETE CASCADE;


--
-- Name: cor_schedule cor_schedule_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_schedule
    ADD CONSTRAINT cor_schedule_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: cor_schedule cor_schedule_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_schedule
    ADD CONSTRAINT cor_schedule_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: cor_schedule cor_schedule_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_schedule
    ADD CONSTRAINT cor_schedule_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.cor_student_registration(id) ON DELETE CASCADE;


--
-- Name: cor_student_registration cor_student_registration_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_student_registration
    ADD CONSTRAINT cor_student_registration_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: cor_student_registration cor_student_registration_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_student_registration
    ADD CONSTRAINT cor_student_registration_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: cor_subject_list cor_subject_list_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_subject_list
    ADD CONSTRAINT cor_subject_list_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: cor_subject_list cor_subject_list_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_subject_list
    ADD CONSTRAINT cor_subject_list_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: cor_subject_list cor_subject_list_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.cor_subject_list
    ADD CONSTRAINT cor_subject_list_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.cor_student_registration(id) ON DELETE CASCADE;


--
-- Name: course course_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: course course_course_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_course_area_id_fkey FOREIGN KEY (course_area_id) REFERENCES public.ref_course_area(id) ON DELETE CASCADE;


--
-- Name: course course_course_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_course_level_id_fkey FOREIGN KEY (course_level_id) REFERENCES public.ref_course_level(id) ON DELETE CASCADE;


--
-- Name: course course_course_mode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_course_mode_id_fkey FOREIGN KEY (course_mode_id) REFERENCES public.ref_course_mode(id) ON DELETE CASCADE;


--
-- Name: course course_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: course_equivalency course_equivalency_course_equivalency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_equivalency
    ADD CONSTRAINT course_equivalency_course_equivalency_id_fkey FOREIGN KEY (course_equivalency_id) REFERENCES public.course(id);


--
-- Name: course_equivalency course_equivalency_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_equivalency
    ADD CONSTRAINT course_equivalency_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.curriculum_course(id);


--
-- Name: course_equivalency course_equivalency_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_equivalency
    ADD CONSTRAINT course_equivalency_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: course_equivalency course_equivalency_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_equivalency
    ADD CONSTRAINT course_equivalency_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: course course_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: course course_offered_in_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_offered_in_college_id_fkey FOREIGN KEY (offered_in_college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: course_requisite course_requisite_course_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_requisite
    ADD CONSTRAINT course_requisite_course_id_fk FOREIGN KEY (course_id) REFERENCES public.curriculum_course(id);


--
-- Name: course_requisite course_requisite_course_requisite_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_requisite
    ADD CONSTRAINT course_requisite_course_requisite_id_fk FOREIGN KEY (course_requisite_id) REFERENCES public.curriculum_course(id);


--
-- Name: course_requisite course_requisite_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_requisite
    ADD CONSTRAINT course_requisite_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: course_requisite course_requisite_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_requisite
    ADD CONSTRAINT course_requisite_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: course_schedule course_schedule_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule
    ADD CONSTRAINT course_schedule_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: course_schedule course_schedule_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule
    ADD CONSTRAINT course_schedule_block_id_fkey FOREIGN KEY (block_id) REFERENCES public.block(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: course_schedule course_schedule_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule
    ADD CONSTRAINT course_schedule_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- Name: course_schedule course_schedule_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule
    ADD CONSTRAINT course_schedule_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: course_schedule_block course_schedule_createdby_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule_block
    ADD CONSTRAINT course_schedule_createdby_fk FOREIGN KEY (created_by) REFERENCES public.auth_user(id);


--
-- Name: course_schedule course_schedule_faculty_in_charge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule
    ADD CONSTRAINT course_schedule_faculty_in_charge_id_fkey FOREIGN KEY (faculty_in_charge_id) REFERENCES public.employee(id) ON DELETE CASCADE;


--
-- Name: course_schedule_block course_schedule_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule_block
    ADD CONSTRAINT course_schedule_fk FOREIGN KEY (course_schedule_id) REFERENCES public.course_schedule(id);


--
-- Name: course_schedule course_schedule_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule
    ADD CONSTRAINT course_schedule_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: course_schedule_block course_schedule_modifiedby_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule_block
    ADD CONSTRAINT course_schedule_modifiedby_fk FOREIGN KEY (modified_by) REFERENCES public.auth_user(id);


--
-- Name: course course_service_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_service_college_id_fkey FOREIGN KEY (service_college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: course_special_fee course_special_fee_account_fee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_special_fee
    ADD CONSTRAINT course_special_fee_account_fee_id_fkey FOREIGN KEY (account_fee_id) REFERENCES public.accounts_fees(id);


--
-- Name: course_special_fee course_special_fee_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_special_fee
    ADD CONSTRAINT course_special_fee_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.curriculum_course(id);


--
-- Name: course_special_fee course_special_fee_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_special_fee
    ADD CONSTRAINT course_special_fee_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: course_special_fee course_special_fee_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_special_fee
    ADD CONSTRAINT course_special_fee_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: course_schedule_block cs_block_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.course_schedule_block
    ADD CONSTRAINT cs_block_fk FOREIGN KEY (block_id) REFERENCES public.block(id);


--
-- Name: curriculum curriculum_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum
    ADD CONSTRAINT curriculum_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: curriculum_course curriculum_course_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum_course
    ADD CONSTRAINT curriculum_course_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- Name: curriculum_course curriculum_course_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum_course
    ADD CONSTRAINT curriculum_course_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: curriculum_course curriculum_course_curriculum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum_course
    ADD CONSTRAINT curriculum_course_curriculum_id_fkey FOREIGN KEY (curriculum_id) REFERENCES public.curriculum(id) ON DELETE CASCADE;


--
-- Name: curriculum_course curriculum_course_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum_course
    ADD CONSTRAINT curriculum_course_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: curriculum_course curriculum_course_year_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum_course
    ADD CONSTRAINT curriculum_course_year_term_id_fkey FOREIGN KEY (year_term_id) REFERENCES public.ref_year_term(id) ON DELETE CASCADE;


--
-- Name: curriculum curriculum_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum
    ADD CONSTRAINT curriculum_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: curriculum curriculum_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum
    ADD CONSTRAINT curriculum_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: default_assessment default_assessment_accounts_fees_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.default_assessment
    ADD CONSTRAINT default_assessment_accounts_fees_id_fkey FOREIGN KEY (accounts_fees_id) REFERENCES public.accounts_fees(id) ON DELETE CASCADE;


--
-- Name: default_assessment default_assessment_assessment_of_fees_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.default_assessment
    ADD CONSTRAINT default_assessment_assessment_of_fees_id_fkey FOREIGN KEY (assessment_of_fees_id) REFERENCES public.assessment_of_fees(id) ON DELETE CASCADE;


--
-- Name: default_assessment default_assessment_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.default_assessment
    ADD CONSTRAINT default_assessment_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: default_assessment default_assessment_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.default_assessment
    ADD CONSTRAINT default_assessment_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: default_assessment default_assessment_transaction_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.default_assessment
    ADD CONSTRAINT default_assessment_transaction_type_id_fkey FOREIGN KEY (transaction_type_id) REFERENCES public.transaction_type(id) ON DELETE CASCADE;


--
-- Name: department department_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: department department_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: department_program department_program_college_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department_program
    ADD CONSTRAINT department_program_college_department_id_fkey FOREIGN KEY (college_department_id) REFERENCES public.college_department(id) ON DELETE CASCADE;


--
-- Name: department_program department_program_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department_program
    ADD CONSTRAINT department_program_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: department_program department_program_curriculum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department_program
    ADD CONSTRAINT department_program_curriculum_id_fkey FOREIGN KEY (curriculum_id) REFERENCES public.curriculum(id) ON DELETE CASCADE;


--
-- Name: department_program department_program_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department_program
    ADD CONSTRAINT department_program_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: department_program department_program_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.department_program
    ADD CONSTRAINT department_program_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id) ON DELETE CASCADE;


--
-- Name: employee employee_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: employee employee_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: employee_faculty_designation employee_designation_pk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_designation
    ADD CONSTRAINT employee_designation_pk FOREIGN KEY (employee_designation_id) REFERENCES public.employee_designation(id);


--
-- Name: employee_faculty_designation employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_designation
    ADD CONSTRAINT employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- Name: employee_faculty_wec employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_wec
    ADD CONSTRAINT employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- Name: employee employee_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: enrollment_settings enrollment_settings_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.enrollment_settings
    ADD CONSTRAINT enrollment_settings_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: enrollment_settings enrollment_settings_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.enrollment_settings
    ADD CONSTRAINT enrollment_settings_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: evaluation evaluation_academic_ledger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_academic_ledger_id_fkey FOREIGN KEY (academic_ledger_id) REFERENCES public.academic_ledger(id);


--
-- Name: evaluation evaluation_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: evaluation evaluation_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: evaluation evaluation_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: evaluation evaluation_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: evaluation_sheets evaluation_sheets_academic_ledger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation_sheets
    ADD CONSTRAINT evaluation_sheets_academic_ledger_id_fkey FOREIGN KEY (academic_ledger_id) REFERENCES public.academic_ledger(id) ON DELETE CASCADE;


--
-- Name: evaluation_sheets evaluation_sheets_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation_sheets
    ADD CONSTRAINT evaluation_sheets_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: evaluation_sheets evaluation_sheets_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation_sheets
    ADD CONSTRAINT evaluation_sheets_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- Name: evaluation_sheets evaluation_sheets_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation_sheets
    ADD CONSTRAINT evaluation_sheets_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: evaluation_sheets evaluation_sheets_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation_sheets
    ADD CONSTRAINT evaluation_sheets_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: evaluation evaluation_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: curriculum_course fees_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.curriculum_course
    ADD CONSTRAINT fees_id_fk FOREIGN KEY (fees_id) REFERENCES public.accounts_fees(id);


--
-- Name: ref_degree fees_template_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_degree
    ADD CONSTRAINT fees_template_fk FOREIGN KEY (fees_template_id) REFERENCES public.assessment_of_fees(id);


--
-- Name: assessment_of_fees fk_assessment_of_fees_department_program; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.assessment_of_fees
    ADD CONSTRAINT fk_assessment_of_fees_department_program FOREIGN KEY (department_program_id) REFERENCES public.department_program(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: block fk_block_academic; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT fk_block_academic FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: import_upload import_upload_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.import_upload
    ADD CONSTRAINT import_upload_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: import_upload import_upload_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.import_upload
    ADD CONSTRAINT import_upload_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: office office_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: office office_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: office office_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: or_printlogs or_printlogs_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.or_printlogs
    ADD CONSTRAINT or_printlogs_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: or_printlogs or_printlogs_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.or_printlogs
    ADD CONSTRAINT or_printlogs_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ors_settings ors_settings_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ors_settings
    ADD CONSTRAINT ors_settings_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ors_settings ors_settings_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ors_settings
    ADD CONSTRAINT ors_settings_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: payment payment_cashier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_cashier_id_fkey FOREIGN KEY (cashier_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: payment payment_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: payment_details payment_details_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts_fees(id) ON DELETE CASCADE;


--
-- Name: payment_details payment_details_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: payment_details payment_details_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: payment_details payment_details_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON DELETE CASCADE;


--
-- Name: payment_details payment_details_student_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_student_no_fkey FOREIGN KEY (student_no) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: payment_details payment_details_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_term_id_fkey FOREIGN KEY (term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: payment_details payment_details_year_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_year_term_id_fkey FOREIGN KEY (year_term_id) REFERENCES public.ref_year_term(id) ON DELETE CASCADE;


--
-- Name: payment payment_enrollment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_enrollment_id_fkey FOREIGN KEY (enrollment_id) REFERENCES public.student_registration(id) ON DELETE CASCADE;


--
-- Name: payment_mode payment_mode_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_mode
    ADD CONSTRAINT payment_mode_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: payment_mode payment_mode_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_mode
    ADD CONSTRAINT payment_mode_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: payment payment_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: payment payment_or_signatory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_or_signatory_fkey FOREIGN KEY (or_signatory) REFERENCES public.signatories(id) ON DELETE CASCADE;


--
-- Name: payment payment_payment_mode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_mode_id_fkey FOREIGN KEY (payment_mode_id) REFERENCES public.payment_mode(id) ON DELETE CASCADE;


--
-- Name: payment payment_student_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_student_no_fkey FOREIGN KEY (student_no) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: payment payment_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_term_id_fkey FOREIGN KEY (term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: payment payment_transaction_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_transaction_type_id_fkey FOREIGN KEY (transaction_type_id) REFERENCES public.transaction_type(id) ON DELETE CASCADE;


--
-- Name: payment payment_year_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_year_term_id_fkey FOREIGN KEY (year_term_id) REFERENCES public.ref_year_term(id) ON DELETE CASCADE;


--
-- Name: preregistration_subjects preregistration_subjects_academicterm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects
    ADD CONSTRAINT preregistration_subjects_academicterm_id_fkey FOREIGN KEY (academicterm_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: preregistration_subjects preregistration_subjects_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects
    ADD CONSTRAINT preregistration_subjects_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- Name: preregistration_subjects preregistration_subjects_course_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects
    ADD CONSTRAINT preregistration_subjects_course_schedule_id_fkey FOREIGN KEY (course_schedule_id) REFERENCES public.course_schedule(id) ON DELETE CASCADE;


--
-- Name: preregistration_subjects preregistration_subjects_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects
    ADD CONSTRAINT preregistration_subjects_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: preregistration_subjects preregistration_subjects_enrollment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects
    ADD CONSTRAINT preregistration_subjects_enrollment_id_fkey FOREIGN KEY (enrollment_id) REFERENCES public.student_registration(id) ON DELETE CASCADE;


--
-- Name: preregistration_subjects preregistration_subjects_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects
    ADD CONSTRAINT preregistration_subjects_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: preregistration_subjects preregistration_subjects_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects
    ADD CONSTRAINT preregistration_subjects_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: preregistration_subjects preregistration_subjects_year_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.preregistration_subjects
    ADD CONSTRAINT preregistration_subjects_year_term_id_fkey FOREIGN KEY (year_term_id) REFERENCES public.ref_year_term(id) ON DELETE CASCADE;


--
-- Name: program program_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: program program_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: program_major program_major_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program_major
    ADD CONSTRAINT program_major_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: program_major program_major_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program_major
    ADD CONSTRAINT program_major_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: program_major program_major_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program_major
    ADD CONSTRAINT program_major_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id) ON DELETE CASCADE;


--
-- Name: program program_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: province province_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id);


--
-- Name: province province_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id);


--
-- Name: questionnaire_category questionnaire_category_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_category
    ADD CONSTRAINT questionnaire_category_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: questionnaire_category questionnaire_category_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_category
    ADD CONSTRAINT questionnaire_category_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: questionnaire_comments questionnaire_comments_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_comments
    ADD CONSTRAINT questionnaire_comments_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: questionnaire_comments questionnaire_comments_evaluated_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_comments
    ADD CONSTRAINT questionnaire_comments_evaluated_id_fkey FOREIGN KEY (evaluated_id) REFERENCES public.questionnaire_evaluated(id) ON DELETE CASCADE;


--
-- Name: questionnaire_comments questionnaire_comments_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_comments
    ADD CONSTRAINT questionnaire_comments_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: questionnaire_evaluated questionnaire_evaluated_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_evaluated
    ADD CONSTRAINT questionnaire_evaluated_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id);


--
-- Name: questionnaire_evaluated questionnaire_evaluated_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_evaluated
    ADD CONSTRAINT questionnaire_evaluated_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: questionnaire_evaluated questionnaire_evaluated_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_evaluated
    ADD CONSTRAINT questionnaire_evaluated_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: questionnaire_evaluated questionnaire_evaluated_faculty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_evaluated
    ADD CONSTRAINT questionnaire_evaluated_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES public.employee(id);


--
-- Name: questionnaire_evaluated questionnaire_evaluated_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_evaluated
    ADD CONSTRAINT questionnaire_evaluated_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: questionnaire_evaluated questionnaire_evaluated_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_evaluated
    ADD CONSTRAINT questionnaire_evaluated_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: questionnaire_evaluated questionnaire_evaluated_subject_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_evaluated
    ADD CONSTRAINT questionnaire_evaluated_subject_list_id_fkey FOREIGN KEY (subject_list_id) REFERENCES public.subject_list(id) ON DELETE CASCADE;


--
-- Name: questionnaire_results questionnaire_results_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_results
    ADD CONSTRAINT questionnaire_results_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: questionnaire_results questionnaire_results_evaluated_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_results
    ADD CONSTRAINT questionnaire_results_evaluated_id_fkey FOREIGN KEY (evaluated_id) REFERENCES public.questionnaire_evaluated(id) ON DELETE CASCADE;


--
-- Name: questionnaire_results questionnaire_results_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.questionnaire_results
    ADD CONSTRAINT questionnaire_results_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_academic_term ref_academic_term_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_academic_term
    ADD CONSTRAINT ref_academic_term_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: employee_faculty_designation ref_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_designation
    ADD CONSTRAINT ref_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id);


--
-- Name: employee_faculty_wec ref_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.employee_faculty_wec
    ADD CONSTRAINT ref_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id);


--
-- Name: ref_academic_term ref_academic_term_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_academic_term
    ADD CONSTRAINT ref_academic_term_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_accounts_category ref_accounts_category_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_category
    ADD CONSTRAINT ref_accounts_category_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_accounts_category ref_accounts_category_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_category
    ADD CONSTRAINT ref_accounts_category_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_accounts_classification ref_accounts_classification_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_classification
    ADD CONSTRAINT ref_accounts_classification_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_accounts_classification ref_accounts_classification_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_classification
    ADD CONSTRAINT ref_accounts_classification_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_accounts_group ref_accounts_group_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_group
    ADD CONSTRAINT ref_accounts_group_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_accounts_group ref_accounts_group_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_group
    ADD CONSTRAINT ref_accounts_group_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_accounts_set ref_accounts_set_fkey_created; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_set
    ADD CONSTRAINT ref_accounts_set_fkey_created FOREIGN KEY (created_by) REFERENCES public.auth_user(id);


--
-- Name: ref_accounts_set ref_accounts_set_fkey_modified; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_accounts_set
    ADD CONSTRAINT ref_accounts_set_fkey_modified FOREIGN KEY (modified_by) REFERENCES public.auth_user(id);


--
-- Name: ref_course_area ref_course_area_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_area
    ADD CONSTRAINT ref_course_area_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_course_area ref_course_area_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_area
    ADD CONSTRAINT ref_course_area_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_course_level ref_course_level_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_level
    ADD CONSTRAINT ref_course_level_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_course_level ref_course_level_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_level
    ADD CONSTRAINT ref_course_level_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_course_mode ref_course_mode_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_mode
    ADD CONSTRAINT ref_course_mode_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_course_mode ref_course_mode_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_mode
    ADD CONSTRAINT ref_course_mode_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_course_type_course ref_course_type_course_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_type_course
    ADD CONSTRAINT ref_course_type_course_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- Name: ref_course_type_course ref_course_type_course_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_type_course
    ADD CONSTRAINT ref_course_type_course_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_course_type_course ref_course_type_course_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_type_course
    ADD CONSTRAINT ref_course_type_course_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_course_type_course ref_course_type_course_ref_course_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_type_course
    ADD CONSTRAINT ref_course_type_course_ref_course_type_id_fkey FOREIGN KEY (ref_course_type_id) REFERENCES public.ref_course_type(id) ON DELETE CASCADE;


--
-- Name: ref_course_type ref_course_type_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_type
    ADD CONSTRAINT ref_course_type_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_course_type ref_course_type_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_course_type
    ADD CONSTRAINT ref_course_type_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_degree ref_degree_fkey_created_by; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_degree
    ADD CONSTRAINT ref_degree_fkey_created_by FOREIGN KEY (created_by) REFERENCES public.auth_user(id);


--
-- Name: ref_degree ref_degree_fkey_modified_by; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_degree
    ADD CONSTRAINT ref_degree_fkey_modified_by FOREIGN KEY (modified_by) REFERENCES public.auth_user(id);


--
-- Name: ref_program_term ref_program_term_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_program_term
    ADD CONSTRAINT ref_program_term_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_program_term ref_program_term_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_program_term
    ADD CONSTRAINT ref_program_term_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_room_type ref_room_type_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_room_type
    ADD CONSTRAINT ref_room_type_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_room_type ref_room_type_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_room_type
    ADD CONSTRAINT ref_room_type_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_year_term ref_year_term_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_year_term
    ADD CONSTRAINT ref_year_term_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: ref_year_term ref_year_term_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.ref_year_term
    ADD CONSTRAINT ref_year_term_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: registrar_unit registrar_unit_auth_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.registrar_unit
    ADD CONSTRAINT registrar_unit_auth_user_id_fkey FOREIGN KEY (auth_user_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: registrar_unit registrar_unit_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.registrar_unit
    ADD CONSTRAINT registrar_unit_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: registrar_unit registrar_unit_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.registrar_unit
    ADD CONSTRAINT registrar_unit_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: registrar_unit registrar_unit_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.registrar_unit
    ADD CONSTRAINT registrar_unit_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: room room_building_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_building_fkey FOREIGN KEY (building_id) REFERENCES public.building(id) ON DELETE CASCADE;


--
-- Name: room room_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: room room_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: room room_room_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_room_type_fkey FOREIGN KEY (room_type) REFERENCES public.ref_room_type(id) ON DELETE CASCADE;


--
-- Name: scholarship_application scholarship_application_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_application
    ADD CONSTRAINT scholarship_application_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: scholarship_application_newapplicant scholarship_application_newappl_scholarship_application_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_application_newapplicant
    ADD CONSTRAINT scholarship_application_newappl_scholarship_application_id_fkey FOREIGN KEY (scholarship_application_id) REFERENCES public.scholarship_application(id) ON DELETE CASCADE;


--
-- Name: scholarship_application scholarship_application_scholarship_subtype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_application
    ADD CONSTRAINT scholarship_application_scholarship_subtype_id_fkey FOREIGN KEY (scholarship_subtype_id) REFERENCES public.scholarship_subtype(id) ON DELETE CASCADE;


--
-- Name: scholarship_application scholarship_application_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_application
    ADD CONSTRAINT scholarship_application_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: scholarship_category scholarship_category_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_category
    ADD CONSTRAINT scholarship_category_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship scholarship_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship
    ADD CONSTRAINT scholarship_category_id_fk FOREIGN KEY (scholarship_category_id) REFERENCES public.scholarship_category(id);


--
-- Name: scholarship_category scholarship_category_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_category
    ADD CONSTRAINT scholarship_category_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship scholarship_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship
    ADD CONSTRAINT scholarship_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_grant_template scholarship_grant_template_account_fees_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_grant_template
    ADD CONSTRAINT scholarship_grant_template_account_fees_id_fkey FOREIGN KEY (account_fees_id) REFERENCES public.accounts_fees(id) ON DELETE CASCADE;


--
-- Name: scholarship_grant_template scholarship_grant_template_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_grant_template
    ADD CONSTRAINT scholarship_grant_template_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_grant_template scholarship_grant_template_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_grant_template
    ADD CONSTRAINT scholarship_grant_template_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_grant_template scholarship_grant_template_scholarship_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_grant_template
    ADD CONSTRAINT scholarship_grant_template_scholarship_provider_id_fkey FOREIGN KEY (scholarship_provider_id) REFERENCES public.scholarship_provider(id) ON DELETE CASCADE;


--
-- Name: scholarship scholarship_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship
    ADD CONSTRAINT scholarship_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_provider scholarship_provider_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider
    ADD CONSTRAINT scholarship_provider_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_provider_group scholarship_provider_group_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_group
    ADD CONSTRAINT scholarship_provider_group_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_provider_group scholarship_provider_group_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_group
    ADD CONSTRAINT scholarship_provider_group_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_provider_level scholarship_provider_level_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_level
    ADD CONSTRAINT scholarship_provider_level_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_provider_level scholarship_provider_level_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_level
    ADD CONSTRAINT scholarship_provider_level_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_provider scholarship_provider_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider
    ADD CONSTRAINT scholarship_provider_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_provider_type scholarship_provider_type_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_type
    ADD CONSTRAINT scholarship_provider_type_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_provider_type scholarship_provider_type_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_provider_type
    ADD CONSTRAINT scholarship_provider_type_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship scholarship_scholarship_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship
    ADD CONSTRAINT scholarship_scholarship_provider_id_fkey FOREIGN KEY (scholarship_provider_id) REFERENCES public.scholarship_provider(id) ON DELETE CASCADE;


--
-- Name: scholarship_subtype_billing scholarship_subtype_billing_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype_billing
    ADD CONSTRAINT scholarship_subtype_billing_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_subtype_billing scholarship_subtype_billing_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype_billing
    ADD CONSTRAINT scholarship_subtype_billing_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_subtype_billing scholarship_subtype_billing_scholarship_subtype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype_billing
    ADD CONSTRAINT scholarship_subtype_billing_scholarship_subtype_id_fkey FOREIGN KEY (scholarship_subtype_id) REFERENCES public.scholarship_subtype(id) ON DELETE CASCADE;


--
-- Name: scholarship_subtype scholarship_subtype_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype
    ADD CONSTRAINT scholarship_subtype_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_subtype scholarship_subtype_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype
    ADD CONSTRAINT scholarship_subtype_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_subtype scholarship_subtype_scholarship_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype
    ADD CONSTRAINT scholarship_subtype_scholarship_id_fkey FOREIGN KEY (scholarship_id) REFERENCES public.scholarship(id) ON DELETE CASCADE;


--
-- Name: scholarship_subtype_tfdiscount scholarship_subtype_tfdiscount_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype_tfdiscount
    ADD CONSTRAINT scholarship_subtype_tfdiscount_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_subtype_tfdiscount scholarship_subtype_tfdiscount_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype_tfdiscount
    ADD CONSTRAINT scholarship_subtype_tfdiscount_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_subtype_tfdiscount scholarship_subtype_tfdiscount_scholarship_subtype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_subtype_tfdiscount
    ADD CONSTRAINT scholarship_subtype_tfdiscount_scholarship_subtype_id_fkey FOREIGN KEY (scholarship_subtype_id) REFERENCES public.scholarship_subtype(id) ON DELETE CASCADE;


--
-- Name: scholarship_tagging scholarship_tagging_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_tagging
    ADD CONSTRAINT scholarship_tagging_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: scholarship_tagging scholarship_tagging_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_tagging
    ADD CONSTRAINT scholarship_tagging_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_tagging scholarship_tagging_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_tagging
    ADD CONSTRAINT scholarship_tagging_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_tagging scholarship_tagging_scholarship_subtype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_tagging
    ADD CONSTRAINT scholarship_tagging_scholarship_subtype_id_fkey FOREIGN KEY (scholarship_subtype_id) REFERENCES public.scholarship_subtype(id) ON DELETE CASCADE;


--
-- Name: scholarship_tagging scholarship_tagging_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_tagging
    ADD CONSTRAINT scholarship_tagging_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: scholarship_untag_request scholarship_untag_request_scholarship_tagging_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_untag_request
    ADD CONSTRAINT scholarship_untag_request_scholarship_tagging_id_fkey FOREIGN KEY (scholarship_tagging_id) REFERENCES public.scholarship_tagging(id) ON DELETE CASCADE;


--
-- Name: scholarship_untag_request scholarship_untag_request_untag_confirmed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_untag_request
    ADD CONSTRAINT scholarship_untag_request_untag_confirmed_by_fkey FOREIGN KEY (untag_confirmed_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: scholarship_untag_request scholarship_untag_request_untag_request_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_untag_request
    ADD CONSTRAINT scholarship_untag_request_untag_request_by_fkey FOREIGN KEY (untag_request_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: signatories signatories_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.signatories
    ADD CONSTRAINT signatories_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: signatories signatories_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.signatories
    ADD CONSTRAINT signatories_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student stud_monthly_family_income_id; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT stud_monthly_family_income_id FOREIGN KEY (monthly_family_income_id) REFERENCES public.student_monthly_family_income(id) ON UPDATE CASCADE;


--
-- Name: student student_academic_term_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_academic_term_id_fk FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id);


--
-- Name: student_assessment student_assessment_account_fees_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment
    ADD CONSTRAINT student_assessment_account_fees_id_fkey FOREIGN KEY (account_fees_id) REFERENCES public.accounts_fees(id) ON DELETE CASCADE;


--
-- Name: student_assessment student_assessment_assessment_of_fees_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment
    ADD CONSTRAINT student_assessment_assessment_of_fees_id_fkey FOREIGN KEY (assessment_of_fees_id) REFERENCES public.assessment_of_fees(id) ON DELETE CASCADE;


--
-- Name: student_assessment student_assessment_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment
    ADD CONSTRAINT student_assessment_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student_assessment student_assessment_enrollment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment
    ADD CONSTRAINT student_assessment_enrollment_id_fkey FOREIGN KEY (enrollment_id) REFERENCES public.student_registration(id) ON DELETE CASCADE;


--
-- Name: student_assessment student_assessment_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment
    ADD CONSTRAINT student_assessment_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student_assessment student_assessment_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment
    ADD CONSTRAINT student_assessment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: student_assessment student_assessment_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment
    ADD CONSTRAINT student_assessment_term_id_fkey FOREIGN KEY (term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: student_assessment student_assessment_transaction_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment
    ADD CONSTRAINT student_assessment_transaction_type_id_fkey FOREIGN KEY (transaction_type_id) REFERENCES public.transaction_type(id) ON DELETE CASCADE;


--
-- Name: student_assessment student_assessment_year_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_assessment
    ADD CONSTRAINT student_assessment_year_term_id_fkey FOREIGN KEY (year_term_id) REFERENCES public.ref_year_term(id) ON DELETE CASCADE;


--
-- Name: student student_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: student student_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student student_curriculum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_curriculum_id_fkey FOREIGN KEY (curriculum_id) REFERENCES public.curriculum(id) ON DELETE CASCADE;


--
-- Name: student student_department_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_department_program_id_fkey FOREIGN KEY (department_program_id) REFERENCES public.department_program(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: student_ledger student_ledger_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_ledger
    ADD CONSTRAINT student_ledger_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student_ledger student_ledger_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_ledger
    ADD CONSTRAINT student_ledger_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student_ledger student_ledger_postedby_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_ledger
    ADD CONSTRAINT student_ledger_postedby_id_fkey FOREIGN KEY (postedby_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student_ledger student_ledger_student_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_ledger
    ADD CONSTRAINT student_ledger_student_no_fkey FOREIGN KEY (student_no) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: student_ledger student_ledger_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_ledger
    ADD CONSTRAINT student_ledger_term_id_fkey FOREIGN KEY (term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: student student_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student_monthly_family_income student_monthly_family_income_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_monthly_family_income
    ADD CONSTRAINT student_monthly_family_income_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student_monthly_family_income student_monthly_family_income_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_monthly_family_income
    ADD CONSTRAINT student_monthly_family_income_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student student_new_curriculum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_new_curriculum_id_fkey FOREIGN KEY (new_curriculum_id) REFERENCES public.curriculum(id) ON DELETE CASCADE;


--
-- Name: student_profile student_profile_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_profile
    ADD CONSTRAINT student_profile_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id);


--
-- Name: student_profile student_profile_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_profile
    ADD CONSTRAINT student_profile_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id);


--
-- Name: student_profile student_profile_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_profile
    ADD CONSTRAINT student_profile_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: student student_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id) ON DELETE CASCADE;


--
-- Name: student student_program_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_program_major_id_fkey FOREIGN KEY (program_major_id) REFERENCES public.program_major(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_account_fees_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_account_fees_id_fkey FOREIGN KEY (account_fees_id) REFERENCES public.assessment_of_fees(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_block_id_fkey FOREIGN KEY (block_id) REFERENCES public.block(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_cor_signatory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_cor_signatory_fkey FOREIGN KEY (cor_signatory) REFERENCES public.signatories(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: payment_details student_registration_id; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT student_registration_id FOREIGN KEY (student_registration_id) REFERENCES public.student_registration(id);


--
-- Name: scholarship_tagging student_registration_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.scholarship_tagging
    ADD CONSTRAINT student_registration_id_fkey FOREIGN KEY (student_registration_id) REFERENCES public.student_registration(id);


--
-- Name: student_registration student_registration_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_or_signatory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_or_signatory_fkey FOREIGN KEY (or_signatory) REFERENCES public.signatories(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_student_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_student_no_fkey FOREIGN KEY (student_no) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_term_id_fkey FOREIGN KEY (term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_transaction_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_transaction_type_id_fkey FOREIGN KEY (transaction_type_id) REFERENCES public.transaction_type(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_validated_by; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_validated_by FOREIGN KEY (validated_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: student_registration student_registration_year_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_year_term_id_fkey FOREIGN KEY (year_term_id) REFERENCES public.ref_year_term(id) ON DELETE CASCADE;


--
-- Name: student_userinfo student_userinfo_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student_userinfo
    ADD CONSTRAINT student_userinfo_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: student student_userlogin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_userlogin_id_fkey FOREIGN KEY (userlogin_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: studentuser_event studentuser_event_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_event
    ADD CONSTRAINT studentuser_event_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.student_userinfo(id) ON DELETE CASCADE;


--
-- Name: studentuser_membership studentuser_membership_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_membership
    ADD CONSTRAINT studentuser_membership_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.studentuser_group(id) ON DELETE CASCADE;


--
-- Name: studentuser_membership studentuser_membership_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_membership
    ADD CONSTRAINT studentuser_membership_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.student_userinfo(id) ON DELETE CASCADE;


--
-- Name: studentuser_permission studentuser_permission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.studentuser_permission
    ADD CONSTRAINT studentuser_permission_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.studentuser_group(id) ON DELETE CASCADE;


--
-- Name: subject_list subject_list_academicterm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list
    ADD CONSTRAINT subject_list_academicterm_id_fkey FOREIGN KEY (academicterm_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: subject_list subject_list_course_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list
    ADD CONSTRAINT subject_list_course_schedule_id_fkey FOREIGN KEY (course_schedule_id) REFERENCES public.course_schedule(id) ON DELETE CASCADE;


--
-- Name: subject_list subject_list_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list
    ADD CONSTRAINT subject_list_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: subject_list subject_list_encoded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list
    ADD CONSTRAINT subject_list_encoded_by_fkey FOREIGN KEY (encoded_by) REFERENCES public.employee(id) ON DELETE CASCADE;


--
-- Name: subject_list subject_list_enrollment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list
    ADD CONSTRAINT subject_list_enrollment_id_fkey FOREIGN KEY (enrollment_id) REFERENCES public.student_registration(id) ON DELETE CASCADE;


--
-- Name: subject_list subject_list_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list
    ADD CONSTRAINT subject_list_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: subject_list subject_list_replaced_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list
    ADD CONSTRAINT subject_list_replaced_course_id_fkey FOREIGN KEY (replaced_course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- Name: subject_list subject_list_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list
    ADD CONSTRAINT subject_list_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: subject_list subject_list_year_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.subject_list
    ADD CONSTRAINT subject_list_year_term_id_fkey FOREIGN KEY (year_term_id) REFERENCES public.ref_year_term(id) ON DELETE CASCADE;


--
-- Name: temp_student_curriculum temp_student_curriculum_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.temp_student_curriculum
    ADD CONSTRAINT temp_student_curriculum_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: temp_student_curriculum temp_student_curriculum_curriculum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.temp_student_curriculum
    ADD CONSTRAINT temp_student_curriculum_curriculum_id_fkey FOREIGN KEY (curriculum_id) REFERENCES public.curriculum(id) ON DELETE CASCADE;


--
-- Name: temp_student_curriculum temp_student_curriculum_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.temp_student_curriculum
    ADD CONSTRAINT temp_student_curriculum_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: temp_student_curriculum temp_student_curriculum_student_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.temp_student_curriculum
    ADD CONSTRAINT temp_student_curriculum_student_no_fkey FOREIGN KEY (student_no) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: tmp_account_finance tmp_account_finance_academic_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_account_finance
    ADD CONSTRAINT tmp_account_finance_academic_term_id_fkey FOREIGN KEY (academic_term_id) REFERENCES public.ref_academic_term(id) ON DELETE CASCADE;


--
-- Name: tmp_account_finance tmp_account_finance_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_account_finance
    ADD CONSTRAINT tmp_account_finance_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: tmp_account_finance tmp_account_finance_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_account_finance
    ADD CONSTRAINT tmp_account_finance_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: tmp_account_finance tmp_account_finance_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_account_finance
    ADD CONSTRAINT tmp_account_finance_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: tmp_account_finance tmp_account_finance_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_account_finance
    ADD CONSTRAINT tmp_account_finance_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id) ON DELETE CASCADE;


--
-- Name: tmp_import_students tmp_import_students_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_import_students
    ADD CONSTRAINT tmp_import_students_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: tmp_import_students tmp_import_students_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_import_students
    ADD CONSTRAINT tmp_import_students_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.program(id) ON DELETE CASCADE;


--
-- Name: tmp_import_students tmp_import_students_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_import_students
    ADD CONSTRAINT tmp_import_students_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: tmp_import_students tmp_import_students_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.tmp_import_students
    ADD CONSTRAINT tmp_import_students_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: transaction_logs transaction_logs_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.transaction_logs
    ADD CONSTRAINT transaction_logs_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: transaction_logs transaction_logs_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.transaction_logs
    ADD CONSTRAINT transaction_logs_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: transaction_type transaction_type_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.transaction_type
    ADD CONSTRAINT transaction_type_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: transaction_type transaction_type_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbasevisor
--

ALTER TABLE ONLY public.transaction_type
    ADD CONSTRAINT transaction_type_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

