--
-- PostgreSQL database dump
--

-- Dumped from database version 15.16
-- Dumped by pg_dump version 16.4

-- Started on 2026-03-18 21:47:13 +07

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
-- TOC entry 303 (class 1259 OID 17060)
-- Name: aiContextDatasources; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."aiContextDatasources" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(64) NOT NULL,
    description character varying(512) NOT NULL,
    datasource character varying(128) NOT NULL,
    "collectionName" character varying(128) NOT NULL,
    fields jsonb,
    filter jsonb,
    sort jsonb,
    "limit" integer DEFAULT 1000 NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public."aiContextDatasources" OWNER TO nocobase;

--
-- TOC entry 302 (class 1259 OID 17059)
-- Name: aiContextDatasources_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."aiContextDatasources_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."aiContextDatasources_id_seq" OWNER TO nocobase;

--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 302
-- Name: aiContextDatasources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."aiContextDatasources_id_seq" OWNED BY public."aiContextDatasources".id;


--
-- TOC entry 304 (class 1259 OID 17070)
-- Name: aiConversations; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."aiConversations" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "sessionId" uuid NOT NULL,
    thread integer DEFAULT 0 NOT NULL,
    "topicId" character varying(255),
    "userId" bigint,
    title character varying(255),
    options jsonb,
    "aiEmployeeUsername" character varying(255)
);


ALTER TABLE public."aiConversations" OWNER TO nocobase;

--
-- TOC entry 305 (class 1259 OID 17080)
-- Name: aiEmployees; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."aiEmployees" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    username character varying(255) NOT NULL,
    nickname character varying(255),
    "position" character varying(255),
    avatar character varying(255),
    bio text,
    about text,
    greeting text,
    "chatSettings" jsonb,
    "skillSettings" jsonb,
    "modelSettings" jsonb,
    "dataSourceSettings" jsonb,
    "enableKnowledgeBase" boolean DEFAULT false NOT NULL,
    "knowledgeBasePrompt" text,
    "knowledgeBase" jsonb,
    enabled boolean DEFAULT true NOT NULL,
    "builtIn" boolean DEFAULT false NOT NULL,
    sort bigint
);


ALTER TABLE public."aiEmployees" OWNER TO nocobase;

--
-- TOC entry 308 (class 1259 OID 17099)
-- Name: aiFiles; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."aiFiles" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    filename character varying(255),
    extname character varying(255),
    size integer,
    mimetype character varying(255),
    path text,
    url text,
    preview text,
    "storageId" bigint,
    meta jsonb DEFAULT '{}'::jsonb,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public."aiFiles" OWNER TO nocobase;

--
-- TOC entry 307 (class 1259 OID 17098)
-- Name: aiFiles_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."aiFiles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."aiFiles_id_seq" OWNER TO nocobase;

--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 307
-- Name: aiFiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."aiFiles_id_seq" OWNED BY public."aiFiles".id;


--
-- TOC entry 309 (class 1259 OID 17111)
-- Name: aiMessages; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."aiMessages" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "messageId" bigint NOT NULL,
    role character varying(255),
    content jsonb,
    "toolCalls" jsonb,
    attachments jsonb,
    "workContext" jsonb,
    metadata jsonb,
    "sessionId" uuid
);


ALTER TABLE public."aiMessages" OWNER TO nocobase;

--
-- TOC entry 311 (class 1259 OID 17120)
-- Name: aiSettings; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."aiSettings" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    options jsonb DEFAULT '"{\"storage\":\"local\"}"'::jsonb,
    "defaultLLMService" character varying(255),
    "defaultModel" character varying(255)
);


ALTER TABLE public."aiSettings" OWNER TO nocobase;

--
-- TOC entry 310 (class 1259 OID 17119)
-- Name: aiSettings_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."aiSettings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."aiSettings_id_seq" OWNER TO nocobase;

--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 310
-- Name: aiSettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."aiSettings_id_seq" OWNED BY public."aiSettings".id;


--
-- TOC entry 312 (class 1259 OID 17130)
-- Name: aiToolMessages; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."aiToolMessages" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    id bigint NOT NULL,
    "sessionId" uuid,
    "messageId" bigint,
    "toolCallId" character varying(255),
    "toolName" character varying(255),
    status character varying(255),
    content jsonb,
    "invokeStatus" character varying(255),
    "invokeStartTime" bigint,
    "invokeEndTime" bigint,
    auto boolean,
    execution character varying(255),
    "interruptActionOrder" integer,
    "interruptAction" jsonb,
    "userDecision" jsonb
);


ALTER TABLE public."aiToolMessages" OWNER TO nocobase;

--
-- TOC entry 336 (class 1259 OID 17380)
-- Name: apiKeys; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."apiKeys" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    name character varying(255),
    "roleName" character varying(255),
    "expiresIn" character varying(255),
    token character varying(255),
    sort bigint,
    "createdById" bigint
);


ALTER TABLE public."apiKeys" OWNER TO nocobase;

--
-- TOC entry 335 (class 1259 OID 17379)
-- Name: apiKeys_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."apiKeys_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."apiKeys_id_seq" OWNER TO nocobase;

--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 335
-- Name: apiKeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."apiKeys_id_seq" OWNED BY public."apiKeys".id;


--
-- TOC entry 216 (class 1259 OID 16395)
-- Name: applicationPlugins; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."applicationPlugins" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255),
    "packageName" character varying(255),
    version character varying(255),
    enabled boolean,
    installed boolean,
    "builtIn" boolean,
    options json
);


ALTER TABLE public."applicationPlugins" OWNER TO nocobase;

--
-- TOC entry 215 (class 1259 OID 16394)
-- Name: applicationPlugins_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."applicationPlugins_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."applicationPlugins_id_seq" OWNER TO nocobase;

--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 215
-- Name: applicationPlugins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."applicationPlugins_id_seq" OWNED BY public."applicationPlugins".id;


--
-- TOC entry 218 (class 1259 OID 16408)
-- Name: applicationVersion; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."applicationVersion" (
    id bigint NOT NULL,
    value character varying(255)
);


ALTER TABLE public."applicationVersion" OWNER TO nocobase;

--
-- TOC entry 217 (class 1259 OID 16407)
-- Name: applicationVersion_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."applicationVersion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."applicationVersion_id_seq" OWNER TO nocobase;

--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 217
-- Name: applicationVersion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."applicationVersion_id_seq" OWNED BY public."applicationVersion".id;


--
-- TOC entry 248 (class 1259 OID 16637)
-- Name: asyncTasks; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."asyncTasks" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    id uuid NOT NULL,
    origin character varying(255),
    type character varying(255),
    title character varying(255),
    params jsonb,
    status integer,
    result jsonb,
    cancelable boolean,
    "progressTotal" double precision,
    "progressCurrent" double precision,
    "startedAt" timestamp with time zone,
    "doneAt" timestamp with time zone,
    "createdById" bigint
);


ALTER TABLE public."asyncTasks" OWNER TO nocobase;

--
-- TOC entry 256 (class 1259 OID 16692)
-- Name: attachments; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.attachments (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    filename character varying(255),
    extname character varying(255),
    size integer,
    mimetype character varying(255),
    path text,
    meta jsonb DEFAULT '{}'::jsonb,
    url text,
    "createdById" bigint,
    "updatedById" bigint,
    "storageId" bigint
);


ALTER TABLE public.attachments OWNER TO nocobase;

--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN attachments.title; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.attachments.title IS '用户文件名（不含扩展名）';


--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN attachments.filename; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.attachments.filename IS '系统文件名（含扩展名）';


--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN attachments.extname; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.attachments.extname IS '扩展名（含“.”）';


--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN attachments.size; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.attachments.size IS '文件体积（字节）';


--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN attachments.path; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.attachments.path IS '相对路径（含“/”前缀）';


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN attachments.meta; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.attachments.meta IS '其他文件信息（如图片的宽高）';


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN attachments.url; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.attachments.url IS '网络访问地址';


--
-- TOC entry 255 (class 1259 OID 16691)
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attachments_id_seq OWNER TO nocobase;

--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 255
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- TOC entry 230 (class 1259 OID 16481)
-- Name: authenticators; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.authenticators (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    "authType" character varying(255) NOT NULL,
    title character varying(255),
    description character varying(255) DEFAULT ''::character varying NOT NULL,
    options json DEFAULT '{}'::json NOT NULL,
    enabled boolean DEFAULT false,
    sort bigint,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public.authenticators OWNER TO nocobase;

--
-- TOC entry 229 (class 1259 OID 16480)
-- Name: authenticators_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public.authenticators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authenticators_id_seq OWNER TO nocobase;

--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 229
-- Name: authenticators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public.authenticators_id_seq OWNED BY public.authenticators.id;


--
-- TOC entry 324 (class 1259 OID 17218)
-- Name: blockTemplateLinks; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."blockTemplateLinks" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "templateKey" character varying(255),
    "templateBlockUid" character varying(255),
    "blockUid" character varying(255)
);


ALTER TABLE public."blockTemplateLinks" OWNER TO nocobase;

--
-- TOC entry 323 (class 1259 OID 17217)
-- Name: blockTemplateLinks_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."blockTemplateLinks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."blockTemplateLinks_id_seq" OWNER TO nocobase;

--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 323
-- Name: blockTemplateLinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."blockTemplateLinks_id_seq" OWNED BY public."blockTemplateLinks".id;


--
-- TOC entry 325 (class 1259 OID 17229)
-- Name: blockTemplates; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."blockTemplates" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    title character varying(255),
    description character varying(255),
    type character varying(255) DEFAULT 'Desktop'::character varying,
    uid character varying(255),
    configured boolean DEFAULT false,
    collection character varying(255),
    "dataSource" character varying(255),
    "componentType" character varying(255),
    "menuName" character varying(255)
);


ALTER TABLE public."blockTemplates" OWNER TO nocobase;

--
-- TOC entry 249 (class 1259 OID 16645)
-- Name: collectionCategories; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."collectionCategories" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255),
    color character varying(255) DEFAULT 'default'::character varying,
    sort bigint
);


ALTER TABLE public."collectionCategories" OWNER TO nocobase;

--
-- TOC entry 251 (class 1259 OID 16665)
-- Name: collectionCategory; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."collectionCategory" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "collectionName" character varying(255) NOT NULL,
    "categoryId" bigint NOT NULL
);


ALTER TABLE public."collectionCategory" OWNER TO nocobase;

--
-- TOC entry 250 (class 1259 OID 16653)
-- Name: collections; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.collections (
    key character varying(255) NOT NULL,
    name character varying(255),
    title character varying(255),
    inherit boolean DEFAULT false,
    hidden boolean DEFAULT false,
    options json DEFAULT '{}'::json,
    description character varying(255),
    sort bigint
);


ALTER TABLE public.collections OWNER TO nocobase;

--
-- TOC entry 227 (class 1259 OID 16465)
-- Name: customRequests; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."customRequests" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    options json
);


ALTER TABLE public."customRequests" OWNER TO nocobase;

--
-- TOC entry 228 (class 1259 OID 16472)
-- Name: customRequestsRoles; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."customRequestsRoles" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "customRequestKey" character varying(255) NOT NULL,
    "roleName" character varying(255) NOT NULL
);


ALTER TABLE public."customRequestsRoles" OWNER TO nocobase;

--
-- TOC entry 246 (class 1259 OID 16621)
-- Name: dataSources; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."dataSources" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    "displayName" character varying(255),
    type character varying(255),
    options json,
    enabled boolean DEFAULT true,
    fixed boolean DEFAULT false
);


ALTER TABLE public."dataSources" OWNER TO nocobase;

--
-- TOC entry 240 (class 1259 OID 16562)
-- Name: dataSourcesCollections; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."dataSourcesCollections" (
    key character varying(255) NOT NULL,
    name character varying(255),
    options json,
    "dataSourceKey" character varying(255)
);


ALTER TABLE public."dataSourcesCollections" OWNER TO nocobase;

--
-- TOC entry 241 (class 1259 OID 16571)
-- Name: dataSourcesFields; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."dataSourcesFields" (
    key character varying(255) NOT NULL,
    name character varying(255),
    "collectionName" character varying(255),
    interface character varying(255),
    description character varying(255),
    "uiSchema" json,
    "collectionKey" character varying(255),
    options json DEFAULT '{}'::json,
    "dataSourceKey" character varying(255)
);


ALTER TABLE public."dataSourcesFields" OWNER TO nocobase;

--
-- TOC entry 245 (class 1259 OID 16612)
-- Name: dataSourcesRoles; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."dataSourcesRoles" (
    id character varying(255) NOT NULL,
    "roleName" character varying(255),
    strategy json,
    "dataSourceKey" character varying(255)
);


ALTER TABLE public."dataSourcesRoles" OWNER TO nocobase;

--
-- TOC entry 244 (class 1259 OID 16602)
-- Name: dataSourcesRolesResources; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."dataSourcesRolesResources" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "dataSourceKey" character varying(255) DEFAULT 'main'::character varying,
    "roleName" character varying(255),
    name character varying(255),
    "usingActionsConfig" boolean
);


ALTER TABLE public."dataSourcesRolesResources" OWNER TO nocobase;

--
-- TOC entry 242 (class 1259 OID 16582)
-- Name: dataSourcesRolesResourcesActions; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."dataSourcesRolesResourcesActions" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255),
    fields jsonb DEFAULT '[]'::jsonb,
    "scopeId" bigint,
    "rolesResourceId" bigint
);


ALTER TABLE public."dataSourcesRolesResourcesActions" OWNER TO nocobase;

--
-- TOC entry 243 (class 1259 OID 16593)
-- Name: dataSourcesRolesResourcesScopes; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."dataSourcesRolesResourcesScopes" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255),
    "dataSourceKey" character varying(255) DEFAULT 'main'::character varying,
    name character varying(255),
    "resourceName" character varying(255),
    scope json
);


ALTER TABLE public."dataSourcesRolesResourcesScopes" OWNER TO nocobase;

--
-- TOC entry 237 (class 1259 OID 16542)
-- Name: desktopRoutes; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."desktopRoutes" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "parentId" bigint,
    title character varying(255),
    tooltip character varying(255),
    icon character varying(255),
    "schemaUid" character varying(255),
    "menuSchemaUid" character varying(255),
    "tabSchemaName" character varying(255),
    type character varying(255),
    options json,
    sort bigint,
    "hideInMenu" boolean,
    "enableTabs" boolean,
    "enableHeader" boolean,
    "displayTitle" boolean,
    hidden boolean,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public."desktopRoutes" OWNER TO nocobase;

--
-- TOC entry 247 (class 1259 OID 16630)
-- Name: environmentVariables; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."environmentVariables" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    value text
);


ALTER TABLE public."environmentVariables" OWNER TO nocobase;

--
-- TOC entry 291 (class 1259 OID 16964)
-- Name: executions; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.executions (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255),
    "eventKey" character varying(255),
    context json,
    status integer,
    dispatched boolean DEFAULT false,
    stack json,
    output json,
    manually boolean,
    "workflowId" bigint
);


ALTER TABLE public.executions OWNER TO nocobase;

--
-- TOC entry 334 (class 1259 OID 17322)
-- Name: feature_values; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.feature_values (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    id bigint NOT NULL,
    "createdById" bigint,
    "updatedById" bigint,
    vehicle_object_item_id bigint,
    version bigint,
    index bigint,
    value character varying(255)
);


ALTER TABLE public.feature_values OWNER TO nocobase;

--
-- TOC entry 252 (class 1259 OID 16671)
-- Name: fields; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.fields (
    key character varying(255) NOT NULL,
    name character varying(255),
    type character varying(255),
    interface character varying(255),
    description character varying(255),
    "collectionName" character varying(255),
    "parentKey" character varying(255),
    "reverseKey" character varying(255),
    options json DEFAULT '{}'::json,
    sort bigint
);


ALTER TABLE public.fields OWNER TO nocobase;

--
-- TOC entry 326 (class 1259 OID 17239)
-- Name: flowModelTemplateUsages; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."flowModelTemplateUsages" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    uid character varying(255) NOT NULL,
    "templateUid" character varying(255) NOT NULL,
    "modelUid" character varying(255) NOT NULL
);


ALTER TABLE public."flowModelTemplateUsages" OWNER TO nocobase;

--
-- TOC entry 327 (class 1259 OID 17250)
-- Name: flowModelTemplates; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."flowModelTemplates" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    uid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    "targetUid" character varying(255) NOT NULL,
    "useModel" character varying(255),
    type character varying(255),
    "dataSourceKey" character varying(255),
    "collectionName" character varying(255),
    "associationName" character varying(255),
    "filterByTk" character varying(255),
    "sourceId" character varying(255)
);


ALTER TABLE public."flowModelTemplates" OWNER TO nocobase;

--
-- TOC entry 258 (class 1259 OID 16721)
-- Name: flowModelTreePath; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."flowModelTreePath" (
    ancestor character varying(255) NOT NULL,
    descendant character varying(255) NOT NULL,
    depth integer,
    async boolean,
    type character varying(255),
    sort integer
);


ALTER TABLE public."flowModelTreePath" OWNER TO nocobase;

--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "flowModelTreePath".type; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public."flowModelTreePath".type IS 'type of node';


--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "flowModelTreePath".sort; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public."flowModelTreePath".sort IS 'sort of node in adjacency';


--
-- TOC entry 259 (class 1259 OID 16729)
-- Name: flowModels; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."flowModels" (
    uid character varying(255) NOT NULL,
    name character varying(255),
    options json DEFAULT '{}'::json
);


ALTER TABLE public."flowModels" OWNER TO nocobase;

--
-- TOC entry 261 (class 1259 OID 16738)
-- Name: flowSql; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."flowSql" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    uid character varying(255),
    "dataSourceKey" character varying(255),
    sql text NOT NULL
);


ALTER TABLE public."flowSql" OWNER TO nocobase;

--
-- TOC entry 260 (class 1259 OID 16737)
-- Name: flowSql_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."flowSql_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."flowSql_id_seq" OWNER TO nocobase;

--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 260
-- Name: flowSql_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."flowSql_id_seq" OWNED BY public."flowSql".id;


--
-- TOC entry 292 (class 1259 OID 16976)
-- Name: flow_nodes; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.flow_nodes (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255),
    title character varying(255),
    "upstreamId" bigint,
    "branchIndex" integer,
    "downstreamId" bigint,
    type character varying(255),
    config json DEFAULT '{}'::json,
    "workflowId" bigint
);


ALTER TABLE public.flow_nodes OWNER TO nocobase;

--
-- TOC entry 236 (class 1259 OID 16533)
-- Name: iframeHtml; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."iframeHtml" (
    id character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    html text,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public."iframeHtml" OWNER TO nocobase;

--
-- TOC entry 231 (class 1259 OID 16496)
-- Name: issuedTokens; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."issuedTokens" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    id uuid NOT NULL,
    "signInTime" bigint NOT NULL,
    jti uuid NOT NULL,
    "issuedTime" bigint NOT NULL,
    "userId" bigint NOT NULL
);


ALTER TABLE public."issuedTokens" OWNER TO nocobase;

--
-- TOC entry 293 (class 1259 OID 16987)
-- Name: jobs; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.jobs (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    id bigint NOT NULL,
    "executionId" bigint,
    "nodeId" bigint,
    "nodeKey" character varying(255),
    "upstreamId" bigint,
    status integer,
    result json,
    meta json
);


ALTER TABLE public.jobs OWNER TO nocobase;

--
-- TOC entry 313 (class 1259 OID 17138)
-- Name: lcCheckpointBlobs; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."lcCheckpointBlobs" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "threadId" character varying(128) NOT NULL,
    "checkpointNs" character varying(128) DEFAULT ''::character varying NOT NULL,
    channel character varying(128) NOT NULL,
    version character varying(128) NOT NULL,
    type character varying(128) NOT NULL,
    blob bytea
);


ALTER TABLE public."lcCheckpointBlobs" OWNER TO nocobase;

--
-- TOC entry 314 (class 1259 OID 17146)
-- Name: lcCheckpointWrites; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."lcCheckpointWrites" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "threadId" character varying(128) NOT NULL,
    "checkpointNs" character varying(128) DEFAULT ''::character varying NOT NULL,
    "checkpointId" character varying(128) NOT NULL,
    "taskId" character varying(128) NOT NULL,
    idx integer NOT NULL,
    channel character varying(128) NOT NULL,
    type character varying(128),
    blob bytea NOT NULL
);


ALTER TABLE public."lcCheckpointWrites" OWNER TO nocobase;

--
-- TOC entry 315 (class 1259 OID 17154)
-- Name: lcCheckpoints; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."lcCheckpoints" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "threadId" character varying(128) NOT NULL,
    "checkpointNs" character varying(128) DEFAULT ''::character varying NOT NULL,
    "checkpointId" character varying(128) NOT NULL,
    "parentCheckpointId" character varying(128),
    type character varying(128),
    checkpoint json NOT NULL,
    metadata json DEFAULT '{}'::json NOT NULL
);


ALTER TABLE public."lcCheckpoints" OWNER TO nocobase;

--
-- TOC entry 316 (class 1259 OID 17163)
-- Name: llmServices; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."llmServices" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255),
    provider character varying(255),
    options jsonb,
    "enabledModels" json DEFAULT '{"mode":"recommended","models":[]}'::json,
    enabled boolean DEFAULT true,
    "modelOptions" jsonb DEFAULT '"{\"temperature\":1,\"topP\":1,\"frequencyPenalty\":0,\"presencePenalty\":0}"'::jsonb,
    sort bigint
);


ALTER TABLE public."llmServices" OWNER TO nocobase;

--
-- TOC entry 238 (class 1259 OID 16550)
-- Name: main_desktopRoutes_path; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."main_desktopRoutes_path" (
    "nodePk" bigint,
    path character varying(1024),
    "rootPk" bigint
);


ALTER TABLE public."main_desktopRoutes_path" OWNER TO nocobase;

--
-- TOC entry 263 (class 1259 OID 16756)
-- Name: main_mobileRoutes_path; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."main_mobileRoutes_path" (
    "nodePk" bigint,
    path character varying(1024),
    "rootPk" bigint
);


ALTER TABLE public."main_mobileRoutes_path" OWNER TO nocobase;

--
-- TOC entry 331 (class 1259 OID 17291)
-- Name: main_vehicle_items_path; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.main_vehicle_items_path (
    "nodePk" bigint,
    path character varying(1024),
    "rootPk" bigint
);


ALTER TABLE public.main_vehicle_items_path OWNER TO nocobase;

--
-- TOC entry 329 (class 1259 OID 17279)
-- Name: main_vehicle_objects_path; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.main_vehicle_objects_path (
    "nodePk" bigint,
    path character varying(1024),
    "rootPk" bigint
);


ALTER TABLE public.main_vehicle_objects_path OWNER TO nocobase;

--
-- TOC entry 214 (class 1259 OID 16389)
-- Name: migrations; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.migrations (
    name character varying(255) NOT NULL
);


ALTER TABLE public.migrations OWNER TO nocobase;

--
-- TOC entry 262 (class 1259 OID 16748)
-- Name: mobileRoutes; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."mobileRoutes" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "parentId" bigint,
    title character varying(255),
    icon character varying(255),
    "schemaUid" character varying(255),
    type character varying(255),
    options json,
    sort bigint,
    "hideInMenu" boolean,
    "enableTabs" boolean,
    hidden boolean,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public."mobileRoutes" OWNER TO nocobase;

--
-- TOC entry 318 (class 1259 OID 17183)
-- Name: notificationChannels; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."notificationChannels" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255),
    options json,
    meta json,
    "notificationType" character varying(255),
    description text,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public."notificationChannels" OWNER TO nocobase;

--
-- TOC entry 320 (class 1259 OID 17199)
-- Name: notificationInAppMessages; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."notificationInAppMessages" (
    id uuid NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" bigint,
    "channelName" character varying(255),
    title text,
    content text,
    status character varying(255),
    "receiveTimestamp" bigint,
    options json
);


ALTER TABLE public."notificationInAppMessages" OWNER TO nocobase;

--
-- TOC entry 319 (class 1259 OID 17192)
-- Name: notificationSendLogs; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."notificationSendLogs" (
    id uuid NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "channelName" character varying(255),
    "channelTitle" character varying(255),
    "triggerFrom" character varying(255),
    "notificationType" character varying(255),
    status character varying(255),
    message json,
    reason text
);


ALTER TABLE public."notificationSendLogs" OWNER TO nocobase;

--
-- TOC entry 284 (class 1259 OID 16903)
-- Name: otpRecords; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."otpRecords" (
    id uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    action character varying(255),
    receiver character varying(255),
    status integer DEFAULT 0,
    "expiresAt" bigint,
    code character varying(255),
    "verifierName" character varying(255)
);


ALTER TABLE public."otpRecords" OWNER TO nocobase;

--
-- TOC entry 220 (class 1259 OID 16420)
-- Name: roles; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.roles (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255),
    description character varying(255),
    strategy json,
    "default" boolean DEFAULT false,
    hidden boolean DEFAULT false,
    "allowConfigure" boolean,
    "allowNewMenu" boolean,
    snippets jsonb DEFAULT '["!ui.*", "!pm", "!pm.*"]'::jsonb,
    sort bigint,
    "allowNewMobileMenu" boolean,
    "allowNewAiEmployee" boolean
);


ALTER TABLE public.roles OWNER TO nocobase;

--
-- TOC entry 306 (class 1259 OID 17090)
-- Name: rolesAiEmployees; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."rolesAiEmployees" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "aiEmployee" character varying(255) NOT NULL,
    "roleName" character varying(255) NOT NULL
);


ALTER TABLE public."rolesAiEmployees" OWNER TO nocobase;

--
-- TOC entry 239 (class 1259 OID 16556)
-- Name: rolesDesktopRoutes; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."rolesDesktopRoutes" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "desktopRouteId" bigint NOT NULL,
    "roleName" character varying(255) NOT NULL
);


ALTER TABLE public."rolesDesktopRoutes" OWNER TO nocobase;

--
-- TOC entry 264 (class 1259 OID 16762)
-- Name: rolesMobileRoutes; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."rolesMobileRoutes" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "mobileRouteId" bigint NOT NULL,
    "roleName" character varying(255) NOT NULL
);


ALTER TABLE public."rolesMobileRoutes" OWNER TO nocobase;

--
-- TOC entry 222 (class 1259 OID 16434)
-- Name: rolesResources; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."rolesResources" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "roleName" character varying(255),
    name character varying(255),
    "usingActionsConfig" boolean
);


ALTER TABLE public."rolesResources" OWNER TO nocobase;

--
-- TOC entry 224 (class 1259 OID 16444)
-- Name: rolesResourcesActions; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."rolesResourcesActions" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "rolesResourceId" bigint,
    name character varying(255),
    fields jsonb DEFAULT '[]'::jsonb,
    "scopeId" bigint
);


ALTER TABLE public."rolesResourcesActions" OWNER TO nocobase;

--
-- TOC entry 223 (class 1259 OID 16443)
-- Name: rolesResourcesActions_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."rolesResourcesActions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."rolesResourcesActions_id_seq" OWNER TO nocobase;

--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 223
-- Name: rolesResourcesActions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."rolesResourcesActions_id_seq" OWNED BY public."rolesResourcesActions".id;


--
-- TOC entry 226 (class 1259 OID 16457)
-- Name: rolesResourcesScopes; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."rolesResourcesScopes" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255),
    name character varying(255),
    "resourceName" character varying(255),
    scope json
);


ALTER TABLE public."rolesResourcesScopes" OWNER TO nocobase;

--
-- TOC entry 225 (class 1259 OID 16456)
-- Name: rolesResourcesScopes_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."rolesResourcesScopes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."rolesResourcesScopes_id_seq" OWNER TO nocobase;

--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 225
-- Name: rolesResourcesScopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."rolesResourcesScopes_id_seq" OWNED BY public."rolesResourcesScopes".id;


--
-- TOC entry 221 (class 1259 OID 16433)
-- Name: rolesResources_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."rolesResources_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."rolesResources_id_seq" OWNER TO nocobase;

--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 221
-- Name: rolesResources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."rolesResources_id_seq" OWNED BY public."rolesResources".id;


--
-- TOC entry 273 (class 1259 OID 16827)
-- Name: rolesUischemas; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."rolesUischemas" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "roleName" character varying(255) NOT NULL,
    "uiSchemaXUid" character varying(255) NOT NULL
);


ALTER TABLE public."rolesUischemas" OWNER TO nocobase;

--
-- TOC entry 219 (class 1259 OID 16414)
-- Name: rolesUsers; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."rolesUsers" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "default" boolean,
    "roleName" character varying(255) NOT NULL,
    "userId" bigint NOT NULL
);


ALTER TABLE public."rolesUsers" OWNER TO nocobase;

--
-- TOC entry 254 (class 1259 OID 16683)
-- Name: sequences; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.sequences (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    collection character varying(255),
    field character varying(255),
    key integer,
    current bigint,
    "lastGeneratedAt" timestamp with time zone
);


ALTER TABLE public.sequences OWNER TO nocobase;

--
-- TOC entry 253 (class 1259 OID 16682)
-- Name: sequences_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public.sequences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sequences_id_seq OWNER TO nocobase;

--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 253
-- Name: sequences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public.sequences_id_seq OWNED BY public.sequences.id;


--
-- TOC entry 257 (class 1259 OID 16704)
-- Name: storages; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.storages (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    name character varying(255),
    type character varying(255),
    options jsonb DEFAULT '{}'::jsonb,
    rules jsonb DEFAULT '{}'::jsonb,
    path text DEFAULT ''::text,
    "baseUrl" character varying(255) DEFAULT ''::character varying,
    "renameMode" character varying(255) DEFAULT 'appendRandomID'::character varying,
    "default" boolean DEFAULT false,
    paranoid boolean DEFAULT false,
    settings json DEFAULT '{}'::json
);


ALTER TABLE public.storages OWNER TO nocobase;

--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN storages.title; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.storages.title IS '存储引擎名称';


--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN storages.type; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.storages.type IS '类型标识，如 local/ali-oss 等';


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN storages.options; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.storages.options IS '配置项';


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN storages.rules; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.storages.rules IS '文件规则';


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN storages.path; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.storages.path IS '存储相对路径模板';


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN storages."baseUrl"; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.storages."baseUrl" IS '访问地址前缀';


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN storages."renameMode"; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.storages."renameMode" IS '重命名模式';


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN storages."default"; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public.storages."default" IS '默认引擎';


--
-- TOC entry 266 (class 1259 OID 16769)
-- Name: systemSettings; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."systemSettings" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    "showLogoOnly" boolean,
    "allowSignUp" boolean DEFAULT true,
    "smsAuthEnabled" boolean DEFAULT false,
    "logoId" bigint,
    "enabledLanguages" json DEFAULT '[]'::json,
    "appLang" character varying(255),
    options json DEFAULT '{}'::json,
    "roleMode" character varying(255) DEFAULT 'default'::character varying,
    "enableEditProfile" boolean,
    "enableChangePassword" boolean
);


ALTER TABLE public."systemSettings" OWNER TO nocobase;

--
-- TOC entry 265 (class 1259 OID 16768)
-- Name: systemSettings_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."systemSettings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."systemSettings_id_seq" OWNER TO nocobase;

--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 265
-- Name: systemSettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."systemSettings_id_seq" OWNED BY public."systemSettings".id;


--
-- TOC entry 333 (class 1259 OID 17302)
-- Name: t_d6ursut4ws9; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.t_d6ursut4ws9 (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    f_b0ayz6z0chw bigint NOT NULL,
    f_qahz3h30s16 bigint NOT NULL
);


ALTER TABLE public.t_d6ursut4ws9 OWNER TO nocobase;

--
-- TOC entry 322 (class 1259 OID 17208)
-- Name: themeConfig; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."themeConfig" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    config json,
    optional boolean,
    "isBuiltIn" boolean,
    uid character varying(255),
    "default" boolean DEFAULT false
);


ALTER TABLE public."themeConfig" OWNER TO nocobase;

--
-- TOC entry 321 (class 1259 OID 17207)
-- Name: themeConfig_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."themeConfig_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."themeConfig_id_seq" OWNER TO nocobase;

--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 321
-- Name: themeConfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."themeConfig_id_seq" OWNED BY public."themeConfig".id;


--
-- TOC entry 233 (class 1259 OID 16503)
-- Name: tokenBlacklist; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."tokenBlacklist" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    token character varying(255),
    expiration timestamp with time zone
);


ALTER TABLE public."tokenBlacklist" OWNER TO nocobase;

--
-- TOC entry 232 (class 1259 OID 16502)
-- Name: tokenBlacklist_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."tokenBlacklist_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."tokenBlacklist_id_seq" OWNER TO nocobase;

--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 232
-- Name: tokenBlacklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."tokenBlacklist_id_seq" OWNED BY public."tokenBlacklist".id;


--
-- TOC entry 234 (class 1259 OID 16510)
-- Name: tokenControlConfig; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."tokenControlConfig" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    config json DEFAULT '{}'::json NOT NULL,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public."tokenControlConfig" OWNER TO nocobase;

--
-- TOC entry 267 (class 1259 OID 16784)
-- Name: uiButtonSchemasRoles; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."uiButtonSchemasRoles" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    uid character varying(255),
    "roleName" character varying(255)
);


ALTER TABLE public."uiButtonSchemasRoles" OWNER TO nocobase;

--
-- TOC entry 269 (class 1259 OID 16794)
-- Name: uiSchemaServerHooks; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."uiSchemaServerHooks" (
    id bigint NOT NULL,
    type character varying(255),
    collection character varying(255),
    field character varying(255),
    method character varying(255),
    params json,
    uid character varying(255)
);


ALTER TABLE public."uiSchemaServerHooks" OWNER TO nocobase;

--
-- TOC entry 268 (class 1259 OID 16793)
-- Name: uiSchemaServerHooks_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."uiSchemaServerHooks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."uiSchemaServerHooks_id_seq" OWNER TO nocobase;

--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 268
-- Name: uiSchemaServerHooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."uiSchemaServerHooks_id_seq" OWNED BY public."uiSchemaServerHooks".id;


--
-- TOC entry 270 (class 1259 OID 16803)
-- Name: uiSchemaTemplates; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."uiSchemaTemplates" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    name character varying(255),
    "componentName" character varying(255),
    "associationName" character varying(255),
    "resourceName" character varying(255),
    "collectionName" character varying(255),
    "dataSourceKey" character varying(255),
    uid character varying(255)
);


ALTER TABLE public."uiSchemaTemplates" OWNER TO nocobase;

--
-- TOC entry 271 (class 1259 OID 16811)
-- Name: uiSchemaTreePath; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."uiSchemaTreePath" (
    ancestor character varying(255) NOT NULL,
    descendant character varying(255) NOT NULL,
    depth integer,
    async boolean,
    type character varying(255),
    sort integer
);


ALTER TABLE public."uiSchemaTreePath" OWNER TO nocobase;

--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN "uiSchemaTreePath".type; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public."uiSchemaTreePath".type IS 'type of node';


--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN "uiSchemaTreePath".sort; Type: COMMENT; Schema: public; Owner: nocobase
--

COMMENT ON COLUMN public."uiSchemaTreePath".sort IS 'sort of node in adjacency';


--
-- TOC entry 272 (class 1259 OID 16819)
-- Name: uiSchemas; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."uiSchemas" (
    "x-uid" character varying(255) NOT NULL,
    name character varying(255),
    schema json DEFAULT '{}'::json
);


ALTER TABLE public."uiSchemas" OWNER TO nocobase;

--
-- TOC entry 277 (class 1259 OID 16846)
-- Name: userDataSyncRecords; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."userDataSyncRecords" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "sourceName" character varying(255) NOT NULL,
    "sourceUk" character varying(255) NOT NULL,
    "dataType" character varying(255) NOT NULL,
    "metaData" json,
    "lastMetaData" json
);


ALTER TABLE public."userDataSyncRecords" OWNER TO nocobase;

--
-- TOC entry 275 (class 1259 OID 16836)
-- Name: userDataSyncRecordsResources; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."userDataSyncRecordsResources" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "recordId" bigint,
    resource character varying(255) NOT NULL,
    "resourcePk" character varying(255)
);


ALTER TABLE public."userDataSyncRecordsResources" OWNER TO nocobase;

--
-- TOC entry 274 (class 1259 OID 16835)
-- Name: userDataSyncRecordsResources_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."userDataSyncRecordsResources_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."userDataSyncRecordsResources_id_seq" OWNER TO nocobase;

--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 274
-- Name: userDataSyncRecordsResources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."userDataSyncRecordsResources_id_seq" OWNED BY public."userDataSyncRecordsResources".id;


--
-- TOC entry 276 (class 1259 OID 16845)
-- Name: userDataSyncRecords_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."userDataSyncRecords_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."userDataSyncRecords_id_seq" OWNER TO nocobase;

--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 276
-- Name: userDataSyncRecords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."userDataSyncRecords_id_seq" OWNED BY public."userDataSyncRecords".id;


--
-- TOC entry 279 (class 1259 OID 16855)
-- Name: userDataSyncSources; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."userDataSyncSources" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    "sourceType" character varying(255) NOT NULL,
    "displayName" character varying(255),
    enabled boolean DEFAULT false,
    options json DEFAULT '{}'::json NOT NULL,
    sort bigint,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public."userDataSyncSources" OWNER TO nocobase;

--
-- TOC entry 278 (class 1259 OID 16854)
-- Name: userDataSyncSources_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."userDataSyncSources_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."userDataSyncSources_id_seq" OWNER TO nocobase;

--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 278
-- Name: userDataSyncSources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."userDataSyncSources_id_seq" OWNED BY public."userDataSyncSources".id;


--
-- TOC entry 281 (class 1259 OID 16870)
-- Name: userDataSyncTasks; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."userDataSyncTasks" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    batch character varying(255) NOT NULL,
    "sourceId" bigint,
    status character varying(255) NOT NULL,
    message character varying(255),
    cost integer,
    sort bigint,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public."userDataSyncTasks" OWNER TO nocobase;

--
-- TOC entry 280 (class 1259 OID 16869)
-- Name: userDataSyncTasks_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."userDataSyncTasks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."userDataSyncTasks_id_seq" OWNER TO nocobase;

--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 280
-- Name: userDataSyncTasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."userDataSyncTasks_id_seq" OWNED BY public."userDataSyncTasks".id;


--
-- TOC entry 294 (class 1259 OID 16997)
-- Name: userWorkflowTasks; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."userWorkflowTasks" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" bigint,
    type character varying(255),
    stats json DEFAULT '{}'::json
);


ALTER TABLE public."userWorkflowTasks" OWNER TO nocobase;

--
-- TOC entry 283 (class 1259 OID 16884)
-- Name: users; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    nickname character varying(255),
    username character varying(255),
    email character varying(255),
    phone character varying(255),
    password character varying(255),
    "passwordChangeTz" bigint,
    "appLang" character varying(255),
    "resetToken" character varying(255),
    "systemSettings" json DEFAULT '{}'::json,
    sort bigint,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public.users OWNER TO nocobase;

--
-- TOC entry 317 (class 1259 OID 17174)
-- Name: usersAiEmployees; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."usersAiEmployees" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    sort bigint,
    prompt text,
    "aiEmployee" character varying(255) NOT NULL,
    "userId" bigint NOT NULL
);


ALTER TABLE public."usersAiEmployees" OWNER TO nocobase;

--
-- TOC entry 235 (class 1259 OID 16520)
-- Name: usersAuthenticators; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."usersAuthenticators" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    uuid character varying(255) NOT NULL,
    nickname character varying(255) DEFAULT ''::character varying NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    meta json DEFAULT '{}'::json,
    "createdById" bigint,
    "updatedById" bigint,
    authenticator character varying(255) NOT NULL,
    "userId" bigint NOT NULL
);


ALTER TABLE public."usersAuthenticators" OWNER TO nocobase;

--
-- TOC entry 285 (class 1259 OID 16912)
-- Name: usersVerificators; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."usersVerificators" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    uuid character varying(255) NOT NULL,
    meta json DEFAULT '{}'::json,
    "createdById" bigint,
    "updatedById" bigint,
    verificator character varying(255) NOT NULL,
    "userId" bigint NOT NULL
);


ALTER TABLE public."usersVerificators" OWNER TO nocobase;

--
-- TOC entry 286 (class 1259 OID 16923)
-- Name: usersVerifiers; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."usersVerifiers" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    uuid character varying(255) NOT NULL,
    meta json DEFAULT '{}'::json,
    "createdById" bigint,
    "updatedById" bigint,
    verifier character varying(255) NOT NULL,
    "userId" bigint NOT NULL
);


ALTER TABLE public."usersVerifiers" OWNER TO nocobase;

--
-- TOC entry 282 (class 1259 OID 16883)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO nocobase;

--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 282
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 330 (class 1259 OID 17285)
-- Name: vehicle_items; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.vehicle_items (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "parentId" bigint,
    id bigint NOT NULL,
    "createdById" bigint,
    "updatedById" bigint,
    name character varying(255),
    category character varying(255),
    header character varying(255)
);


ALTER TABLE public.vehicle_items OWNER TO nocobase;

--
-- TOC entry 328 (class 1259 OID 17273)
-- Name: vehicle_objects; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.vehicle_objects (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "parentId" bigint,
    id bigint NOT NULL,
    "createdById" bigint,
    "updatedById" bigint,
    name character varying(255)
);


ALTER TABLE public.vehicle_objects OWNER TO nocobase;

--
-- TOC entry 332 (class 1259 OID 17297)
-- Name: vehicle_objects_items; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.vehicle_objects_items (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    id bigint NOT NULL,
    "createdById" bigint,
    "updatedById" bigint,
    vehicle_object_id bigint,
    vehicle_item_id bigint
);


ALTER TABLE public.vehicle_objects_items OWNER TO nocobase;

--
-- TOC entry 337 (class 1259 OID 17390)
-- Name: vehicle_test_values; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.vehicle_test_values (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    id bigint NOT NULL,
    "createdById" bigint,
    "updatedById" bigint,
    vehicle_object_item_id bigint,
    version bigint,
    index bigint,
    value character varying(255)
);


ALTER TABLE public.vehicle_test_values OWNER TO nocobase;

--
-- TOC entry 287 (class 1259 OID 16934)
-- Name: verifications; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.verifications (
    id uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    type character varying(255),
    receiver character varying(255),
    status integer DEFAULT 0,
    "expiresAt" timestamp with time zone,
    content character varying(255),
    "providerId" character varying(255)
);


ALTER TABLE public.verifications OWNER TO nocobase;

--
-- TOC entry 288 (class 1259 OID 16943)
-- Name: verifications_providers; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.verifications_providers (
    id character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    type character varying(255),
    options jsonb,
    "default" boolean
);


ALTER TABLE public.verifications_providers OWNER TO nocobase;

--
-- TOC entry 289 (class 1259 OID 16950)
-- Name: verificators; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.verificators (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255),
    "verificationType" character varying(255),
    description character varying(255),
    options jsonb
);


ALTER TABLE public.verificators OWNER TO nocobase;

--
-- TOC entry 290 (class 1259 OID 16957)
-- Name: verifiers; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.verifiers (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255),
    "verificationType" character varying(255),
    description character varying(255),
    options jsonb
);


ALTER TABLE public.verifiers OWNER TO nocobase;

--
-- TOC entry 295 (class 1259 OID 17006)
-- Name: workflowCategories; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."workflowCategories" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    color character varying(255) DEFAULT 'default'::character varying,
    sort bigint
);


ALTER TABLE public."workflowCategories" OWNER TO nocobase;

--
-- TOC entry 296 (class 1259 OID 17014)
-- Name: workflowCategoryRelations; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."workflowCategoryRelations" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "workflowCategoryId" bigint,
    "workflowId" bigint NOT NULL,
    "categoryId" bigint NOT NULL
);


ALTER TABLE public."workflowCategoryRelations" OWNER TO nocobase;

--
-- TOC entry 297 (class 1259 OID 17021)
-- Name: workflowStats; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."workflowStats" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    executed bigint DEFAULT 0
);


ALTER TABLE public."workflowStats" OWNER TO nocobase;

--
-- TOC entry 299 (class 1259 OID 17028)
-- Name: workflowTasks; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."workflowTasks" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" bigint,
    type character varying(255),
    key character varying(255),
    "workflowId" bigint
);


ALTER TABLE public."workflowTasks" OWNER TO nocobase;

--
-- TOC entry 298 (class 1259 OID 17027)
-- Name: workflowTasks_id_seq; Type: SEQUENCE; Schema: public; Owner: nocobase
--

CREATE SEQUENCE public."workflowTasks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."workflowTasks_id_seq" OWNER TO nocobase;

--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 298
-- Name: workflowTasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nocobase
--

ALTER SEQUENCE public."workflowTasks_id_seq" OWNED BY public."workflowTasks".id;


--
-- TOC entry 300 (class 1259 OID 17039)
-- Name: workflowVersionStats; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public."workflowVersionStats" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    id bigint NOT NULL,
    executed bigint DEFAULT 0
);


ALTER TABLE public."workflowVersionStats" OWNER TO nocobase;

--
-- TOC entry 301 (class 1259 OID 17045)
-- Name: workflows; Type: TABLE; Schema: public; Owner: nocobase
--

CREATE TABLE public.workflows (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255),
    title character varying(255),
    enabled boolean DEFAULT false,
    description text,
    type character varying(255),
    "triggerTitle" character varying(255),
    config jsonb DEFAULT '{}'::jsonb,
    executed integer DEFAULT 0,
    "allExecuted" integer DEFAULT 0,
    current boolean,
    sync boolean DEFAULT false,
    options jsonb DEFAULT '{}'::jsonb
);


ALTER TABLE public.workflows OWNER TO nocobase;

--
-- TOC entry 3754 (class 2604 OID 17063)
-- Name: aiContextDatasources id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."aiContextDatasources" ALTER COLUMN id SET DEFAULT nextval('public."aiContextDatasources_id_seq"'::regclass);


--
-- TOC entry 3761 (class 2604 OID 17102)
-- Name: aiFiles id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."aiFiles" ALTER COLUMN id SET DEFAULT nextval('public."aiFiles_id_seq"'::regclass);


--
-- TOC entry 3763 (class 2604 OID 17123)
-- Name: aiSettings id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."aiSettings" ALTER COLUMN id SET DEFAULT nextval('public."aiSettings_id_seq"'::regclass);


--
-- TOC entry 3777 (class 2604 OID 17383)
-- Name: apiKeys id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."apiKeys" ALTER COLUMN id SET DEFAULT nextval('public."apiKeys_id_seq"'::regclass);


--
-- TOC entry 3679 (class 2604 OID 16398)
-- Name: applicationPlugins id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."applicationPlugins" ALTER COLUMN id SET DEFAULT nextval('public."applicationPlugins_id_seq"'::regclass);


--
-- TOC entry 3680 (class 2604 OID 16411)
-- Name: applicationVersion id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."applicationVersion" ALTER COLUMN id SET DEFAULT nextval('public."applicationVersion_id_seq"'::regclass);


--
-- TOC entry 3709 (class 2604 OID 16695)
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- TOC entry 3688 (class 2604 OID 16484)
-- Name: authenticators id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.authenticators ALTER COLUMN id SET DEFAULT nextval('public.authenticators_id_seq'::regclass);


--
-- TOC entry 3774 (class 2604 OID 17221)
-- Name: blockTemplateLinks id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."blockTemplateLinks" ALTER COLUMN id SET DEFAULT nextval('public."blockTemplateLinks_id_seq"'::regclass);


--
-- TOC entry 3720 (class 2604 OID 16741)
-- Name: flowSql id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."flowSql" ALTER COLUMN id SET DEFAULT nextval('public."flowSql_id_seq"'::regclass);


--
-- TOC entry 3684 (class 2604 OID 16437)
-- Name: rolesResources id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesResources" ALTER COLUMN id SET DEFAULT nextval('public."rolesResources_id_seq"'::regclass);


--
-- TOC entry 3685 (class 2604 OID 16447)
-- Name: rolesResourcesActions id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesResourcesActions" ALTER COLUMN id SET DEFAULT nextval('public."rolesResourcesActions_id_seq"'::regclass);


--
-- TOC entry 3687 (class 2604 OID 16460)
-- Name: rolesResourcesScopes id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesResourcesScopes" ALTER COLUMN id SET DEFAULT nextval('public."rolesResourcesScopes_id_seq"'::regclass);


--
-- TOC entry 3708 (class 2604 OID 16686)
-- Name: sequences id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.sequences ALTER COLUMN id SET DEFAULT nextval('public.sequences_id_seq'::regclass);


--
-- TOC entry 3721 (class 2604 OID 16772)
-- Name: systemSettings id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."systemSettings" ALTER COLUMN id SET DEFAULT nextval('public."systemSettings_id_seq"'::regclass);


--
-- TOC entry 3772 (class 2604 OID 17211)
-- Name: themeConfig id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."themeConfig" ALTER COLUMN id SET DEFAULT nextval('public."themeConfig_id_seq"'::regclass);


--
-- TOC entry 3692 (class 2604 OID 16506)
-- Name: tokenBlacklist id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."tokenBlacklist" ALTER COLUMN id SET DEFAULT nextval('public."tokenBlacklist_id_seq"'::regclass);


--
-- TOC entry 3727 (class 2604 OID 16797)
-- Name: uiSchemaServerHooks id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."uiSchemaServerHooks" ALTER COLUMN id SET DEFAULT nextval('public."uiSchemaServerHooks_id_seq"'::regclass);


--
-- TOC entry 3730 (class 2604 OID 16849)
-- Name: userDataSyncRecords id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userDataSyncRecords" ALTER COLUMN id SET DEFAULT nextval('public."userDataSyncRecords_id_seq"'::regclass);


--
-- TOC entry 3729 (class 2604 OID 16839)
-- Name: userDataSyncRecordsResources id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userDataSyncRecordsResources" ALTER COLUMN id SET DEFAULT nextval('public."userDataSyncRecordsResources_id_seq"'::regclass);


--
-- TOC entry 3731 (class 2604 OID 16858)
-- Name: userDataSyncSources id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userDataSyncSources" ALTER COLUMN id SET DEFAULT nextval('public."userDataSyncSources_id_seq"'::regclass);


--
-- TOC entry 3734 (class 2604 OID 16873)
-- Name: userDataSyncTasks id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userDataSyncTasks" ALTER COLUMN id SET DEFAULT nextval('public."userDataSyncTasks_id_seq"'::regclass);


--
-- TOC entry 3735 (class 2604 OID 16887)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3746 (class 2604 OID 17031)
-- Name: workflowTasks id; Type: DEFAULT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."workflowTasks" ALTER COLUMN id SET DEFAULT nextval('public."workflowTasks_id_seq"'::regclass);


--
-- TOC entry 4350 (class 0 OID 17060)
-- Dependencies: 303
-- Data for Name: aiContextDatasources; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."aiContextDatasources" (id, "createdAt", "updatedAt", title, description, datasource, "collectionName", fields, filter, sort, "limit", enabled) FROM stdin;
\.


--
-- TOC entry 4351 (class 0 OID 17070)
-- Dependencies: 304
-- Data for Name: aiConversations; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."aiConversations" ("createdAt", "updatedAt", "sessionId", thread, "topicId", "userId", title, options, "aiEmployeeUsername") FROM stdin;
\.


--
-- TOC entry 4352 (class 0 OID 17080)
-- Dependencies: 305
-- Data for Name: aiEmployees; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."aiEmployees" ("createdAt", "updatedAt", username, nickname, "position", avatar, bio, about, greeting, "chatSettings", "skillSettings", "modelSettings", "dataSourceSettings", "enableKnowledgeBase", "knowledgeBasePrompt", "knowledgeBase", enabled, "builtIn", sort) FROM stdin;
2026-02-24 15:08:52.157+00	2026-02-24 15:08:52.157+00	orin	Orin	Data modeling expert	nocobase-055-male	A data modeling expert who helps translate business scenarios into normalized database schemas with table declarations and relationship diagrams.	\N	Hi, I’m Orin. Tell me about your business scenario, and I’ll help you model the database step by step.	\N	{"skills": [{"name": "intentRouter", "autoCall": true}, {"name": "getDataSources", "autoCall": true}, {"name": "getCollectionNames", "autoCall": true}, {"name": "getCollectionMetadata", "autoCall": true}, {"name": "defineCollections", "autoCall": false}]}	\N	\N	f	From knowledge base:\n{knowledgeBaseData}\nanswer user's question using this information.	{"topK": 3, "score": "0.6", "knowledgeBaseIds": []}	t	t	1
2026-02-24 15:08:52.162+00	2026-02-24 15:08:52.162+00	nathan	Nathan	Frontend code engineer	nocobase-002-male	An frontend engineer specializing in JavaScript, HTML, and CSS.	\N	Hello, I’m Nathan, your frontend code engineer. I’ll generate high-quality JavaScript / HTML / CSS code for you. What would you like me to build today?	\N	{"skills": [{"name": "getDataSources", "autoCall": true}, {"name": "getCollectionNames", "autoCall": true}, {"name": "getCollectionMetadata", "autoCall": true}, {"name": "listCodeSnippet", "autoCall": true}, {"name": "getCodeSnippet", "autoCall": true}, {"name": "getContextApis", "autoCall": true}, {"name": "getContextEnvs", "autoCall": true}, {"name": "getContextVars", "autoCall": true}, {"name": "lintAndTestJS", "autoCall": true}, {"name": "searchFieldMetadata", "autoCall": true}, {"name": "searchDocs", "autoCall": true}, {"name": "readDocEntry", "autoCall": true}]}	\N	\N	f	From knowledge base:\n{knowledgeBaseData}\nanswer user's question using this information.	{"topK": 3, "score": "0.6", "knowledgeBaseIds": []}	t	t	2
2026-02-24 15:08:52.166+00	2026-02-24 15:08:52.166+00	dex	Dex	Data organizer	nocobase-015-male	I extract and structure data from text, and can fill forms automatically.	\N	Hi! Send me text and I'll structure it into organized data or fill forms.	\N	{"skills": [{"name": "getDataSources", "autoCall": true}, {"name": "getCollectionNames", "autoCall": true}, {"name": "getCollectionMetadata", "autoCall": true}]}	\N	\N	f	From knowledge base:\n{knowledgeBaseData}\nanswer user's question using this information.	{"topK": 3, "score": "0.6", "knowledgeBaseIds": []}	t	t	3
2026-02-24 15:08:52.17+00	2026-02-24 15:08:52.17+00	viz	Viz	Insights analyst	nocobase-010-male	I'm Viz, your insights analyst. I find the stories in your data and bring them to life with clear charts and easy-to-understand explanations.	\N	Hi, I'm Viz. Ask me a question about your data, and I'll help you see the story behind the numbers.	\N	{"skills": [{"name": "getDataSources", "autoCall": true}, {"name": "getCollectionNames", "autoCall": true}, {"name": "getCollectionMetadata", "autoCall": true}]}	\N	\N	f	From knowledge base:\n{knowledgeBaseData}\nanswer user's question using this information.	{"topK": 3, "score": "0.6", "knowledgeBaseIds": []}	t	t	4
2026-02-24 15:08:52.173+00	2026-02-24 15:08:52.173+00	vera	Vera	Research analyst	nocobase-027-female	I'm Vera, your research analyst. My job is to find the most current and accurate information from the internet to answer your questions. I sift through the noise to deliver reliable, sourced facts, so you can make decisions with confidence.	\N	Hi, I'm Vera. What information can I help you find and verify today?	\N	{"skills": [{"name": "getDataSources", "autoCall": true}, {"name": "getCollectionNames", "autoCall": true}, {"name": "getCollectionMetadata", "autoCall": true}]}	\N	\N	f	From knowledge base:\n{knowledgeBaseData}\nanswer user's question using this information.	{"topK": 3, "score": "0.6", "knowledgeBaseIds": []}	t	t	5
2026-02-24 15:08:52.176+00	2026-02-24 15:08:52.176+00	lexi	Lexi	Translator	nocobase-051-female	I'm Lexi. I bridge communication gaps by providing fast and accurate translations so you can understand others and they can understand you.	\N	Hello, I'm Lexi. What can I translate for you today?	\N	{"skills": [{"name": "frontend-formFiller", "autoCall": true}, {"name": "getDataSources", "autoCall": true}, {"name": "getCollectionNames", "autoCall": true}, {"name": "getCollectionMetadata", "autoCall": true}]}	\N	\N	f	From knowledge base:\n{knowledgeBaseData}\nanswer user's question using this information.	{"topK": 3, "score": "0.6", "knowledgeBaseIds": []}	t	t	6
2026-02-24 15:08:52.18+00	2026-02-24 15:08:52.18+00	cole	Cole	NocoBase expert	nocobase-036-female	I'm Cole, your NocoBase expert. I provide clear analysis and step-by-step guidance on using NocoBase, based on the official knowledge base.	\N	Hello, I'm Cole. I have access to the NocoBase knowledge base. Ask me anything about setting up or using the platform.	\N	{"skills": []}	\N	\N	f	From knowledge base:\n{knowledgeBaseData}\nanswer user's question using this information.	{"topK": 3, "score": "0.6", "knowledgeBaseIds": []}	t	t	7
2026-02-24 15:08:52.184+00	2026-02-24 15:08:52.184+00	ellis	Ellis	Email expert	nocobase-057-female	I organize, summarize, and draft professional emails by combining history, customer identity, and the current message.	\N	Hi, I’m Ellis. Share an email or thread, and I’ll pull the context, summarize clearly, and help you craft the right reply.	\N	{"skills": []}	\N	\N	f	From knowledge base:\n{knowledgeBaseData}\nanswer user's question using this information.	{"topK": 3, "score": "0.6", "knowledgeBaseIds": []}	t	t	8
2026-02-24 15:08:52.187+00	2026-02-24 15:08:52.187+00	dara	Dara	Data visualization specialist	nocobase-048-female	I'm Dara, a data visualization expert who transforms complex data into clear and engaging charts that make insights instantly visible.	\N	Hi, I’m Dara. Ask me about your data — I’ll visualize the answer.	\N	{"skills": [{"name": "viz-switchModes", "autoCall": true}, {"name": "viz-runQuery", "autoCall": true}, {"name": "getDataSources", "autoCall": true}, {"name": "getCollectionNames", "autoCall": true}, {"name": "getCollectionMetadata", "autoCall": true}]}	\N	\N	f	From knowledge base:\n{knowledgeBaseData}\nanswer user's question using this information.	{"topK": 3, "score": "0.6", "knowledgeBaseIds": []}	t	t	9
\.


--
-- TOC entry 4355 (class 0 OID 17099)
-- Dependencies: 308
-- Data for Name: aiFiles; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."aiFiles" (id, "createdAt", "updatedAt", title, filename, extname, size, mimetype, path, url, preview, "storageId", meta, "createdById", "updatedById") FROM stdin;
\.


--
-- TOC entry 4356 (class 0 OID 17111)
-- Dependencies: 309
-- Data for Name: aiMessages; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."aiMessages" ("createdAt", "updatedAt", "messageId", role, content, "toolCalls", attachments, "workContext", metadata, "sessionId") FROM stdin;
\.


--
-- TOC entry 4358 (class 0 OID 17120)
-- Dependencies: 311
-- Data for Name: aiSettings; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."aiSettings" (id, "createdAt", "updatedAt", options, "defaultLLMService", "defaultModel") FROM stdin;
1	2026-02-24 15:08:52.156+00	2026-02-24 15:08:52.156+00	{"storage": "local"}	\N	\N
\.


--
-- TOC entry 4359 (class 0 OID 17130)
-- Dependencies: 312
-- Data for Name: aiToolMessages; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."aiToolMessages" ("createdAt", "updatedAt", id, "sessionId", "messageId", "toolCallId", "toolName", status, content, "invokeStatus", "invokeStartTime", "invokeEndTime", auto, execution, "interruptActionOrder", "interruptAction", "userDecision") FROM stdin;
\.


--
-- TOC entry 4383 (class 0 OID 17380)
-- Dependencies: 336
-- Data for Name: apiKeys; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."apiKeys" (id, "createdAt", name, "roleName", "expiresIn", token, sort, "createdById") FROM stdin;
\.


--
-- TOC entry 4263 (class 0 OID 16395)
-- Dependencies: 216
-- Data for Name: applicationPlugins; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."applicationPlugins" (id, "createdAt", "updatedAt", name, "packageName", version, enabled, installed, "builtIn", options) FROM stdin;
59	2026-02-25 13:15:37.514+00	2026-03-01 15:14:18.524+00	object-item-block	object-item-block	2.0.2	t	t	\N	\N
61	2026-03-01 15:17:43.695+00	2026-03-01 15:17:43.695+00	api-doc	@nocobase/plugin-api-doc	2.0.2	t	t	\N	\N
1	2026-02-24 15:08:49.489+00	2026-02-24 15:08:52.197+00	acl	@nocobase/plugin-acl	2.0.2	t	t	t	\N
2	2026-02-24 15:08:49.493+00	2026-02-24 15:08:52.198+00	action-bulk-edit	@nocobase/plugin-action-bulk-edit	2.0.2	t	t	t	\N
3	2026-02-24 15:08:49.495+00	2026-02-24 15:08:52.199+00	action-bulk-update	@nocobase/plugin-action-bulk-update	2.0.2	t	t	t	\N
4	2026-02-24 15:08:49.497+00	2026-02-24 15:08:52.2+00	action-custom-request	@nocobase/plugin-action-custom-request	2.0.2	t	t	t	\N
5	2026-02-24 15:08:49.498+00	2026-02-24 15:08:52.2+00	action-duplicate	@nocobase/plugin-action-duplicate	2.0.2	t	t	t	\N
6	2026-02-24 15:08:49.5+00	2026-02-24 15:08:52.201+00	action-export	@nocobase/plugin-action-export	2.0.2	t	t	t	\N
7	2026-02-24 15:08:49.501+00	2026-02-24 15:08:52.201+00	action-import	@nocobase/plugin-action-import	2.0.2	t	t	t	\N
8	2026-02-24 15:08:49.503+00	2026-02-24 15:08:52.201+00	action-print	@nocobase/plugin-action-print	2.0.2	t	t	t	\N
9	2026-02-24 15:08:49.504+00	2026-02-24 15:08:52.202+00	auth	@nocobase/plugin-auth	2.0.2	t	t	t	\N
10	2026-02-24 15:08:49.505+00	2026-02-24 15:08:52.202+00	async-task-manager	@nocobase/plugin-async-task-manager	2.0.2	t	t	t	\N
11	2026-02-24 15:08:49.506+00	2026-02-24 15:08:52.203+00	ai	@nocobase/plugin-ai	2.0.2	t	t	t	\N
12	2026-02-24 15:08:49.507+00	2026-02-24 15:08:52.203+00	block-iframe	@nocobase/plugin-block-iframe	2.0.2	t	t	t	\N
13	2026-02-24 15:08:49.508+00	2026-02-24 15:08:52.204+00	block-workbench	@nocobase/plugin-block-workbench	2.0.2	t	t	t	\N
14	2026-02-24 15:08:49.509+00	2026-02-24 15:08:52.204+00	block-list	@nocobase/plugin-block-list	2.0.2	t	t	t	\N
15	2026-02-24 15:08:49.51+00	2026-02-24 15:08:52.205+00	block-grid-card	@nocobase/plugin-block-grid-card	2.0.2	t	t	t	\N
16	2026-02-24 15:08:49.511+00	2026-02-24 15:08:52.205+00	block-markdown	@nocobase/plugin-block-markdown	2.0.2	t	t	t	\N
17	2026-02-24 15:08:49.512+00	2026-02-24 15:08:52.206+00	calendar	@nocobase/plugin-calendar	2.0.2	t	t	t	\N
18	2026-02-24 15:08:49.512+00	2026-02-24 15:08:52.206+00	client	@nocobase/plugin-client	2.0.2	t	t	t	\N
19	2026-02-24 15:08:49.513+00	2026-02-24 15:08:52.206+00	collection-sql	@nocobase/plugin-collection-sql	2.0.2	t	t	t	\N
20	2026-02-24 15:08:49.514+00	2026-02-24 15:08:52.207+00	collection-tree	@nocobase/plugin-collection-tree	2.0.2	t	t	t	\N
21	2026-02-24 15:08:49.515+00	2026-02-24 15:08:52.207+00	data-source-main	@nocobase/plugin-data-source-main	2.0.2	t	t	t	\N
22	2026-02-24 15:08:49.516+00	2026-02-24 15:08:52.207+00	data-source-manager	@nocobase/plugin-data-source-manager	2.0.2	t	t	t	\N
23	2026-02-24 15:08:49.517+00	2026-02-24 15:08:52.208+00	data-visualization	@nocobase/plugin-data-visualization	2.0.2	t	t	t	\N
24	2026-02-24 15:08:49.517+00	2026-02-24 15:08:52.208+00	environment-variables	@nocobase/plugin-environment-variables	2.0.2	t	t	t	\N
25	2026-02-24 15:08:49.518+00	2026-02-24 15:08:52.209+00	error-handler	@nocobase/plugin-error-handler	2.0.2	t	t	t	\N
26	2026-02-24 15:08:49.519+00	2026-02-24 15:08:52.209+00	field-formula	@nocobase/plugin-field-formula	2.0.2	t	t	t	\N
27	2026-02-24 15:08:49.519+00	2026-02-24 15:08:52.209+00	field-markdown-vditor	@nocobase/plugin-field-markdown-vditor	2.0.2	t	t	t	\N
28	2026-02-24 15:08:49.52+00	2026-02-24 15:08:52.21+00	field-sequence	@nocobase/plugin-field-sequence	2.0.2	t	t	t	\N
29	2026-02-24 15:08:49.521+00	2026-02-24 15:08:52.21+00	field-sort	@nocobase/plugin-field-sort	2.0.2	t	t	t	\N
30	2026-02-24 15:08:49.522+00	2026-02-24 15:08:52.21+00	file-manager	@nocobase/plugin-file-manager	2.0.2	t	t	t	\N
31	2026-02-24 15:08:49.522+00	2026-02-24 15:08:52.211+00	gantt	@nocobase/plugin-gantt	2.0.2	t	t	t	\N
32	2026-02-24 15:08:49.523+00	2026-02-24 15:08:52.211+00	text-copy	@nocobase/plugin-text-copy	2.0.2	t	t	t	\N
33	2026-02-24 15:08:49.524+00	2026-02-24 15:08:52.211+00	kanban	@nocobase/plugin-kanban	2.0.2	t	t	t	\N
34	2026-02-24 15:08:49.525+00	2026-02-24 15:08:52.212+00	flow-engine	@nocobase/plugin-flow-engine	2.0.2	t	t	t	\N
35	2026-02-24 15:08:49.526+00	2026-02-24 15:08:52.212+00	logger	@nocobase/plugin-logger	2.0.2	t	t	t	\N
36	2026-02-24 15:08:49.526+00	2026-02-24 15:08:52.213+00	notification-manager	@nocobase/plugin-notification-manager	2.0.2	t	t	t	\N
37	2026-02-24 15:08:49.527+00	2026-02-24 15:08:52.213+00	notification-in-app-message	@nocobase/plugin-notification-in-app-message	2.0.2	t	t	t	\N
38	2026-02-24 15:08:49.528+00	2026-02-24 15:08:52.213+00	mobile	@nocobase/plugin-mobile	2.0.2	t	t	t	{"deprecated":true}
39	2026-02-24 15:08:49.528+00	2026-02-24 15:08:52.214+00	system-settings	@nocobase/plugin-system-settings	2.0.2	t	t	t	\N
40	2026-02-24 15:08:49.529+00	2026-02-24 15:08:52.214+00	ui-schema-storage	@nocobase/plugin-ui-schema-storage	2.0.2	t	t	t	\N
41	2026-02-24 15:08:49.53+00	2026-02-24 15:08:52.215+00	user-data-sync	@nocobase/plugin-user-data-sync	2.0.2	t	t	t	\N
42	2026-02-24 15:08:49.53+00	2026-02-24 15:08:52.215+00	users	@nocobase/plugin-users	2.0.2	t	t	t	\N
43	2026-02-24 15:08:49.531+00	2026-02-24 15:08:52.216+00	verification	@nocobase/plugin-verification	2.0.2	t	t	t	\N
44	2026-02-24 15:08:49.532+00	2026-02-24 15:08:52.216+00	workflow	@nocobase/plugin-workflow	2.0.2	t	t	t	\N
45	2026-02-24 15:08:49.533+00	2026-02-24 15:08:52.216+00	workflow-action-trigger	@nocobase/plugin-workflow-action-trigger	2.0.2	t	t	t	\N
46	2026-02-24 15:08:49.533+00	2026-02-24 15:08:52.217+00	workflow-aggregate	@nocobase/plugin-workflow-aggregate	2.0.2	t	t	t	\N
47	2026-02-24 15:08:49.534+00	2026-02-24 15:08:52.217+00	workflow-delay	@nocobase/plugin-workflow-delay	2.0.2	t	t	t	\N
48	2026-02-24 15:08:49.535+00	2026-02-24 15:08:52.218+00	workflow-json-query	@nocobase/plugin-workflow-json-query	2.0.2	t	t	t	\N
49	2026-02-24 15:08:49.536+00	2026-02-24 15:08:52.218+00	workflow-json-variable-mapping	@nocobase/plugin-workflow-json-variable-mapping	2.0.2	t	t	t	\N
50	2026-02-24 15:08:49.537+00	2026-02-24 15:08:52.218+00	workflow-loop	@nocobase/plugin-workflow-loop	2.0.2	t	t	t	\N
51	2026-02-24 15:08:49.537+00	2026-02-24 15:08:52.219+00	workflow-parallel	@nocobase/plugin-workflow-parallel	2.0.2	t	t	t	\N
52	2026-02-24 15:08:49.538+00	2026-02-24 15:08:52.219+00	workflow-request	@nocobase/plugin-workflow-request	2.0.2	t	t	t	\N
53	2026-02-24 15:08:49.539+00	2026-02-24 15:08:52.22+00	workflow-sql	@nocobase/plugin-workflow-sql	2.0.2	t	t	t	\N
54	2026-02-24 15:08:49.54+00	2026-02-24 15:08:52.22+00	workflow-notification	@nocobase/plugin-workflow-notification	2.0.2	t	t	t	\N
55	2026-02-24 15:08:49.541+00	2026-02-24 15:08:52.221+00	theme-editor	@nocobase/plugin-theme-editor	2.0.2	t	t	t	\N
56	2026-02-24 15:08:49.541+00	2026-02-24 15:08:52.221+00	block-template	@nocobase/plugin-block-template	2.0.2	t	t	t	\N
57	2026-02-24 15:08:49.542+00	2026-02-24 15:08:52.221+00	ui-templates	@nocobase/plugin-ui-templates	2.0.2	t	t	t	\N
58	2026-02-24 15:08:49.543+00	2026-02-24 15:08:52.222+00	license	@nocobase/plugin-license	2.0.2	t	t	t	\N
60	2026-02-26 13:29:44.912+00	2026-02-26 13:29:44.912+00	csv-service	csv-service	2.0.2	t	t	\N	\N
62	2026-03-01 15:17:57.888+00	2026-03-01 15:17:57.888+00	api-keys	@nocobase/plugin-api-keys	2.0.2	t	t	\N	\N
\.


--
-- TOC entry 4265 (class 0 OID 16408)
-- Dependencies: 218
-- Data for Name: applicationVersion; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."applicationVersion" (id, value) FROM stdin;
1	2.0.2
\.


--
-- TOC entry 4295 (class 0 OID 16637)
-- Dependencies: 248
-- Data for Name: asyncTasks; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."asyncTasks" ("createdAt", "updatedAt", id, origin, type, title, params, status, result, cancelable, "progressTotal", "progressCurrent", "startedAt", "doneAt", "createdById") FROM stdin;
\.


--
-- TOC entry 4303 (class 0 OID 16692)
-- Dependencies: 256
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.attachments (id, "createdAt", "updatedAt", title, filename, extname, size, mimetype, path, meta, url, "createdById", "updatedById", "storageId") FROM stdin;
1	2026-02-24 15:08:51.826+00	2026-02-24 15:08:51.826+00	nocobase-logo	logo-gra8ha.png	.png	11186	image/png		{}	\N	\N	\N	350060243714048
2	2026-02-24 15:45:23.482+00	2026-02-24 15:45:23.489+00	vf3	vf3-op8s29.jpg	.jpg	69228	image/jpeg		{}	\N	1	1	350060243714048
\.


--
-- TOC entry 4277 (class 0 OID 16481)
-- Dependencies: 230
-- Data for Name: authenticators; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.authenticators (id, "createdAt", "updatedAt", name, "authType", title, description, options, enabled, sort, "createdById", "updatedById") FROM stdin;
1	2026-02-24 15:08:51.805+00	2026-02-24 15:08:51.805+00	basic	Email/Password	\N	Sign in with username/email.	{"public":{"allowSignUp":true}}	t	1	\N	\N
\.


--
-- TOC entry 4371 (class 0 OID 17218)
-- Dependencies: 324
-- Data for Name: blockTemplateLinks; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."blockTemplateLinks" (id, "createdAt", "updatedAt", "templateKey", "templateBlockUid", "blockUid") FROM stdin;
\.


--
-- TOC entry 4372 (class 0 OID 17229)
-- Dependencies: 325
-- Data for Name: blockTemplates; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."blockTemplates" ("createdAt", "updatedAt", key, title, description, type, uid, configured, collection, "dataSource", "componentType", "menuName") FROM stdin;
\.


--
-- TOC entry 4296 (class 0 OID 16645)
-- Dependencies: 249
-- Data for Name: collectionCategories; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."collectionCategories" (id, "createdAt", "updatedAt", name, color, sort) FROM stdin;
\.


--
-- TOC entry 4298 (class 0 OID 16665)
-- Dependencies: 251
-- Data for Name: collectionCategory; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."collectionCategory" ("createdAt", "updatedAt", "collectionName", "categoryId") FROM stdin;
\.


--
-- TOC entry 4297 (class 0 OID 16653)
-- Dependencies: 250
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.collections (key, name, title, inherit, hidden, options, description, sort) FROM stdin;
7w2hrchhzpn	roles	{{t("Roles")}}	f	f	{"origin":"@nocobase/plugin-acl","dumpRules":"required","migrationRules":["overwrite","schema-only"],"autoGenId":false,"model":"RoleModel","filterTargetKey":"name","titleField":"title","sortable":true,"underscored":false,"from":"db2cm"}	Role data	1
omwiwzlzmnr	users	{{t("Users")}}	f	f	{"origin":"@nocobase/plugin-users","dumpRules":{"group":"user"},"migrationRules":["schema-only","overwrite","schema-only","overwrite","skip"],"sortable":"sort","model":"UserModel","titleField":"nickname","createdBy":true,"updatedBy":true,"logging":true,"shared":true,"underscored":false,"from":"db2cm"}	\N	2
mljmkpo12c8	vehicle_objects	vehicle_objects	f	f	{"logging":true,"template":"tree","view":false,"tree":"adjacencyList","autoGenId":false,"createdAt":true,"createdBy":true,"updatedAt":true,"updatedBy":true}	\N	3
fjxra540su0	vehicle_items	vehicle_items	f	f	{"logging":true,"template":"tree","view":false,"tree":"adjacencyList","autoGenId":false,"createdAt":true,"createdBy":true,"updatedAt":true,"updatedBy":true}	\N	4
hje2n4n4rfi	vehicle_objects_items	vehicle_objects_items	f	f	{"logging":true,"template":"general","view":false,"autoGenId":false,"createdAt":true,"createdBy":true,"updatedAt":true,"updatedBy":true}	\N	5
9sb25x2fyga	feature_values	vehicle_feature_values	f	f	{"logging":true,"template":"general","view":false,"autoGenId":false,"createdAt":true,"createdBy":true,"updatedAt":true,"updatedBy":true,"filterTargetKey":["id"],"unavailableActions":[]}	\N	7
ttug4n1e0gz	vehicle_test_values	vehicle_test_values	f	f	{"logging":true,"template":"general","view":false,"autoGenId":false,"createdAt":true,"createdBy":true,"updatedAt":true,"updatedBy":true}	\N	8
\.


--
-- TOC entry 4274 (class 0 OID 16465)
-- Dependencies: 227
-- Data for Name: customRequests; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."customRequests" ("createdAt", "updatedAt", key, options) FROM stdin;
\.


--
-- TOC entry 4275 (class 0 OID 16472)
-- Dependencies: 228
-- Data for Name: customRequestsRoles; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."customRequestsRoles" ("createdAt", "updatedAt", "customRequestKey", "roleName") FROM stdin;
\.


--
-- TOC entry 4293 (class 0 OID 16621)
-- Dependencies: 246
-- Data for Name: dataSources; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."dataSources" ("createdAt", "updatedAt", key, "displayName", type, options, enabled, fixed) FROM stdin;
2026-02-24 15:08:51.814+00	2026-02-24 15:08:51.814+00	main	{{t("Main")}}	main	{}	t	t
\.


--
-- TOC entry 4287 (class 0 OID 16562)
-- Dependencies: 240
-- Data for Name: dataSourcesCollections; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."dataSourcesCollections" (key, name, options, "dataSourceKey") FROM stdin;
\.


--
-- TOC entry 4288 (class 0 OID 16571)
-- Dependencies: 241
-- Data for Name: dataSourcesFields; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."dataSourcesFields" (key, name, "collectionName", interface, description, "uiSchema", "collectionKey", options, "dataSourceKey") FROM stdin;
\.


--
-- TOC entry 4292 (class 0 OID 16612)
-- Dependencies: 245
-- Data for Name: dataSourcesRoles; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."dataSourcesRoles" (id, "roleName", strategy, "dataSourceKey") FROM stdin;
f2kuw9fw2z9	root	\N	main
6xruyuzu1pv	member	{"actions":["view:own"]}	main
rl5aabtuofi	admin	{"actions":["create","view","update","destroy","export","importXlsx"]}	main
\.


--
-- TOC entry 4291 (class 0 OID 16602)
-- Dependencies: 244
-- Data for Name: dataSourcesRolesResources; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."dataSourcesRolesResources" (id, "createdAt", "updatedAt", "dataSourceKey", "roleName", name, "usingActionsConfig") FROM stdin;
\.


--
-- TOC entry 4289 (class 0 OID 16582)
-- Dependencies: 242
-- Data for Name: dataSourcesRolesResourcesActions; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."dataSourcesRolesResourcesActions" (id, "createdAt", "updatedAt", name, fields, "scopeId", "rolesResourceId") FROM stdin;
\.


--
-- TOC entry 4290 (class 0 OID 16593)
-- Dependencies: 243
-- Data for Name: dataSourcesRolesResourcesScopes; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."dataSourcesRolesResourcesScopes" (id, "createdAt", "updatedAt", key, "dataSourceKey", name, "resourceName", scope) FROM stdin;
350060243714049	2026-02-24 15:08:51.849+00	2026-02-24 15:08:51.849+00	all	main	{{t("All records")}}	\N	{}
350060243714050	2026-02-24 15:08:51.852+00	2026-02-24 15:08:51.852+00	own	main	{{t("Own records")}}	\N	{"createdById":"{{ ctx.state.currentUser.id }}"}
\.


--
-- TOC entry 4284 (class 0 OID 16542)
-- Dependencies: 237
-- Data for Name: desktopRoutes; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."desktopRoutes" (id, "createdAt", "updatedAt", "parentId", title, tooltip, icon, "schemaUid", "menuSchemaUid", "tabSchemaName", type, options, sort, "hideInMenu", "enableTabs", "enableHeader", "displayTitle", hidden, "createdById", "updatedById") FROM stdin;
350064010461184	2026-02-24 15:38:47.226+00	2026-02-24 15:38:47.226+00	\N	Database	\N	databaseoutlined	jxjso55xh8k	\N	\N	group	\N	1	\N	\N	\N	\N	\N	1	1
350064144678912	2026-02-24 15:39:51.612+00	2026-02-24 15:39:51.612+00	350064010461184	Vehicle Test	\N	accountbookoutlined	0fa2yc47a4c	b516gp9dn0m	\N	flowPage	\N	1	\N	f	\N	\N	\N	1	1
350064144678913	2026-02-24 15:39:51.657+00	2026-02-24 15:39:51.657+00	350064144678912	\N	\N	\N	p2f38zatpcp	\N	93ke67nlwt9	tabs	\N	1	\N	\N	\N	\N	t	1	1
350066568986624	2026-02-24 15:59:07.308+00	2026-02-24 15:59:07.308+00	\N	Vinfast	\N	caroutlined	m4j7efw58l2	\N	\N	group	\N	2	\N	\N	\N	\N	\N	1	1
350066659164160	2026-02-24 15:59:50.835+00	2026-02-24 15:59:50.835+00	350066568986624	Vehicle Tests	\N	\N	ljfrpm7e234	17e807neiat	\N	flowPage	\N	1	\N	f	\N	\N	\N	1	1
350066659164161	2026-02-24 15:59:50.909+00	2026-02-24 15:59:50.909+00	350066659164160	\N	\N	\N	57e7tzgvnoi	\N	9blmbkb2vp5	tabs	\N	1	\N	\N	\N	\N	t	1	1
\.


--
-- TOC entry 4294 (class 0 OID 16630)
-- Dependencies: 247
-- Data for Name: environmentVariables; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."environmentVariables" ("createdAt", "updatedAt", name, type, value) FROM stdin;
\.


--
-- TOC entry 4338 (class 0 OID 16964)
-- Dependencies: 291
-- Data for Name: executions; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.executions (id, "createdAt", "updatedAt", key, "eventKey", context, status, dispatched, stack, output, manually, "workflowId") FROM stdin;
\.


--
-- TOC entry 4381 (class 0 OID 17322)
-- Dependencies: 334
-- Data for Name: feature_values; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.feature_values ("createdAt", "updatedAt", id, "createdById", "updatedById", vehicle_object_item_id, version, index, value) FROM stdin;
\.


--
-- TOC entry 4299 (class 0 OID 16671)
-- Dependencies: 252
-- Data for Name: fields; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.fields (key, name, type, interface, description, "collectionName", "parentKey", "reverseKey", options, sort) FROM stdin;
f3k94fzpwvm	name	uid	input	\N	roles	\N	\N	{"prefix":"r_","primaryKey":true,"uiSchema":{"type":"string","title":"{{t(\\"Role UID\\")}}","x-component":"Input"}}	1
f1rs8fo4j0p	title	string	input	\N	roles	\N	\N	{"unique":true,"uiSchema":{"type":"string","title":"{{t(\\"Role name\\")}}","x-component":"Input"},"translation":true}	2
0qz49xkxlbr	description	string	\N	\N	roles	\N	\N	{}	3
epa9tl6a5zm	strategy	json	\N	\N	roles	\N	\N	{}	4
8v50udky11f	default	boolean	\N	\N	roles	\N	\N	{"defaultValue":false}	5
akks1myoua1	hidden	boolean	\N	\N	roles	\N	\N	{"defaultValue":false}	6
f8yemcgbumm	allowConfigure	boolean	\N	\N	roles	\N	\N	{}	7
qdxhvhvzl93	allowNewMenu	boolean	\N	\N	roles	\N	\N	{}	8
omzmbt8s99v	menuUiSchemas	belongsToMany	\N	\N	roles	\N	\N	{"target":"uiSchemas","targetKey":"x-uid","foreignKey":"roleName","sourceKey":"name","otherKey":"uiSchemaXUid","through":"rolesUischemas"}	9
cstzg0uvqs2	resources	hasMany	\N	\N	roles	\N	\N	{"target":"dataSourcesRolesResources","sourceKey":"name","foreignKey":"roleName","targetKey":"id"}	10
0jf7g30eq2a	snippets	set	\N	\N	roles	\N	\N	{"defaultValue":["!ui.*","!pm","!pm.*"]}	11
1nluwey8zp4	users	belongsToMany	\N	\N	roles	\N	\N	{"target":"users","foreignKey":"roleName","otherKey":"userId","onDelete":"CASCADE","sourceKey":"name","targetKey":"id","through":"rolesUsers"}	12
bktbcwioh0p	sort	sort	\N	\N	roles	\N	\N	{"hidden":true}	13
37ejtd62tzg	desktopRoutes	belongsToMany	\N	\N	roles	\N	\N	{"target":"desktopRoutes","through":"rolesDesktopRoutes","onDelete":"CASCADE","foreignKey":"roleName","sourceKey":"name","otherKey":"desktopRouteId","targetKey":"id"}	14
rvova4c9bjm	mobileRoutes	belongsToMany	\N	\N	roles	\N	\N	{"target":"mobileRoutes","through":"rolesMobileRoutes","onDelete":"CASCADE","foreignKey":"roleName","sourceKey":"name","otherKey":"mobileRouteId","targetKey":"id"}	15
eoqhlefagck	allowNewMobileMenu	boolean	\N	\N	roles	\N	\N	{}	16
w72uqod2gts	aiEmployees	belongsToMany	\N	\N	roles	\N	\N	{"target":"aiEmployees","foreignKey":"roleName","otherKey":"aiEmployee","onDelete":"CASCADE","sourceKey":"name","targetKey":"username","through":"rolesAiEmployees"}	17
9ge1r84lk51	allowNewAiEmployee	boolean	\N	\N	roles	\N	\N	{}	18
p78yid0y70d	id	bigInt	integer	\N	users	\N	\N	{"autoIncrement":true,"primaryKey":true,"allowNull":false,"uiSchema":{"type":"number","title":"{{t(\\"ID\\")}}","x-component":"InputNumber","x-read-pretty":true}}	1
sgpom7szv4h	nickname	string	input	\N	users	\N	\N	{"uiSchema":{"type":"string","title":"{{t(\\"Nickname\\")}}","x-component":"Input"}}	2
hx56k6u36qp	username	string	input	\N	users	\N	\N	{"unique":true,"uiSchema":{"type":"string","title":"{{t(\\"Username\\")}}","x-component":"Input","x-validator":{"username":true},"required":true}}	3
hkp1d4cxbvn	email	string	email	\N	users	\N	\N	{"unique":true,"uiSchema":{"type":"string","title":"{{t(\\"Email\\")}}","x-component":"Input","x-validator":"email","required":true}}	4
y4oo6cw67xv	phone	string	input	\N	users	\N	\N	{"unique":true,"uiSchema":{"type":"string","title":"{{t(\\"Phone\\")}}","x-component":"Input","required":true}}	5
9lrblpah712	password	password	password	\N	users	\N	\N	{"hidden":true,"uiSchema":{"type":"string","title":"{{t(\\"Password\\")}}","x-component":"Password","x-validator":{"password":true}}}	6
5yv2bjie9ba	passwordChangeTz	bigInt	\N	\N	users	\N	\N	{}	7
17a1pxvrzo7	appLang	string	\N	\N	users	\N	\N	{}	8
lxjl2gqigzx	resetToken	string	\N	\N	users	\N	\N	{"unique":true,"hidden":true}	9
br4yh8wmjiu	systemSettings	json	\N	\N	users	\N	\N	{"defaultValue":{}}	10
ili92990jiy	createdAt	date	createdAt	\N	users	\N	\N	{"uiSchema":{"x-component-props":{"dateFormat":"YYYY-MM-DD"},"type":"datetime","title":"{{t(\\"Created at\\")}}","x-component":"DatePicker","x-read-pretty":true},"field":"createdAt"}	11
z7gzkou962l	updatedAt	date	updatedAt	\N	users	\N	\N	{"uiSchema":{"x-component-props":{"dateFormat":"YYYY-MM-DD"},"type":"datetime","title":"{{t(\\"Last updated at\\")}}","x-component":"DatePicker","x-read-pretty":true},"field":"updatedAt"}	12
4uq63cqize6	sort	sort	\N	\N	users	\N	\N	{"hidden":true}	13
wowshkqemwp	roles	belongsToMany	m2m	\N	users	\N	\N	{"target":"roles","foreignKey":"userId","otherKey":"roleName","onDelete":"CASCADE","sourceKey":"id","targetKey":"name","through":"rolesUsers","uiSchema":{"type":"array","title":"{{t(\\"Roles\\")}}","x-component":"AssociationField","x-component-props":{"multiple":true,"fieldNames":{"label":"title","value":"name"}}}}	14
3297znqkqay	createdBy	belongsTo	createdBy	\N	users	\N	\N	{"target":"users","foreignKey":"createdById","targetKey":"id","uiSchema":{"type":"object","title":"{{t(\\"Created by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true}}	15
qa59euanor7	createdById	context	\N	\N	users	\N	\N	{"dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	16
b8j3lks28oh	updatedBy	belongsTo	updatedBy	\N	users	\N	\N	{"target":"users","foreignKey":"updatedById","targetKey":"id","uiSchema":{"type":"object","title":"{{t(\\"Last updated by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true}}	17
r7hx5z17syp	updatedById	context	\N	\N	users	\N	\N	{"dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	18
xc2a44maxmp	aiEmployees	belongsToMany	\N	\N	users	\N	\N	{"target":"aiEmployees","foreignKey":"userId","otherKey":"aiEmployee","onDelete":"CASCADE","sourceKey":"id","targetKey":"username","through":"usersAiEmployees"}	19
riljdrc48gx	parentId	snowflakeId	snowflakeId	\N	vehicle_objects	\N	\N	{"isForeignKey":true,"uiSchema":{"type":"number","title":"{{t(\\"Parent ID\\")}}","x-component":"InputNumber","x-component-props":{"stringMode":true,"separator":"0.00","step":"1"},"x-validator":"integer"},"autoFill":false}	1
o5ys2zz55s5	parent	belongsTo	m2o	\N	vehicle_objects	\N	\N	{"foreignKey":"parentId","treeParent":true,"onDelete":"CASCADE","uiSchema":{"title":"{{t(\\"Parent\\")}}","x-component":"AssociationField","x-component-props":{"multiple":false,"fieldNames":{"label":"id","value":"id"}}},"target":"vehicle_objects","targetKey":"id"}	2
aohoxca82jm	children	hasMany	o2m	\N	vehicle_objects	\N	\N	{"foreignKey":"parentId","treeChildren":true,"onDelete":"CASCADE","uiSchema":{"title":"{{t(\\"Children\\")}}","x-component":"AssociationField","x-component-props":{"multiple":true,"fieldNames":{"label":"id","value":"id"}}},"target":"vehicle_objects","targetKey":"id","sourceKey":"id"}	3
sx6x1n8en3k	id	snowflakeId	snowflakeId	\N	vehicle_objects	\N	\N	{"autoIncrement":false,"primaryKey":true,"allowNull":false,"uiSchema":{"type":"number","title":"{{t(\\"ID\\")}}","x-component":"InputNumber","x-component-props":{"stringMode":true,"separator":"0.00","step":"1"},"x-validator":"integer"}}	4
129rnt87tub	createdAt	date	createdAt	\N	vehicle_objects	\N	\N	{"field":"createdAt","uiSchema":{"type":"datetime","title":"{{t(\\"Created at\\")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	5
ibz90odf9dm	createdBy	belongsTo	createdBy	\N	vehicle_objects	\N	\N	{"target":"users","foreignKey":"createdById","uiSchema":{"type":"object","title":"{{t(\\"Created by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	6
5x3ev6is0v4	updatedAt	date	updatedAt	\N	vehicle_objects	\N	\N	{"field":"updatedAt","uiSchema":{"type":"datetime","title":"{{t(\\"Last updated at\\")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	7
90n6plfeu5k	updatedBy	belongsTo	updatedBy	\N	vehicle_objects	\N	\N	{"target":"users","foreignKey":"updatedById","uiSchema":{"type":"object","title":"{{t(\\"Last updated by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	8
mxzc4tru6y2	parentId	snowflakeId	snowflakeId	\N	vehicle_items	\N	\N	{"isForeignKey":true,"uiSchema":{"type":"number","title":"{{t(\\"Parent ID\\")}}","x-component":"InputNumber","x-component-props":{"stringMode":true,"separator":"0.00","step":"1"},"x-validator":"integer"},"autoFill":false}	1
5qm71idt9th	parent	belongsTo	m2o	\N	vehicle_items	\N	\N	{"foreignKey":"parentId","treeParent":true,"onDelete":"CASCADE","uiSchema":{"title":"{{t(\\"Parent\\")}}","x-component":"AssociationField","x-component-props":{"multiple":false,"fieldNames":{"label":"id","value":"id"}}},"target":"vehicle_items","targetKey":"id"}	2
wzs4jwjz5r7	children	hasMany	o2m	\N	vehicle_items	\N	\N	{"foreignKey":"parentId","treeChildren":true,"onDelete":"CASCADE","uiSchema":{"title":"{{t(\\"Children\\")}}","x-component":"AssociationField","x-component-props":{"multiple":true,"fieldNames":{"label":"id","value":"id"}}},"target":"vehicle_items","targetKey":"id","sourceKey":"id"}	3
9r0f6upaadz	id	snowflakeId	snowflakeId	\N	vehicle_items	\N	\N	{"autoIncrement":false,"primaryKey":true,"allowNull":false,"uiSchema":{"type":"number","title":"{{t(\\"ID\\")}}","x-component":"InputNumber","x-component-props":{"stringMode":true,"separator":"0.00","step":"1"},"x-validator":"integer"}}	4
wb2vf6b3wzu	createdAt	date	createdAt	\N	vehicle_items	\N	\N	{"field":"createdAt","uiSchema":{"type":"datetime","title":"{{t(\\"Created at\\")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	5
2mj15cd3y13	createdBy	belongsTo	createdBy	\N	vehicle_items	\N	\N	{"target":"users","foreignKey":"createdById","uiSchema":{"type":"object","title":"{{t(\\"Created by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	6
8ru5gupmv2v	updatedAt	date	updatedAt	\N	vehicle_items	\N	\N	{"field":"updatedAt","uiSchema":{"type":"datetime","title":"{{t(\\"Last updated at\\")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	7
69ndnsq36m7	updatedBy	belongsTo	updatedBy	\N	vehicle_items	\N	\N	{"target":"users","foreignKey":"updatedById","uiSchema":{"type":"object","title":"{{t(\\"Last updated by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	8
exue5mcay5k	createdAt	date	createdAt	\N	vehicle_objects_items	\N	\N	{"field":"createdAt","uiSchema":{"type":"datetime","title":"{{t(\\"Created at\\")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	2
3zzl0uyv8gw	createdBy	belongsTo	createdBy	\N	vehicle_objects_items	\N	\N	{"target":"users","foreignKey":"createdById","uiSchema":{"type":"object","title":"{{t(\\"Created by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	3
qboyrflneon	updatedAt	date	updatedAt	\N	vehicle_objects_items	\N	\N	{"field":"updatedAt","uiSchema":{"type":"datetime","title":"{{t(\\"Last updated at\\")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	4
ra3bnavjn91	updatedBy	belongsTo	updatedBy	\N	vehicle_objects_items	\N	\N	{"target":"users","foreignKey":"updatedById","uiSchema":{"type":"object","title":"{{t(\\"Last updated by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	5
9waquwfcthh	name	string	input	\N	vehicle_objects	\N	\N	{"uiSchema":{"type":"string","x-component":"Input","title":"name"},"defaultValue":null}	9
or971t9wb0z	image	belongsToMany	attachment	\N	vehicle_objects	\N	\N	{"target":"attachments","uiSchema":{"type":"array","x-component":"Upload.Attachment","x-use-component-props":"useAttachmentFieldProps","x-component-props":{"multiple":true},"title":"image"},"through":"t_d6ursut4ws9","foreignKey":"f_b0ayz6z0chw","otherKey":"f_qahz3h30s16","targetKey":"id","sourceKey":"id"}	10
s5eo0q07jaq	name	string	input	\N	vehicle_items	\N	\N	{"uiSchema":{"type":"string","x-component":"Input","title":"name"},"defaultValue":null}	9
i7q4s79qter	category	string	input	\N	vehicle_items	\N	\N	{"uiSchema":{"type":"string","x-component":"Input","title":"category"},"defaultValue":null}	10
c1xulqzobo2	header	string	input	\N	vehicle_items	\N	\N	{"uiSchema":{"type":"string","x-component":"Input","title":"header"},"defaultValue":null}	11
0dsb3xzvuic	vehicle_object	belongsTo	m2o	\N	vehicle_objects_items	\N	\N	{"uiSchema":{"x-component":"AssociationField","x-component-props":{"multiple":false},"title":"vehicle_object"},"foreignKey":"vehicle_object_id","onDelete":"SET NULL","target":"vehicle_objects","targetKey":"id"}	6
3ylzroq3r6f	vehicle_object_id	bigInt	integer	\N	vehicle_objects_items	\N	\N	{"isForeignKey":true,"uiSchema":{"type":"number","title":"vehicle_object_id","x-component":"InputNumber","x-read-pretty":true}}	1
8lwqexd479i	id	snowflakeId	snowflakeId	\N	vehicle_objects_items	\N	\N	{"autoIncrement":false,"primaryKey":true,"allowNull":false,"uiSchema":{"type":"number","title":"{{t(\\"ID\\")}}","x-component":"InputNumber","x-component-props":{"stringMode":true,"separator":"0.00","step":"1"},"x-validator":"integer"}}	0
ldtqdaik3zo	vehicle_item	belongsTo	m2o	\N	vehicle_objects_items	\N	\N	{"uiSchema":{"x-component":"AssociationField","x-component-props":{"multiple":false},"title":"vehicle_item"},"foreignKey":"vehicle_item_id","onDelete":"SET NULL","target":"vehicle_items","targetKey":"id"}	7
lzflsfpxdi4	vehicle_item_id	bigInt	integer	\N	vehicle_objects_items	\N	\N	{"isForeignKey":true,"uiSchema":{"type":"number","title":"vehicle_item_id","x-component":"InputNumber","x-read-pretty":true}}	1
jtd1xx5w4s0	createdAt	date	createdAt	\N	vehicle_test_values	\N	\N	{"field":"createdAt","uiSchema":{"type":"datetime","title":"{{t(\\"Created at\\")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	2
ksiv02jv8t0	createdBy	belongsTo	createdBy	\N	vehicle_test_values	\N	\N	{"target":"users","foreignKey":"createdById","uiSchema":{"type":"object","title":"{{t(\\"Created by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	3
8ej92j60pnk	createdAt	date	createdAt	\N	feature_values	\N	\N	{"field":"createdAt","uiSchema":{"type":"datetime","title":"{{t(\\"Created at\\")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	2
fnxscqofr6i	createdBy	belongsTo	createdBy	\N	feature_values	\N	\N	{"target":"users","foreignKey":"createdById","uiSchema":{"type":"object","title":"{{t(\\"Created by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	3
4vihmo34x0e	updatedAt	date	updatedAt	\N	feature_values	\N	\N	{"field":"updatedAt","uiSchema":{"type":"datetime","title":"{{t(\\"Last updated at\\")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	4
on2vufb4ih2	updatedBy	belongsTo	updatedBy	\N	feature_values	\N	\N	{"target":"users","foreignKey":"updatedById","uiSchema":{"type":"object","title":"{{t(\\"Last updated by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	5
nf0qlqbpaa6	vehicle_object_item	belongsTo	m2o	\N	feature_values	\N	\N	{"uiSchema":{"x-component":"AssociationField","x-component-props":{"multiple":false},"title":"vehicle_object_item"},"foreignKey":"vehicle_object_item_id","onDelete":"SET NULL","target":"vehicle_objects_items","targetKey":"id"}	6
y2wbuvzr9fm	vehicle_object_item_id	bigInt	integer	\N	feature_values	\N	\N	{"isForeignKey":true,"uiSchema":{"type":"number","title":"vehicle_object_item_id","x-component":"InputNumber","x-read-pretty":true}}	1
tbahaavyqn6	id	snowflakeId	snowflakeId	\N	feature_values	\N	\N	{"autoIncrement":false,"primaryKey":true,"allowNull":false,"uiSchema":{"type":"number","title":"{{t(\\"ID\\")}}","x-component":"InputNumber","x-component-props":{"stringMode":true,"separator":"0.00","step":"1"},"x-validator":"integer"}}	0
yw574suagbs	version	bigInt	integer	\N	feature_values	\N	\N	{"uiSchema":{"type":"number","x-component":"InputNumber","x-component-props":{"stringMode":true,"step":"1"},"x-validator":"integer","title":"version"},"defaultValue":null}	7
poa906beu85	index	bigInt	integer	\N	feature_values	\N	\N	{"uiSchema":{"type":"number","x-component":"InputNumber","x-component-props":{"stringMode":true,"step":"1"},"x-validator":"integer","title":"index"},"defaultValue":null}	8
bcxenmy7sw6	value	string	input	\N	feature_values	\N	\N	{"uiSchema":{"type":"string","x-component":"Input","title":"value"},"defaultValue":null}	9
i3xr3ztmp7d	updatedAt	date	updatedAt	\N	vehicle_test_values	\N	\N	{"field":"updatedAt","uiSchema":{"type":"datetime","title":"{{t(\\"Last updated at\\")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	4
58swuji7k41	updatedBy	belongsTo	updatedBy	\N	vehicle_test_values	\N	\N	{"target":"users","foreignKey":"updatedById","uiSchema":{"type":"object","title":"{{t(\\"Last updated by\\")}}","x-component":"AssociationField","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	5
g2wplir8ynl	vehicle_object_item	belongsTo	m2o	\N	vehicle_test_values	\N	\N	{"uiSchema":{"x-component":"AssociationField","x-component-props":{"multiple":false},"title":"vehicle_object_item"},"foreignKey":"vehicle_object_item_id","onDelete":"SET NULL","target":"vehicle_objects_items","targetKey":"id"}	6
t7rgqb7u24a	vehicle_object_item_id	bigInt	integer	\N	vehicle_test_values	\N	\N	{"isForeignKey":true,"uiSchema":{"type":"number","title":"vehicle_object_item_id","x-component":"InputNumber","x-read-pretty":true}}	1
j6at9ghivtt	id	snowflakeId	snowflakeId	\N	vehicle_test_values	\N	\N	{"autoIncrement":false,"primaryKey":true,"allowNull":false,"uiSchema":{"type":"number","title":"{{t(\\"ID\\")}}","x-component":"InputNumber","x-component-props":{"stringMode":true,"separator":"0.00","step":"1"},"x-validator":"integer"}}	0
hzk14bkjrsk	version	bigInt	integer	\N	vehicle_test_values	\N	\N	{"uiSchema":{"type":"number","x-component":"InputNumber","x-component-props":{"stringMode":true,"step":"1"},"x-validator":"integer","title":"version"},"defaultValue":null}	7
aepa3qg6diy	index	bigInt	integer	\N	vehicle_test_values	\N	\N	{"uiSchema":{"type":"number","x-component":"InputNumber","x-component-props":{"stringMode":true,"step":"1"},"x-validator":"integer","title":"index"},"defaultValue":null}	8
4bnacx7p914	value	string	input	\N	vehicle_test_values	\N	\N	{"uiSchema":{"type":"string","x-component":"Input","title":"value"},"defaultValue":null}	9
\.


--
-- TOC entry 4373 (class 0 OID 17239)
-- Dependencies: 326
-- Data for Name: flowModelTemplateUsages; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."flowModelTemplateUsages" ("createdAt", "updatedAt", uid, "templateUid", "modelUid") FROM stdin;
\.


--
-- TOC entry 4374 (class 0 OID 17250)
-- Dependencies: 327
-- Data for Name: flowModelTemplates; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."flowModelTemplates" ("createdAt", "updatedAt", uid, name, description, "targetUid", "useModel", type, "dataSourceKey", "collectionName", "associationName", "filterByTk", "sourceId") FROM stdin;
\.


--
-- TOC entry 4305 (class 0 OID 16721)
-- Dependencies: 258
-- Data for Name: flowModelTreePath; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."flowModelTreePath" (ancestor, descendant, depth, async, type, sort) FROM stdin;
jxjso55xh8k	jxjso55xh8k	0	f	\N	\N
0fa2yc47a4c	0fa2yc47a4c	0	f	\N	\N
p2f38zatpcp	p2f38zatpcp	0	f	\N	\N
0fa7d5aba7a	0fa7d5aba7a	0	t	page	\N
0fa2yc47a4c	0fa7d5aba7a	1	\N	\N	1
a35efb6ad11	a35efb6ad11	0	t	grid	\N
p2f38zatpcp	a35efb6ad11	1	\N	\N	1
p2f38zatpcp	0a4e37a3032	2	\N	\N	\N
0a4e37a3032	0a4e37a3032	0	f	items	\N
a35efb6ad11	0a4e37a3032	1	\N	\N	1
p2f38zatpcp	38e359364be	3	\N	\N	\N
a35efb6ad11	38e359364be	2	\N	\N	\N
38e359364be	38e359364be	0	f	columns	\N
0a4e37a3032	38e359364be	1	\N	\N	1
p2f38zatpcp	21130803aa3	3	\N	\N	\N
a35efb6ad11	21130803aa3	2	\N	\N	\N
21130803aa3	21130803aa3	0	f	columns	\N
0a4e37a3032	21130803aa3	1	\N	\N	2
p2f38zatpcp	2141e9f6bb4	4	\N	\N	\N
a35efb6ad11	2141e9f6bb4	3	\N	\N	\N
0a4e37a3032	2141e9f6bb4	2	\N	\N	\N
2141e9f6bb4	2141e9f6bb4	0	f	field	\N
21130803aa3	2141e9f6bb4	1	\N	\N	1
p2f38zatpcp	78e58d3a988	3	\N	\N	\N
a35efb6ad11	78e58d3a988	2	\N	\N	\N
78e58d3a988	78e58d3a988	0	f	columns	\N
0a4e37a3032	78e58d3a988	1	\N	\N	3
p2f38zatpcp	7f5063ba236	4	\N	\N	\N
a35efb6ad11	7f5063ba236	3	\N	\N	\N
0a4e37a3032	7f5063ba236	2	\N	\N	\N
7f5063ba236	7f5063ba236	0	f	field	\N
78e58d3a988	7f5063ba236	1	\N	\N	1
p2f38zatpcp	521c3ac8729	3	\N	\N	\N
a35efb6ad11	521c3ac8729	2	\N	\N	\N
521c3ac8729	521c3ac8729	0	f	columns	\N
0a4e37a3032	521c3ac8729	1	\N	\N	4
p2f38zatpcp	968ab16502e	4	\N	\N	\N
a35efb6ad11	968ab16502e	3	\N	\N	\N
0a4e37a3032	968ab16502e	2	\N	\N	\N
968ab16502e	968ab16502e	0	f	field	\N
521c3ac8729	968ab16502e	1	\N	\N	1
p2f38zatpcp	eaf65338606	3	\N	\N	\N
a35efb6ad11	eaf65338606	2	\N	\N	\N
eaf65338606	eaf65338606	0	f	actions	\N
0a4e37a3032	eaf65338606	1	\N	\N	1
p2f38zatpcp	2be8852ac4f	3	\N	\N	\N
a35efb6ad11	2be8852ac4f	2	\N	\N	\N
2be8852ac4f	2be8852ac4f	0	f	actions	\N
0a4e37a3032	2be8852ac4f	1	\N	\N	2
p2f38zatpcp	3cec61ad9a4	3	\N	\N	\N
a35efb6ad11	3cec61ad9a4	2	\N	\N	\N
3cec61ad9a4	3cec61ad9a4	0	f	actions	\N
0a4e37a3032	3cec61ad9a4	1	\N	\N	3
p2f38zatpcp	35e2081403f	4	\N	\N	\N
a35efb6ad11	35e2081403f	3	\N	\N	\N
0a4e37a3032	35e2081403f	2	\N	\N	\N
35e2081403f	35e2081403f	0	f	actions	\N
38e359364be	35e2081403f	1	\N	\N	1
p2f38zatpcp	8312e1ee426	3	\N	\N	\N
a35efb6ad11	8312e1ee426	2	\N	\N	\N
8312e1ee426	8312e1ee426	0	f	actions	\N
cf79155dd3f	8312e1ee426	1	\N	\N	1
p2f38zatpcp	1cf8474e451	4	\N	\N	\N
a35efb6ad11	1cf8474e451	3	\N	\N	\N
0a4e37a3032	1cf8474e451	2	\N	\N	\N
1cf8474e451	1cf8474e451	0	f	actions	\N
38e359364be	1cf8474e451	1	\N	\N	3
p2f38zatpcp	c57b5ba5849	4	\N	\N	\N
a35efb6ad11	c57b5ba5849	3	\N	\N	\N
0a4e37a3032	c57b5ba5849	2	\N	\N	\N
c57b5ba5849	c57b5ba5849	0	t	page	\N
2be8852ac4f	c57b5ba5849	1	\N	\N	1
p2f38zatpcp	0526adbf110	5	\N	\N	\N
a35efb6ad11	0526adbf110	4	\N	\N	\N
0a4e37a3032	0526adbf110	3	\N	\N	\N
2be8852ac4f	0526adbf110	2	\N	\N	\N
0526adbf110	0526adbf110	0	f	tabs	\N
c57b5ba5849	0526adbf110	1	\N	\N	1
p2f38zatpcp	50e7b165f62	6	\N	\N	\N
a35efb6ad11	50e7b165f62	5	\N	\N	\N
0a4e37a3032	50e7b165f62	4	\N	\N	\N
2be8852ac4f	50e7b165f62	3	\N	\N	\N
c57b5ba5849	50e7b165f62	2	\N	\N	\N
50e7b165f62	50e7b165f62	0	t	grid	\N
0526adbf110	50e7b165f62	1	\N	\N	1
p2f38zatpcp	abdf845ed14	7	\N	\N	\N
a35efb6ad11	abdf845ed14	6	\N	\N	\N
0a4e37a3032	abdf845ed14	5	\N	\N	\N
2be8852ac4f	abdf845ed14	4	\N	\N	\N
c57b5ba5849	abdf845ed14	3	\N	\N	\N
0526adbf110	abdf845ed14	2	\N	\N	\N
abdf845ed14	abdf845ed14	0	f	items	\N
50e7b165f62	abdf845ed14	1	\N	\N	1
p2f38zatpcp	f93eec1567c	8	\N	\N	\N
a35efb6ad11	f93eec1567c	7	\N	\N	\N
0a4e37a3032	f93eec1567c	6	\N	\N	\N
2be8852ac4f	f93eec1567c	5	\N	\N	\N
c57b5ba5849	f93eec1567c	4	\N	\N	\N
0526adbf110	f93eec1567c	3	\N	\N	\N
50e7b165f62	f93eec1567c	2	\N	\N	\N
f93eec1567c	f93eec1567c	0	f	grid	\N
abdf845ed14	f93eec1567c	1	\N	\N	1
p2f38zatpcp	51ddf701380	9	\N	\N	\N
a35efb6ad11	51ddf701380	8	\N	\N	\N
0a4e37a3032	51ddf701380	7	\N	\N	\N
2be8852ac4f	51ddf701380	6	\N	\N	\N
c57b5ba5849	51ddf701380	5	\N	\N	\N
0526adbf110	51ddf701380	4	\N	\N	\N
50e7b165f62	51ddf701380	3	\N	\N	\N
abdf845ed14	51ddf701380	2	\N	\N	\N
51ddf701380	51ddf701380	0	f	items	\N
f93eec1567c	51ddf701380	1	\N	\N	1
p2f38zatpcp	49cbec68b90	10	\N	\N	\N
a35efb6ad11	49cbec68b90	9	\N	\N	\N
0a4e37a3032	49cbec68b90	8	\N	\N	\N
2be8852ac4f	49cbec68b90	7	\N	\N	\N
c57b5ba5849	49cbec68b90	6	\N	\N	\N
0526adbf110	49cbec68b90	5	\N	\N	\N
50e7b165f62	49cbec68b90	4	\N	\N	\N
abdf845ed14	49cbec68b90	3	\N	\N	\N
f93eec1567c	49cbec68b90	2	\N	\N	\N
49cbec68b90	49cbec68b90	0	f	field	\N
51ddf701380	49cbec68b90	1	\N	\N	1
p2f38zatpcp	66d7ff7c061	9	\N	\N	\N
a35efb6ad11	66d7ff7c061	8	\N	\N	\N
0a4e37a3032	66d7ff7c061	7	\N	\N	\N
2be8852ac4f	66d7ff7c061	6	\N	\N	\N
c57b5ba5849	66d7ff7c061	5	\N	\N	\N
0526adbf110	66d7ff7c061	4	\N	\N	\N
50e7b165f62	66d7ff7c061	3	\N	\N	\N
abdf845ed14	66d7ff7c061	2	\N	\N	\N
66d7ff7c061	66d7ff7c061	0	f	items	\N
f93eec1567c	66d7ff7c061	1	\N	\N	2
p2f38zatpcp	1570aaec497	10	\N	\N	\N
a35efb6ad11	1570aaec497	9	\N	\N	\N
0a4e37a3032	1570aaec497	8	\N	\N	\N
2be8852ac4f	1570aaec497	7	\N	\N	\N
c57b5ba5849	1570aaec497	6	\N	\N	\N
0526adbf110	1570aaec497	5	\N	\N	\N
50e7b165f62	1570aaec497	4	\N	\N	\N
abdf845ed14	1570aaec497	3	\N	\N	\N
f93eec1567c	1570aaec497	2	\N	\N	\N
1570aaec497	1570aaec497	0	f	field	\N
66d7ff7c061	1570aaec497	1	\N	\N	1
p2f38zatpcp	260356f8aac	8	\N	\N	\N
a35efb6ad11	260356f8aac	7	\N	\N	\N
0a4e37a3032	260356f8aac	6	\N	\N	\N
2be8852ac4f	260356f8aac	5	\N	\N	\N
c57b5ba5849	260356f8aac	4	\N	\N	\N
0526adbf110	260356f8aac	3	\N	\N	\N
50e7b165f62	260356f8aac	2	\N	\N	\N
260356f8aac	260356f8aac	0	f	actions	\N
abdf845ed14	260356f8aac	1	\N	\N	1
p2f38zatpcp	81686b64c59	9	\N	\N	\N
a35efb6ad11	81686b64c59	8	\N	\N	\N
0a4e37a3032	81686b64c59	7	\N	\N	\N
2be8852ac4f	81686b64c59	6	\N	\N	\N
c57b5ba5849	81686b64c59	5	\N	\N	\N
0526adbf110	81686b64c59	4	\N	\N	\N
50e7b165f62	81686b64c59	3	\N	\N	\N
abdf845ed14	81686b64c59	2	\N	\N	\N
81686b64c59	81686b64c59	0	f	items	\N
f93eec1567c	81686b64c59	1	\N	\N	3
p2f38zatpcp	a8891a753ff	10	\N	\N	\N
a35efb6ad11	a8891a753ff	9	\N	\N	\N
0a4e37a3032	a8891a753ff	8	\N	\N	\N
2be8852ac4f	a8891a753ff	7	\N	\N	\N
c57b5ba5849	a8891a753ff	6	\N	\N	\N
0526adbf110	a8891a753ff	5	\N	\N	\N
50e7b165f62	a8891a753ff	4	\N	\N	\N
abdf845ed14	a8891a753ff	3	\N	\N	\N
f93eec1567c	a8891a753ff	2	\N	\N	\N
a8891a753ff	a8891a753ff	0	f	field	\N
81686b64c59	a8891a753ff	1	\N	\N	1
p2f38zatpcp	107209482a0	5	\N	\N	\N
a35efb6ad11	107209482a0	4	\N	\N	\N
0a4e37a3032	107209482a0	3	\N	\N	\N
38e359364be	107209482a0	2	\N	\N	\N
107209482a0	107209482a0	0	t	page	\N
1cf8474e451	107209482a0	1	\N	\N	1
p2f38zatpcp	3af181ef464	6	\N	\N	\N
a35efb6ad11	3af181ef464	5	\N	\N	\N
0a4e37a3032	3af181ef464	4	\N	\N	\N
38e359364be	3af181ef464	3	\N	\N	\N
1cf8474e451	3af181ef464	2	\N	\N	\N
3af181ef464	3af181ef464	0	f	tabs	\N
107209482a0	3af181ef464	1	\N	\N	1
p2f38zatpcp	8e7911ae393	7	\N	\N	\N
a35efb6ad11	8e7911ae393	6	\N	\N	\N
0a4e37a3032	8e7911ae393	5	\N	\N	\N
38e359364be	8e7911ae393	4	\N	\N	\N
1cf8474e451	8e7911ae393	3	\N	\N	\N
107209482a0	8e7911ae393	2	\N	\N	\N
8e7911ae393	8e7911ae393	0	t	grid	\N
3af181ef464	8e7911ae393	1	\N	\N	1
p2f38zatpcp	42242d41077	8	\N	\N	\N
a35efb6ad11	42242d41077	7	\N	\N	\N
0a4e37a3032	42242d41077	6	\N	\N	\N
38e359364be	42242d41077	5	\N	\N	\N
1cf8474e451	42242d41077	4	\N	\N	\N
107209482a0	42242d41077	3	\N	\N	\N
3af181ef464	42242d41077	2	\N	\N	\N
42242d41077	42242d41077	0	f	items	\N
8e7911ae393	42242d41077	1	\N	\N	1
p2f38zatpcp	43b941fba10	9	\N	\N	\N
a35efb6ad11	43b941fba10	8	\N	\N	\N
0a4e37a3032	43b941fba10	7	\N	\N	\N
38e359364be	43b941fba10	6	\N	\N	\N
1cf8474e451	43b941fba10	5	\N	\N	\N
107209482a0	43b941fba10	4	\N	\N	\N
3af181ef464	43b941fba10	3	\N	\N	\N
8e7911ae393	43b941fba10	2	\N	\N	\N
43b941fba10	43b941fba10	0	f	grid	\N
42242d41077	43b941fba10	1	\N	\N	1
p2f38zatpcp	9081feebf09	10	\N	\N	\N
a35efb6ad11	9081feebf09	9	\N	\N	\N
0a4e37a3032	9081feebf09	8	\N	\N	\N
38e359364be	9081feebf09	7	\N	\N	\N
1cf8474e451	9081feebf09	6	\N	\N	\N
107209482a0	9081feebf09	5	\N	\N	\N
3af181ef464	9081feebf09	4	\N	\N	\N
8e7911ae393	9081feebf09	3	\N	\N	\N
42242d41077	9081feebf09	2	\N	\N	\N
9081feebf09	9081feebf09	0	f	items	\N
43b941fba10	9081feebf09	1	\N	\N	1
p2f38zatpcp	83bf1dd2633	11	\N	\N	\N
a35efb6ad11	83bf1dd2633	10	\N	\N	\N
0a4e37a3032	83bf1dd2633	9	\N	\N	\N
38e359364be	83bf1dd2633	8	\N	\N	\N
1cf8474e451	83bf1dd2633	7	\N	\N	\N
107209482a0	83bf1dd2633	6	\N	\N	\N
3af181ef464	83bf1dd2633	5	\N	\N	\N
8e7911ae393	83bf1dd2633	4	\N	\N	\N
42242d41077	83bf1dd2633	3	\N	\N	\N
43b941fba10	83bf1dd2633	2	\N	\N	\N
83bf1dd2633	83bf1dd2633	0	f	field	\N
9081feebf09	83bf1dd2633	1	\N	\N	1
p2f38zatpcp	5c488f7a73f	10	\N	\N	\N
a35efb6ad11	5c488f7a73f	9	\N	\N	\N
0a4e37a3032	5c488f7a73f	8	\N	\N	\N
38e359364be	5c488f7a73f	7	\N	\N	\N
1cf8474e451	5c488f7a73f	6	\N	\N	\N
107209482a0	5c488f7a73f	5	\N	\N	\N
3af181ef464	5c488f7a73f	4	\N	\N	\N
8e7911ae393	5c488f7a73f	3	\N	\N	\N
42242d41077	5c488f7a73f	2	\N	\N	\N
5c488f7a73f	5c488f7a73f	0	f	items	\N
43b941fba10	5c488f7a73f	1	\N	\N	2
p2f38zatpcp	d4f7470a863	11	\N	\N	\N
a35efb6ad11	d4f7470a863	10	\N	\N	\N
0a4e37a3032	d4f7470a863	9	\N	\N	\N
38e359364be	d4f7470a863	8	\N	\N	\N
1cf8474e451	d4f7470a863	7	\N	\N	\N
107209482a0	d4f7470a863	6	\N	\N	\N
3af181ef464	d4f7470a863	5	\N	\N	\N
8e7911ae393	d4f7470a863	4	\N	\N	\N
42242d41077	d4f7470a863	3	\N	\N	\N
43b941fba10	d4f7470a863	2	\N	\N	\N
d4f7470a863	d4f7470a863	0	f	field	\N
5c488f7a73f	d4f7470a863	1	\N	\N	1
p2f38zatpcp	9624f270352	9	\N	\N	\N
a35efb6ad11	9624f270352	8	\N	\N	\N
0a4e37a3032	9624f270352	7	\N	\N	\N
38e359364be	9624f270352	6	\N	\N	\N
1cf8474e451	9624f270352	5	\N	\N	\N
107209482a0	9624f270352	4	\N	\N	\N
3af181ef464	9624f270352	3	\N	\N	\N
8e7911ae393	9624f270352	2	\N	\N	\N
9624f270352	9624f270352	0	f	actions	\N
42242d41077	9624f270352	1	\N	\N	1
p2f38zatpcp	e32e2e04e95	2	\N	\N	\N
e32e2e04e95	e32e2e04e95	0	f	items	\N
a35efb6ad11	e32e2e04e95	1	\N	\N	2
p2f38zatpcp	1a101a13fb3	3	\N	\N	\N
a35efb6ad11	1a101a13fb3	2	\N	\N	\N
1a101a13fb3	1a101a13fb3	0	f	columns	\N
e32e2e04e95	1a101a13fb3	1	\N	\N	1
p2f38zatpcp	82ef459abe9	3	\N	\N	\N
a35efb6ad11	82ef459abe9	2	\N	\N	\N
82ef459abe9	82ef459abe9	0	f	columns	\N
p2f38zatpcp	3083a65b723	7	\N	\N	\N
p2f38zatpcp	ff5d6948f8b	4	\N	\N	\N
a35efb6ad11	ff5d6948f8b	3	\N	\N	\N
e32e2e04e95	ff5d6948f8b	2	\N	\N	\N
ff5d6948f8b	ff5d6948f8b	0	f	field	\N
82ef459abe9	ff5d6948f8b	1	\N	\N	1
p2f38zatpcp	ae0e084849d	3	\N	\N	\N
a35efb6ad11	ae0e084849d	2	\N	\N	\N
ae0e084849d	ae0e084849d	0	f	columns	\N
a35efb6ad11	3083a65b723	6	\N	\N	\N
p2f38zatpcp	1e9a9a2201b	4	\N	\N	\N
a35efb6ad11	1e9a9a2201b	3	\N	\N	\N
e32e2e04e95	1e9a9a2201b	2	\N	\N	\N
1e9a9a2201b	1e9a9a2201b	0	f	field	\N
ae0e084849d	1e9a9a2201b	1	\N	\N	1
p2f38zatpcp	8a2ff04a8d8	3	\N	\N	\N
a35efb6ad11	8a2ff04a8d8	2	\N	\N	\N
8a2ff04a8d8	8a2ff04a8d8	0	f	columns	\N
e32e2e04e95	3083a65b723	5	\N	\N	\N
p2f38zatpcp	c77e29540cd	4	\N	\N	\N
a35efb6ad11	c77e29540cd	3	\N	\N	\N
e32e2e04e95	c77e29540cd	2	\N	\N	\N
c77e29540cd	c77e29540cd	0	f	field	\N
8a2ff04a8d8	c77e29540cd	1	\N	\N	1
3c79e120274	3083a65b723	4	\N	\N	\N
2f4ca2a1d19	2f4ca2a1d19	0	f	field	\N
c6d4e863058	2f4ca2a1d19	1	\N	\N	1
p2f38zatpcp	c6d4e863058	3	\N	\N	\N
p2f38zatpcp	2f4ca2a1d19	4	\N	\N	\N
e32e2e04e95	2f4ca2a1d19	2	\N	\N	\N
a35efb6ad11	c6d4e863058	2	\N	\N	\N
a35efb6ad11	2f4ca2a1d19	3	\N	\N	\N
c6d4e863058	c6d4e863058	0	f	columns	\N
e32e2e04e95	82ef459abe9	1	\N	\N	3
e32e2e04e95	ae0e084849d	1	\N	\N	4
e32e2e04e95	8a2ff04a8d8	1	\N	\N	5
e32e2e04e95	c6d4e863058	1	\N	\N	2
p2f38zatpcp	8102bf42424	4	\N	\N	\N
a35efb6ad11	8102bf42424	3	\N	\N	\N
e32e2e04e95	8102bf42424	2	\N	\N	\N
8102bf42424	8102bf42424	0	f	actions	\N
1a101a13fb3	8102bf42424	1	\N	\N	1
p2f38zatpcp	ff9e29d71a5	4	\N	\N	\N
a35efb6ad11	ff9e29d71a5	3	\N	\N	\N
e32e2e04e95	ff9e29d71a5	2	\N	\N	\N
ff9e29d71a5	ff9e29d71a5	0	f	actions	\N
1a101a13fb3	ff9e29d71a5	1	\N	\N	2
p2f38zatpcp	a95c2654cda	3	\N	\N	\N
a35efb6ad11	a95c2654cda	2	\N	\N	\N
a95c2654cda	a95c2654cda	0	f	actions	\N
e32e2e04e95	a95c2654cda	1	\N	\N	1
p2f38zatpcp	3c79e120274	3	\N	\N	\N
a35efb6ad11	3c79e120274	2	\N	\N	\N
3c79e120274	3c79e120274	0	f	actions	\N
e32e2e04e95	3c79e120274	1	\N	\N	2
p2f38zatpcp	0fd891694af	3	\N	\N	\N
a35efb6ad11	0fd891694af	2	\N	\N	\N
0fd891694af	0fd891694af	0	f	actions	\N
e32e2e04e95	0fd891694af	1	\N	\N	3
p2f38zatpcp	06991026dc8	4	\N	\N	\N
a35efb6ad11	06991026dc8	3	\N	\N	\N
e32e2e04e95	06991026dc8	2	\N	\N	\N
06991026dc8	06991026dc8	0	t	page	\N
3c79e120274	06991026dc8	1	\N	\N	1
p2f38zatpcp	c5977031d6b	5	\N	\N	\N
a35efb6ad11	c5977031d6b	4	\N	\N	\N
e32e2e04e95	c5977031d6b	3	\N	\N	\N
3c79e120274	c5977031d6b	2	\N	\N	\N
c5977031d6b	c5977031d6b	0	f	tabs	\N
06991026dc8	c5977031d6b	1	\N	\N	1
p2f38zatpcp	36ec61dd418	6	\N	\N	\N
a35efb6ad11	36ec61dd418	5	\N	\N	\N
e32e2e04e95	36ec61dd418	4	\N	\N	\N
3c79e120274	36ec61dd418	3	\N	\N	\N
06991026dc8	36ec61dd418	2	\N	\N	\N
36ec61dd418	36ec61dd418	0	t	grid	\N
c5977031d6b	36ec61dd418	1	\N	\N	1
06991026dc8	3083a65b723	3	\N	\N	\N
c5977031d6b	3083a65b723	2	\N	\N	\N
3083a65b723	3083a65b723	0	f	items	\N
36ec61dd418	3083a65b723	1	\N	\N	1
p2f38zatpcp	e816fb7cb72	8	\N	\N	\N
a35efb6ad11	e816fb7cb72	7	\N	\N	\N
e32e2e04e95	e816fb7cb72	6	\N	\N	\N
3c79e120274	e816fb7cb72	5	\N	\N	\N
06991026dc8	e816fb7cb72	4	\N	\N	\N
c5977031d6b	e816fb7cb72	3	\N	\N	\N
36ec61dd418	e816fb7cb72	2	\N	\N	\N
e816fb7cb72	e816fb7cb72	0	f	grid	\N
3083a65b723	e816fb7cb72	1	\N	\N	1
p2f38zatpcp	d579beec4b7	9	\N	\N	\N
a35efb6ad11	d579beec4b7	8	\N	\N	\N
e32e2e04e95	d579beec4b7	7	\N	\N	\N
3c79e120274	d579beec4b7	6	\N	\N	\N
06991026dc8	d579beec4b7	5	\N	\N	\N
c5977031d6b	d579beec4b7	4	\N	\N	\N
36ec61dd418	d579beec4b7	3	\N	\N	\N
3083a65b723	d579beec4b7	2	\N	\N	\N
d579beec4b7	d579beec4b7	0	f	items	\N
e816fb7cb72	d579beec4b7	1	\N	\N	1
p2f38zatpcp	199e3b15da5	10	\N	\N	\N
a35efb6ad11	199e3b15da5	9	\N	\N	\N
e32e2e04e95	199e3b15da5	8	\N	\N	\N
3c79e120274	199e3b15da5	7	\N	\N	\N
06991026dc8	199e3b15da5	6	\N	\N	\N
c5977031d6b	199e3b15da5	5	\N	\N	\N
36ec61dd418	199e3b15da5	4	\N	\N	\N
3083a65b723	199e3b15da5	3	\N	\N	\N
e816fb7cb72	199e3b15da5	2	\N	\N	\N
199e3b15da5	199e3b15da5	0	f	field	\N
d579beec4b7	199e3b15da5	1	\N	\N	1
p2f38zatpcp	686eab04705	9	\N	\N	\N
a35efb6ad11	686eab04705	8	\N	\N	\N
e32e2e04e95	686eab04705	7	\N	\N	\N
3c79e120274	686eab04705	6	\N	\N	\N
06991026dc8	686eab04705	5	\N	\N	\N
c5977031d6b	686eab04705	4	\N	\N	\N
36ec61dd418	686eab04705	3	\N	\N	\N
3083a65b723	686eab04705	2	\N	\N	\N
686eab04705	686eab04705	0	f	items	\N
e816fb7cb72	686eab04705	1	\N	\N	2
p2f38zatpcp	b77b415ddd9	10	\N	\N	\N
a35efb6ad11	b77b415ddd9	9	\N	\N	\N
e32e2e04e95	b77b415ddd9	8	\N	\N	\N
3c79e120274	b77b415ddd9	7	\N	\N	\N
06991026dc8	b77b415ddd9	6	\N	\N	\N
c5977031d6b	b77b415ddd9	5	\N	\N	\N
36ec61dd418	b77b415ddd9	4	\N	\N	\N
e816fb7cb72	b77b415ddd9	2	\N	\N	\N
3083a65b723	b77b415ddd9	3	\N	\N	\N
b77b415ddd9	b77b415ddd9	0	f	field	\N
686eab04705	b77b415ddd9	1	\N	\N	1
p2f38zatpcp	48b0024753d	9	\N	\N	\N
a35efb6ad11	48b0024753d	8	\N	\N	\N
e32e2e04e95	48b0024753d	7	\N	\N	\N
3c79e120274	48b0024753d	6	\N	\N	\N
06991026dc8	48b0024753d	5	\N	\N	\N
c5977031d6b	48b0024753d	4	\N	\N	\N
3083a65b723	48b0024753d	2	\N	\N	\N
36ec61dd418	48b0024753d	3	\N	\N	\N
48b0024753d	48b0024753d	0	f	items	\N
e816fb7cb72	48b0024753d	1	\N	\N	3
p2f38zatpcp	f4e9a78c3e5	10	\N	\N	\N
a35efb6ad11	f4e9a78c3e5	9	\N	\N	\N
e32e2e04e95	f4e9a78c3e5	8	\N	\N	\N
3c79e120274	f4e9a78c3e5	7	\N	\N	\N
06991026dc8	f4e9a78c3e5	6	\N	\N	\N
c5977031d6b	f4e9a78c3e5	5	\N	\N	\N
3083a65b723	f4e9a78c3e5	3	\N	\N	\N
36ec61dd418	f4e9a78c3e5	4	\N	\N	\N
e816fb7cb72	f4e9a78c3e5	2	\N	\N	\N
f4e9a78c3e5	f4e9a78c3e5	0	f	field	\N
48b0024753d	f4e9a78c3e5	1	\N	\N	1
p2f38zatpcp	6472164b998	9	\N	\N	\N
a35efb6ad11	6472164b998	8	\N	\N	\N
e32e2e04e95	6472164b998	7	\N	\N	\N
3c79e120274	6472164b998	6	\N	\N	\N
06991026dc8	6472164b998	5	\N	\N	\N
c5977031d6b	6472164b998	4	\N	\N	\N
3083a65b723	6472164b998	2	\N	\N	\N
36ec61dd418	6472164b998	3	\N	\N	\N
6472164b998	6472164b998	0	f	items	\N
e816fb7cb72	6472164b998	1	\N	\N	4
p2f38zatpcp	d441f11007e	10	\N	\N	\N
a35efb6ad11	d441f11007e	9	\N	\N	\N
e32e2e04e95	d441f11007e	8	\N	\N	\N
3c79e120274	d441f11007e	7	\N	\N	\N
06991026dc8	d441f11007e	6	\N	\N	\N
c5977031d6b	d441f11007e	5	\N	\N	\N
3083a65b723	d441f11007e	3	\N	\N	\N
36ec61dd418	d441f11007e	4	\N	\N	\N
e816fb7cb72	d441f11007e	2	\N	\N	\N
d441f11007e	d441f11007e	0	f	field	\N
6472164b998	d441f11007e	1	\N	\N	1
p2f38zatpcp	42f651de83c	8	\N	\N	\N
a35efb6ad11	42f651de83c	7	\N	\N	\N
e32e2e04e95	42f651de83c	6	\N	\N	\N
3c79e120274	42f651de83c	5	\N	\N	\N
06991026dc8	42f651de83c	4	\N	\N	\N
36ec61dd418	42f651de83c	2	\N	\N	\N
c5977031d6b	42f651de83c	3	\N	\N	\N
42f651de83c	42f651de83c	0	f	actions	\N
3083a65b723	42f651de83c	1	\N	\N	1
p2f38zatpcp	eeedaac817f	5	\N	\N	\N
a35efb6ad11	eeedaac817f	4	\N	\N	\N
1a101a13fb3	eeedaac817f	2	\N	\N	\N
e32e2e04e95	eeedaac817f	3	\N	\N	\N
eeedaac817f	eeedaac817f	0	t	page	\N
ff9e29d71a5	eeedaac817f	1	\N	\N	1
p2f38zatpcp	bc9432120b4	6	\N	\N	\N
a35efb6ad11	bc9432120b4	5	\N	\N	\N
1a101a13fb3	bc9432120b4	3	\N	\N	\N
e32e2e04e95	bc9432120b4	4	\N	\N	\N
ff9e29d71a5	bc9432120b4	2	\N	\N	\N
bc9432120b4	bc9432120b4	0	f	tabs	\N
eeedaac817f	bc9432120b4	1	\N	\N	1
p2f38zatpcp	c3cbf681c63	7	\N	\N	\N
a35efb6ad11	c3cbf681c63	6	\N	\N	\N
1a101a13fb3	c3cbf681c63	4	\N	\N	\N
e32e2e04e95	c3cbf681c63	5	\N	\N	\N
ff9e29d71a5	c3cbf681c63	3	\N	\N	\N
eeedaac817f	c3cbf681c63	2	\N	\N	\N
c3cbf681c63	c3cbf681c63	0	t	grid	\N
bc9432120b4	c3cbf681c63	1	\N	\N	1
p2f38zatpcp	f06ad2b75bf	8	\N	\N	\N
a35efb6ad11	f06ad2b75bf	7	\N	\N	\N
1a101a13fb3	f06ad2b75bf	5	\N	\N	\N
e32e2e04e95	f06ad2b75bf	6	\N	\N	\N
ff9e29d71a5	f06ad2b75bf	4	\N	\N	\N
eeedaac817f	f06ad2b75bf	3	\N	\N	\N
bc9432120b4	f06ad2b75bf	2	\N	\N	\N
f06ad2b75bf	f06ad2b75bf	0	f	items	\N
c3cbf681c63	f06ad2b75bf	1	\N	\N	1
p2f38zatpcp	3e377dd7534	9	\N	\N	\N
a35efb6ad11	3e377dd7534	8	\N	\N	\N
1a101a13fb3	3e377dd7534	6	\N	\N	\N
e32e2e04e95	3e377dd7534	7	\N	\N	\N
ff9e29d71a5	3e377dd7534	5	\N	\N	\N
eeedaac817f	3e377dd7534	4	\N	\N	\N
bc9432120b4	3e377dd7534	3	\N	\N	\N
c3cbf681c63	3e377dd7534	2	\N	\N	\N
3e377dd7534	3e377dd7534	0	f	grid	\N
f06ad2b75bf	3e377dd7534	1	\N	\N	1
p2f38zatpcp	e022821801b	10	\N	\N	\N
a35efb6ad11	e022821801b	9	\N	\N	\N
1a101a13fb3	e022821801b	7	\N	\N	\N
e32e2e04e95	e022821801b	8	\N	\N	\N
ff9e29d71a5	e022821801b	6	\N	\N	\N
eeedaac817f	e022821801b	5	\N	\N	\N
bc9432120b4	e022821801b	4	\N	\N	\N
c3cbf681c63	e022821801b	3	\N	\N	\N
f06ad2b75bf	e022821801b	2	\N	\N	\N
e022821801b	e022821801b	0	f	items	\N
3e377dd7534	e022821801b	1	\N	\N	1
p2f38zatpcp	238c6484475	11	\N	\N	\N
a35efb6ad11	238c6484475	10	\N	\N	\N
1a101a13fb3	238c6484475	8	\N	\N	\N
e32e2e04e95	238c6484475	9	\N	\N	\N
ff9e29d71a5	238c6484475	7	\N	\N	\N
eeedaac817f	238c6484475	6	\N	\N	\N
bc9432120b4	238c6484475	5	\N	\N	\N
c3cbf681c63	238c6484475	4	\N	\N	\N
f06ad2b75bf	238c6484475	3	\N	\N	\N
3e377dd7534	238c6484475	2	\N	\N	\N
p2f38zatpcp	4e0c902aedb	3	\N	\N	\N
238c6484475	238c6484475	0	f	field	\N
a35efb6ad11	4e0c902aedb	2	\N	\N	\N
e022821801b	238c6484475	1	\N	\N	1
p2f38zatpcp	59aaa65023d	10	\N	\N	\N
a35efb6ad11	59aaa65023d	9	\N	\N	\N
1a101a13fb3	59aaa65023d	7	\N	\N	\N
e32e2e04e95	59aaa65023d	8	\N	\N	\N
ff9e29d71a5	59aaa65023d	6	\N	\N	\N
eeedaac817f	59aaa65023d	5	\N	\N	\N
bc9432120b4	59aaa65023d	4	\N	\N	\N
c3cbf681c63	59aaa65023d	3	\N	\N	\N
f06ad2b75bf	59aaa65023d	2	\N	\N	\N
59aaa65023d	59aaa65023d	0	f	items	\N
3e377dd7534	59aaa65023d	1	\N	\N	2
p2f38zatpcp	7cd6d806589	11	\N	\N	\N
a35efb6ad11	7cd6d806589	10	\N	\N	\N
1a101a13fb3	7cd6d806589	8	\N	\N	\N
e32e2e04e95	7cd6d806589	9	\N	\N	\N
ff9e29d71a5	7cd6d806589	7	\N	\N	\N
eeedaac817f	7cd6d806589	6	\N	\N	\N
bc9432120b4	7cd6d806589	5	\N	\N	\N
c3cbf681c63	7cd6d806589	4	\N	\N	\N
f06ad2b75bf	7cd6d806589	3	\N	\N	\N
3e377dd7534	7cd6d806589	2	\N	\N	\N
7cd6d806589	7cd6d806589	0	f	field	\N
59aaa65023d	7cd6d806589	1	\N	\N	1
p2f38zatpcp	7a08f2f0923	10	\N	\N	\N
a35efb6ad11	7a08f2f0923	9	\N	\N	\N
1a101a13fb3	7a08f2f0923	7	\N	\N	\N
e32e2e04e95	7a08f2f0923	8	\N	\N	\N
ff9e29d71a5	7a08f2f0923	6	\N	\N	\N
eeedaac817f	7a08f2f0923	5	\N	\N	\N
bc9432120b4	7a08f2f0923	4	\N	\N	\N
c3cbf681c63	7a08f2f0923	3	\N	\N	\N
f06ad2b75bf	7a08f2f0923	2	\N	\N	\N
7a08f2f0923	7a08f2f0923	0	f	items	\N
3e377dd7534	7a08f2f0923	1	\N	\N	3
p2f38zatpcp	71afb45a4da	11	\N	\N	\N
a35efb6ad11	71afb45a4da	10	\N	\N	\N
1a101a13fb3	71afb45a4da	8	\N	\N	\N
e32e2e04e95	71afb45a4da	9	\N	\N	\N
ff9e29d71a5	71afb45a4da	7	\N	\N	\N
eeedaac817f	71afb45a4da	6	\N	\N	\N
bc9432120b4	71afb45a4da	5	\N	\N	\N
c3cbf681c63	71afb45a4da	4	\N	\N	\N
f06ad2b75bf	71afb45a4da	3	\N	\N	\N
3e377dd7534	71afb45a4da	2	\N	\N	\N
71afb45a4da	71afb45a4da	0	f	field	\N
7a08f2f0923	71afb45a4da	1	\N	\N	1
p2f38zatpcp	4d920e3f887	9	\N	\N	\N
a35efb6ad11	4d920e3f887	8	\N	\N	\N
1a101a13fb3	4d920e3f887	6	\N	\N	\N
e32e2e04e95	4d920e3f887	7	\N	\N	\N
ff9e29d71a5	4d920e3f887	5	\N	\N	\N
eeedaac817f	4d920e3f887	4	\N	\N	\N
bc9432120b4	4d920e3f887	3	\N	\N	\N
c3cbf681c63	4d920e3f887	2	\N	\N	\N
4d920e3f887	4d920e3f887	0	f	actions	\N
f06ad2b75bf	4d920e3f887	1	\N	\N	1
p2f38zatpcp	72f060f0b63	2	\N	\N	\N
72f060f0b63	72f060f0b63	0	f	items	\N
a35efb6ad11	72f060f0b63	1	\N	\N	3
p2f38zatpcp	ce2f74e6a81	3	\N	\N	\N
a35efb6ad11	ce2f74e6a81	2	\N	\N	\N
ce2f74e6a81	ce2f74e6a81	0	f	columns	\N
72f060f0b63	ce2f74e6a81	1	\N	\N	1
p2f38zatpcp	de99a56a486	3	\N	\N	\N
a35efb6ad11	de99a56a486	2	\N	\N	\N
de99a56a486	de99a56a486	0	f	columns	\N
72f060f0b63	cc68fa051a6	1	\N	\N	2
p2f38zatpcp	fa82789f63d	4	\N	\N	\N
a35efb6ad11	fa82789f63d	3	\N	\N	\N
72f060f0b63	fa82789f63d	2	\N	\N	\N
fa82789f63d	fa82789f63d	0	f	field	\N
de99a56a486	fa82789f63d	1	\N	\N	1
p2f38zatpcp	84f7e6465c5	3	\N	\N	\N
a35efb6ad11	84f7e6465c5	2	\N	\N	\N
84f7e6465c5	84f7e6465c5	0	f	columns	\N
p2f38zatpcp	75f07fe48ba	3	\N	\N	\N
p2f38zatpcp	40c864f2f59	4	\N	\N	\N
a35efb6ad11	40c864f2f59	3	\N	\N	\N
72f060f0b63	40c864f2f59	2	\N	\N	\N
40c864f2f59	40c864f2f59	0	f	field	\N
84f7e6465c5	40c864f2f59	1	\N	\N	1
a35efb6ad11	75f07fe48ba	2	\N	\N	\N
c9acdbf008f	c9acdbf008f	0	f	field	\N
dc9f68e6631	c9acdbf008f	1	\N	\N	1
p2f38zatpcp	c9acdbf008f	4	\N	\N	\N
p2f38zatpcp	dc9f68e6631	3	\N	\N	\N
a35efb6ad11	c9acdbf008f	3	\N	\N	\N
a35efb6ad11	dc9f68e6631	2	\N	\N	\N
72f060f0b63	c9acdbf008f	2	\N	\N	\N
dc9f68e6631	dc9f68e6631	0	f	columns	\N
72f060f0b63	84f7e6465c5	1	\N	\N	4
72f060f0b63	de99a56a486	1	\N	\N	3
72f060f0b63	dc9f68e6631	1	\N	\N	2
p2f38zatpcp	3515d30f990	3	\N	\N	\N
a35efb6ad11	3515d30f990	2	\N	\N	\N
3515d30f990	3515d30f990	0	f	actions	\N
72f060f0b63	3515d30f990	1	\N	\N	1
p2f38zatpcp	cc68fa051a6	3	\N	\N	\N
a35efb6ad11	cc68fa051a6	2	\N	\N	\N
cc68fa051a6	cc68fa051a6	0	f	actions	\N
75f07fe48ba	75f07fe48ba	0	f	actions	\N
72f060f0b63	75f07fe48ba	1	\N	\N	3
p2f38zatpcp	b4f84505e09	4	\N	\N	\N
a35efb6ad11	b4f84505e09	3	\N	\N	\N
72f060f0b63	b4f84505e09	2	\N	\N	\N
b4f84505e09	b4f84505e09	0	t	page	\N
cc68fa051a6	b4f84505e09	1	\N	\N	1
p2f38zatpcp	397286dbe81	5	\N	\N	\N
a35efb6ad11	397286dbe81	4	\N	\N	\N
72f060f0b63	397286dbe81	3	\N	\N	\N
cc68fa051a6	397286dbe81	2	\N	\N	\N
397286dbe81	397286dbe81	0	f	tabs	\N
b4f84505e09	397286dbe81	1	\N	\N	1
p2f38zatpcp	39853e87235	6	\N	\N	\N
a35efb6ad11	39853e87235	5	\N	\N	\N
72f060f0b63	39853e87235	4	\N	\N	\N
cc68fa051a6	39853e87235	3	\N	\N	\N
b4f84505e09	39853e87235	2	\N	\N	\N
39853e87235	39853e87235	0	t	grid	\N
397286dbe81	39853e87235	1	\N	\N	1
p2f38zatpcp	954c469773b	7	\N	\N	\N
a35efb6ad11	954c469773b	6	\N	\N	\N
72f060f0b63	954c469773b	5	\N	\N	\N
cc68fa051a6	954c469773b	4	\N	\N	\N
b4f84505e09	954c469773b	3	\N	\N	\N
397286dbe81	954c469773b	2	\N	\N	\N
954c469773b	954c469773b	0	f	items	\N
39853e87235	954c469773b	1	\N	\N	1
p2f38zatpcp	b438a51d8cb	8	\N	\N	\N
a35efb6ad11	b438a51d8cb	7	\N	\N	\N
72f060f0b63	b438a51d8cb	6	\N	\N	\N
cc68fa051a6	b438a51d8cb	5	\N	\N	\N
b4f84505e09	b438a51d8cb	4	\N	\N	\N
397286dbe81	b438a51d8cb	3	\N	\N	\N
39853e87235	b438a51d8cb	2	\N	\N	\N
b438a51d8cb	b438a51d8cb	0	f	grid	\N
954c469773b	b438a51d8cb	1	\N	\N	1
p2f38zatpcp	457d22d1f31	9	\N	\N	\N
a35efb6ad11	457d22d1f31	8	\N	\N	\N
72f060f0b63	457d22d1f31	7	\N	\N	\N
cc68fa051a6	457d22d1f31	6	\N	\N	\N
b4f84505e09	457d22d1f31	5	\N	\N	\N
397286dbe81	457d22d1f31	4	\N	\N	\N
39853e87235	457d22d1f31	3	\N	\N	\N
954c469773b	457d22d1f31	2	\N	\N	\N
457d22d1f31	457d22d1f31	0	f	items	\N
b438a51d8cb	457d22d1f31	1	\N	\N	1
p2f38zatpcp	025881d9aac	10	\N	\N	\N
a35efb6ad11	025881d9aac	9	\N	\N	\N
72f060f0b63	025881d9aac	8	\N	\N	\N
cc68fa051a6	025881d9aac	7	\N	\N	\N
b4f84505e09	025881d9aac	6	\N	\N	\N
397286dbe81	025881d9aac	5	\N	\N	\N
39853e87235	025881d9aac	4	\N	\N	\N
954c469773b	025881d9aac	3	\N	\N	\N
b438a51d8cb	025881d9aac	2	\N	\N	\N
025881d9aac	025881d9aac	0	f	field	\N
457d22d1f31	025881d9aac	1	\N	\N	1
p2f38zatpcp	48108637f06	9	\N	\N	\N
a35efb6ad11	48108637f06	8	\N	\N	\N
72f060f0b63	48108637f06	7	\N	\N	\N
cc68fa051a6	48108637f06	6	\N	\N	\N
b4f84505e09	48108637f06	5	\N	\N	\N
397286dbe81	48108637f06	4	\N	\N	\N
39853e87235	48108637f06	3	\N	\N	\N
954c469773b	48108637f06	2	\N	\N	\N
48108637f06	48108637f06	0	f	items	\N
b438a51d8cb	48108637f06	1	\N	\N	2
p2f38zatpcp	b27aa52d5c6	10	\N	\N	\N
a35efb6ad11	b27aa52d5c6	9	\N	\N	\N
72f060f0b63	b27aa52d5c6	8	\N	\N	\N
cc68fa051a6	b27aa52d5c6	7	\N	\N	\N
b4f84505e09	b27aa52d5c6	6	\N	\N	\N
397286dbe81	b27aa52d5c6	5	\N	\N	\N
39853e87235	b27aa52d5c6	4	\N	\N	\N
954c469773b	b27aa52d5c6	3	\N	\N	\N
b438a51d8cb	b27aa52d5c6	2	\N	\N	\N
b27aa52d5c6	b27aa52d5c6	0	f	field	\N
48108637f06	b27aa52d5c6	1	\N	\N	1
p2f38zatpcp	741e01ecd02	8	\N	\N	\N
a35efb6ad11	741e01ecd02	7	\N	\N	\N
72f060f0b63	741e01ecd02	6	\N	\N	\N
cc68fa051a6	741e01ecd02	5	\N	\N	\N
b4f84505e09	741e01ecd02	4	\N	\N	\N
397286dbe81	741e01ecd02	3	\N	\N	\N
39853e87235	741e01ecd02	2	\N	\N	\N
741e01ecd02	741e01ecd02	0	f	actions	\N
954c469773b	741e01ecd02	1	\N	\N	1
p2f38zatpcp	4cd02d1443c	4	\N	\N	\N
a35efb6ad11	4cd02d1443c	3	\N	\N	\N
72f060f0b63	4cd02d1443c	2	\N	\N	\N
4cd02d1443c	4cd02d1443c	0	f	actions	\N
ce2f74e6a81	4cd02d1443c	1	\N	\N	1
p2f38zatpcp	5e57403f834	4	\N	\N	\N
a35efb6ad11	5e57403f834	3	\N	\N	\N
72f060f0b63	5e57403f834	2	\N	\N	\N
5e57403f834	5e57403f834	0	f	actions	\N
ce2f74e6a81	5e57403f834	1	\N	\N	2
p2f38zatpcp	b02e09e7b7f	3	\N	\N	\N
a35efb6ad11	b02e09e7b7f	2	\N	\N	\N
b02e09e7b7f	b02e09e7b7f	0	f	columns	\N
72f060f0b63	b02e09e7b7f	1	\N	\N	5
p2f38zatpcp	cf1b70bcc1b	4	\N	\N	\N
a35efb6ad11	cf1b70bcc1b	3	\N	\N	\N
72f060f0b63	cf1b70bcc1b	2	\N	\N	\N
cf1b70bcc1b	cf1b70bcc1b	0	f	field	\N
b02e09e7b7f	cf1b70bcc1b	1	\N	\N	1
p2f38zatpcp	7cc312c10f5	3	\N	\N	\N
a35efb6ad11	7cc312c10f5	2	\N	\N	\N
7cc312c10f5	7cc312c10f5	0	f	columns	\N
72f060f0b63	7cc312c10f5	1	\N	\N	6
p2f38zatpcp	f80863d5729	4	\N	\N	\N
a35efb6ad11	f80863d5729	3	\N	\N	\N
72f060f0b63	f80863d5729	2	\N	\N	\N
f80863d5729	f80863d5729	0	f	field	\N
7cc312c10f5	f80863d5729	1	\N	\N	1
4e0c902aedb	4e0c902aedb	0	f	actions	\N
cf79155dd3f	4e0c902aedb	1	\N	\N	2
p2f38zatpcp	7c5982b99b0	3	\N	\N	\N
a35efb6ad11	7c5982b99b0	2	\N	\N	\N
7c5982b99b0	7c5982b99b0	0	f	actions	\N
cf79155dd3f	7c5982b99b0	1	\N	\N	4
p2f38zatpcp	8c8527ce711	4	\N	\N	\N
a35efb6ad11	8c8527ce711	3	\N	\N	\N
cf79155dd3f	8c8527ce711	2	\N	\N	\N
8c8527ce711	8c8527ce711	0	t	page	\N
4e0c902aedb	8c8527ce711	1	\N	\N	1
p2f38zatpcp	35b56bab2ab	5	\N	\N	\N
a35efb6ad11	35b56bab2ab	4	\N	\N	\N
4e0c902aedb	35b56bab2ab	2	\N	\N	\N
cf79155dd3f	35b56bab2ab	3	\N	\N	\N
35b56bab2ab	35b56bab2ab	0	f	tabs	\N
8c8527ce711	35b56bab2ab	1	\N	\N	1
p2f38zatpcp	2c932d53e51	6	\N	\N	\N
a35efb6ad11	2c932d53e51	5	\N	\N	\N
4e0c902aedb	2c932d53e51	3	\N	\N	\N
cf79155dd3f	2c932d53e51	4	\N	\N	\N
8c8527ce711	2c932d53e51	2	\N	\N	\N
2c932d53e51	2c932d53e51	0	t	grid	\N
35b56bab2ab	2c932d53e51	1	\N	\N	1
p2f38zatpcp	6ec5b26278f	7	\N	\N	\N
a35efb6ad11	6ec5b26278f	6	\N	\N	\N
4e0c902aedb	6ec5b26278f	4	\N	\N	\N
cf79155dd3f	6ec5b26278f	5	\N	\N	\N
8c8527ce711	6ec5b26278f	3	\N	\N	\N
35b56bab2ab	6ec5b26278f	2	\N	\N	\N
6ec5b26278f	6ec5b26278f	0	f	items	\N
2c932d53e51	6ec5b26278f	1	\N	\N	1
p2f38zatpcp	15503049cbe	8	\N	\N	\N
a35efb6ad11	15503049cbe	7	\N	\N	\N
4e0c902aedb	15503049cbe	5	\N	\N	\N
cf79155dd3f	15503049cbe	6	\N	\N	\N
8c8527ce711	15503049cbe	4	\N	\N	\N
35b56bab2ab	15503049cbe	3	\N	\N	\N
2c932d53e51	15503049cbe	2	\N	\N	\N
15503049cbe	15503049cbe	0	f	grid	\N
6ec5b26278f	15503049cbe	1	\N	\N	1
p2f38zatpcp	1623f1c3e1c	9	\N	\N	\N
a35efb6ad11	1623f1c3e1c	8	\N	\N	\N
4e0c902aedb	1623f1c3e1c	6	\N	\N	\N
cf79155dd3f	1623f1c3e1c	7	\N	\N	\N
8c8527ce711	1623f1c3e1c	5	\N	\N	\N
35b56bab2ab	1623f1c3e1c	4	\N	\N	\N
2c932d53e51	1623f1c3e1c	3	\N	\N	\N
6ec5b26278f	1623f1c3e1c	2	\N	\N	\N
1623f1c3e1c	1623f1c3e1c	0	f	items	\N
15503049cbe	1623f1c3e1c	1	\N	\N	1
p2f38zatpcp	4345e8c8b04	10	\N	\N	\N
a35efb6ad11	4345e8c8b04	9	\N	\N	\N
4e0c902aedb	4345e8c8b04	7	\N	\N	\N
cf79155dd3f	4345e8c8b04	8	\N	\N	\N
8c8527ce711	4345e8c8b04	6	\N	\N	\N
35b56bab2ab	4345e8c8b04	5	\N	\N	\N
2c932d53e51	4345e8c8b04	4	\N	\N	\N
6ec5b26278f	4345e8c8b04	3	\N	\N	\N
15503049cbe	4345e8c8b04	2	\N	\N	\N
4345e8c8b04	4345e8c8b04	0	f	field	\N
1623f1c3e1c	4345e8c8b04	1	\N	\N	1
p2f38zatpcp	208147ec1c7	9	\N	\N	\N
a35efb6ad11	208147ec1c7	8	\N	\N	\N
4e0c902aedb	208147ec1c7	6	\N	\N	\N
cf79155dd3f	208147ec1c7	7	\N	\N	\N
8c8527ce711	208147ec1c7	5	\N	\N	\N
35b56bab2ab	208147ec1c7	4	\N	\N	\N
2c932d53e51	208147ec1c7	3	\N	\N	\N
6ec5b26278f	208147ec1c7	2	\N	\N	\N
208147ec1c7	208147ec1c7	0	f	items	\N
15503049cbe	208147ec1c7	1	\N	\N	2
p2f38zatpcp	1d543dbc33e	10	\N	\N	\N
a35efb6ad11	1d543dbc33e	9	\N	\N	\N
4e0c902aedb	1d543dbc33e	7	\N	\N	\N
cf79155dd3f	1d543dbc33e	8	\N	\N	\N
8c8527ce711	1d543dbc33e	6	\N	\N	\N
35b56bab2ab	1d543dbc33e	5	\N	\N	\N
2c932d53e51	1d543dbc33e	4	\N	\N	\N
6ec5b26278f	1d543dbc33e	3	\N	\N	\N
15503049cbe	1d543dbc33e	2	\N	\N	\N
1d543dbc33e	1d543dbc33e	0	f	field	\N
208147ec1c7	1d543dbc33e	1	\N	\N	1
p2f38zatpcp	bb4f00abef6	9	\N	\N	\N
a35efb6ad11	bb4f00abef6	8	\N	\N	\N
4e0c902aedb	bb4f00abef6	6	\N	\N	\N
cf79155dd3f	bb4f00abef6	7	\N	\N	\N
8c8527ce711	bb4f00abef6	5	\N	\N	\N
35b56bab2ab	bb4f00abef6	4	\N	\N	\N
2c932d53e51	bb4f00abef6	3	\N	\N	\N
6ec5b26278f	bb4f00abef6	2	\N	\N	\N
bb4f00abef6	bb4f00abef6	0	f	items	\N
15503049cbe	bb4f00abef6	1	\N	\N	3
p2f38zatpcp	8a7201e70d5	10	\N	\N	\N
a35efb6ad11	8a7201e70d5	9	\N	\N	\N
4e0c902aedb	8a7201e70d5	7	\N	\N	\N
cf79155dd3f	8a7201e70d5	8	\N	\N	\N
8c8527ce711	8a7201e70d5	6	\N	\N	\N
35b56bab2ab	8a7201e70d5	5	\N	\N	\N
2c932d53e51	8a7201e70d5	4	\N	\N	\N
6ec5b26278f	8a7201e70d5	3	\N	\N	\N
15503049cbe	8a7201e70d5	2	\N	\N	\N
8a7201e70d5	8a7201e70d5	0	f	field	\N
bb4f00abef6	8a7201e70d5	1	\N	\N	1
p2f38zatpcp	9f07bfa174f	9	\N	\N	\N
a35efb6ad11	9f07bfa174f	8	\N	\N	\N
4e0c902aedb	9f07bfa174f	6	\N	\N	\N
cf79155dd3f	9f07bfa174f	7	\N	\N	\N
8c8527ce711	9f07bfa174f	5	\N	\N	\N
35b56bab2ab	9f07bfa174f	4	\N	\N	\N
2c932d53e51	9f07bfa174f	3	\N	\N	\N
6ec5b26278f	9f07bfa174f	2	\N	\N	\N
9f07bfa174f	9f07bfa174f	0	f	items	\N
15503049cbe	9f07bfa174f	1	\N	\N	4
p2f38zatpcp	a526c89bbba	10	\N	\N	\N
a35efb6ad11	a526c89bbba	9	\N	\N	\N
4e0c902aedb	a526c89bbba	7	\N	\N	\N
cf79155dd3f	a526c89bbba	8	\N	\N	\N
8c8527ce711	a526c89bbba	6	\N	\N	\N
35b56bab2ab	a526c89bbba	5	\N	\N	\N
2c932d53e51	a526c89bbba	4	\N	\N	\N
6ec5b26278f	a526c89bbba	3	\N	\N	\N
15503049cbe	a526c89bbba	2	\N	\N	\N
a526c89bbba	a526c89bbba	0	f	field	\N
9f07bfa174f	a526c89bbba	1	\N	\N	1
p2f38zatpcp	1a20eb5c180	8	\N	\N	\N
a35efb6ad11	1a20eb5c180	7	\N	\N	\N
4e0c902aedb	1a20eb5c180	5	\N	\N	\N
cf79155dd3f	1a20eb5c180	6	\N	\N	\N
8c8527ce711	1a20eb5c180	4	\N	\N	\N
35b56bab2ab	1a20eb5c180	3	\N	\N	\N
2c932d53e51	1a20eb5c180	2	\N	\N	\N
1a20eb5c180	1a20eb5c180	0	f	actions	\N
6ec5b26278f	1a20eb5c180	1	\N	\N	1
p2f38zatpcp	fbf5c5b0b12	4	\N	\N	\N
a35efb6ad11	fbf5c5b0b12	3	\N	\N	\N
cf79155dd3f	fbf5c5b0b12	2	\N	\N	\N
fbf5c5b0b12	fbf5c5b0b12	0	f	actions	\N
f9b7330c3b9	fbf5c5b0b12	1	\N	\N	1
p2f38zatpcp	ea3fd7ac877	4	\N	\N	\N
cf79155dd3f	f9b7330c3b9	1	\N	\N	1
a35efb6ad11	ea3fd7ac877	3	\N	\N	\N
cf79155dd3f	ea3fd7ac877	2	\N	\N	\N
ea3fd7ac877	ea3fd7ac877	0	f	actions	\N
p2f38zatpcp	905a82748a2	3	\N	\N	\N
f9b7330c3b9	ea3fd7ac877	1	\N	\N	2
a35efb6ad11	905a82748a2	2	\N	\N	\N
p2f38zatpcp	cf79155dd3f	2	\N	\N	\N
905a82748a2	905a82748a2	0	f	columns	\N
cf79155dd3f	905a82748a2	1	\N	\N	2
p2f38zatpcp	4777a1c52e0	4	\N	\N	\N
a35efb6ad11	4777a1c52e0	3	\N	\N	\N
cf79155dd3f	4777a1c52e0	2	\N	\N	\N
m4j7efw58l2	m4j7efw58l2	0	f	\N	\N
ljfrpm7e234	ljfrpm7e234	0	f	\N	\N
57e7tzgvnoi	57e7tzgvnoi	0	f	\N	\N
dc281a93c05	dc281a93c05	0	t	page	\N
ljfrpm7e234	dc281a93c05	1	\N	\N	1
bcc5f4553dc	bcc5f4553dc	0	t	grid	\N
57e7tzgvnoi	bcc5f4553dc	1	\N	\N	1
57e7tzgvnoi	8a2411fc68f	2	\N	\N	\N
8a2411fc68f	8a2411fc68f	0	f	items	\N
bcc5f4553dc	8a2411fc68f	1	\N	\N	1
4777a1c52e0	4777a1c52e0	0	f	field	\N
905a82748a2	4777a1c52e0	1	\N	\N	1
p2f38zatpcp	e41c4b8e1ad	3	\N	\N	\N
a35efb6ad11	e41c4b8e1ad	2	\N	\N	\N
cf79155dd3f	cf79155dd3f	0	f	items	\N
a35efb6ad11	cf79155dd3f	1	\N	\N	4
p2f38zatpcp	f9b7330c3b9	3	\N	\N	\N
a35efb6ad11	f9b7330c3b9	2	\N	\N	\N
f9b7330c3b9	f9b7330c3b9	0	f	columns	\N
e41c4b8e1ad	e41c4b8e1ad	0	f	columns	\N
cf79155dd3f	e41c4b8e1ad	1	\N	\N	3
p2f38zatpcp	f5e076581dd	4	\N	\N	\N
a35efb6ad11	f5e076581dd	3	\N	\N	\N
cf79155dd3f	f5e076581dd	2	\N	\N	\N
f5e076581dd	f5e076581dd	0	f	field	\N
e41c4b8e1ad	f5e076581dd	1	\N	\N	1
p2f38zatpcp	57f48c560f8	3	\N	\N	\N
a35efb6ad11	57f48c560f8	2	\N	\N	\N
57f48c560f8	57f48c560f8	0	f	columns	\N
cf79155dd3f	57f48c560f8	1	\N	\N	4
p2f38zatpcp	34bb98fe895	4	\N	\N	\N
a35efb6ad11	34bb98fe895	3	\N	\N	\N
cf79155dd3f	34bb98fe895	2	\N	\N	\N
34bb98fe895	34bb98fe895	0	f	field	\N
57f48c560f8	34bb98fe895	1	\N	\N	1
p2f38zatpcp	995aecb149b	3	\N	\N	\N
a35efb6ad11	995aecb149b	2	\N	\N	\N
995aecb149b	995aecb149b	0	f	columns	\N
cf79155dd3f	995aecb149b	1	\N	\N	5
p2f38zatpcp	709ef69dec0	4	\N	\N	\N
a35efb6ad11	709ef69dec0	3	\N	\N	\N
cf79155dd3f	709ef69dec0	2	\N	\N	\N
709ef69dec0	709ef69dec0	0	f	field	\N
995aecb149b	709ef69dec0	1	\N	\N	1
\.


--
-- TOC entry 4306 (class 0 OID 16729)
-- Dependencies: 259
-- Data for Name: flowModels; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."flowModels" (uid, name, options) FROM stdin;
jxjso55xh8k	jxjso55xh8k	{"schema":{"use":"RouteModel"}}
0fa2yc47a4c	0fa2yc47a4c	{"schema":{"use":"RouteModel"}}
p2f38zatpcp	p2f38zatpcp	{"schema":{"use":"RouteModel"}}
0fa7d5aba7a	0fa7d5aba7a	{"parentId":"0fa2yc47a4c","subKey":"page","subType":"object","use":"RootPageModel","stepParams":{},"sortIndex":0,"flowRegistry":{}}
38e359364be	38e359364be	{"use":"TableActionsColumnModel","parentId":"0a4e37a3032","subKey":"columns","subType":"array","stepParams":{},"sortIndex":0,"flowRegistry":{}}
21130803aa3	21130803aa3	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects","fieldPath":"id"}},"tableColumnSettings":{"model":{"use":"DisplayNumberFieldModel"}}},"parentId":"0a4e37a3032","subKey":"columns","subType":"array","sortIndex":2,"flowRegistry":{}}
2141e9f6bb4	2141e9f6bb4	{"use":"DisplayNumberFieldModel","props":null,"parentId":"21130803aa3","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
78e58d3a988	78e58d3a988	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects","fieldPath":"name"}},"tableColumnSettings":{"model":{"use":"DisplayTextFieldModel"}}},"parentId":"0a4e37a3032","subKey":"columns","subType":"array","sortIndex":3,"flowRegistry":{}}
7f5063ba236	7f5063ba236	{"use":"DisplayTextFieldModel","props":null,"parentId":"78e58d3a988","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
521c3ac8729	521c3ac8729	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects","fieldPath":"image"}},"tableColumnSettings":{"model":{"use":"DisplayPreviewFieldModel"}}},"parentId":"0a4e37a3032","subKey":"columns","subType":"array","sortIndex":4,"flowRegistry":{}}
968ab16502e	968ab16502e	{"use":"DisplayPreviewFieldModel","props":null,"parentId":"521c3ac8729","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
eaf65338606	eaf65338606	{"use":"FilterActionModel","parentId":"0a4e37a3032","subKey":"actions","subType":"array","stepParams":{},"sortIndex":1,"flowRegistry":{}}
2be8852ac4f	2be8852ac4f	{"use":"AddNewActionModel","parentId":"0a4e37a3032","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects","dataSourceKey":"main"}}},"sortIndex":2,"flowRegistry":{}}
3cec61ad9a4	3cec61ad9a4	{"use":"BulkDeleteActionModel","parentId":"0a4e37a3032","subKey":"actions","subType":"array","stepParams":{},"sortIndex":3,"flowRegistry":{}}
35e2081403f	35e2081403f	{"use":"ViewActionModel","parentId":"38e359364be","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects","dataSourceKey":"main"}},"buttonSettings":{"general":{"type":"link","icon":null}}},"sortIndex":1,"flowRegistry":{}}
1cf8474e451	1cf8474e451	{"use":"EditActionModel","parentId":"38e359364be","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects","dataSourceKey":"main"}},"buttonSettings":{"general":{"type":"link","icon":null}}},"sortIndex":3,"flowRegistry":{}}
c57b5ba5849	c57b5ba5849	{"parentId":"2be8852ac4f","subKey":"page","subType":"object","use":"ChildPageModel","stepParams":{"pageSettings":{"general":{"displayTitle":false,"enableTabs":true}}},"sortIndex":0,"flowRegistry":{}}
0526adbf110	0526adbf110	{"use":"ChildPageTabModel","stepParams":{"pageTabSettings":{"tab":{"title":"{{t(\\"Add new\\")}}"}}},"parentId":"c57b5ba5849","subKey":"tabs","subType":"array","sortIndex":0,"flowRegistry":{}}
50e7b165f62	50e7b165f62	{"parentId":"0526adbf110","subKey":"grid","subType":"object","use":"BlockGridModel","stepParams":{},"sortIndex":0,"flowRegistry":{},"filterManager":[]}
abdf845ed14	abdf845ed14	{"use":"CreateFormModel","stepParams":{"resourceSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects"}}},"parentId":"50e7b165f62","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
51ddf701380	51ddf701380	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects","fieldPath":"name"}}},"parentId":"f93eec1567c","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
49cbec68b90	49cbec68b90	{"use":"InputFieldModel","props":null,"parentId":"51ddf701380","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
66d7ff7c061	66d7ff7c061	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects","fieldPath":"image"}}},"parentId":"f93eec1567c","subKey":"items","subType":"array","sortIndex":2,"flowRegistry":{}}
1570aaec497	1570aaec497	{"use":"UploadFieldModel","props":null,"parentId":"66d7ff7c061","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
260356f8aac	260356f8aac	{"use":"FormSubmitActionModel","parentId":"abdf845ed14","subKey":"actions","subType":"array","stepParams":{},"sortIndex":1,"flowRegistry":{}}
81686b64c59	81686b64c59	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects","fieldPath":"parent"}}},"parentId":"f93eec1567c","subKey":"items","subType":"array","sortIndex":3,"flowRegistry":{}}
a8891a753ff	a8891a753ff	{"use":"CascadeSelectFieldModel","props":null,"parentId":"81686b64c59","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
a35efb6ad11	a35efb6ad11	{"parentId":"p2f38zatpcp","subKey":"grid","subType":"object","use":"BlockGridModel","stepParams":{"gridSettings":{"grid":{"rows":{"08989q8epdu":[["0a4e37a3032"]],"8sr6pqhqacb":[["e32e2e04e95"]],"yar9mer1umo":[["72f060f0b63"]]},"sizes":{},"rowOrder":["08989q8epdu","8sr6pqhqacb","yar9mer1umo"]}}},"sortIndex":0,"flowRegistry":{},"filterManager":[]}
f93eec1567c	f93eec1567c	{"use":"FormGridModel","parentId":"abdf845ed14","subKey":"grid","subType":"object","stepParams":{"gridSettings":{"grid":{"rows":{"nmr687ik44y":[["81686b64c59","51ddf701380"]],"shjtbn5ll33":[["66d7ff7c061"]]},"sizes":{"nmr687ik44y":[24]},"rowOrder":["nmr687ik44y","shjtbn5ll33"]}}},"sortIndex":1,"flowRegistry":{}}
107209482a0	107209482a0	{"parentId":"1cf8474e451","subKey":"page","subType":"object","use":"ChildPageModel","stepParams":{"pageSettings":{"general":{"displayTitle":false,"enableTabs":true}}},"sortIndex":0,"flowRegistry":{}}
3af181ef464	3af181ef464	{"use":"ChildPageTabModel","stepParams":{"pageTabSettings":{"tab":{"title":"{{t(\\"Edit\\")}}"}}},"parentId":"107209482a0","subKey":"tabs","subType":"array","sortIndex":0,"flowRegistry":{}}
8e7911ae393	8e7911ae393	{"parentId":"3af181ef464","subKey":"grid","subType":"object","use":"BlockGridModel","stepParams":{},"sortIndex":0,"flowRegistry":{},"filterManager":[]}
42242d41077	42242d41077	{"use":"EditFormModel","stepParams":{"resourceSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects","filterByTk":"{{ctx.view.inputArgs.filterByTk}}"}}},"parentId":"8e7911ae393","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
43b941fba10	43b941fba10	{"use":"FormGridModel","parentId":"42242d41077","subKey":"grid","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
9081feebf09	9081feebf09	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects","fieldPath":"name"}}},"parentId":"43b941fba10","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
83bf1dd2633	83bf1dd2633	{"use":"InputFieldModel","props":null,"parentId":"9081feebf09","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
5c488f7a73f	5c488f7a73f	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects","fieldPath":"image"}}},"parentId":"43b941fba10","subKey":"items","subType":"array","sortIndex":2,"flowRegistry":{}}
d4f7470a863	d4f7470a863	{"use":"UploadFieldModel","props":null,"parentId":"5c488f7a73f","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
9624f270352	9624f270352	{"use":"FormSubmitActionModel","parentId":"42242d41077","subKey":"actions","subType":"array","stepParams":{},"sortIndex":1,"flowRegistry":{}}
0a4e37a3032	0a4e37a3032	{"use":"TableBlockModel","stepParams":{"resourceSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects"}},"dataLoadingModeSettings":{"mode":"auto"},"tableSettings":{"treeTable":{"treeTable":true}},"cardSettings":{"titleDescription":{"title":"Vehicle Objects"}}},"parentId":"a35efb6ad11","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
1a101a13fb3	1a101a13fb3	{"use":"TableActionsColumnModel","parentId":"e32e2e04e95","subKey":"columns","subType":"array","stepParams":{},"sortIndex":0,"flowRegistry":{}}
82ef459abe9	82ef459abe9	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"name"}},"tableColumnSettings":{"model":{"use":"DisplayTextFieldModel"}}},"parentId":"e32e2e04e95","subKey":"columns","subType":"array","sortIndex":2,"flowRegistry":{}}
ff5d6948f8b	ff5d6948f8b	{"use":"DisplayTextFieldModel","props":null,"parentId":"82ef459abe9","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_items","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
ae0e084849d	ae0e084849d	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"category"}},"tableColumnSettings":{"model":{"use":"DisplayTextFieldModel"}}},"parentId":"e32e2e04e95","subKey":"columns","subType":"array","sortIndex":3,"flowRegistry":{}}
1e9a9a2201b	1e9a9a2201b	{"use":"DisplayTextFieldModel","props":null,"parentId":"ae0e084849d","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_items","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
c77e29540cd	c77e29540cd	{"use":"DisplayTextFieldModel","props":null,"parentId":"8a2ff04a8d8","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_items","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
c6d4e863058	c6d4e863058	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"id"}},"tableColumnSettings":{"model":{"use":"DisplayNumberFieldModel"}}},"parentId":"e32e2e04e95","subKey":"columns","subType":"array","sortIndex":5,"flowRegistry":{}}
2f4ca2a1d19	2f4ca2a1d19	{"use":"DisplayNumberFieldModel","props":null,"parentId":"c6d4e863058","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_items","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
8102bf42424	8102bf42424	{"use":"ViewActionModel","parentId":"1a101a13fb3","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_items","dataSourceKey":"main"}},"buttonSettings":{"general":{"type":"link","icon":null}}},"sortIndex":1,"flowRegistry":{}}
ff9e29d71a5	ff9e29d71a5	{"use":"EditActionModel","parentId":"1a101a13fb3","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_items","dataSourceKey":"main"}},"buttonSettings":{"general":{"type":"link","icon":null}}},"sortIndex":2,"flowRegistry":{}}
a95c2654cda	a95c2654cda	{"use":"FilterActionModel","parentId":"e32e2e04e95","subKey":"actions","subType":"array","stepParams":{},"sortIndex":1,"flowRegistry":{}}
3c79e120274	3c79e120274	{"use":"AddNewActionModel","parentId":"e32e2e04e95","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_items","dataSourceKey":"main"}}},"sortIndex":2,"flowRegistry":{}}
0fd891694af	0fd891694af	{"use":"BulkDeleteActionModel","parentId":"e32e2e04e95","subKey":"actions","subType":"array","stepParams":{},"sortIndex":3,"flowRegistry":{}}
06991026dc8	06991026dc8	{"parentId":"3c79e120274","subKey":"page","subType":"object","use":"ChildPageModel","stepParams":{"pageSettings":{"general":{"displayTitle":false,"enableTabs":true}}},"sortIndex":0,"flowRegistry":{}}
c5977031d6b	c5977031d6b	{"use":"ChildPageTabModel","stepParams":{"pageTabSettings":{"tab":{"title":"{{t(\\"Add new\\")}}"}}},"parentId":"06991026dc8","subKey":"tabs","subType":"array","sortIndex":0,"flowRegistry":{}}
36ec61dd418	36ec61dd418	{"parentId":"c5977031d6b","subKey":"grid","subType":"object","use":"BlockGridModel","stepParams":{},"sortIndex":0,"flowRegistry":{},"filterManager":[]}
3083a65b723	3083a65b723	{"use":"CreateFormModel","stepParams":{"resourceSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items"}}},"parentId":"36ec61dd418","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
8a2ff04a8d8	8a2ff04a8d8	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"header"}},"tableColumnSettings":{"model":{"use":"DisplayTextFieldModel"},"width":{"width":300}}},"parentId":"e32e2e04e95","subKey":"columns","subType":"array","sortIndex":4,"flowRegistry":{}}
d579beec4b7	d579beec4b7	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"name"}}},"parentId":"e816fb7cb72","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
199e3b15da5	199e3b15da5	{"use":"InputFieldModel","props":null,"parentId":"d579beec4b7","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
686eab04705	686eab04705	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"category"}}},"parentId":"e816fb7cb72","subKey":"items","subType":"array","sortIndex":2,"flowRegistry":{}}
b77b415ddd9	b77b415ddd9	{"use":"InputFieldModel","props":null,"parentId":"686eab04705","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
48b0024753d	48b0024753d	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"header"}}},"parentId":"e816fb7cb72","subKey":"items","subType":"array","sortIndex":3,"flowRegistry":{}}
f4e9a78c3e5	f4e9a78c3e5	{"use":"InputFieldModel","props":null,"parentId":"48b0024753d","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
6472164b998	6472164b998	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"parent"}}},"parentId":"e816fb7cb72","subKey":"items","subType":"array","sortIndex":4,"flowRegistry":{}}
d441f11007e	d441f11007e	{"use":"CascadeSelectFieldModel","props":null,"parentId":"6472164b998","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
e816fb7cb72	e816fb7cb72	{"use":"FormGridModel","parentId":"3083a65b723","subKey":"grid","subType":"object","stepParams":{"gridSettings":{"grid":{"rows":{"yf53tkzc4vv":[["6472164b998","d579beec4b7"]],"a8jaycfqc5b":[["686eab04705"]],"cv074kcs78r":[["48b0024753d"]]},"sizes":{"yf53tkzc4vv":[24],"a8jaycfqc5b":[24],"cv074kcs78r":[24]},"rowOrder":["yf53tkzc4vv","a8jaycfqc5b","cv074kcs78r"]}}},"sortIndex":0,"flowRegistry":{}}
42f651de83c	42f651de83c	{"use":"FormSubmitActionModel","parentId":"3083a65b723","subKey":"actions","subType":"array","stepParams":{},"sortIndex":1,"flowRegistry":{}}
eeedaac817f	eeedaac817f	{"parentId":"ff9e29d71a5","subKey":"page","subType":"object","use":"ChildPageModel","stepParams":{"pageSettings":{"general":{"displayTitle":false,"enableTabs":true}}},"sortIndex":0,"flowRegistry":{}}
bc9432120b4	bc9432120b4	{"use":"ChildPageTabModel","stepParams":{"pageTabSettings":{"tab":{"title":"{{t(\\"Edit\\")}}"}}},"parentId":"eeedaac817f","subKey":"tabs","subType":"array","sortIndex":0,"flowRegistry":{}}
c3cbf681c63	c3cbf681c63	{"parentId":"bc9432120b4","subKey":"grid","subType":"object","use":"BlockGridModel","stepParams":{},"sortIndex":0,"flowRegistry":{},"filterManager":[]}
f06ad2b75bf	f06ad2b75bf	{"use":"EditFormModel","stepParams":{"resourceSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","filterByTk":"{{ctx.view.inputArgs.filterByTk}}"}}},"parentId":"c3cbf681c63","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
3e377dd7534	3e377dd7534	{"use":"FormGridModel","parentId":"f06ad2b75bf","subKey":"grid","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
e022821801b	e022821801b	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"name"}}},"parentId":"3e377dd7534","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
238c6484475	238c6484475	{"use":"InputFieldModel","props":null,"parentId":"e022821801b","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
59aaa65023d	59aaa65023d	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"category"}}},"parentId":"3e377dd7534","subKey":"items","subType":"array","sortIndex":2,"flowRegistry":{}}
7cd6d806589	7cd6d806589	{"use":"InputFieldModel","props":null,"parentId":"59aaa65023d","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
7a08f2f0923	7a08f2f0923	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items","fieldPath":"header"}}},"parentId":"3e377dd7534","subKey":"items","subType":"array","sortIndex":3,"flowRegistry":{}}
71afb45a4da	71afb45a4da	{"use":"InputFieldModel","props":null,"parentId":"7a08f2f0923","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
4d920e3f887	4d920e3f887	{"use":"FormSubmitActionModel","parentId":"f06ad2b75bf","subKey":"actions","subType":"array","stepParams":{},"sortIndex":1,"flowRegistry":{}}
e32e2e04e95	e32e2e04e95	{"use":"TableBlockModel","stepParams":{"resourceSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_items"}},"dataLoadingModeSettings":{"mode":"auto"},"tableSettings":{"treeTable":{"treeTable":true}},"cardSettings":{"titleDescription":{"title":"Vehicle Items"}}},"parentId":"a35efb6ad11","subKey":"items","subType":"array","sortIndex":2,"flowRegistry":{}}
ce2f74e6a81	ce2f74e6a81	{"use":"TableActionsColumnModel","parentId":"72f060f0b63","subKey":"columns","subType":"array","stepParams":{},"sortIndex":0,"flowRegistry":{}}
de99a56a486	de99a56a486	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects_items","fieldPath":"vehicle_object"}},"tableColumnSettings":{"model":{"use":"DisplayNumberFieldModel"}}},"parentId":"72f060f0b63","subKey":"columns","subType":"array","sortIndex":2,"flowRegistry":{}}
fa82789f63d	fa82789f63d	{"use":"DisplayNumberFieldModel","props":null,"parentId":"de99a56a486","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects","associationName":"vehicle_objects_items.vehicle_object","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
84f7e6465c5	84f7e6465c5	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects_items","fieldPath":"vehicle_item"}},"tableColumnSettings":{"model":{"use":"DisplayNumberFieldModel"}}},"parentId":"72f060f0b63","subKey":"columns","subType":"array","sortIndex":3,"flowRegistry":{}}
40c864f2f59	40c864f2f59	{"use":"DisplayNumberFieldModel","props":null,"parentId":"84f7e6465c5","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_items","associationName":"vehicle_objects_items.vehicle_item","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
dc9f68e6631	dc9f68e6631	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects_items","fieldPath":"id"}},"tableColumnSettings":{"model":{"use":"DisplayNumberFieldModel"}}},"parentId":"72f060f0b63","subKey":"columns","subType":"array","sortIndex":4,"flowRegistry":{}}
c9acdbf008f	c9acdbf008f	{"use":"DisplayNumberFieldModel","props":null,"parentId":"dc9f68e6631","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects_items","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
3515d30f990	3515d30f990	{"use":"FilterActionModel","parentId":"72f060f0b63","subKey":"actions","subType":"array","stepParams":{},"sortIndex":1,"flowRegistry":{}}
cc68fa051a6	cc68fa051a6	{"use":"AddNewActionModel","parentId":"72f060f0b63","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects_items","dataSourceKey":"main"}}},"sortIndex":2,"flowRegistry":{}}
75f07fe48ba	75f07fe48ba	{"use":"BulkDeleteActionModel","parentId":"72f060f0b63","subKey":"actions","subType":"array","stepParams":{},"sortIndex":3,"flowRegistry":{}}
b4f84505e09	b4f84505e09	{"parentId":"cc68fa051a6","subKey":"page","subType":"object","use":"ChildPageModel","stepParams":{"pageSettings":{"general":{"displayTitle":false,"enableTabs":true}}},"sortIndex":0,"flowRegistry":{}}
397286dbe81	397286dbe81	{"use":"ChildPageTabModel","stepParams":{"pageTabSettings":{"tab":{"title":"{{t(\\"Add new\\")}}"}}},"parentId":"b4f84505e09","subKey":"tabs","subType":"array","sortIndex":0,"flowRegistry":{}}
39853e87235	39853e87235	{"parentId":"397286dbe81","subKey":"grid","subType":"object","use":"BlockGridModel","stepParams":{},"sortIndex":0,"flowRegistry":{},"filterManager":[]}
954c469773b	954c469773b	{"use":"CreateFormModel","stepParams":{"resourceSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects_items"}}},"parentId":"39853e87235","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
b438a51d8cb	b438a51d8cb	{"use":"FormGridModel","parentId":"954c469773b","subKey":"grid","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
457d22d1f31	457d22d1f31	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects_items","fieldPath":"vehicle_object"}}},"parentId":"b438a51d8cb","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
025881d9aac	025881d9aac	{"use":"CascadeSelectFieldModel","props":null,"parentId":"457d22d1f31","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
48108637f06	48108637f06	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects_items","fieldPath":"vehicle_item"}}},"parentId":"b438a51d8cb","subKey":"items","subType":"array","sortIndex":2,"flowRegistry":{}}
b27aa52d5c6	b27aa52d5c6	{"use":"CascadeSelectFieldModel","props":null,"parentId":"48108637f06","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
741e01ecd02	741e01ecd02	{"use":"FormSubmitActionModel","parentId":"954c469773b","subKey":"actions","subType":"array","stepParams":{},"sortIndex":1,"flowRegistry":{}}
4cd02d1443c	4cd02d1443c	{"use":"ViewActionModel","parentId":"ce2f74e6a81","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects_items","dataSourceKey":"main"}},"buttonSettings":{"general":{"type":"link","icon":null}}},"sortIndex":1,"flowRegistry":{}}
5e57403f834	5e57403f834	{"use":"EditActionModel","parentId":"ce2f74e6a81","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects_items","dataSourceKey":"main"}},"buttonSettings":{"general":{"type":"link","icon":null}}},"sortIndex":2,"flowRegistry":{}}
b02e09e7b7f	b02e09e7b7f	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects_items","fieldPath":"vehicle_object.name","associationPathName":"vehicle_object"}},"tableColumnSettings":{"model":{"use":"DisplayTextFieldModel"}}},"parentId":"72f060f0b63","subKey":"columns","subType":"array","sortIndex":4,"flowRegistry":{}}
cf1b70bcc1b	cf1b70bcc1b	{"use":"DisplayTextFieldModel","parentId":"b02e09e7b7f","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_objects","associationName":"vehicle_objects_items.vehicle_object","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
7cc312c10f5	7cc312c10f5	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects_items","fieldPath":"vehicle_item.name","associationPathName":"vehicle_item"}},"tableColumnSettings":{"model":{"use":"DisplayTextFieldModel"}}},"parentId":"72f060f0b63","subKey":"columns","subType":"array","sortIndex":5,"flowRegistry":{}}
f80863d5729	f80863d5729	{"use":"DisplayTextFieldModel","parentId":"7cc312c10f5","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_items","associationName":"vehicle_objects_items.vehicle_item","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
72f060f0b63	72f060f0b63	{"use":"TableBlockModel","stepParams":{"resourceSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_objects_items"}},"dataLoadingModeSettings":{"mode":"auto"},"cardSettings":{"titleDescription":{"title":"Vehicle Object Items"}}},"parentId":"a35efb6ad11","subKey":"items","subType":"array","sortIndex":3,"flowRegistry":{}}
f9b7330c3b9	f9b7330c3b9	{"use":"TableActionsColumnModel","parentId":"cf79155dd3f","subKey":"columns","subType":"array","stepParams":{},"sortIndex":0,"flowRegistry":{}}
905a82748a2	905a82748a2	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_test_values","fieldPath":"vehicle_object_item_id"}},"tableColumnSettings":{"model":{"use":"DisplayNumberFieldModel"}}},"parentId":"cf79155dd3f","subKey":"columns","subType":"array","sortIndex":2,"flowRegistry":{}}
m4j7efw58l2	m4j7efw58l2	{"schema":{"use":"RouteModel"}}
ljfrpm7e234	ljfrpm7e234	{"schema":{"use":"RouteModel"}}
57e7tzgvnoi	57e7tzgvnoi	{"schema":{"use":"RouteModel"}}
dc281a93c05	dc281a93c05	{"parentId":"ljfrpm7e234","subKey":"page","subType":"object","use":"RootPageModel","stepParams":{},"sortIndex":0,"flowRegistry":{}}
bcc5f4553dc	bcc5f4553dc	{"parentId":"57e7tzgvnoi","subKey":"grid","subType":"object","use":"BlockGridModel","stepParams":{},"sortIndex":0,"flowRegistry":{},"filterManager":[]}
8a2411fc68f	8a2411fc68f	{"use":"JSBlockModel","parentId":"bcc5f4553dc","subKey":"items","subType":"array","stepParams":{"jsSettings":{"runJs":{"version":"v1","code":"const { useRequest } = sdk; // NocoBase cung cấp sdk trong block context\\n\\nconst FolderExplorer = () => {\\n  // 1. Lấy dữ liệu từ Collection 'folders'\\n  const { data, loading } = useRequest({\\n    url: 'folders:list',\\n    params: { paginate: false },\\n  });\\n\\n  // 2. Logic chuyển đổi dữ liệu sang HTML Tree (Đệ quy)\\n  const renderTree = (items, parentId = null) => {\\n    const children = items.filter(item => item.parent_id === parentId);\\n    if (children.length === 0) return '';\\n\\n    return `\\n      <ul style=\\"list-style: none; padding-left: 20px;\\">\\n        ${children.map(child => `\\n          <li style=\\"margin: 5px 0;\\">\\n            <div class=\\"folder-item\\" onclick=\\"console.log('Clicked folder: ${child.id}')\\" \\n                 style=\\"cursor: pointer; display: flex; align-items: center; gap: 8px;\\">\\n              <span>${child.parent_id ? '📄' : '📁'}</span>\\n              <span style=\\"font-weight: ${child.parent_id ? 'normal' : 'bold'}\\">${child.title}</span>\\n            </div>\\n            ${renderTree(items, child.id)}\\n          </li>\\n        `).join('')}\\n      </ul>\\n    `;\\n  };\\n\\n  if (loading) return React.createElement('div', null, 'Đang tải...');\\n\\n  const items = data?.data?.data || [];\\n  const treeHTML = renderTree(items, null);\\n\\n  // 3. Trả về giao diện dưới dạng HTML String\\n  return React.createElement('div', {\\n    style: {\\n      padding: '15px',\\n      background: '#fff',\\n      borderRadius: '8px',\\n      border: '1px solid #ddd',\\n      fontFamily: 'sans-serif'\\n    },\\n    dangerouslySetInnerHTML: {\\n      __html: `\\n        <h3 style=\\"margin-top: 0;\\">📁 File Explorer</h3>\\n        <style>\\n          .folder-item:hover { color: #1890ff; background: #f0f2f5; }\\n        </script>\\n        ${treeHTML}\\n      `\\n    }\\n  });\\n};\\n\\nreturn FolderExplorer;"}}},"sortIndex":1,"flowRegistry":{}}
4777a1c52e0	4777a1c52e0	{"use":"DisplayNumberFieldModel","props":null,"parentId":"905a82748a2","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_test_values","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
cf79155dd3f	cf79155dd3f	{"use":"TableBlockModel","stepParams":{"resourceSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_test_values"}}},"parentId":"a35efb6ad11","subKey":"items","subType":"array","sortIndex":4,"flowRegistry":{}}
e41c4b8e1ad	e41c4b8e1ad	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_test_values","fieldPath":"version"}},"tableColumnSettings":{"model":{"use":"DisplayNumberFieldModel"}}},"parentId":"cf79155dd3f","subKey":"columns","subType":"array","sortIndex":3,"flowRegistry":{}}
f5e076581dd	f5e076581dd	{"use":"DisplayNumberFieldModel","props":null,"parentId":"e41c4b8e1ad","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_test_values","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
57f48c560f8	57f48c560f8	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_test_values","fieldPath":"index"}},"tableColumnSettings":{"model":{"use":"DisplayNumberFieldModel"}}},"parentId":"cf79155dd3f","subKey":"columns","subType":"array","sortIndex":4,"flowRegistry":{}}
34bb98fe895	34bb98fe895	{"use":"DisplayNumberFieldModel","props":null,"parentId":"57f48c560f8","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_test_values","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
995aecb149b	995aecb149b	{"use":"TableColumnModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_test_values","fieldPath":"value"}},"tableColumnSettings":{"model":{"use":"DisplayTextFieldModel"}}},"parentId":"cf79155dd3f","subKey":"columns","subType":"array","sortIndex":5,"flowRegistry":{}}
709ef69dec0	709ef69dec0	{"use":"DisplayTextFieldModel","props":null,"parentId":"995aecb149b","subKey":"field","subType":"object","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_test_values","dataSourceKey":"main"}}},"sortIndex":0,"flowRegistry":{}}
8312e1ee426	8312e1ee426	{"use":"FilterActionModel","parentId":"cf79155dd3f","subKey":"actions","subType":"array","stepParams":{},"sortIndex":1,"flowRegistry":{}}
4e0c902aedb	4e0c902aedb	{"use":"AddNewActionModel","parentId":"cf79155dd3f","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_test_values","dataSourceKey":"main"}}},"sortIndex":2,"flowRegistry":{}}
7c5982b99b0	7c5982b99b0	{"use":"BulkDeleteActionModel","parentId":"cf79155dd3f","subKey":"actions","subType":"array","stepParams":{},"sortIndex":4,"flowRegistry":{}}
8c8527ce711	8c8527ce711	{"parentId":"4e0c902aedb","subKey":"page","subType":"object","use":"ChildPageModel","stepParams":{"pageSettings":{"general":{"displayTitle":false,"enableTabs":true}}},"sortIndex":0,"flowRegistry":{}}
35b56bab2ab	35b56bab2ab	{"use":"ChildPageTabModel","stepParams":{"pageTabSettings":{"tab":{"title":"{{t(\\"Add new\\")}}"}}},"parentId":"8c8527ce711","subKey":"tabs","subType":"array","sortIndex":0,"flowRegistry":{}}
2c932d53e51	2c932d53e51	{"parentId":"35b56bab2ab","subKey":"grid","subType":"object","use":"BlockGridModel","stepParams":{},"sortIndex":0,"flowRegistry":{},"filterManager":[]}
6ec5b26278f	6ec5b26278f	{"use":"CreateFormModel","stepParams":{"resourceSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_test_values"}}},"parentId":"2c932d53e51","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
1623f1c3e1c	1623f1c3e1c	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_test_values","fieldPath":"version"}}},"parentId":"15503049cbe","subKey":"items","subType":"array","sortIndex":1,"flowRegistry":{}}
4345e8c8b04	4345e8c8b04	{"use":"NumberFieldModel","props":null,"parentId":"1623f1c3e1c","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
208147ec1c7	208147ec1c7	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_test_values","fieldPath":"index"}}},"parentId":"15503049cbe","subKey":"items","subType":"array","sortIndex":2,"flowRegistry":{}}
1d543dbc33e	1d543dbc33e	{"use":"NumberFieldModel","props":null,"parentId":"208147ec1c7","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
bb4f00abef6	bb4f00abef6	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_test_values","fieldPath":"value"}}},"parentId":"15503049cbe","subKey":"items","subType":"array","sortIndex":3,"flowRegistry":{}}
8a7201e70d5	8a7201e70d5	{"use":"InputFieldModel","props":null,"parentId":"bb4f00abef6","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
9f07bfa174f	9f07bfa174f	{"use":"FormItemModel","stepParams":{"fieldSettings":{"init":{"dataSourceKey":"main","collectionName":"vehicle_test_values","fieldPath":"vehicle_object_item"}}},"parentId":"15503049cbe","subKey":"items","subType":"array","sortIndex":4,"flowRegistry":{}}
a526c89bbba	a526c89bbba	{"use":"RecordSelectFieldModel","props":null,"parentId":"9f07bfa174f","subKey":"field","subType":"object","stepParams":{},"sortIndex":0,"flowRegistry":{}}
15503049cbe	15503049cbe	{"use":"FormGridModel","parentId":"6ec5b26278f","subKey":"grid","subType":"object","stepParams":{"gridSettings":{"grid":{"rows":{"jy60dyoxgc3":[["9f07bfa174f","1623f1c3e1c"]],"ybu9w1ld0fs":[["208147ec1c7"]],"2wyhhbejhg2":[["bb4f00abef6"]]},"sizes":{"jy60dyoxgc3":[24],"ybu9w1ld0fs":[24],"2wyhhbejhg2":[24]},"rowOrder":["jy60dyoxgc3","ybu9w1ld0fs","2wyhhbejhg2"]}}},"sortIndex":0,"flowRegistry":{}}
1a20eb5c180	1a20eb5c180	{"use":"FormSubmitActionModel","parentId":"6ec5b26278f","subKey":"actions","subType":"array","stepParams":{},"sortIndex":1,"flowRegistry":{}}
fbf5c5b0b12	fbf5c5b0b12	{"use":"ViewActionModel","parentId":"f9b7330c3b9","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_test_values","dataSourceKey":"main"}},"buttonSettings":{"general":{"type":"link","icon":null}}},"sortIndex":1,"flowRegistry":{}}
ea3fd7ac877	ea3fd7ac877	{"use":"EditActionModel","parentId":"f9b7330c3b9","subKey":"actions","subType":"array","stepParams":{"popupSettings":{"openView":{"collectionName":"vehicle_test_values","dataSourceKey":"main"}},"buttonSettings":{"general":{"type":"link","icon":null}}},"sortIndex":2,"flowRegistry":{}}
\.


--
-- TOC entry 4308 (class 0 OID 16738)
-- Dependencies: 261
-- Data for Name: flowSql; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."flowSql" (id, "createdAt", "updatedAt", uid, "dataSourceKey", sql) FROM stdin;
\.


--
-- TOC entry 4339 (class 0 OID 16976)
-- Dependencies: 292
-- Data for Name: flow_nodes; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.flow_nodes (id, "createdAt", "updatedAt", key, title, "upstreamId", "branchIndex", "downstreamId", type, config, "workflowId") FROM stdin;
\.


--
-- TOC entry 4283 (class 0 OID 16533)
-- Dependencies: 236
-- Data for Name: iframeHtml; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."iframeHtml" (id, "createdAt", "updatedAt", html, "createdById", "updatedById") FROM stdin;
\.


--
-- TOC entry 4278 (class 0 OID 16496)
-- Dependencies: 231
-- Data for Name: issuedTokens; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."issuedTokens" ("createdAt", "updatedAt", id, "signInTime", jti, "issuedTime", "userId") FROM stdin;
2026-03-05 16:16:06.287+00	2026-03-05 16:16:06.287+00	c1196553-de15-4e3e-a77a-e238886e86c6	1772727366278	d7337fdb-bfef-44d9-af70-e8529d18f3af	1772727366278	1
2026-03-09 15:29:07.676+00	2026-03-09 15:29:07.676+00	ba7fdde8-55df-47fe-ad81-e98377b10564	1773070147669	f25aba50-f54d-40d5-9fce-f0eff1aa9a0a	1773070147669	1
2026-03-09 15:42:36.446+00	2026-03-09 15:42:36.446+00	5b544b27-e11e-4f3f-b8f1-33b880154051	1773070956441	dbfd8545-2533-4b18-8d43-883acebd5e6c	1773070956441	1
\.


--
-- TOC entry 4340 (class 0 OID 16987)
-- Dependencies: 293
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.jobs ("createdAt", "updatedAt", id, "executionId", "nodeId", "nodeKey", "upstreamId", status, result, meta) FROM stdin;
\.


--
-- TOC entry 4360 (class 0 OID 17138)
-- Dependencies: 313
-- Data for Name: lcCheckpointBlobs; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."lcCheckpointBlobs" ("createdAt", "updatedAt", "threadId", "checkpointNs", channel, version, type, blob) FROM stdin;
\.


--
-- TOC entry 4361 (class 0 OID 17146)
-- Dependencies: 314
-- Data for Name: lcCheckpointWrites; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."lcCheckpointWrites" ("createdAt", "updatedAt", "threadId", "checkpointNs", "checkpointId", "taskId", idx, channel, type, blob) FROM stdin;
\.


--
-- TOC entry 4362 (class 0 OID 17154)
-- Dependencies: 315
-- Data for Name: lcCheckpoints; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."lcCheckpoints" ("createdAt", "updatedAt", "threadId", "checkpointNs", "checkpointId", "parentCheckpointId", type, checkpoint, metadata) FROM stdin;
\.


--
-- TOC entry 4363 (class 0 OID 17163)
-- Dependencies: 316
-- Data for Name: llmServices; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."llmServices" ("createdAt", "updatedAt", name, title, provider, options, "enabledModels", enabled, "modelOptions", sort) FROM stdin;
\.


--
-- TOC entry 4285 (class 0 OID 16550)
-- Dependencies: 238
-- Data for Name: main_desktopRoutes_path; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."main_desktopRoutes_path" ("nodePk", path, "rootPk") FROM stdin;
350064010461184	/350064010461184	350064010461184
350064144678912	/350064010461184/350064144678912	350064010461184
350064144678913	/350064010461184/350064144678912/350064144678913	350064010461184
350066568986624	/350066568986624	350066568986624
350066659164160	/350066568986624/350066659164160	350066568986624
350066659164161	/350066568986624/350066659164160/350066659164161	350066568986624
\.


--
-- TOC entry 4310 (class 0 OID 16756)
-- Dependencies: 263
-- Data for Name: main_mobileRoutes_path; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."main_mobileRoutes_path" ("nodePk", path, "rootPk") FROM stdin;
\.


--
-- TOC entry 4378 (class 0 OID 17291)
-- Dependencies: 331
-- Data for Name: main_vehicle_items_path; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.main_vehicle_items_path ("nodePk", path, "rootPk") FROM stdin;
350065029677056	/350065029677056	350065029677056
350065098883072	/350065029677056/350065098883072	350065029677056
350065128243200	/350065029677056/350065098883072/350065128243200	350065029677056
350065159700480	/350065029677056/350065098883072/350065128243200/350065159700480	350065029677056
\.


--
-- TOC entry 4376 (class 0 OID 17279)
-- Dependencies: 329
-- Data for Name: main_vehicle_objects_path; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.main_vehicle_objects_path ("nodePk", path, "rootPk") FROM stdin;
350064283090944	/350064283090944	350064283090944
350064392142848	/350064283090944/350064392142848	350064283090944
350064478126080	/350064283090944/350064392142848/350064478126080	350064283090944
350064612343808	/350064283090944/350064392142848/350064478126080/350064612343808	350064283090944
\.


--
-- TOC entry 4261 (class 0 OID 16389)
-- Dependencies: 214
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.migrations (name) FROM stdin;
\.


--
-- TOC entry 4309 (class 0 OID 16748)
-- Dependencies: 262
-- Data for Name: mobileRoutes; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."mobileRoutes" (id, "createdAt", "updatedAt", "parentId", title, icon, "schemaUid", type, options, sort, "hideInMenu", "enableTabs", hidden, "createdById", "updatedById") FROM stdin;
\.


--
-- TOC entry 4365 (class 0 OID 17183)
-- Dependencies: 318
-- Data for Name: notificationChannels; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."notificationChannels" ("createdAt", "updatedAt", name, title, options, meta, "notificationType", description, "createdById", "updatedById") FROM stdin;
\.


--
-- TOC entry 4367 (class 0 OID 17199)
-- Dependencies: 320
-- Data for Name: notificationInAppMessages; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."notificationInAppMessages" (id, "createdAt", "updatedAt", "userId", "channelName", title, content, status, "receiveTimestamp", options) FROM stdin;
\.


--
-- TOC entry 4366 (class 0 OID 17192)
-- Dependencies: 319
-- Data for Name: notificationSendLogs; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."notificationSendLogs" (id, "createdAt", "updatedAt", "channelName", "channelTitle", "triggerFrom", "notificationType", status, message, reason) FROM stdin;
\.


--
-- TOC entry 4331 (class 0 OID 16903)
-- Dependencies: 284
-- Data for Name: otpRecords; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."otpRecords" (id, "createdAt", "updatedAt", action, receiver, status, "expiresAt", code, "verifierName") FROM stdin;
\.


--
-- TOC entry 4267 (class 0 OID 16420)
-- Dependencies: 220
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.roles ("createdAt", "updatedAt", name, title, description, strategy, "default", hidden, "allowConfigure", "allowNewMenu", snippets, sort, "allowNewMobileMenu", "allowNewAiEmployee") FROM stdin;
2026-02-24 15:08:51.832+00	2026-02-24 15:08:51.832+00	root	{{t("Root")}}	\N	\N	f	t	\N	f	["pm", "pm.*", "ui.*"]	1	f	t
2026-02-24 15:08:51.842+00	2026-02-24 15:08:51.842+00	member	{{t("Member")}}	\N	{"actions":["view:own"]}	t	f	\N	t	["!pm", "!pm.*", "!ui.*"]	3	t	t
2026-02-24 15:08:51.838+00	2026-02-24 15:08:52.236+00	admin	{{t("Admin")}}	\N	{"actions":["create","view","update","destroy","export","importXlsx"]}	f	f	t	t	["pm", "pm.*", "ui.*"]	2	t	t
\.


--
-- TOC entry 4353 (class 0 OID 17090)
-- Dependencies: 306
-- Data for Name: rolesAiEmployees; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."rolesAiEmployees" ("createdAt", "updatedAt", "aiEmployee", "roleName") FROM stdin;
2026-02-24 15:08:52.161+00	2026-02-24 15:08:52.161+00	orin	admin
2026-02-24 15:08:52.165+00	2026-02-24 15:08:52.165+00	nathan	admin
2026-02-24 15:08:52.169+00	2026-02-24 15:08:52.169+00	dex	root
2026-02-24 15:08:52.169+00	2026-02-24 15:08:52.169+00	dex	admin
2026-02-24 15:08:52.169+00	2026-02-24 15:08:52.169+00	dex	member
2026-02-24 15:08:52.172+00	2026-02-24 15:08:52.172+00	viz	root
2026-02-24 15:08:52.172+00	2026-02-24 15:08:52.172+00	viz	admin
2026-02-24 15:08:52.172+00	2026-02-24 15:08:52.172+00	viz	member
2026-02-24 15:08:52.175+00	2026-02-24 15:08:52.175+00	vera	root
2026-02-24 15:08:52.175+00	2026-02-24 15:08:52.175+00	vera	admin
2026-02-24 15:08:52.175+00	2026-02-24 15:08:52.175+00	vera	member
2026-02-24 15:08:52.179+00	2026-02-24 15:08:52.179+00	lexi	root
2026-02-24 15:08:52.179+00	2026-02-24 15:08:52.179+00	lexi	admin
2026-02-24 15:08:52.179+00	2026-02-24 15:08:52.179+00	lexi	member
2026-02-24 15:08:52.183+00	2026-02-24 15:08:52.183+00	cole	root
2026-02-24 15:08:52.183+00	2026-02-24 15:08:52.183+00	cole	admin
2026-02-24 15:08:52.183+00	2026-02-24 15:08:52.183+00	cole	member
2026-02-24 15:08:52.186+00	2026-02-24 15:08:52.186+00	ellis	root
2026-02-24 15:08:52.186+00	2026-02-24 15:08:52.186+00	ellis	admin
2026-02-24 15:08:52.186+00	2026-02-24 15:08:52.186+00	ellis	member
2026-02-24 15:08:52.189+00	2026-02-24 15:08:52.189+00	dara	admin
\.


--
-- TOC entry 4286 (class 0 OID 16556)
-- Dependencies: 239
-- Data for Name: rolesDesktopRoutes; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."rolesDesktopRoutes" ("createdAt", "updatedAt", "desktopRouteId", "roleName") FROM stdin;
2026-02-24 15:38:47.304+00	2026-02-24 15:38:47.304+00	350064010461184	member
2026-02-24 15:38:47.304+00	2026-02-24 15:38:47.304+00	350064010461184	admin
2026-02-24 15:39:51.651+00	2026-02-24 15:39:51.651+00	350064144678912	member
2026-02-24 15:39:51.651+00	2026-02-24 15:39:51.651+00	350064144678912	admin
2026-02-24 15:39:51.676+00	2026-02-24 15:39:51.676+00	350064144678913	member
2026-02-24 15:39:51.676+00	2026-02-24 15:39:51.676+00	350064144678913	admin
2026-02-24 15:59:07.379+00	2026-02-24 15:59:07.379+00	350066568986624	member
2026-02-24 15:59:07.379+00	2026-02-24 15:59:07.379+00	350066568986624	admin
2026-02-24 15:59:50.893+00	2026-02-24 15:59:50.893+00	350066659164160	member
2026-02-24 15:59:50.893+00	2026-02-24 15:59:50.893+00	350066659164160	admin
2026-02-24 15:59:50.959+00	2026-02-24 15:59:50.959+00	350066659164161	member
2026-02-24 15:59:50.959+00	2026-02-24 15:59:50.959+00	350066659164161	admin
\.


--
-- TOC entry 4311 (class 0 OID 16762)
-- Dependencies: 264
-- Data for Name: rolesMobileRoutes; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."rolesMobileRoutes" ("createdAt", "updatedAt", "mobileRouteId", "roleName") FROM stdin;
\.


--
-- TOC entry 4269 (class 0 OID 16434)
-- Dependencies: 222
-- Data for Name: rolesResources; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."rolesResources" (id, "createdAt", "updatedAt", "roleName", name, "usingActionsConfig") FROM stdin;
\.


--
-- TOC entry 4271 (class 0 OID 16444)
-- Dependencies: 224
-- Data for Name: rolesResourcesActions; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."rolesResourcesActions" (id, "createdAt", "updatedAt", "rolesResourceId", name, fields, "scopeId") FROM stdin;
\.


--
-- TOC entry 4273 (class 0 OID 16457)
-- Dependencies: 226
-- Data for Name: rolesResourcesScopes; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."rolesResourcesScopes" (id, "createdAt", "updatedAt", key, name, "resourceName", scope) FROM stdin;
\.


--
-- TOC entry 4320 (class 0 OID 16827)
-- Dependencies: 273
-- Data for Name: rolesUischemas; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."rolesUischemas" ("createdAt", "updatedAt", "roleName", "uiSchemaXUid") FROM stdin;
\.


--
-- TOC entry 4266 (class 0 OID 16414)
-- Dependencies: 219
-- Data for Name: rolesUsers; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."rolesUsers" ("createdAt", "updatedAt", "default", "roleName", "userId") FROM stdin;
2026-02-24 15:08:51.902+00	2026-02-24 15:08:51.902+00	\N	member	1
2026-02-24 15:08:52.152+00	2026-02-24 15:08:52.152+00	\N	admin	1
2026-02-24 15:08:52.152+00	2026-02-24 15:08:52.154+00	t	root	1
\.


--
-- TOC entry 4301 (class 0 OID 16683)
-- Dependencies: 254
-- Data for Name: sequences; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.sequences (id, "createdAt", "updatedAt", collection, field, key, current, "lastGeneratedAt") FROM stdin;
\.


--
-- TOC entry 4304 (class 0 OID 16704)
-- Dependencies: 257
-- Data for Name: storages; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.storages (id, "createdAt", "updatedAt", title, name, type, options, rules, path, "baseUrl", "renameMode", "default", paranoid, settings) FROM stdin;
350060243714048	2026-02-24 15:08:51.818+00	2026-02-24 15:08:51.818+00	Local storage	local	local	{"documentRoot": "storage/uploads"}	{"size": 20971520}		/storage/uploads	appendRandomID	t	f	{}
\.


--
-- TOC entry 4313 (class 0 OID 16769)
-- Dependencies: 266
-- Data for Name: systemSettings; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."systemSettings" (id, "createdAt", "updatedAt", title, "showLogoOnly", "allowSignUp", "smsAuthEnabled", "logoId", "enabledLanguages", "appLang", options, "roleMode", "enableEditProfile", "enableChangePassword") FROM stdin;
1	2026-02-24 15:08:51.829+00	2026-02-24 15:08:51.829+00	NocoBase	\N	t	f	1	["en-US"]	en-US	{}	default	\N	\N
\.


--
-- TOC entry 4380 (class 0 OID 17302)
-- Dependencies: 333
-- Data for Name: t_d6ursut4ws9; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.t_d6ursut4ws9 ("createdAt", "updatedAt", f_b0ayz6z0chw, f_qahz3h30s16) FROM stdin;
2026-02-24 15:45:25.442+00	2026-02-24 15:45:25.442+00	350064612343808	2
\.


--
-- TOC entry 4369 (class 0 OID 17208)
-- Dependencies: 322
-- Data for Name: themeConfig; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."themeConfig" (id, "createdAt", "updatedAt", config, optional, "isBuiltIn", uid, "default") FROM stdin;
1	2026-02-24 15:08:52.192+00	2026-02-24 15:08:52.192+00	{"name":"Default"}	t	t	default	f
2	2026-02-24 15:08:52.192+00	2026-02-24 15:08:52.192+00	{"name":"Dark","algorithm":"darkAlgorithm"}	t	t	dark	f
3	2026-02-24 15:08:52.193+00	2026-02-24 15:08:52.193+00	{"name":"Compact","algorithm":"compactAlgorithm","token":{"fontSize":16}}	t	t	compact	t
4	2026-02-24 15:08:52.194+00	2026-02-24 15:08:52.194+00	{"name":"Compact dark","algorithm":["compactAlgorithm","darkAlgorithm"],"token":{"fontSize":16,"colorBgHeader":"#000000","colorPrimaryHeader":"#000000"}}	t	t	compact_dark	f
\.


--
-- TOC entry 4280 (class 0 OID 16503)
-- Dependencies: 233
-- Data for Name: tokenBlacklist; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."tokenBlacklist" (id, "createdAt", "updatedAt", token, expiration) FROM stdin;
\.


--
-- TOC entry 4281 (class 0 OID 16510)
-- Dependencies: 234
-- Data for Name: tokenControlConfig; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."tokenControlConfig" ("createdAt", "updatedAt", key, config, "createdById", "updatedById") FROM stdin;
2026-02-24 15:08:51.809+00	2026-02-24 15:08:51.809+00	token-policy-config	{"tokenExpirationTime":"1d","sessionExpirationTime":"7d","expiredTokenRenewLimit":"1d"}	\N	\N
\.


--
-- TOC entry 4314 (class 0 OID 16784)
-- Dependencies: 267
-- Data for Name: uiButtonSchemasRoles; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."uiButtonSchemasRoles" ("createdAt", "updatedAt", uid, "roleName") FROM stdin;
\.


--
-- TOC entry 4316 (class 0 OID 16794)
-- Dependencies: 269
-- Data for Name: uiSchemaServerHooks; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."uiSchemaServerHooks" (id, type, collection, field, method, params, uid) FROM stdin;
\.


--
-- TOC entry 4317 (class 0 OID 16803)
-- Dependencies: 270
-- Data for Name: uiSchemaTemplates; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."uiSchemaTemplates" ("createdAt", "updatedAt", key, name, "componentName", "associationName", "resourceName", "collectionName", "dataSourceKey", uid) FROM stdin;
\.


--
-- TOC entry 4318 (class 0 OID 16811)
-- Dependencies: 271
-- Data for Name: uiSchemaTreePath; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."uiSchemaTreePath" (ancestor, descendant, depth, async, type, sort) FROM stdin;
nocobase-admin-profile-create-form	nocobase-admin-profile-create-form	0	f	\N	\N
27sa0h34sa9	27sa0h34sa9	0	f	properties	\N
nocobase-admin-profile-create-form	27sa0h34sa9	1	\N	\N	1
nocobase-admin-profile-create-form	f3sfx5yvhn2	2	\N	\N	\N
f3sfx5yvhn2	f3sfx5yvhn2	0	f	properties	\N
27sa0h34sa9	f3sfx5yvhn2	1	\N	\N	1
nocobase-admin-profile-create-form	d88p4wnkc7b	3	\N	\N	\N
27sa0h34sa9	d88p4wnkc7b	2	\N	\N	\N
d88p4wnkc7b	d88p4wnkc7b	0	f	properties	\N
f3sfx5yvhn2	d88p4wnkc7b	1	\N	\N	1
nocobase-admin-profile-create-form	2nq5i90z3l5	4	\N	\N	\N
27sa0h34sa9	2nq5i90z3l5	3	\N	\N	\N
f3sfx5yvhn2	2nq5i90z3l5	2	\N	\N	\N
2nq5i90z3l5	2nq5i90z3l5	0	f	properties	\N
d88p4wnkc7b	2nq5i90z3l5	1	\N	\N	1
nocobase-admin-profile-create-form	4xex6fc7yy3	5	\N	\N	\N
27sa0h34sa9	4xex6fc7yy3	4	\N	\N	\N
f3sfx5yvhn2	4xex6fc7yy3	3	\N	\N	\N
d88p4wnkc7b	4xex6fc7yy3	2	\N	\N	\N
4xex6fc7yy3	4xex6fc7yy3	0	f	properties	\N
2nq5i90z3l5	4xex6fc7yy3	1	\N	\N	1
nocobase-admin-profile-create-form	936xaupk8x6	6	\N	\N	\N
27sa0h34sa9	936xaupk8x6	5	\N	\N	\N
f3sfx5yvhn2	936xaupk8x6	4	\N	\N	\N
d88p4wnkc7b	936xaupk8x6	3	\N	\N	\N
2nq5i90z3l5	936xaupk8x6	2	\N	\N	\N
936xaupk8x6	936xaupk8x6	0	f	properties	\N
4xex6fc7yy3	936xaupk8x6	1	\N	\N	1
nocobase-admin-profile-create-form	u9qjfzrf581	4	\N	\N	\N
27sa0h34sa9	u9qjfzrf581	3	\N	\N	\N
f3sfx5yvhn2	u9qjfzrf581	2	\N	\N	\N
u9qjfzrf581	u9qjfzrf581	0	f	properties	\N
d88p4wnkc7b	u9qjfzrf581	1	\N	\N	2
nocobase-admin-profile-create-form	j15ls0gwfa8	5	\N	\N	\N
27sa0h34sa9	j15ls0gwfa8	4	\N	\N	\N
f3sfx5yvhn2	j15ls0gwfa8	3	\N	\N	\N
d88p4wnkc7b	j15ls0gwfa8	2	\N	\N	\N
j15ls0gwfa8	j15ls0gwfa8	0	f	properties	\N
u9qjfzrf581	j15ls0gwfa8	1	\N	\N	1
nocobase-admin-profile-create-form	ean995sj1g6	6	\N	\N	\N
27sa0h34sa9	ean995sj1g6	5	\N	\N	\N
f3sfx5yvhn2	ean995sj1g6	4	\N	\N	\N
d88p4wnkc7b	ean995sj1g6	3	\N	\N	\N
u9qjfzrf581	ean995sj1g6	2	\N	\N	\N
ean995sj1g6	ean995sj1g6	0	f	properties	\N
j15ls0gwfa8	ean995sj1g6	1	\N	\N	1
nocobase-admin-profile-create-form	3z3xlf37zch	4	\N	\N	\N
27sa0h34sa9	3z3xlf37zch	3	\N	\N	\N
f3sfx5yvhn2	3z3xlf37zch	2	\N	\N	\N
3z3xlf37zch	3z3xlf37zch	0	f	properties	\N
d88p4wnkc7b	3z3xlf37zch	1	\N	\N	3
nocobase-admin-profile-create-form	7g2pir1ny3w	5	\N	\N	\N
27sa0h34sa9	7g2pir1ny3w	4	\N	\N	\N
f3sfx5yvhn2	7g2pir1ny3w	3	\N	\N	\N
d88p4wnkc7b	7g2pir1ny3w	2	\N	\N	\N
7g2pir1ny3w	7g2pir1ny3w	0	f	properties	\N
3z3xlf37zch	7g2pir1ny3w	1	\N	\N	1
nocobase-admin-profile-create-form	vv66do4f7xa	6	\N	\N	\N
27sa0h34sa9	vv66do4f7xa	5	\N	\N	\N
f3sfx5yvhn2	vv66do4f7xa	4	\N	\N	\N
d88p4wnkc7b	vv66do4f7xa	3	\N	\N	\N
3z3xlf37zch	vv66do4f7xa	2	\N	\N	\N
vv66do4f7xa	vv66do4f7xa	0	f	properties	\N
7g2pir1ny3w	vv66do4f7xa	1	\N	\N	1
nocobase-admin-profile-create-form	x9tsk35cewt	4	\N	\N	\N
27sa0h34sa9	x9tsk35cewt	3	\N	\N	\N
f3sfx5yvhn2	x9tsk35cewt	2	\N	\N	\N
x9tsk35cewt	x9tsk35cewt	0	f	properties	\N
d88p4wnkc7b	x9tsk35cewt	1	\N	\N	4
nocobase-admin-profile-create-form	xyxdnyp61ik	5	\N	\N	\N
27sa0h34sa9	xyxdnyp61ik	4	\N	\N	\N
f3sfx5yvhn2	xyxdnyp61ik	3	\N	\N	\N
d88p4wnkc7b	xyxdnyp61ik	2	\N	\N	\N
xyxdnyp61ik	xyxdnyp61ik	0	f	properties	\N
x9tsk35cewt	xyxdnyp61ik	1	\N	\N	1
nocobase-admin-profile-create-form	z37o84cs68g	6	\N	\N	\N
27sa0h34sa9	z37o84cs68g	5	\N	\N	\N
f3sfx5yvhn2	z37o84cs68g	4	\N	\N	\N
d88p4wnkc7b	z37o84cs68g	3	\N	\N	\N
x9tsk35cewt	z37o84cs68g	2	\N	\N	\N
z37o84cs68g	z37o84cs68g	0	f	properties	\N
xyxdnyp61ik	z37o84cs68g	1	\N	\N	1
nocobase-admin-profile-create-form	m9dx6py01js	4	\N	\N	\N
27sa0h34sa9	m9dx6py01js	3	\N	\N	\N
f3sfx5yvhn2	m9dx6py01js	2	\N	\N	\N
m9dx6py01js	m9dx6py01js	0	f	properties	\N
d88p4wnkc7b	m9dx6py01js	1	\N	\N	5
nocobase-admin-profile-create-form	onyb0q74y28	5	\N	\N	\N
27sa0h34sa9	onyb0q74y28	4	\N	\N	\N
f3sfx5yvhn2	onyb0q74y28	3	\N	\N	\N
d88p4wnkc7b	onyb0q74y28	2	\N	\N	\N
onyb0q74y28	onyb0q74y28	0	f	properties	\N
m9dx6py01js	onyb0q74y28	1	\N	\N	1
nocobase-admin-profile-create-form	mb4hg5oii9r	6	\N	\N	\N
27sa0h34sa9	mb4hg5oii9r	5	\N	\N	\N
f3sfx5yvhn2	mb4hg5oii9r	4	\N	\N	\N
d88p4wnkc7b	mb4hg5oii9r	3	\N	\N	\N
m9dx6py01js	mb4hg5oii9r	2	\N	\N	\N
mb4hg5oii9r	mb4hg5oii9r	0	f	properties	\N
onyb0q74y28	mb4hg5oii9r	1	\N	\N	1
nocobase-admin-profile-create-form	988n63sonw6	4	\N	\N	\N
27sa0h34sa9	988n63sonw6	3	\N	\N	\N
f3sfx5yvhn2	988n63sonw6	2	\N	\N	\N
988n63sonw6	988n63sonw6	0	f	properties	\N
d88p4wnkc7b	988n63sonw6	1	\N	\N	6
0fa2yc47a4c	0fa2yc47a4c	0	f	\N	\N
ljfrpm7e234	ljfrpm7e234	0	f	\N	\N
nocobase-admin-profile-create-form	6e154dl4gk2	5	\N	\N	\N
27sa0h34sa9	6e154dl4gk2	4	\N	\N	\N
f3sfx5yvhn2	6e154dl4gk2	3	\N	\N	\N
d88p4wnkc7b	6e154dl4gk2	2	\N	\N	\N
6e154dl4gk2	6e154dl4gk2	0	f	properties	\N
988n63sonw6	6e154dl4gk2	1	\N	\N	1
nocobase-admin-profile-create-form	icietk59903	6	\N	\N	\N
27sa0h34sa9	icietk59903	5	\N	\N	\N
f3sfx5yvhn2	icietk59903	4	\N	\N	\N
d88p4wnkc7b	icietk59903	3	\N	\N	\N
988n63sonw6	icietk59903	2	\N	\N	\N
icietk59903	icietk59903	0	f	properties	\N
6e154dl4gk2	icietk59903	1	\N	\N	1
nocobase-admin-profile-create-form	gsvnt786lf0	3	\N	\N	\N
27sa0h34sa9	gsvnt786lf0	2	\N	\N	\N
gsvnt786lf0	gsvnt786lf0	0	f	properties	\N
f3sfx5yvhn2	gsvnt786lf0	1	\N	\N	2
nocobase-admin-profile-create-form	po3lc4l1dub	4	\N	\N	\N
27sa0h34sa9	po3lc4l1dub	3	\N	\N	\N
f3sfx5yvhn2	po3lc4l1dub	2	\N	\N	\N
po3lc4l1dub	po3lc4l1dub	0	f	properties	\N
gsvnt786lf0	po3lc4l1dub	1	\N	\N	1
nocobase-admin-profile-create-form	q1jpleprn3l	4	\N	\N	\N
27sa0h34sa9	q1jpleprn3l	3	\N	\N	\N
f3sfx5yvhn2	q1jpleprn3l	2	\N	\N	\N
q1jpleprn3l	q1jpleprn3l	0	f	properties	\N
gsvnt786lf0	q1jpleprn3l	1	\N	\N	2
nocobase-admin-profile-edit-form	nocobase-admin-profile-edit-form	0	f	\N	\N
sp7kzm3ud9i	sp7kzm3ud9i	0	f	properties	\N
nocobase-admin-profile-edit-form	sp7kzm3ud9i	1	\N	\N	1
nocobase-admin-profile-edit-form	s8u6bmpl2xr	2	\N	\N	\N
s8u6bmpl2xr	s8u6bmpl2xr	0	f	properties	\N
sp7kzm3ud9i	s8u6bmpl2xr	1	\N	\N	1
nocobase-admin-profile-edit-form	qinq14cq087	3	\N	\N	\N
sp7kzm3ud9i	qinq14cq087	2	\N	\N	\N
qinq14cq087	qinq14cq087	0	f	properties	\N
s8u6bmpl2xr	qinq14cq087	1	\N	\N	1
nocobase-admin-profile-edit-form	k8qu0k7n3th	4	\N	\N	\N
sp7kzm3ud9i	k8qu0k7n3th	3	\N	\N	\N
s8u6bmpl2xr	k8qu0k7n3th	2	\N	\N	\N
k8qu0k7n3th	k8qu0k7n3th	0	f	properties	\N
qinq14cq087	k8qu0k7n3th	1	\N	\N	1
nocobase-admin-profile-edit-form	t7fit5iaver	5	\N	\N	\N
sp7kzm3ud9i	t7fit5iaver	4	\N	\N	\N
s8u6bmpl2xr	t7fit5iaver	3	\N	\N	\N
qinq14cq087	t7fit5iaver	2	\N	\N	\N
t7fit5iaver	t7fit5iaver	0	f	properties	\N
k8qu0k7n3th	t7fit5iaver	1	\N	\N	1
nocobase-admin-profile-edit-form	nksviv8126g	6	\N	\N	\N
sp7kzm3ud9i	nksviv8126g	5	\N	\N	\N
s8u6bmpl2xr	nksviv8126g	4	\N	\N	\N
qinq14cq087	nksviv8126g	3	\N	\N	\N
k8qu0k7n3th	nksviv8126g	2	\N	\N	\N
nksviv8126g	nksviv8126g	0	f	properties	\N
t7fit5iaver	nksviv8126g	1	\N	\N	1
nocobase-admin-profile-edit-form	209csnoncay	4	\N	\N	\N
sp7kzm3ud9i	209csnoncay	3	\N	\N	\N
s8u6bmpl2xr	209csnoncay	2	\N	\N	\N
209csnoncay	209csnoncay	0	f	properties	\N
qinq14cq087	209csnoncay	1	\N	\N	2
nocobase-admin-profile-edit-form	1ivw6qauw36	5	\N	\N	\N
sp7kzm3ud9i	1ivw6qauw36	4	\N	\N	\N
s8u6bmpl2xr	1ivw6qauw36	3	\N	\N	\N
qinq14cq087	1ivw6qauw36	2	\N	\N	\N
1ivw6qauw36	1ivw6qauw36	0	f	properties	\N
209csnoncay	1ivw6qauw36	1	\N	\N	1
nocobase-admin-profile-edit-form	qpjjmuks1dw	6	\N	\N	\N
sp7kzm3ud9i	qpjjmuks1dw	5	\N	\N	\N
s8u6bmpl2xr	qpjjmuks1dw	4	\N	\N	\N
qinq14cq087	qpjjmuks1dw	3	\N	\N	\N
209csnoncay	qpjjmuks1dw	2	\N	\N	\N
qpjjmuks1dw	qpjjmuks1dw	0	f	properties	\N
1ivw6qauw36	qpjjmuks1dw	1	\N	\N	1
nocobase-admin-profile-edit-form	yj03uvuaqi5	4	\N	\N	\N
sp7kzm3ud9i	yj03uvuaqi5	3	\N	\N	\N
s8u6bmpl2xr	yj03uvuaqi5	2	\N	\N	\N
yj03uvuaqi5	yj03uvuaqi5	0	f	properties	\N
qinq14cq087	yj03uvuaqi5	1	\N	\N	3
nocobase-admin-profile-edit-form	zxos5hpu1pv	5	\N	\N	\N
sp7kzm3ud9i	zxos5hpu1pv	4	\N	\N	\N
s8u6bmpl2xr	zxos5hpu1pv	3	\N	\N	\N
qinq14cq087	zxos5hpu1pv	2	\N	\N	\N
zxos5hpu1pv	zxos5hpu1pv	0	f	properties	\N
yj03uvuaqi5	zxos5hpu1pv	1	\N	\N	1
nocobase-admin-profile-edit-form	bxkn69p867c	6	\N	\N	\N
sp7kzm3ud9i	bxkn69p867c	5	\N	\N	\N
s8u6bmpl2xr	bxkn69p867c	4	\N	\N	\N
qinq14cq087	bxkn69p867c	3	\N	\N	\N
yj03uvuaqi5	bxkn69p867c	2	\N	\N	\N
bxkn69p867c	bxkn69p867c	0	f	properties	\N
zxos5hpu1pv	bxkn69p867c	1	\N	\N	1
nocobase-admin-profile-edit-form	2wtp4x8upca	4	\N	\N	\N
sp7kzm3ud9i	2wtp4x8upca	3	\N	\N	\N
s8u6bmpl2xr	2wtp4x8upca	2	\N	\N	\N
2wtp4x8upca	2wtp4x8upca	0	f	properties	\N
qinq14cq087	2wtp4x8upca	1	\N	\N	4
nocobase-admin-profile-edit-form	qcxeh52id2d	5	\N	\N	\N
sp7kzm3ud9i	qcxeh52id2d	4	\N	\N	\N
s8u6bmpl2xr	qcxeh52id2d	3	\N	\N	\N
qinq14cq087	qcxeh52id2d	2	\N	\N	\N
qcxeh52id2d	qcxeh52id2d	0	f	properties	\N
2wtp4x8upca	qcxeh52id2d	1	\N	\N	1
nocobase-admin-profile-edit-form	fn4m8d3g5eu	6	\N	\N	\N
sp7kzm3ud9i	fn4m8d3g5eu	5	\N	\N	\N
s8u6bmpl2xr	fn4m8d3g5eu	4	\N	\N	\N
qinq14cq087	fn4m8d3g5eu	3	\N	\N	\N
2wtp4x8upca	fn4m8d3g5eu	2	\N	\N	\N
fn4m8d3g5eu	fn4m8d3g5eu	0	f	properties	\N
qcxeh52id2d	fn4m8d3g5eu	1	\N	\N	1
nocobase-admin-profile-edit-form	py6deaggm4g	4	\N	\N	\N
sp7kzm3ud9i	py6deaggm4g	3	\N	\N	\N
s8u6bmpl2xr	py6deaggm4g	2	\N	\N	\N
py6deaggm4g	py6deaggm4g	0	f	properties	\N
qinq14cq087	py6deaggm4g	1	\N	\N	5
nocobase-admin-profile-edit-form	d43qhwcmm6a	5	\N	\N	\N
sp7kzm3ud9i	d43qhwcmm6a	4	\N	\N	\N
s8u6bmpl2xr	d43qhwcmm6a	3	\N	\N	\N
qinq14cq087	d43qhwcmm6a	2	\N	\N	\N
d43qhwcmm6a	d43qhwcmm6a	0	f	properties	\N
py6deaggm4g	d43qhwcmm6a	1	\N	\N	1
nocobase-admin-profile-edit-form	ystfg4gvau4	6	\N	\N	\N
sp7kzm3ud9i	ystfg4gvau4	5	\N	\N	\N
s8u6bmpl2xr	ystfg4gvau4	4	\N	\N	\N
qinq14cq087	ystfg4gvau4	3	\N	\N	\N
py6deaggm4g	ystfg4gvau4	2	\N	\N	\N
ystfg4gvau4	ystfg4gvau4	0	f	properties	\N
d43qhwcmm6a	ystfg4gvau4	1	\N	\N	1
nocobase-admin-profile-edit-form	ek7wbw1b9iz	3	\N	\N	\N
sp7kzm3ud9i	ek7wbw1b9iz	2	\N	\N	\N
ek7wbw1b9iz	ek7wbw1b9iz	0	f	properties	\N
s8u6bmpl2xr	ek7wbw1b9iz	1	\N	\N	2
nocobase-admin-profile-edit-form	rya7faf4yjv	4	\N	\N	\N
sp7kzm3ud9i	rya7faf4yjv	3	\N	\N	\N
s8u6bmpl2xr	rya7faf4yjv	2	\N	\N	\N
rya7faf4yjv	rya7faf4yjv	0	f	properties	\N
ek7wbw1b9iz	rya7faf4yjv	1	\N	\N	1
nocobase-admin-profile-edit-form	f8olu9x0b6t	4	\N	\N	\N
sp7kzm3ud9i	f8olu9x0b6t	3	\N	\N	\N
s8u6bmpl2xr	f8olu9x0b6t	2	\N	\N	\N
f8olu9x0b6t	f8olu9x0b6t	0	f	properties	\N
ek7wbw1b9iz	f8olu9x0b6t	1	\N	\N	2
nocobase-user-profile-edit-form	nocobase-user-profile-edit-form	0	f	\N	\N
kjbvk5dssba	kjbvk5dssba	0	f	properties	\N
nocobase-user-profile-edit-form	kjbvk5dssba	1	\N	\N	1
nocobase-user-profile-edit-form	9cwmwq0kh70	2	\N	\N	\N
9cwmwq0kh70	9cwmwq0kh70	0	f	properties	\N
kjbvk5dssba	9cwmwq0kh70	1	\N	\N	1
nocobase-user-profile-edit-form	iqkwqr48zrs	3	\N	\N	\N
kjbvk5dssba	iqkwqr48zrs	2	\N	\N	\N
iqkwqr48zrs	iqkwqr48zrs	0	f	properties	\N
9cwmwq0kh70	iqkwqr48zrs	1	\N	\N	1
nocobase-user-profile-edit-form	qvomdfkmi2k	4	\N	\N	\N
kjbvk5dssba	qvomdfkmi2k	3	\N	\N	\N
9cwmwq0kh70	qvomdfkmi2k	2	\N	\N	\N
qvomdfkmi2k	qvomdfkmi2k	0	f	properties	\N
iqkwqr48zrs	qvomdfkmi2k	1	\N	\N	1
nocobase-user-profile-edit-form	11oqup7lyod	5	\N	\N	\N
kjbvk5dssba	11oqup7lyod	4	\N	\N	\N
9cwmwq0kh70	11oqup7lyod	3	\N	\N	\N
iqkwqr48zrs	11oqup7lyod	2	\N	\N	\N
11oqup7lyod	11oqup7lyod	0	f	properties	\N
qvomdfkmi2k	11oqup7lyod	1	\N	\N	1
nocobase-user-profile-edit-form	rizi7fj8caj	6	\N	\N	\N
kjbvk5dssba	rizi7fj8caj	5	\N	\N	\N
9cwmwq0kh70	rizi7fj8caj	4	\N	\N	\N
iqkwqr48zrs	rizi7fj8caj	3	\N	\N	\N
qvomdfkmi2k	rizi7fj8caj	2	\N	\N	\N
rizi7fj8caj	rizi7fj8caj	0	f	properties	\N
11oqup7lyod	rizi7fj8caj	1	\N	\N	1
nocobase-user-profile-edit-form	wz1rv870cv4	4	\N	\N	\N
kjbvk5dssba	wz1rv870cv4	3	\N	\N	\N
9cwmwq0kh70	wz1rv870cv4	2	\N	\N	\N
wz1rv870cv4	wz1rv870cv4	0	f	properties	\N
iqkwqr48zrs	wz1rv870cv4	1	\N	\N	2
nocobase-user-profile-edit-form	wcj7mc8kdlc	5	\N	\N	\N
kjbvk5dssba	wcj7mc8kdlc	4	\N	\N	\N
9cwmwq0kh70	wcj7mc8kdlc	3	\N	\N	\N
iqkwqr48zrs	wcj7mc8kdlc	2	\N	\N	\N
wcj7mc8kdlc	wcj7mc8kdlc	0	f	properties	\N
wz1rv870cv4	wcj7mc8kdlc	1	\N	\N	1
nocobase-user-profile-edit-form	z1nlzs4ckds	6	\N	\N	\N
kjbvk5dssba	z1nlzs4ckds	5	\N	\N	\N
9cwmwq0kh70	z1nlzs4ckds	4	\N	\N	\N
iqkwqr48zrs	z1nlzs4ckds	3	\N	\N	\N
wz1rv870cv4	z1nlzs4ckds	2	\N	\N	\N
z1nlzs4ckds	z1nlzs4ckds	0	f	properties	\N
wcj7mc8kdlc	z1nlzs4ckds	1	\N	\N	1
nocobase-user-profile-edit-form	51eild18qxs	4	\N	\N	\N
kjbvk5dssba	51eild18qxs	3	\N	\N	\N
9cwmwq0kh70	51eild18qxs	2	\N	\N	\N
51eild18qxs	51eild18qxs	0	f	properties	\N
iqkwqr48zrs	51eild18qxs	1	\N	\N	3
nocobase-user-profile-edit-form	8eegfpant8l	5	\N	\N	\N
kjbvk5dssba	8eegfpant8l	4	\N	\N	\N
9cwmwq0kh70	8eegfpant8l	3	\N	\N	\N
iqkwqr48zrs	8eegfpant8l	2	\N	\N	\N
8eegfpant8l	8eegfpant8l	0	f	properties	\N
51eild18qxs	8eegfpant8l	1	\N	\N	1
nocobase-user-profile-edit-form	yo5hnu83eaw	6	\N	\N	\N
kjbvk5dssba	yo5hnu83eaw	5	\N	\N	\N
9cwmwq0kh70	yo5hnu83eaw	4	\N	\N	\N
iqkwqr48zrs	yo5hnu83eaw	3	\N	\N	\N
51eild18qxs	yo5hnu83eaw	2	\N	\N	\N
yo5hnu83eaw	yo5hnu83eaw	0	f	properties	\N
8eegfpant8l	yo5hnu83eaw	1	\N	\N	1
nocobase-user-profile-edit-form	6sfjbc382ds	4	\N	\N	\N
kjbvk5dssba	6sfjbc382ds	3	\N	\N	\N
9cwmwq0kh70	6sfjbc382ds	2	\N	\N	\N
6sfjbc382ds	6sfjbc382ds	0	f	properties	\N
iqkwqr48zrs	6sfjbc382ds	1	\N	\N	4
nocobase-user-profile-edit-form	pusl29uog60	5	\N	\N	\N
kjbvk5dssba	pusl29uog60	4	\N	\N	\N
9cwmwq0kh70	pusl29uog60	3	\N	\N	\N
iqkwqr48zrs	pusl29uog60	2	\N	\N	\N
pusl29uog60	pusl29uog60	0	f	properties	\N
6sfjbc382ds	pusl29uog60	1	\N	\N	1
nocobase-user-profile-edit-form	czubrotwt78	6	\N	\N	\N
kjbvk5dssba	czubrotwt78	5	\N	\N	\N
9cwmwq0kh70	czubrotwt78	4	\N	\N	\N
iqkwqr48zrs	czubrotwt78	3	\N	\N	\N
6sfjbc382ds	czubrotwt78	2	\N	\N	\N
czubrotwt78	czubrotwt78	0	f	properties	\N
pusl29uog60	czubrotwt78	1	\N	\N	1
nocobase-user-profile-edit-form	nb7ixhb4cum	3	\N	\N	\N
kjbvk5dssba	nb7ixhb4cum	2	\N	\N	\N
nb7ixhb4cum	nb7ixhb4cum	0	f	properties	\N
9cwmwq0kh70	nb7ixhb4cum	1	\N	\N	2
nocobase-user-profile-edit-form	kc6vtd00mt6	4	\N	\N	\N
kjbvk5dssba	kc6vtd00mt6	3	\N	\N	\N
9cwmwq0kh70	kc6vtd00mt6	2	\N	\N	\N
kc6vtd00mt6	kc6vtd00mt6	0	f	properties	\N
nb7ixhb4cum	kc6vtd00mt6	1	\N	\N	1
nocobase-user-profile-edit-form	s2wfn9sozoo	4	\N	\N	\N
kjbvk5dssba	s2wfn9sozoo	3	\N	\N	\N
9cwmwq0kh70	s2wfn9sozoo	2	\N	\N	\N
s2wfn9sozoo	s2wfn9sozoo	0	f	properties	\N
nb7ixhb4cum	s2wfn9sozoo	1	\N	\N	2
\.


--
-- TOC entry 4319 (class 0 OID 16819)
-- Dependencies: 272
-- Data for Name: uiSchemas; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."uiSchemas" ("x-uid", name, schema) FROM stdin;
nocobase-admin-profile-create-form	idc62jxa6io	{"type":"void"}
27sa0h34sa9	form	{"type":"void","x-decorator":"FormBlockProvider","x-decorator-props":{"collection":"users","dataSource":"main"},"x-use-decorator-props":"useCreateFormBlockDecoratorProps"}
f3sfx5yvhn2	create	{"type":"void","x-component":"FormV2","x-use-component-props":"useCreateFormBlockProps"}
d88p4wnkc7b	grid	{"type":"void","x-component":"Grid","x-initializer":"form:configureFields"}
2nq5i90z3l5	nickname	{"type":"void","x-component":"Grid.Row"}
4xex6fc7yy3	col	{"type":"void","x-component":"Grid.Col"}
936xaupk8x6	nickname	{"type":"string","x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.nickname"}
u9qjfzrf581	username	{"type":"void","x-component":"Grid.Row"}
j15ls0gwfa8	col	{"type":"void","x-component":"Grid.Col"}
ean995sj1g6	username	{"type":"string","required":true,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.username"}
3z3xlf37zch	email	{"type":"void","x-component":"Grid.Row"}
7g2pir1ny3w	col	{"type":"void","x-component":"Grid.Col"}
vv66do4f7xa	email	{"type":"string","required":false,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.email"}
x9tsk35cewt	phone	{"type":"void","x-component":"Grid.Row"}
xyxdnyp61ik	col	{"type":"void","x-component":"Grid.Col"}
z37o84cs68g	phone	{"type":"string","required":false,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.phone"}
m9dx6py01js	password	{"type":"void","x-component":"Grid.Row"}
onyb0q74y28	col	{"type":"void","x-component":"Grid.Col"}
mb4hg5oii9r	password	{"type":"string","required":true,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.password"}
988n63sonw6	roles	{"type":"void","x-component":"Grid.Row"}
6e154dl4gk2	col	{"type":"void","x-component":"Grid.Col"}
icietk59903	roles	{"type":"string","required":false,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.roles"}
gsvnt786lf0	footer	{"type":"void","x-component":"Action.Drawer.FootBar"}
po3lc4l1dub	cancel	{"title":"{{ t(\\"Cancel\\") }}","x-component":"Action","x-use-component-props":"useCancelActionProps"}
q1jpleprn3l	submit	{"title":"{{ t(\\"Submit\\") }}","x-component":"Action","x-use-component-props":"useCreateActionProps","x-component-props":{"type":"primary","htmlType":"submit"}}
nocobase-admin-profile-edit-form	99jv13hzl4v	{"type":"void"}
sp7kzm3ud9i	form	{"type":"void","x-decorator":"FormBlockProvider","x-decorator-props":{"collection":"users","dataSource":"main","action":"get"},"x-use-decorator-props":"useEditFormBlockDecoratorProps"}
s8u6bmpl2xr	edit	{"type":"void","x-component":"FormV2","x-use-component-props":"useEditFormBlockProps"}
qinq14cq087	grid	{"type":"void","x-component":"Grid","x-initializer":"form:configureFields"}
k8qu0k7n3th	nickname	{"type":"void","x-component":"Grid.Row"}
t7fit5iaver	col	{"type":"void","x-component":"Grid.Col"}
nksviv8126g	nickname	{"type":"string","x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.nickname"}
209csnoncay	username	{"type":"void","x-component":"Grid.Row"}
1ivw6qauw36	col	{"type":"void","x-component":"Grid.Col"}
qpjjmuks1dw	username	{"type":"string","required":true,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.username"}
yj03uvuaqi5	email	{"type":"void","x-component":"Grid.Row"}
zxos5hpu1pv	col	{"type":"void","x-component":"Grid.Col"}
bxkn69p867c	email	{"type":"string","required":false,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.email"}
2wtp4x8upca	phone	{"type":"void","x-component":"Grid.Row"}
qcxeh52id2d	col	{"type":"void","x-component":"Grid.Col"}
fn4m8d3g5eu	phone	{"type":"string","required":false,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.phone"}
py6deaggm4g	roles	{"type":"void","x-component":"Grid.Row"}
d43qhwcmm6a	col	{"type":"void","x-component":"Grid.Col"}
ystfg4gvau4	roles	{"type":"string","required":false,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.roles"}
ek7wbw1b9iz	footer	{"type":"void","x-component":"Action.Drawer.FootBar"}
rya7faf4yjv	cancel	{"title":"{{ t(\\"Cancel\\") }}","x-component":"Action","x-use-component-props":"useCancelActionProps"}
f8olu9x0b6t	submit	{"title":"{{ t(\\"Submit\\") }}","x-component":"Action","x-use-component-props":"useUpdateActionProps","x-component-props":{"type":"primary","htmlType":"submit"}}
nocobase-user-profile-edit-form	go9soak8qlj	{"type":"void"}
kjbvk5dssba	form	{"type":"void","x-decorator":"FormBlockProvider","x-decorator-props":{"collection":"users","dataSource":"main","action":"get"},"x-use-decorator-props":"useEditFormBlockDecoratorProps"}
9cwmwq0kh70	edit	{"type":"void","x-component":"FormV2","x-use-component-props":"useEditFormBlockProps"}
iqkwqr48zrs	grid	{"type":"void","x-component":"Grid","x-initializer":"form:configureFields"}
qvomdfkmi2k	nickname	{"type":"void","x-component":"Grid.Row"}
11oqup7lyod	col	{"type":"void","x-component":"Grid.Col"}
rizi7fj8caj	nickname	{"type":"string","x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.nickname"}
wz1rv870cv4	username	{"type":"void","x-component":"Grid.Row"}
wcj7mc8kdlc	col	{"type":"void","x-component":"Grid.Col"}
z1nlzs4ckds	username	{"type":"string","required":true,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.username"}
51eild18qxs	email	{"type":"void","x-component":"Grid.Row"}
8eegfpant8l	col	{"type":"void","x-component":"Grid.Col"}
yo5hnu83eaw	email	{"type":"string","required":false,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.email"}
6sfjbc382ds	phone	{"type":"void","x-component":"Grid.Row"}
pusl29uog60	col	{"type":"void","x-component":"Grid.Col"}
czubrotwt78	phone	{"type":"string","required":false,"x-toolbar":"FormItemSchemaToolbar","x-settings":"fieldSettings:FormItem","x-component":"CollectionField","x-decorator":"FormItem","x-component-props":{},"x-collection-field":"users.phone"}
nb7ixhb4cum	footer	{"type":"void","x-component":"Action.Drawer.FootBar"}
kc6vtd00mt6	cancel	{"title":"{{ t(\\"Cancel\\") }}","x-component":"Action","x-use-component-props":"useCancelActionProps"}
s2wfn9sozoo	submit	{"title":"{{ t(\\"Submit\\") }}","x-component":"Action","x-use-component-props":"useUpdateProfileActionProps","x-component-props":{"type":"primary","htmlType":"submit"}}
0fa2yc47a4c	n0caicgyu7w	{"type":"void","x-component":"FlowRoute"}
ljfrpm7e234	gtvugedxusg	{"type":"void","x-component":"FlowRoute"}
\.


--
-- TOC entry 4324 (class 0 OID 16846)
-- Dependencies: 277
-- Data for Name: userDataSyncRecords; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."userDataSyncRecords" (id, "createdAt", "updatedAt", "sourceName", "sourceUk", "dataType", "metaData", "lastMetaData") FROM stdin;
\.


--
-- TOC entry 4322 (class 0 OID 16836)
-- Dependencies: 275
-- Data for Name: userDataSyncRecordsResources; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."userDataSyncRecordsResources" (id, "createdAt", "updatedAt", "recordId", resource, "resourcePk") FROM stdin;
\.


--
-- TOC entry 4326 (class 0 OID 16855)
-- Dependencies: 279
-- Data for Name: userDataSyncSources; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."userDataSyncSources" (id, "createdAt", "updatedAt", name, "sourceType", "displayName", enabled, options, sort, "createdById", "updatedById") FROM stdin;
\.


--
-- TOC entry 4328 (class 0 OID 16870)
-- Dependencies: 281
-- Data for Name: userDataSyncTasks; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."userDataSyncTasks" (id, "createdAt", "updatedAt", batch, "sourceId", status, message, cost, sort, "createdById", "updatedById") FROM stdin;
\.


--
-- TOC entry 4341 (class 0 OID 16997)
-- Dependencies: 294
-- Data for Name: userWorkflowTasks; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."userWorkflowTasks" (id, "createdAt", "updatedAt", "userId", type, stats) FROM stdin;
\.


--
-- TOC entry 4330 (class 0 OID 16884)
-- Dependencies: 283
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.users (id, "createdAt", "updatedAt", nickname, username, email, phone, password, "passwordChangeTz", "appLang", "resetToken", "systemSettings", sort, "createdById", "updatedById") FROM stdin;
1	2026-02-24 15:08:51.854+00	2026-02-24 15:08:51.854+00	Super Admin	nocobase	admin@nocobase.com	\N	50809de83cb75d01843c3983621c6a03874c4e0a0038abd3f6dbc2a39969602a	\N	\N	\N	{}	1	\N	\N
\.


--
-- TOC entry 4364 (class 0 OID 17174)
-- Dependencies: 317
-- Data for Name: usersAiEmployees; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."usersAiEmployees" ("createdAt", "updatedAt", sort, prompt, "aiEmployee", "userId") FROM stdin;
\.


--
-- TOC entry 4282 (class 0 OID 16520)
-- Dependencies: 235
-- Data for Name: usersAuthenticators; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."usersAuthenticators" ("createdAt", "updatedAt", uuid, nickname, avatar, meta, "createdById", "updatedById", authenticator, "userId") FROM stdin;
\.


--
-- TOC entry 4332 (class 0 OID 16912)
-- Dependencies: 285
-- Data for Name: usersVerificators; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."usersVerificators" ("createdAt", "updatedAt", uuid, meta, "createdById", "updatedById", verificator, "userId") FROM stdin;
\.


--
-- TOC entry 4333 (class 0 OID 16923)
-- Dependencies: 286
-- Data for Name: usersVerifiers; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."usersVerifiers" ("createdAt", "updatedAt", uuid, meta, "createdById", "updatedById", verifier, "userId") FROM stdin;
\.


--
-- TOC entry 4377 (class 0 OID 17285)
-- Dependencies: 330
-- Data for Name: vehicle_items; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.vehicle_items ("createdAt", "updatedAt", "parentId", id, "createdById", "updatedById", name, category, header) FROM stdin;
2026-02-24 15:46:53.188+00	2026-02-24 15:46:53.188+00	\N	350065029677056	1	1	Level1	test	\N
2026-02-24 15:47:26.124+00	2026-02-24 15:47:26.137+00	350065029677056	350065098883072	1	1	Level2	test	\N
2026-02-24 15:47:55.411+00	2026-02-24 15:47:55.425+00	350065128243200	350065159700480	1	1	Level4	test	@col1@col2@col3@col4
2026-02-24 15:47:40.056+00	2026-02-24 15:48:17.171+00	350065098883072	350065128243200	1	1	Level3	test	@col1@col2@col3
\.


--
-- TOC entry 4375 (class 0 OID 17273)
-- Dependencies: 328
-- Data for Name: vehicle_objects; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.vehicle_objects ("createdAt", "updatedAt", "parentId", id, "createdById", "updatedById", name) FROM stdin;
2026-02-24 15:40:57.257+00	2026-02-24 15:40:57.257+00	\N	350064283090944	1	1	Level1
2026-02-24 15:41:49.138+00	2026-02-24 15:41:49.152+00	350064283090944	350064392142848	1	1	Level2
2026-02-24 15:42:30.317+00	2026-02-24 15:42:30.328+00	350064392142848	350064478126080	1	1	Level3
2026-02-24 15:43:34.477+00	2026-02-24 15:43:34.495+00	350064478126080	350064612343808	1	1	Level4
\.


--
-- TOC entry 4379 (class 0 OID 17297)
-- Dependencies: 332
-- Data for Name: vehicle_objects_items; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.vehicle_objects_items ("createdAt", "updatedAt", id, "createdById", "updatedById", vehicle_object_id, vehicle_item_id) FROM stdin;
2026-02-24 15:50:27.928+00	2026-02-24 15:50:27.949+00	350065478467584	1	1	350064612343808	350065128243200
2026-02-24 15:50:41.901+00	2026-02-24 15:50:41.909+00	350065507827712	1	1	350064612343808	350065159700480
\.


--
-- TOC entry 4384 (class 0 OID 17390)
-- Dependencies: 337
-- Data for Name: vehicle_test_values; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.vehicle_test_values ("createdAt", "updatedAt", id, "createdById", "updatedById", vehicle_object_item_id, version, index, value) FROM stdin;
2026-03-05 17:05:21.069+00	2026-03-05 17:05:21.084+00	351705647546368	1	1	350065507827712	1	0	10
2026-03-05 17:05:41.402+00	2026-03-05 17:05:41.409+00	351705689489408	1	1	350065507827712	1	1	20
2026-03-05 17:05:56.36+00	2026-03-05 17:05:56.368+00	351705720946688	1	1	350065507827712	2	0	30
2026-03-05 17:06:24.58+00	2026-03-05 17:06:24.589+00	351705779666944	1	1	350065507827712	2	1	40
\.


--
-- TOC entry 4334 (class 0 OID 16934)
-- Dependencies: 287
-- Data for Name: verifications; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.verifications (id, "createdAt", "updatedAt", type, receiver, status, "expiresAt", content, "providerId") FROM stdin;
\.


--
-- TOC entry 4335 (class 0 OID 16943)
-- Dependencies: 288
-- Data for Name: verifications_providers; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.verifications_providers (id, "createdAt", "updatedAt", title, type, options, "default") FROM stdin;
\.


--
-- TOC entry 4336 (class 0 OID 16950)
-- Dependencies: 289
-- Data for Name: verificators; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.verificators ("createdAt", "updatedAt", name, title, "verificationType", description, options) FROM stdin;
\.


--
-- TOC entry 4337 (class 0 OID 16957)
-- Dependencies: 290
-- Data for Name: verifiers; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.verifiers ("createdAt", "updatedAt", name, title, "verificationType", description, options) FROM stdin;
\.


--
-- TOC entry 4342 (class 0 OID 17006)
-- Dependencies: 295
-- Data for Name: workflowCategories; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."workflowCategories" (id, "createdAt", "updatedAt", title, color, sort) FROM stdin;
\.


--
-- TOC entry 4343 (class 0 OID 17014)
-- Dependencies: 296
-- Data for Name: workflowCategoryRelations; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."workflowCategoryRelations" ("createdAt", "updatedAt", "workflowCategoryId", "workflowId", "categoryId") FROM stdin;
\.


--
-- TOC entry 4344 (class 0 OID 17021)
-- Dependencies: 297
-- Data for Name: workflowStats; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."workflowStats" ("createdAt", "updatedAt", key, executed) FROM stdin;
\.


--
-- TOC entry 4346 (class 0 OID 17028)
-- Dependencies: 299
-- Data for Name: workflowTasks; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."workflowTasks" (id, "createdAt", "updatedAt", "userId", type, key, "workflowId") FROM stdin;
\.


--
-- TOC entry 4347 (class 0 OID 17039)
-- Dependencies: 300
-- Data for Name: workflowVersionStats; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public."workflowVersionStats" ("createdAt", "updatedAt", id, executed) FROM stdin;
\.


--
-- TOC entry 4348 (class 0 OID 17045)
-- Dependencies: 301
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: nocobase
--

COPY public.workflows (id, "createdAt", "updatedAt", key, title, enabled, description, type, "triggerTitle", config, executed, "allExecuted", current, sync, options) FROM stdin;
\.


--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 302
-- Name: aiContextDatasources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."aiContextDatasources_id_seq"', 1, false);


--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 307
-- Name: aiFiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."aiFiles_id_seq"', 1, false);


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 310
-- Name: aiSettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."aiSettings_id_seq"', 1, true);


--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 335
-- Name: apiKeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."apiKeys_id_seq"', 1, false);


--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 215
-- Name: applicationPlugins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."applicationPlugins_id_seq"', 62, true);


--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 217
-- Name: applicationVersion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."applicationVersion_id_seq"', 1, true);


--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 255
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public.attachments_id_seq', 2, true);


--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 229
-- Name: authenticators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public.authenticators_id_seq', 1, true);


--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 323
-- Name: blockTemplateLinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."blockTemplateLinks_id_seq"', 1, false);


--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 260
-- Name: flowSql_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."flowSql_id_seq"', 1, false);


--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 223
-- Name: rolesResourcesActions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."rolesResourcesActions_id_seq"', 1, false);


--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 225
-- Name: rolesResourcesScopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."rolesResourcesScopes_id_seq"', 1, false);


--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 221
-- Name: rolesResources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."rolesResources_id_seq"', 1, false);


--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 253
-- Name: sequences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public.sequences_id_seq', 1, false);


--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 265
-- Name: systemSettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."systemSettings_id_seq"', 1, true);


--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 321
-- Name: themeConfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."themeConfig_id_seq"', 4, true);


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 232
-- Name: tokenBlacklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."tokenBlacklist_id_seq"', 1, false);


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 268
-- Name: uiSchemaServerHooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."uiSchemaServerHooks_id_seq"', 1, false);


--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 274
-- Name: userDataSyncRecordsResources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."userDataSyncRecordsResources_id_seq"', 1, false);


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 276
-- Name: userDataSyncRecords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."userDataSyncRecords_id_seq"', 1, false);


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 278
-- Name: userDataSyncSources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."userDataSyncSources_id_seq"', 1, false);


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 280
-- Name: userDataSyncTasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."userDataSyncTasks_id_seq"', 1, false);


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 282
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 298
-- Name: workflowTasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nocobase
--

SELECT pg_catalog.setval('public."workflowTasks_id_seq"', 1, false);


--
-- TOC entry 4024 (class 2606 OID 17069)
-- Name: aiContextDatasources aiContextDatasources_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."aiContextDatasources"
    ADD CONSTRAINT "aiContextDatasources_pkey" PRIMARY KEY (id);


--
-- TOC entry 4026 (class 2606 OID 17077)
-- Name: aiConversations aiConversations_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."aiConversations"
    ADD CONSTRAINT "aiConversations_pkey" PRIMARY KEY ("sessionId");


--
-- TOC entry 4030 (class 2606 OID 17089)
-- Name: aiEmployees aiEmployees_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."aiEmployees"
    ADD CONSTRAINT "aiEmployees_pkey" PRIMARY KEY (username);


--
-- TOC entry 4035 (class 2606 OID 17107)
-- Name: aiFiles aiFiles_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."aiFiles"
    ADD CONSTRAINT "aiFiles_pkey" PRIMARY KEY (id);


--
-- TOC entry 4040 (class 2606 OID 17117)
-- Name: aiMessages aiMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."aiMessages"
    ADD CONSTRAINT "aiMessages_pkey" PRIMARY KEY ("messageId");


--
-- TOC entry 4043 (class 2606 OID 17128)
-- Name: aiSettings aiSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."aiSettings"
    ADD CONSTRAINT "aiSettings_pkey" PRIMARY KEY (id);


--
-- TOC entry 4045 (class 2606 OID 17136)
-- Name: aiToolMessages aiToolMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."aiToolMessages"
    ADD CONSTRAINT "aiToolMessages_pkey" PRIMARY KEY (id);


--
-- TOC entry 4111 (class 2606 OID 17387)
-- Name: apiKeys apiKeys_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."apiKeys"
    ADD CONSTRAINT "apiKeys_pkey" PRIMARY KEY (id);


--
-- TOC entry 3781 (class 2606 OID 16404)
-- Name: applicationPlugins applicationPlugins_name_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."applicationPlugins"
    ADD CONSTRAINT "applicationPlugins_name_key" UNIQUE (name);


--
-- TOC entry 3783 (class 2606 OID 16406)
-- Name: applicationPlugins applicationPlugins_packageName_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."applicationPlugins"
    ADD CONSTRAINT "applicationPlugins_packageName_key" UNIQUE ("packageName");


--
-- TOC entry 3785 (class 2606 OID 16402)
-- Name: applicationPlugins applicationPlugins_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."applicationPlugins"
    ADD CONSTRAINT "applicationPlugins_pkey" PRIMARY KEY (id);


--
-- TOC entry 3787 (class 2606 OID 16413)
-- Name: applicationVersion applicationVersion_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."applicationVersion"
    ADD CONSTRAINT "applicationVersion_pkey" PRIMARY KEY (id);


--
-- TOC entry 3870 (class 2606 OID 16643)
-- Name: asyncTasks asyncTasks_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."asyncTasks"
    ADD CONSTRAINT "asyncTasks_pkey" PRIMARY KEY (id);


--
-- TOC entry 3890 (class 2606 OID 16700)
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 3811 (class 2606 OID 16493)
-- Name: authenticators authenticators_name_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.authenticators
    ADD CONSTRAINT authenticators_name_key UNIQUE (name);


--
-- TOC entry 3813 (class 2606 OID 16491)
-- Name: authenticators authenticators_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.authenticators
    ADD CONSTRAINT authenticators_pkey PRIMARY KEY (id);


--
-- TOC entry 4071 (class 2606 OID 17225)
-- Name: blockTemplateLinks blockTemplateLinks_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."blockTemplateLinks"
    ADD CONSTRAINT "blockTemplateLinks_pkey" PRIMARY KEY (id);


--
-- TOC entry 4076 (class 2606 OID 17237)
-- Name: blockTemplates blockTemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."blockTemplates"
    ADD CONSTRAINT "blockTemplates_pkey" PRIMARY KEY (key);


--
-- TOC entry 3873 (class 2606 OID 16652)
-- Name: collectionCategories collectionCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."collectionCategories"
    ADD CONSTRAINT "collectionCategories_pkey" PRIMARY KEY (id);


--
-- TOC entry 3879 (class 2606 OID 16669)
-- Name: collectionCategory collectionCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."collectionCategory"
    ADD CONSTRAINT "collectionCategory_pkey" PRIMARY KEY ("collectionName", "categoryId");


--
-- TOC entry 3875 (class 2606 OID 16664)
-- Name: collections collections_name_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_name_key UNIQUE (name);


--
-- TOC entry 3877 (class 2606 OID 16662)
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (key);


--
-- TOC entry 3807 (class 2606 OID 16478)
-- Name: customRequestsRoles customRequestsRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."customRequestsRoles"
    ADD CONSTRAINT "customRequestsRoles_pkey" PRIMARY KEY ("customRequestKey", "roleName");


--
-- TOC entry 3805 (class 2606 OID 16471)
-- Name: customRequests customRequests_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."customRequests"
    ADD CONSTRAINT "customRequests_pkey" PRIMARY KEY (key);


--
-- TOC entry 3842 (class 2606 OID 16568)
-- Name: dataSourcesCollections dataSourcesCollections_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."dataSourcesCollections"
    ADD CONSTRAINT "dataSourcesCollections_pkey" PRIMARY KEY (key);


--
-- TOC entry 3846 (class 2606 OID 16578)
-- Name: dataSourcesFields dataSourcesFields_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."dataSourcesFields"
    ADD CONSTRAINT "dataSourcesFields_pkey" PRIMARY KEY (key);


--
-- TOC entry 3851 (class 2606 OID 16589)
-- Name: dataSourcesRolesResourcesActions dataSourcesRolesResourcesActions_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."dataSourcesRolesResourcesActions"
    ADD CONSTRAINT "dataSourcesRolesResourcesActions_pkey" PRIMARY KEY (id);


--
-- TOC entry 3855 (class 2606 OID 16600)
-- Name: dataSourcesRolesResourcesScopes dataSourcesRolesResourcesScopes_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."dataSourcesRolesResourcesScopes"
    ADD CONSTRAINT "dataSourcesRolesResourcesScopes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3858 (class 2606 OID 16609)
-- Name: dataSourcesRolesResources dataSourcesRolesResources_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."dataSourcesRolesResources"
    ADD CONSTRAINT "dataSourcesRolesResources_pkey" PRIMARY KEY (id);


--
-- TOC entry 3862 (class 2606 OID 16618)
-- Name: dataSourcesRoles dataSourcesRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."dataSourcesRoles"
    ADD CONSTRAINT "dataSourcesRoles_pkey" PRIMARY KEY (id);


--
-- TOC entry 3866 (class 2606 OID 16629)
-- Name: dataSources dataSources_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."dataSources"
    ADD CONSTRAINT "dataSources_pkey" PRIMARY KEY (key);


--
-- TOC entry 3835 (class 2606 OID 16548)
-- Name: desktopRoutes desktopRoutes_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."desktopRoutes"
    ADD CONSTRAINT "desktopRoutes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3868 (class 2606 OID 16636)
-- Name: environmentVariables environmentVariables_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."environmentVariables"
    ADD CONSTRAINT "environmentVariables_pkey" PRIMARY KEY (name);


--
-- TOC entry 3988 (class 2606 OID 16973)
-- Name: executions executions_eventKey_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.executions
    ADD CONSTRAINT "executions_eventKey_key" UNIQUE ("eventKey");


--
-- TOC entry 3990 (class 2606 OID 16971)
-- Name: executions executions_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.executions
    ADD CONSTRAINT executions_pkey PRIMARY KEY (id);


--
-- TOC entry 4107 (class 2606 OID 17326)
-- Name: feature_values feature_values_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.feature_values
    ADD CONSTRAINT feature_values_pkey PRIMARY KEY (id);


--
-- TOC entry 3884 (class 2606 OID 16678)
-- Name: fields fields_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_pkey PRIMARY KEY (key);


--
-- TOC entry 4079 (class 2606 OID 17245)
-- Name: flowModelTemplateUsages flowModelTemplateUsages_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."flowModelTemplateUsages"
    ADD CONSTRAINT "flowModelTemplateUsages_pkey" PRIMARY KEY (uid);


--
-- TOC entry 4085 (class 2606 OID 17256)
-- Name: flowModelTemplates flowModelTemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."flowModelTemplates"
    ADD CONSTRAINT "flowModelTemplates_pkey" PRIMARY KEY (uid);


--
-- TOC entry 3898 (class 2606 OID 16727)
-- Name: flowModelTreePath flowModelTreePath_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."flowModelTreePath"
    ADD CONSTRAINT "flowModelTreePath_pkey" PRIMARY KEY (ancestor, descendant);


--
-- TOC entry 3901 (class 2606 OID 16736)
-- Name: flowModels flowModels_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."flowModels"
    ADD CONSTRAINT "flowModels_pkey" PRIMARY KEY (uid);


--
-- TOC entry 3903 (class 2606 OID 16745)
-- Name: flowSql flowSql_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."flowSql"
    ADD CONSTRAINT "flowSql_pkey" PRIMARY KEY (id);


--
-- TOC entry 3905 (class 2606 OID 16747)
-- Name: flowSql flowSql_uid_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."flowSql"
    ADD CONSTRAINT "flowSql_uid_key" UNIQUE (uid);


--
-- TOC entry 3994 (class 2606 OID 16983)
-- Name: flow_nodes flow_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.flow_nodes
    ADD CONSTRAINT flow_nodes_pkey PRIMARY KEY (id);


--
-- TOC entry 3831 (class 2606 OID 16539)
-- Name: iframeHtml iframeHtml_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."iframeHtml"
    ADD CONSTRAINT "iframeHtml_pkey" PRIMARY KEY (id);


--
-- TOC entry 3816 (class 2606 OID 16500)
-- Name: issuedTokens issuedTokens_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."issuedTokens"
    ADD CONSTRAINT "issuedTokens_pkey" PRIMARY KEY (id);


--
-- TOC entry 4000 (class 2606 OID 16993)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4048 (class 2606 OID 17145)
-- Name: lcCheckpointBlobs lcCheckpointBlobs_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."lcCheckpointBlobs"
    ADD CONSTRAINT "lcCheckpointBlobs_pkey" PRIMARY KEY ("threadId", "checkpointNs", channel, version);


--
-- TOC entry 4050 (class 2606 OID 17153)
-- Name: lcCheckpointWrites lcCheckpointWrites_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."lcCheckpointWrites"
    ADD CONSTRAINT "lcCheckpointWrites_pkey" PRIMARY KEY ("threadId", "checkpointNs", "checkpointId", "taskId", idx);


--
-- TOC entry 4052 (class 2606 OID 17162)
-- Name: lcCheckpoints lcCheckpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."lcCheckpoints"
    ADD CONSTRAINT "lcCheckpoints_pkey" PRIMARY KEY ("threadId", "checkpointNs", "checkpointId");


--
-- TOC entry 4054 (class 2606 OID 17172)
-- Name: llmServices llmServices_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."llmServices"
    ADD CONSTRAINT "llmServices_pkey" PRIMARY KEY (name);


--
-- TOC entry 3779 (class 2606 OID 16393)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (name);


--
-- TOC entry 3907 (class 2606 OID 16754)
-- Name: mobileRoutes mobileRoutes_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."mobileRoutes"
    ADD CONSTRAINT "mobileRoutes_pkey" PRIMARY KEY (id);


--
-- TOC entry 4060 (class 2606 OID 17189)
-- Name: notificationChannels notificationChannels_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."notificationChannels"
    ADD CONSTRAINT "notificationChannels_pkey" PRIMARY KEY (name);


--
-- TOC entry 4066 (class 2606 OID 17205)
-- Name: notificationInAppMessages notificationInAppMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."notificationInAppMessages"
    ADD CONSTRAINT "notificationInAppMessages_pkey" PRIMARY KEY (id);


--
-- TOC entry 4064 (class 2606 OID 17198)
-- Name: notificationSendLogs notificationSendLogs_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."notificationSendLogs"
    ADD CONSTRAINT "notificationSendLogs_pkey" PRIMARY KEY (id);


--
-- TOC entry 3965 (class 2606 OID 16910)
-- Name: otpRecords otpRecords_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."otpRecords"
    ADD CONSTRAINT "otpRecords_pkey" PRIMARY KEY (id);


--
-- TOC entry 4032 (class 2606 OID 17096)
-- Name: rolesAiEmployees rolesAiEmployees_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesAiEmployees"
    ADD CONSTRAINT "rolesAiEmployees_pkey" PRIMARY KEY ("aiEmployee", "roleName");


--
-- TOC entry 3839 (class 2606 OID 16560)
-- Name: rolesDesktopRoutes rolesDesktopRoutes_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesDesktopRoutes"
    ADD CONSTRAINT "rolesDesktopRoutes_pkey" PRIMARY KEY ("desktopRouteId", "roleName");


--
-- TOC entry 3911 (class 2606 OID 16766)
-- Name: rolesMobileRoutes rolesMobileRoutes_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesMobileRoutes"
    ADD CONSTRAINT "rolesMobileRoutes_pkey" PRIMARY KEY ("mobileRouteId", "roleName");


--
-- TOC entry 3799 (class 2606 OID 16452)
-- Name: rolesResourcesActions rolesResourcesActions_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesResourcesActions"
    ADD CONSTRAINT "rolesResourcesActions_pkey" PRIMARY KEY (id);


--
-- TOC entry 3803 (class 2606 OID 16464)
-- Name: rolesResourcesScopes rolesResourcesScopes_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesResourcesScopes"
    ADD CONSTRAINT "rolesResourcesScopes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3796 (class 2606 OID 16441)
-- Name: rolesResources rolesResources_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesResources"
    ADD CONSTRAINT "rolesResources_pkey" PRIMARY KEY (id);


--
-- TOC entry 3932 (class 2606 OID 16833)
-- Name: rolesUischemas rolesUischemas_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesUischemas"
    ADD CONSTRAINT "rolesUischemas_pkey" PRIMARY KEY ("roleName", "uiSchemaXUid");


--
-- TOC entry 3789 (class 2606 OID 16418)
-- Name: rolesUsers rolesUsers_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."rolesUsers"
    ADD CONSTRAINT "rolesUsers_pkey" PRIMARY KEY ("roleName", "userId");


--
-- TOC entry 3792 (class 2606 OID 16429)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (name);


--
-- TOC entry 3794 (class 2606 OID 16431)
-- Name: roles roles_title_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_title_key UNIQUE (title);


--
-- TOC entry 3887 (class 2606 OID 16690)
-- Name: sequences sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.sequences
    ADD CONSTRAINT sequences_pkey PRIMARY KEY (id);


--
-- TOC entry 3894 (class 2606 OID 16720)
-- Name: storages storages_name_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.storages
    ADD CONSTRAINT storages_name_key UNIQUE (name);


--
-- TOC entry 3896 (class 2606 OID 16718)
-- Name: storages storages_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.storages
    ADD CONSTRAINT storages_pkey PRIMARY KEY (id);


--
-- TOC entry 3914 (class 2606 OID 16781)
-- Name: systemSettings systemSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."systemSettings"
    ADD CONSTRAINT "systemSettings_pkey" PRIMARY KEY (id);


--
-- TOC entry 4104 (class 2606 OID 17306)
-- Name: t_d6ursut4ws9 t_d6ursut4ws9_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.t_d6ursut4ws9
    ADD CONSTRAINT t_d6ursut4ws9_pkey PRIMARY KEY (f_b0ayz6z0chw, f_qahz3h30s16);


--
-- TOC entry 4069 (class 2606 OID 17216)
-- Name: themeConfig themeConfig_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."themeConfig"
    ADD CONSTRAINT "themeConfig_pkey" PRIMARY KEY (id);


--
-- TOC entry 3819 (class 2606 OID 16508)
-- Name: tokenBlacklist tokenBlacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."tokenBlacklist"
    ADD CONSTRAINT "tokenBlacklist_pkey" PRIMARY KEY (id);


--
-- TOC entry 3822 (class 2606 OID 16517)
-- Name: tokenControlConfig tokenControlConfig_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."tokenControlConfig"
    ADD CONSTRAINT "tokenControlConfig_pkey" PRIMARY KEY (key);


--
-- TOC entry 3917 (class 2606 OID 16790)
-- Name: uiButtonSchemasRoles uiButtonSchemasRoles_uid_roleName_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."uiButtonSchemasRoles"
    ADD CONSTRAINT "uiButtonSchemasRoles_uid_roleName_key" UNIQUE (uid, "roleName");


--
-- TOC entry 3921 (class 2606 OID 16801)
-- Name: uiSchemaServerHooks uiSchemaServerHooks_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."uiSchemaServerHooks"
    ADD CONSTRAINT "uiSchemaServerHooks_pkey" PRIMARY KEY (id);


--
-- TOC entry 3924 (class 2606 OID 16809)
-- Name: uiSchemaTemplates uiSchemaTemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."uiSchemaTemplates"
    ADD CONSTRAINT "uiSchemaTemplates_pkey" PRIMARY KEY (key);


--
-- TOC entry 3927 (class 2606 OID 16817)
-- Name: uiSchemaTreePath uiSchemaTreePath_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."uiSchemaTreePath"
    ADD CONSTRAINT "uiSchemaTreePath_pkey" PRIMARY KEY (ancestor, descendant);


--
-- TOC entry 3930 (class 2606 OID 16826)
-- Name: uiSchemas uiSchemas_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."uiSchemas"
    ADD CONSTRAINT "uiSchemas_pkey" PRIMARY KEY ("x-uid");


--
-- TOC entry 3935 (class 2606 OID 16843)
-- Name: userDataSyncRecordsResources userDataSyncRecordsResources_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userDataSyncRecordsResources"
    ADD CONSTRAINT "userDataSyncRecordsResources_pkey" PRIMARY KEY (id);


--
-- TOC entry 3938 (class 2606 OID 16853)
-- Name: userDataSyncRecords userDataSyncRecords_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userDataSyncRecords"
    ADD CONSTRAINT "userDataSyncRecords_pkey" PRIMARY KEY (id);


--
-- TOC entry 3940 (class 2606 OID 16866)
-- Name: userDataSyncSources userDataSyncSources_name_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userDataSyncSources"
    ADD CONSTRAINT "userDataSyncSources_name_key" UNIQUE (name);


--
-- TOC entry 3942 (class 2606 OID 16864)
-- Name: userDataSyncSources userDataSyncSources_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userDataSyncSources"
    ADD CONSTRAINT "userDataSyncSources_pkey" PRIMARY KEY (id);


--
-- TOC entry 3946 (class 2606 OID 16879)
-- Name: userDataSyncTasks userDataSyncTasks_batch_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userDataSyncTasks"
    ADD CONSTRAINT "userDataSyncTasks_batch_key" UNIQUE (batch);


--
-- TOC entry 3948 (class 2606 OID 16877)
-- Name: userDataSyncTasks userDataSyncTasks_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userDataSyncTasks"
    ADD CONSTRAINT "userDataSyncTasks_pkey" PRIMARY KEY (id);


--
-- TOC entry 4003 (class 2606 OID 17004)
-- Name: userWorkflowTasks userWorkflowTasks_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."userWorkflowTasks"
    ADD CONSTRAINT "userWorkflowTasks_pkey" PRIMARY KEY (id);


--
-- TOC entry 4056 (class 2606 OID 17180)
-- Name: usersAiEmployees usersAiEmployees_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."usersAiEmployees"
    ADD CONSTRAINT "usersAiEmployees_pkey" PRIMARY KEY ("aiEmployee", "userId");


--
-- TOC entry 3826 (class 2606 OID 16529)
-- Name: usersAuthenticators usersAuthenticators_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."usersAuthenticators"
    ADD CONSTRAINT "usersAuthenticators_pkey" PRIMARY KEY (authenticator, "userId");


--
-- TOC entry 3968 (class 2606 OID 16919)
-- Name: usersVerificators usersVerificators_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."usersVerificators"
    ADD CONSTRAINT "usersVerificators_pkey" PRIMARY KEY (verificator, "userId");


--
-- TOC entry 3973 (class 2606 OID 16930)
-- Name: usersVerifiers usersVerifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."usersVerifiers"
    ADD CONSTRAINT "usersVerifiers_pkey" PRIMARY KEY (verifier, "userId");


--
-- TOC entry 3954 (class 2606 OID 16896)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3956 (class 2606 OID 16898)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 3958 (class 2606 OID 16892)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3960 (class 2606 OID 16900)
-- Name: users users_resetToken_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_resetToken_key" UNIQUE ("resetToken");


--
-- TOC entry 3963 (class 2606 OID 16894)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4094 (class 2606 OID 17289)
-- Name: vehicle_items vehicle_items_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.vehicle_items
    ADD CONSTRAINT vehicle_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4098 (class 2606 OID 17301)
-- Name: vehicle_objects_items vehicle_objects_items_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.vehicle_objects_items
    ADD CONSTRAINT vehicle_objects_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4090 (class 2606 OID 17277)
-- Name: vehicle_objects vehicle_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.vehicle_objects
    ADD CONSTRAINT vehicle_objects_pkey PRIMARY KEY (id);


--
-- TOC entry 4116 (class 2606 OID 17394)
-- Name: vehicle_test_values vehicle_test_values_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.vehicle_test_values
    ADD CONSTRAINT vehicle_test_values_pkey PRIMARY KEY (id);


--
-- TOC entry 3978 (class 2606 OID 16941)
-- Name: verifications verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.verifications
    ADD CONSTRAINT verifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3981 (class 2606 OID 16949)
-- Name: verifications_providers verifications_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.verifications_providers
    ADD CONSTRAINT verifications_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3983 (class 2606 OID 16956)
-- Name: verificators verificators_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.verificators
    ADD CONSTRAINT verificators_pkey PRIMARY KEY (name);


--
-- TOC entry 3985 (class 2606 OID 16963)
-- Name: verifiers verifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.verifiers
    ADD CONSTRAINT verifiers_pkey PRIMARY KEY (name);


--
-- TOC entry 4006 (class 2606 OID 17013)
-- Name: workflowCategories workflowCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."workflowCategories"
    ADD CONSTRAINT "workflowCategories_pkey" PRIMARY KEY (id);


--
-- TOC entry 4008 (class 2606 OID 17018)
-- Name: workflowCategoryRelations workflowCategoryRelations_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."workflowCategoryRelations"
    ADD CONSTRAINT "workflowCategoryRelations_pkey" PRIMARY KEY ("workflowId", "categoryId");


--
-- TOC entry 4012 (class 2606 OID 17026)
-- Name: workflowStats workflowStats_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."workflowStats"
    ADD CONSTRAINT "workflowStats_pkey" PRIMARY KEY (key);


--
-- TOC entry 4014 (class 2606 OID 17035)
-- Name: workflowTasks workflowTasks_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."workflowTasks"
    ADD CONSTRAINT "workflowTasks_pkey" PRIMARY KEY (id);


--
-- TOC entry 4019 (class 2606 OID 17044)
-- Name: workflowVersionStats workflowVersionStats_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public."workflowVersionStats"
    ADD CONSTRAINT "workflowVersionStats_pkey" PRIMARY KEY (id);


--
-- TOC entry 4022 (class 2606 OID 17057)
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: nocobase
--

ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- TOC entry 4027 (class 1259 OID 17079)
-- Name: ai_conversations_ai_employee_username; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ai_conversations_ai_employee_username ON public."aiConversations" USING btree ("aiEmployeeUsername");


--
-- TOC entry 4028 (class 1259 OID 17078)
-- Name: ai_conversations_user_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ai_conversations_user_id ON public."aiConversations" USING btree ("userId");


--
-- TOC entry 4036 (class 1259 OID 17109)
-- Name: ai_files_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ai_files_created_by_id ON public."aiFiles" USING btree ("createdById");


--
-- TOC entry 4037 (class 1259 OID 17108)
-- Name: ai_files_storage_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ai_files_storage_id ON public."aiFiles" USING btree ("storageId");


--
-- TOC entry 4038 (class 1259 OID 17110)
-- Name: ai_files_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ai_files_updated_by_id ON public."aiFiles" USING btree ("updatedById");


--
-- TOC entry 4041 (class 1259 OID 17118)
-- Name: ai_messages_session_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ai_messages_session_id ON public."aiMessages" USING btree ("sessionId");


--
-- TOC entry 4046 (class 1259 OID 17137)
-- Name: ai_tool_messages_tool_call_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ai_tool_messages_tool_call_id ON public."aiToolMessages" USING btree ("toolCallId");


--
-- TOC entry 4112 (class 1259 OID 17389)
-- Name: api_keys_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX api_keys_created_by_id ON public."apiKeys" USING btree ("createdById");


--
-- TOC entry 4113 (class 1259 OID 17388)
-- Name: api_keys_role_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX api_keys_role_name ON public."apiKeys" USING btree ("roleName");


--
-- TOC entry 3871 (class 1259 OID 16644)
-- Name: async_tasks_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX async_tasks_created_by_id ON public."asyncTasks" USING btree ("createdById");


--
-- TOC entry 3888 (class 1259 OID 16701)
-- Name: attachments_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX attachments_created_by_id ON public.attachments USING btree ("createdById");


--
-- TOC entry 3891 (class 1259 OID 16703)
-- Name: attachments_storage_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX attachments_storage_id ON public.attachments USING btree ("storageId");


--
-- TOC entry 3892 (class 1259 OID 16702)
-- Name: attachments_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX attachments_updated_by_id ON public.attachments USING btree ("updatedById");


--
-- TOC entry 3809 (class 1259 OID 16494)
-- Name: authenticators_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX authenticators_created_by_id ON public.authenticators USING btree ("createdById");


--
-- TOC entry 3814 (class 1259 OID 16495)
-- Name: authenticators_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX authenticators_updated_by_id ON public.authenticators USING btree ("updatedById");


--
-- TOC entry 4072 (class 1259 OID 17227)
-- Name: block_template_links_block_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX block_template_links_block_uid ON public."blockTemplateLinks" USING btree ("blockUid");


--
-- TOC entry 4073 (class 1259 OID 17226)
-- Name: block_template_links_template_block_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX block_template_links_template_block_uid ON public."blockTemplateLinks" USING btree ("templateBlockUid");


--
-- TOC entry 4074 (class 1259 OID 17228)
-- Name: block_template_links_template_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX block_template_links_template_key ON public."blockTemplateLinks" USING btree ("templateKey");


--
-- TOC entry 4077 (class 1259 OID 17238)
-- Name: block_templates_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX block_templates_uid ON public."blockTemplates" USING btree (uid);


--
-- TOC entry 3880 (class 1259 OID 16670)
-- Name: collection_category_category_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX collection_category_category_id ON public."collectionCategory" USING btree ("categoryId");


--
-- TOC entry 3808 (class 1259 OID 16479)
-- Name: custom_requests_roles_role_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX custom_requests_roles_role_name ON public."customRequestsRoles" USING btree ("roleName");


--
-- TOC entry 3843 (class 1259 OID 16570)
-- Name: data_sources_collections_data_source_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX data_sources_collections_data_source_key ON public."dataSourcesCollections" USING btree ("dataSourceKey");


--
-- TOC entry 3844 (class 1259 OID 16569)
-- Name: data_sources_collections_name_data_source_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE UNIQUE INDEX data_sources_collections_name_data_source_key ON public."dataSourcesCollections" USING btree (name, "dataSourceKey");


--
-- TOC entry 3847 (class 1259 OID 16580)
-- Name: data_sources_fields_collection_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX data_sources_fields_collection_key ON public."dataSourcesFields" USING btree ("collectionKey");


--
-- TOC entry 3848 (class 1259 OID 16581)
-- Name: data_sources_fields_data_source_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX data_sources_fields_data_source_key ON public."dataSourcesFields" USING btree ("dataSourceKey");


--
-- TOC entry 3849 (class 1259 OID 16579)
-- Name: data_sources_fields_name_collection_name_data_source_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE UNIQUE INDEX data_sources_fields_name_collection_name_data_source_key ON public."dataSourcesFields" USING btree (name, "collectionName", "dataSourceKey");


--
-- TOC entry 3863 (class 1259 OID 16620)
-- Name: data_sources_roles_data_source_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX data_sources_roles_data_source_key ON public."dataSourcesRoles" USING btree ("dataSourceKey");


--
-- TOC entry 3852 (class 1259 OID 16591)
-- Name: data_sources_roles_resources_actions_roles_resource_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX data_sources_roles_resources_actions_roles_resource_id ON public."dataSourcesRolesResourcesActions" USING btree ("rolesResourceId");


--
-- TOC entry 3853 (class 1259 OID 16590)
-- Name: data_sources_roles_resources_actions_scope_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX data_sources_roles_resources_actions_scope_id ON public."dataSourcesRolesResourcesActions" USING btree ("scopeId");


--
-- TOC entry 3859 (class 1259 OID 16611)
-- Name: data_sources_roles_resources_data_source_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX data_sources_roles_resources_data_source_key ON public."dataSourcesRolesResources" USING btree ("dataSourceKey");


--
-- TOC entry 3860 (class 1259 OID 16610)
-- Name: data_sources_roles_resources_role_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX data_sources_roles_resources_role_name ON public."dataSourcesRolesResources" USING btree ("roleName");


--
-- TOC entry 3856 (class 1259 OID 16601)
-- Name: data_sources_roles_resources_scopes_data_source_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX data_sources_roles_resources_scopes_data_source_key ON public."dataSourcesRolesResourcesScopes" USING btree ("dataSourceKey");


--
-- TOC entry 3864 (class 1259 OID 16619)
-- Name: data_sources_roles_role_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX data_sources_roles_role_name ON public."dataSourcesRoles" USING btree ("roleName");


--
-- TOC entry 3836 (class 1259 OID 16549)
-- Name: desktop_routes_parent_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX desktop_routes_parent_id ON public."desktopRoutes" USING btree ("parentId");


--
-- TOC entry 3986 (class 1259 OID 16974)
-- Name: executions_dispatched_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX executions_dispatched_id ON public.executions USING btree (dispatched, id);


--
-- TOC entry 3991 (class 1259 OID 16975)
-- Name: executions_workflow_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX executions_workflow_id ON public.executions USING btree ("workflowId");


--
-- TOC entry 4105 (class 1259 OID 17327)
-- Name: feature_values_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX feature_values_created_by_id ON public.feature_values USING btree ("createdById");


--
-- TOC entry 4108 (class 1259 OID 17328)
-- Name: feature_values_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX feature_values_updated_by_id ON public.feature_values USING btree ("updatedById");


--
-- TOC entry 4109 (class 1259 OID 17329)
-- Name: feature_values_vehicle_object_item_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX feature_values_vehicle_object_item_id ON public.feature_values USING btree (vehicle_object_item_id);


--
-- TOC entry 3881 (class 1259 OID 16679)
-- Name: fields_collection_name_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE UNIQUE INDEX fields_collection_name_name ON public.fields USING btree ("collectionName", name);


--
-- TOC entry 3882 (class 1259 OID 16680)
-- Name: fields_parent_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX fields_parent_key ON public.fields USING btree ("parentKey");


--
-- TOC entry 3885 (class 1259 OID 16681)
-- Name: fields_reverse_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX fields_reverse_key ON public.fields USING btree ("reverseKey");


--
-- TOC entry 4080 (class 1259 OID 17249)
-- Name: flow_model_template_usages_model_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX flow_model_template_usages_model_uid ON public."flowModelTemplateUsages" USING btree ("modelUid");


--
-- TOC entry 4081 (class 1259 OID 17248)
-- Name: flow_model_template_usages_template_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX flow_model_template_usages_template_uid ON public."flowModelTemplateUsages" USING btree ("templateUid");


--
-- TOC entry 4082 (class 1259 OID 17247)
-- Name: flow_model_template_usages_template_uid_model_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE UNIQUE INDEX flow_model_template_usages_template_uid_model_uid ON public."flowModelTemplateUsages" USING btree ("templateUid", "modelUid");


--
-- TOC entry 4083 (class 1259 OID 17246)
-- Name: flow_model_template_usages_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE UNIQUE INDEX flow_model_template_usages_uid ON public."flowModelTemplateUsages" USING btree (uid);


--
-- TOC entry 4086 (class 1259 OID 17258)
-- Name: flow_model_templates_target_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX flow_model_templates_target_uid ON public."flowModelTemplates" USING btree ("targetUid");


--
-- TOC entry 4087 (class 1259 OID 17257)
-- Name: flow_model_templates_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE UNIQUE INDEX flow_model_templates_uid ON public."flowModelTemplates" USING btree (uid);


--
-- TOC entry 3899 (class 1259 OID 16728)
-- Name: flow_model_tree_path_descendant; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX flow_model_tree_path_descendant ON public."flowModelTreePath" USING btree (descendant);


--
-- TOC entry 3992 (class 1259 OID 16985)
-- Name: flow_nodes_downstream_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX flow_nodes_downstream_id ON public.flow_nodes USING btree ("downstreamId");


--
-- TOC entry 3995 (class 1259 OID 16984)
-- Name: flow_nodes_upstream_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX flow_nodes_upstream_id ON public.flow_nodes USING btree ("upstreamId");


--
-- TOC entry 3996 (class 1259 OID 16986)
-- Name: flow_nodes_workflow_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX flow_nodes_workflow_id ON public.flow_nodes USING btree ("workflowId");


--
-- TOC entry 3832 (class 1259 OID 16540)
-- Name: iframe_html_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX iframe_html_created_by_id ON public."iframeHtml" USING btree ("createdById");


--
-- TOC entry 3833 (class 1259 OID 16541)
-- Name: iframe_html_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX iframe_html_updated_by_id ON public."iframeHtml" USING btree ("updatedById");


--
-- TOC entry 3817 (class 1259 OID 16501)
-- Name: issued_tokens_jti; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX issued_tokens_jti ON public."issuedTokens" USING btree (jti);


--
-- TOC entry 3997 (class 1259 OID 16994)
-- Name: jobs_execution_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX jobs_execution_id ON public.jobs USING btree ("executionId");


--
-- TOC entry 3998 (class 1259 OID 16995)
-- Name: jobs_node_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX jobs_node_id ON public.jobs USING btree ("nodeId");


--
-- TOC entry 4001 (class 1259 OID 16996)
-- Name: jobs_upstream_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX jobs_upstream_id ON public.jobs USING btree ("upstreamId");


--
-- TOC entry 3837 (class 1259 OID 16555)
-- Name: main_desktop_routes_path_path; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX main_desktop_routes_path_path ON public."main_desktopRoutes_path" USING btree (path);


--
-- TOC entry 3909 (class 1259 OID 16761)
-- Name: main_mobile_routes_path_path; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX main_mobile_routes_path_path ON public."main_mobileRoutes_path" USING btree (path);


--
-- TOC entry 4095 (class 1259 OID 17296)
-- Name: main_vehicle_items_path_path; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX main_vehicle_items_path_path ON public.main_vehicle_items_path USING btree (path);


--
-- TOC entry 4091 (class 1259 OID 17284)
-- Name: main_vehicle_objects_path_path; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX main_vehicle_objects_path_path ON public.main_vehicle_objects_path USING btree (path);


--
-- TOC entry 3908 (class 1259 OID 16755)
-- Name: mobile_routes_parent_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX mobile_routes_parent_id ON public."mobileRoutes" USING btree ("parentId");


--
-- TOC entry 4061 (class 1259 OID 17190)
-- Name: notification_channels_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX notification_channels_created_by_id ON public."notificationChannels" USING btree ("createdById");


--
-- TOC entry 4062 (class 1259 OID 17191)
-- Name: notification_channels_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX notification_channels_updated_by_id ON public."notificationChannels" USING btree ("updatedById");


--
-- TOC entry 4067 (class 1259 OID 17206)
-- Name: notification_in_app_messages_channel_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX notification_in_app_messages_channel_name ON public."notificationInAppMessages" USING btree ("channelName");


--
-- TOC entry 3966 (class 1259 OID 16911)
-- Name: otp_records_verifier_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX otp_records_verifier_name ON public."otpRecords" USING btree ("verifierName");


--
-- TOC entry 4033 (class 1259 OID 17097)
-- Name: roles_ai_employees_role_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX roles_ai_employees_role_name ON public."rolesAiEmployees" USING btree ("roleName");


--
-- TOC entry 3840 (class 1259 OID 16561)
-- Name: roles_desktop_routes_role_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX roles_desktop_routes_role_name ON public."rolesDesktopRoutes" USING btree ("roleName");


--
-- TOC entry 3912 (class 1259 OID 16767)
-- Name: roles_mobile_routes_role_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX roles_mobile_routes_role_name ON public."rolesMobileRoutes" USING btree ("roleName");


--
-- TOC entry 3800 (class 1259 OID 16453)
-- Name: roles_resources_actions_roles_resource_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX roles_resources_actions_roles_resource_id ON public."rolesResourcesActions" USING btree ("rolesResourceId");


--
-- TOC entry 3801 (class 1259 OID 16454)
-- Name: roles_resources_actions_scope_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX roles_resources_actions_scope_id ON public."rolesResourcesActions" USING btree ("scopeId");


--
-- TOC entry 3797 (class 1259 OID 16442)
-- Name: roles_resources_role_name_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE UNIQUE INDEX roles_resources_role_name_name ON public."rolesResources" USING btree ("roleName", name);


--
-- TOC entry 3933 (class 1259 OID 16834)
-- Name: roles_uischemas_ui_schema_x_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX roles_uischemas_ui_schema_x_uid ON public."rolesUischemas" USING btree ("uiSchemaXUid");


--
-- TOC entry 3790 (class 1259 OID 16419)
-- Name: roles_users_user_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX roles_users_user_id ON public."rolesUsers" USING btree ("userId");


--
-- TOC entry 3915 (class 1259 OID 16782)
-- Name: system_settings_logo_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX system_settings_logo_id ON public."systemSettings" USING btree ("logoId");


--
-- TOC entry 4102 (class 1259 OID 17307)
-- Name: t_d6ursut4ws9_f_qahz3h30s16; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX t_d6ursut4ws9_f_qahz3h30s16 ON public.t_d6ursut4ws9 USING btree (f_qahz3h30s16);


--
-- TOC entry 3820 (class 1259 OID 16509)
-- Name: token_blacklist_token; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX token_blacklist_token ON public."tokenBlacklist" USING btree (token);


--
-- TOC entry 3823 (class 1259 OID 16518)
-- Name: token_control_config_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX token_control_config_created_by_id ON public."tokenControlConfig" USING btree ("createdById");


--
-- TOC entry 3824 (class 1259 OID 16519)
-- Name: token_control_config_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX token_control_config_updated_by_id ON public."tokenControlConfig" USING btree ("updatedById");


--
-- TOC entry 3918 (class 1259 OID 16792)
-- Name: ui_button_schemas_roles_role_name; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ui_button_schemas_roles_role_name ON public."uiButtonSchemasRoles" USING btree ("roleName");


--
-- TOC entry 3919 (class 1259 OID 16791)
-- Name: ui_button_schemas_roles_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ui_button_schemas_roles_uid ON public."uiButtonSchemasRoles" USING btree (uid);


--
-- TOC entry 3922 (class 1259 OID 16802)
-- Name: ui_schema_server_hooks_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ui_schema_server_hooks_uid ON public."uiSchemaServerHooks" USING btree (uid);


--
-- TOC entry 3925 (class 1259 OID 16810)
-- Name: ui_schema_templates_uid; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ui_schema_templates_uid ON public."uiSchemaTemplates" USING btree (uid);


--
-- TOC entry 3928 (class 1259 OID 16818)
-- Name: ui_schema_tree_path_descendant; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX ui_schema_tree_path_descendant ON public."uiSchemaTreePath" USING btree (descendant);


--
-- TOC entry 3936 (class 1259 OID 16844)
-- Name: user_data_sync_records_resources_record_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX user_data_sync_records_resources_record_id ON public."userDataSyncRecordsResources" USING btree ("recordId");


--
-- TOC entry 3943 (class 1259 OID 16867)
-- Name: user_data_sync_sources_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX user_data_sync_sources_created_by_id ON public."userDataSyncSources" USING btree ("createdById");


--
-- TOC entry 3944 (class 1259 OID 16868)
-- Name: user_data_sync_sources_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX user_data_sync_sources_updated_by_id ON public."userDataSyncSources" USING btree ("updatedById");


--
-- TOC entry 3949 (class 1259 OID 16881)
-- Name: user_data_sync_tasks_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX user_data_sync_tasks_created_by_id ON public."userDataSyncTasks" USING btree ("createdById");


--
-- TOC entry 3950 (class 1259 OID 16880)
-- Name: user_data_sync_tasks_source_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX user_data_sync_tasks_source_id ON public."userDataSyncTasks" USING btree ("sourceId");


--
-- TOC entry 3951 (class 1259 OID 16882)
-- Name: user_data_sync_tasks_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX user_data_sync_tasks_updated_by_id ON public."userDataSyncTasks" USING btree ("updatedById");


--
-- TOC entry 4004 (class 1259 OID 17005)
-- Name: user_workflow_tasks_user_id_type; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE UNIQUE INDEX user_workflow_tasks_user_id_type ON public."userWorkflowTasks" USING btree ("userId", type);


--
-- TOC entry 4057 (class 1259 OID 17181)
-- Name: users_ai_employees_ai_employee; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_ai_employees_ai_employee ON public."usersAiEmployees" USING btree ("aiEmployee");


--
-- TOC entry 4058 (class 1259 OID 17182)
-- Name: users_ai_employees_user_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_ai_employees_user_id ON public."usersAiEmployees" USING btree ("userId");


--
-- TOC entry 3827 (class 1259 OID 16530)
-- Name: users_authenticators_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_authenticators_created_by_id ON public."usersAuthenticators" USING btree ("createdById");


--
-- TOC entry 3828 (class 1259 OID 16531)
-- Name: users_authenticators_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_authenticators_updated_by_id ON public."usersAuthenticators" USING btree ("updatedById");


--
-- TOC entry 3829 (class 1259 OID 16532)
-- Name: users_authenticators_user_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_authenticators_user_id ON public."usersAuthenticators" USING btree ("userId");


--
-- TOC entry 3952 (class 1259 OID 16901)
-- Name: users_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_created_by_id ON public.users USING btree ("createdById");


--
-- TOC entry 3961 (class 1259 OID 16902)
-- Name: users_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_updated_by_id ON public.users USING btree ("updatedById");


--
-- TOC entry 3969 (class 1259 OID 16920)
-- Name: users_verificators_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_verificators_created_by_id ON public."usersVerificators" USING btree ("createdById");


--
-- TOC entry 3970 (class 1259 OID 16921)
-- Name: users_verificators_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_verificators_updated_by_id ON public."usersVerificators" USING btree ("updatedById");


--
-- TOC entry 3971 (class 1259 OID 16922)
-- Name: users_verificators_user_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_verificators_user_id ON public."usersVerificators" USING btree ("userId");


--
-- TOC entry 3974 (class 1259 OID 16931)
-- Name: users_verifiers_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_verifiers_created_by_id ON public."usersVerifiers" USING btree ("createdById");


--
-- TOC entry 3975 (class 1259 OID 16932)
-- Name: users_verifiers_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_verifiers_updated_by_id ON public."usersVerifiers" USING btree ("updatedById");


--
-- TOC entry 3976 (class 1259 OID 16933)
-- Name: users_verifiers_user_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX users_verifiers_user_id ON public."usersVerifiers" USING btree ("userId");


--
-- TOC entry 4092 (class 1259 OID 17290)
-- Name: vehicle_items_parent_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX vehicle_items_parent_id ON public.vehicle_items USING btree ("parentId");


--
-- TOC entry 4096 (class 1259 OID 17310)
-- Name: vehicle_objects_items_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX vehicle_objects_items_created_by_id ON public.vehicle_objects_items USING btree ("createdById");


--
-- TOC entry 4099 (class 1259 OID 17311)
-- Name: vehicle_objects_items_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX vehicle_objects_items_updated_by_id ON public.vehicle_objects_items USING btree ("updatedById");


--
-- TOC entry 4100 (class 1259 OID 17313)
-- Name: vehicle_objects_items_vehicle_item_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX vehicle_objects_items_vehicle_item_id ON public.vehicle_objects_items USING btree (vehicle_item_id);


--
-- TOC entry 4101 (class 1259 OID 17312)
-- Name: vehicle_objects_items_vehicle_object_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX vehicle_objects_items_vehicle_object_id ON public.vehicle_objects_items USING btree (vehicle_object_id);


--
-- TOC entry 4088 (class 1259 OID 17278)
-- Name: vehicle_objects_parent_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX vehicle_objects_parent_id ON public.vehicle_objects USING btree ("parentId");


--
-- TOC entry 4114 (class 1259 OID 17395)
-- Name: vehicle_test_values_created_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX vehicle_test_values_created_by_id ON public.vehicle_test_values USING btree ("createdById");


--
-- TOC entry 4117 (class 1259 OID 17396)
-- Name: vehicle_test_values_updated_by_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX vehicle_test_values_updated_by_id ON public.vehicle_test_values USING btree ("updatedById");


--
-- TOC entry 4118 (class 1259 OID 17397)
-- Name: vehicle_test_values_vehicle_object_item_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX vehicle_test_values_vehicle_object_item_id ON public.vehicle_test_values USING btree (vehicle_object_item_id);


--
-- TOC entry 3979 (class 1259 OID 16942)
-- Name: verifications_provider_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX verifications_provider_id ON public.verifications USING btree ("providerId");


--
-- TOC entry 4009 (class 1259 OID 17020)
-- Name: workflow_category_relations_category_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX workflow_category_relations_category_id ON public."workflowCategoryRelations" USING btree ("categoryId");


--
-- TOC entry 4010 (class 1259 OID 17019)
-- Name: workflow_category_relations_workflow_category_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX workflow_category_relations_workflow_category_id ON public."workflowCategoryRelations" USING btree ("workflowCategoryId");


--
-- TOC entry 4015 (class 1259 OID 17036)
-- Name: workflow_tasks_type_key; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE UNIQUE INDEX workflow_tasks_type_key ON public."workflowTasks" USING btree (type, key);


--
-- TOC entry 4016 (class 1259 OID 17037)
-- Name: workflow_tasks_user_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX workflow_tasks_user_id ON public."workflowTasks" USING btree ("userId");


--
-- TOC entry 4017 (class 1259 OID 17038)
-- Name: workflow_tasks_workflow_id; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE INDEX workflow_tasks_workflow_id ON public."workflowTasks" USING btree ("workflowId");


--
-- TOC entry 4020 (class 1259 OID 17058)
-- Name: workflows_key_current; Type: INDEX; Schema: public; Owner: nocobase
--

CREATE UNIQUE INDEX workflows_key_current ON public.workflows USING btree (key, current);


-- Completed on 2026-03-18 21:47:13 +07

--
-- PostgreSQL database dump complete
--

