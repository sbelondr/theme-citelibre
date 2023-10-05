/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `archive_item`;
CREATE TABLE IF NOT EXISTS `archive_item` (
  `id_archive_item` int(11) NOT NULL DEFAULT 0,
  `folder_to_archive` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archive_destination` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archive_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archive_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archive_mime_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_archive_item`),
  KEY `archive_item_state_idx` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `archive_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_item` ENABLE KEYS */;

DROP TABLE IF EXISTS `blobstore_blobstore`;
CREATE TABLE IF NOT EXISTS `blobstore_blobstore` (
  `id_blob` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `blob_value` mediumblob DEFAULT NULL,
  PRIMARY KEY (`id_blob`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `blobstore_blobstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `blobstore_blobstore` ENABLE KEYS */;

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id_contact` int(11) NOT NULL DEFAULT 0,
  `description` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `hits` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_contact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` (`id_contact`, `description`, `email`, `workgroup_key`, `hits`) VALUES
	(1, 'Contact 1', 'adresse_email_du_contact_1@domaine.com', 'all', 0),
	(2, 'Contact 2', 'adresse_email_du_contact_2@domaine.com', 'all', 2);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

DROP TABLE IF EXISTS `contact_list`;
CREATE TABLE IF NOT EXISTS `contact_list` (
  `id_contact_list` int(11) NOT NULL DEFAULT 0,
  `label_contact_list` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description_contact_list` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `contact_list_order` int(11) NOT NULL DEFAULT 0,
  `is_tos_active` smallint(6) NOT NULL DEFAULT 0,
  `tos_message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_contact_list`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `contact_list` DISABLE KEYS */;
INSERT INTO `contact_list` (`id_contact_list`, `label_contact_list`, `description_contact_list`, `workgroup_key`, `role`, `contact_list_order`, `is_tos_active`, `tos_message`) VALUES
	(1, 'Liste de contacts', 'Ceci est une liste de contacts', 'all', 'none', 1, 1, 'Message a valider');
/*!40000 ALTER TABLE `contact_list` ENABLE KEYS */;

DROP TABLE IF EXISTS `contact_list_contact`;
CREATE TABLE IF NOT EXISTS `contact_list_contact` (
  `id_contact_list` int(11) NOT NULL DEFAULT 0,
  `id_contact` int(11) NOT NULL DEFAULT 0,
  `contact_order` int(11) NOT NULL DEFAULT 0,
  `hits` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_contact_list`,`id_contact`,`contact_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `contact_list_contact` DISABLE KEYS */;
INSERT INTO `contact_list_contact` (`id_contact_list`, `id_contact`, `contact_order`, `hits`) VALUES
	(1, 1, 1, 0),
	(1, 2, 2, 2);
/*!40000 ALTER TABLE `contact_list_contact` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_dashboard`;
CREATE TABLE IF NOT EXISTS `core_admin_dashboard` (
  `dashboard_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dashboard_column` int(11) NOT NULL,
  `dashboard_order` int(11) NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_dashboard` DISABLE KEYS */;
INSERT INTO `core_admin_dashboard` (`dashboard_name`, `dashboard_column`, `dashboard_order`) VALUES
	('usersAdminDashboardComponent', 1, 1),
	('searchAdminDashboardComponent', 1, 2),
	('editorAdminDashboardComponent', 1, 3),
	('autoIncludesAdminDashboardComponent', 1, 4),
	('featuresAdminDashboardComponent', 1, 5),
	('xslExportAdminDashboardComponent', 1, 6),
	('myluteceAuthenticationFilterAdminDashboardComponent', 1, 3),
	('databaseAdminDashboardComponent', 1, 1),
	('workflowAdminDashboardComponent', 1, 1);
/*!40000 ALTER TABLE `core_admin_dashboard` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_mailinglist`;
CREATE TABLE IF NOT EXISTS `core_admin_mailinglist` (
  `id_mailinglist` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `workgroup` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_mailinglist` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist` (`id_mailinglist`, `name`, `description`, `workgroup`) VALUES
	(1, 'admin', 'admin', 'all');
/*!40000 ALTER TABLE `core_admin_mailinglist` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_mailinglist_filter`;
CREATE TABLE IF NOT EXISTS `core_admin_mailinglist_filter` (
  `id_mailinglist` int(11) NOT NULL DEFAULT 0,
  `workgroup` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`,`workgroup`,`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_mailinglist_filter` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist_filter` (`id_mailinglist`, `workgroup`, `role`) VALUES
	(1, 'all', 'super_admin');
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_right`;
CREATE TABLE IF NOT EXISTS `core_admin_right` (
  `id_right` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level_right` smallint(6) DEFAULT NULL,
  `admin_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_updatable` int(11) NOT NULL DEFAULT 0,
  `plugin_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_feature_group` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `documentation_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `is_external_feature` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id_right`),
  KEY `index_right` (`level_right`,`admin_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_right` DISABLE KEYS */;
INSERT INTO `core_admin_right` (`id_right`, `name`, `level_right`, `admin_url`, `description`, `is_updatable`, `plugin_name`, `id_feature_group`, `icon_url`, `documentation_url`, `id_order`, `is_external_feature`) VALUES
	('CORE_ADMIN_SITE', 'portal.site.adminFeature.admin_site.name', 2, 'jsp/admin/site/AdminSite.jsp', 'portal.site.adminFeature.admin_site.description', 1, NULL, 'SITE', 'images/admin/skin/features/admin_site.png', 'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-site', 1, 0),
	('CORE_CACHE_MANAGEMENT', 'portal.system.adminFeature.cache_management.name', 0, 'jsp/admin/system/ManageCaches.jsp', 'portal.system.adminFeature.cache_management.description', 1, '', 'SYSTEM', 'images/admin/skin/features/manage_caches.png', NULL, 1, 0),
	('CORE_SEARCH_INDEXATION', 'portal.search.adminFeature.indexer.name', 0, 'jsp/admin/search/ManageSearchIndexation.jsp', 'portal.search.adminFeature.indexer.description', 0, '', 'SYSTEM', NULL, NULL, 2, 0),
	('CORE_SEARCH_MANAGEMENT', 'portal.search.adminFeature.search_management.name', 0, NULL, 'portal.search.adminFeature.search_management.description', 0, '', 'SYSTEM', NULL, NULL, 3, 0),
	('CORE_LOGS_VISUALISATION', 'portal.system.adminFeature.logs_visualisation.name', 0, 'jsp/admin/system/ManageFilesSystem.jsp', 'portal.system.adminFeature.logs_visualisation.description', 1, '', 'SYSTEM', 'images/admin/skin/features/view_logs.png', NULL, 4, 0),
	('CORE_PAGE_TEMPLATE_MANAGEMENT', 'portal.style.adminFeature.page_template_management.name', 0, 'jsp/admin/style/ManagePageTemplates.jsp', 'portal.style.adminFeature.page_template_management.description', 0, '', 'STYLE', 'images/admin/skin/features/manage_page_templates.png', NULL, 1, 0),
	('CORE_PLUGINS_MANAGEMENT', 'portal.system.adminFeature.plugins_management.name', 0, 'jsp/admin/system/ManagePlugins.jsp', 'portal.system.adminFeature.plugins_management.description', 1, '', 'SYSTEM', 'images/admin/skin/features/manage_plugins.png', NULL, 5, 0),
	('CORE_PROPERTIES_MANAGEMENT', 'portal.site.adminFeature.properties_management.name', 2, 'jsp/admin/ManageProperties.jsp', 'portal.site.adminFeature.properties_management.description', 0, NULL, 'SITE', NULL, 'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-properties', 2, 0),
	('CORE_STYLESHEET_MANAGEMENT', 'portal.style.adminFeature.stylesheet_management.name', 0, 'jsp/admin/style/ManageStyleSheets.jsp', 'portal.style.adminFeature.stylesheet_management.description', 1, '', 'STYLE', 'images/admin/skin/features/manage_stylesheets.png', NULL, 2, 0),
	('CORE_STYLES_MANAGEMENT', 'portal.style.adminFeature.styles_management.name', 0, 'jsp/admin/style/ManageStyles.jsp', 'portal.style.adminFeature.styles_management.description', 1, '', 'STYLE', 'images/admin/skin/features/manage_styles.png', NULL, 3, 0),
	('CORE_USERS_MANAGEMENT', 'portal.users.adminFeature.users_management.name', 2, 'jsp/admin/user/ManageUsers.jsp', 'portal.users.adminFeature.users_management.description', 1, '', 'MANAGERS', 'images/admin/skin/features/manage_users.png', NULL, 2, 0),
	('CORE_FEATURES_MANAGEMENT', 'portal.admin.adminFeature.features_management.name', 0, NULL, 'portal.admin.adminFeature.features_management.description', 0, '', 'SYSTEM', 'images/admin/skin/features/manage_features.png', NULL, 6, 0),
	('CORE_RBAC_MANAGEMENT', 'portal.rbac.adminFeature.rbac_management.name', 0, 'jsp/admin/rbac/ManageRoles.jsp', 'portal.rbac.adminFeature.rbac_management.description', 0, '', 'MANAGERS', 'images/admin/skin/features/manage_rbac.png', NULL, 1, 0),
	('CORE_DAEMONS_MANAGEMENT', 'portal.system.adminFeature.daemons_management.name', 0, 'jsp/admin/system/ManageDaemons.jsp', 'portal.system.adminFeature.daemons_management.description', 0, '', 'SYSTEM', NULL, NULL, 7, 0),
	('CORE_WORKGROUPS_MANAGEMENT', 'portal.workgroup.adminFeature.workgroups_management.name', 2, 'jsp/admin/workgroup/ManageWorkgroups.jsp', 'portal.workgroup.adminFeature.workgroups_management.description', 0, '', 'MANAGERS', 'images/admin/skin/features/manage_workgroups.png', NULL, 3, 0),
	('CORE_ROLES_MANAGEMENT', 'portal.role.adminFeature.roles_management.name', 2, 'jsp/admin/role/ManagePageRole.jsp', 'portal.role.adminFeature.roles_management.description', 0, '', 'USERS', 'images/admin/skin/features/manage_roles.png', NULL, 2, 0),
	('CORE_MAILINGLISTS_MANAGEMENT', 'portal.mailinglist.adminFeature.mailinglists_management.name', 2, 'jsp/admin/mailinglist/ManageMailingLists.jsp', 'portal.mailinglist.adminFeature.mailinglists_management.description', 0, '', 'MANAGERS', 'images/admin/skin/features/manage_mailinglists.png', NULL, 4, 0),
	('CORE_LEVEL_RIGHT_MANAGEMENT', 'portal.users.adminFeature.level_right_management.name', 2, NULL, 'portal.users.adminFeature.level_right_management.description', 0, '', 'MANAGERS', 'images/admin/skin/features/manage_rights_levels.png', NULL, 5, 0),
	('CORE_LINK_SERVICE_MANAGEMENT', 'portal.insert.adminFeature.linkService_management.name', 2, NULL, 'portal.insert.adminFeature.linkService_management.description', 0, NULL, NULL, NULL, NULL, 1, 0),
	('CORE_RIGHT_MANAGEMENT', 'portal.users.adminFeature.right_management.name', 0, 'jsp/admin/features/ManageRights.jsp', 'portal.users.adminFeature.right_management.description', 0, '', 'MANAGERS', 'images/admin/skin/features/manage_rights_levels.png', NULL, 6, 0),
	('CORE_ADMINDASHBOARD_MANAGEMENT', 'portal.admindashboard.adminFeature.right_management.name', 0, NULL, 'portal.admindashboard.adminFeature.right_management.description', 0, '', 'SYSTEM', 'images/admin/skin/features/manage_admindashboards.png', NULL, 8, 0),
	('CORE_DASHBOARD_MANAGEMENT', 'portal.dashboard.adminFeature.dashboard_management.name', 0, NULL, 'portal.dashboard.adminFeature.dashboard_management.description', 0, '', 'SYSTEM', 'images/admin/skin/features/manage_dashboards.png', NULL, 9, 0),
	('CORE_XSL_EXPORT_MANAGEMENT', 'portal.xsl.adminFeature.xsl_export_management.name', 2, NULL, 'portal.xsl.adminFeature.xsl_export_management.description', 1, '', 'SYSTEM', NULL, NULL, 11, 0),
	('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT', 'portal.templates.adminFeature.ManageAutoIncludes.name', 1, NULL, 'portal.templates.adminFeature.ManageAutoIncludes.description', 1, '', 'STYLE', 'images/admin/skin/features/manage_templates.png', NULL, 4, 0),
	('CORE_EDITORS_MANAGEMENT', 'portal.admindashboard.editorManagement.right.name', 2, NULL, 'portal.admindashboard.editorManagement.right.description', 1, '', 'SYSTEM', NULL, NULL, 10, 0),
	('CONTACT_MANAGEMENT', 'contact.adminFeature.contact_management.name', 3, 'jsp/admin/plugins/contact/ManageContactsHome.jsp', 'contact.adminFeature.contact_management.description', 0, 'contact', 'APPLICATIONS', NULL, NULL, 7, 0),
	('VIEW_TEMP_FILES', 'filegenerator.adminFeature.temporary_files.name', 2, 'jsp/admin/plugins/filegenerator/ManageMyFiles.jsp', 'filegenerator.adminFeature.temporary_files.description', 0, '', 'CONTENT', NULL, NULL, 3, 0),
	('FORMS_MANAGEMENT', 'forms.adminFeature.manageForms.name', 1, 'jsp/admin/plugins/forms/ManageForms.jsp', 'forms.adminFeature.manageForms.description', 0, 'forms', 'CONTENT', NULL, NULL, 1, 0),
	('FORMS_MULTIVIEW', 'forms.adminFeature.multiviewForms.name', 2, 'jsp/admin/plugins/forms/MultiviewForms.jsp', 'forms.adminFeature.multiviewForms.description', 0, 'forms', 'CONTENT', NULL, NULL, 2, 0),
	('BREADCRUMBACCORDION_MANAGEMENT', 'module.forms.breadcrumbaccordion.adminFeature.manageBreadcrumbAccordion.name', 1, 'jsp/admin/plugins/forms/modules/breadcrumbaccordion/ManageBreadcrumbAccordion.jsp', 'module.forms.breadcrumbaccordion.adminFeature.manageBreadcrumbAccordion.description', 0, 'forms-breadcrumbaccordion', 'CONTENT', NULL, NULL, 4, 0),
	('CONFIG_DOCUMENT_PRODUCER_MANAGEMENT', 'module.forms.documentproducer.adminFeature.ManageConfigDocumentProducer.name', 1, 'jsp/admin/plugins/forms/modules/documentproducer/ManageConfigProducer.jsp?view=getSelectForm', 'module.forms.documentproducer.adminFeature.ManageConfigDocumentProducer.description', 0, 'forms-documentproducer', 'APPLICATIONS', NULL, NULL, 2, 0),
	('ENTRY_TYPE_MANAGEMENT', 'genericattributes.adminFeature.manageEntryType.name', 1, 'jsp/admin/plugins/genericattributes/ManageEntryType.jsp', 'genericattributes.adminFeature.manageEntryType.description', 0, 'genericattributes', 'APPLICATIONS', NULL, NULL, 3, 0),
	('HTMLPAGE_MANAGEMENT', 'htmlpage.adminFeature.htmlpage_management.name', 2, 'jsp/admin/plugins/htmlpage/ManageHtmlPage.jsp', 'htmlpage.adminFeature.htmlpage_management.description', 0, 'htmlpage', 'CONTENT', NULL, 'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-htmlpage', 5, 0),
	('MATOMO_MANAGEMENT', 'matomo.adminFeature.ManageMatomo.name', 1, 'jsp/admin/plugins/matomo/Matomo.jsp', 'matomo.adminFeature.ManageMatomo.description', 0, 'matomo', 'SITE', NULL, NULL, 3, 0),
	('MYLUTECE_MANAGEMENT', 'mylutece.adminFeature.mylutece_management.name', 2, 'jsp/admin/plugins/mylutece/attribute/ManageAttributes.jsp', 'mylutece.adminFeature.mylutece_management.description', 0, 'mylutece', 'USERS', NULL, NULL, 1, 0),
	('MYLUTECE_MANAGE_AUTHENTICATION_FILTER', 'mylutece.adminFeature.mylutece_management_authentication_filter.name', 3, 'jsp/admin/plugins/mylutece/security/ManageAuthenticationFilter.jsp', 'mylutece.adminFeature.mylutece_management_authentication_filter.description', 0, 'mylutece', 'SYSTEM', NULL, NULL, 15, 0),
	('DATABASE_MANAGEMENT_USERS', 'module.mylutece.database.adminFeature.database_management_user.name', 3, 'jsp/admin/plugins/mylutece/modules/database/ManageUsers.jsp', 'module.mylutece.database.adminFeature.database_management_user.description', 0, 'mylutece-database', 'USERS', NULL, NULL, 4, 0),
	('DATABASE_GROUPS_MANAGEMENT', 'module.mylutece.database.adminFeature.groups_management.name', 3, 'jsp/admin/plugins/mylutece/modules/database/ManageGroups.jsp', 'module.mylutece.database.adminFeature.groups_management.description', 0, 'mylutece-database', 'USERS', NULL, NULL, 5, 0),
	('POLL_MANAGEMENT', 'poll.adminFeature.Manage.name', 1, 'jsp/admin/plugins/poll/ManagePollForms.jsp', 'poll.adminFeature.Manage.description', 0, 'poll', 'APPLICATIONS', NULL, NULL, 4, 0),
	('PROFILES_MANAGEMENT', 'profiles.adminFeature.profiles_management.name', 0, 'jsp/admin/plugins/profiles/ManageProfiles.jsp', 'profiles.adminFeature.profiles_management.description', 0, 'profiles', 'MANAGERS', NULL, 'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-profiles', 7, 0),
	('PROFILES_VIEWS_MANAGEMENT', 'profiles.adminFeature.views_management.name', 0, 'jsp/admin/plugins/profiles/ManageViews.jsp', 'profiles.adminFeature.views_management.description', 0, 'profiles', 'MANAGERS', NULL, 'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-profiles', 8, 0),
	('REFERENCELIST_MANAGEMENT', 'referencelist.adminFeature.ReferenceListManage.name', 0, 'jsp/admin/plugins/referencelist/ManageReferences.jsp', 'referencelist.adminFeature.ReferenceListManage.description', 0, 'referencelist', 'APPLICATIONS', NULL, NULL, 5, 0),
	('REGULAR_EXPRESSION_MANAGEMENT', 'regularexpression.adminFeature.regularexpression_management.name', 0, 'jsp/admin/plugins/regularexpression/ManageRegularExpression.jsp', 'regularexpression.adminFeature.regularexpression_management.description', 0, 'regularexpression', 'SYSTEM', NULL, NULL, 16, 0),
	('SEO_MANAGEMENT', 'seo.adminFeature.seo_management.name', 0, 'jsp/admin/plugins/seo/ManageSEO.jsp', 'seo.adminFeature.seo_management.description', 0, 'seo', 'SYSTEM', NULL, NULL, 17, 0),
	('SYSTEMINFO_MANAGEMENT', 'systeminfo.adminFeature.systeminfo_management.name', 0, 'jsp/admin/plugins/systeminfo/ManageSystemInfo.jsp', 'systeminfo.adminFeature.systeminfo_management.description', 0, 'systeminfo', 'SYSTEM', NULL, NULL, 18, 0),
	('UNITS_MANAGEMENT', 'unittree.adminFeature.unitsManagement.name', 2, 'jsp/admin/plugins/unittree/ManageUnits.jsp', 'unittree.adminFeature.unitsManagement.description', 0, 'unittree', 'APPLICATIONS', NULL, '', 6, 0),
	('WORKFLOW_MANAGEMENT', 'workflow.adminFeature.workflow_management.name', 3, 'jsp/admin/plugins/workflow/ManageWorkflow.jsp', 'workflow.adminFeature.workflow_management.description', 0, 'workflow', 'APPLICATIONS', NULL, NULL, 1, 0),
	('MYLUTECE_MANAGE_EXTERNAL_APPLICATION', 'mylutece.adminFeature.mylutece_management_external_application.name', 3, 'jsp/admin/plugins/mylutece/ManageExternalApplicationUser.jsp', 'mylutece.adminFeature.mylutece_management_external_application.description', 0, 'mylutece', 'USERS', NULL, NULL, 6, 0);
/*!40000 ALTER TABLE `core_admin_right` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_role`;
CREATE TABLE IF NOT EXISTS `core_admin_role` (
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_role` DISABLE KEYS */;
INSERT INTO `core_admin_role` (`role_key`, `role_description`) VALUES
	('all_site_manager', 'Site Manager'),
	('super_admin', 'Super Administrateur'),
	('forms_manager', 'FORMS - Gestion des formulaires'),
	('forms_multiview', 'FORMS - Visualisation des résultats des formulaires'),
	('assign_roles', 'Assigner des roles aux utilisateurs'),
	('assign_groups', 'Assigner des groupes aux utilisateurs'),
	('mylutece_manager', 'Gérer les patramètres avancés Mylutece'),
	('mylutece_database_manager', 'Mylutece Database management'),
	('profiles_manager', 'Profiles management'),
	('profiles_views_manager', 'Profiles Views management'),
	('CREATE_REFERENCE_IMPORT', 'Import csv file'),
	('unittree_management', 'Gestion des entités'),
	('workflow_manager', 'Workflow management');
/*!40000 ALTER TABLE `core_admin_role` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_role_resource`;
CREATE TABLE IF NOT EXISTS `core_admin_role_resource` (
  `rbac_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resource_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resource_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`rbac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1910 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_role_resource` DISABLE KEYS */;
INSERT INTO `core_admin_role_resource` (`rbac_id`, `role_key`, `resource_type`, `resource_id`, `permission`) VALUES
	(57, 'all_site_manager', 'PAGE', '*', 'VIEW'),
	(58, 'all_site_manager', 'PAGE', '*', 'MANAGE'),
	(77, 'super_admin', 'INSERT_SERVICE', '*', '*'),
	(101, 'all_site_manager', 'PORTLET_TYPE', '*', '*'),
	(111, 'all_site_manager', 'ADMIN_USER', '*', '*'),
	(137, 'all_site_manager', 'SEARCH_SERVICE', '*', '*'),
	(164, 'all_site_manager', 'XSL_EXPORT', '*', '*'),
	(1907, 'forms_manager', 'FORMS_FORM', '*', '*'),
	(1908, 'forms_multiview', 'FORM_PANEL_CONF', '*', '*'),
	(205, 'assign_roles', 'ROLE_TYPE', '*', 'ASSIGN_ROLE'),
	(207, 'mylutece_manager', 'MYLUTECE', '*', '*'),
	(206, 'assign_groups', 'GROUP_TYPE', '*', 'ASSIGN_GROUP'),
	(350, 'mylutece_database_manager', 'DATABASE', '*', '*'),
	(150, 'profiles_manager', 'PROFILES', '*', '*'),
	(151, 'profiles_views_manager', 'PROFILES_VIEWS', '*', '*'),
	(165, 'CREATE_REFERENCE_IMPORT', 'REFERENCE_IMPORT', '*', '*'),
	(210, 'unittree_management', 'UNIT_TYPE', '*', '*'),
	(912, 'workflow_manager', 'WORKFLOW_ACTION_TYPE', '*', '*'),
	(923, 'workflow_manager', 'WORKFLOW_STATE_TYPE', '*', '*');
/*!40000 ALTER TABLE `core_admin_role_resource` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_user`;
CREATE TABLE IF NOT EXISTS `core_admin_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `access_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT 0,
  `password` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fr',
  `level_user` smallint(6) NOT NULL DEFAULT 0,
  `reset_password` smallint(6) NOT NULL DEFAULT 0,
  `accessibility_mode` smallint(6) NOT NULL DEFAULT 0,
  `password_max_valid_date` timestamp NULL DEFAULT NULL,
  `account_max_valid_date` bigint(20) DEFAULT NULL,
  `nb_alerts_sent` int(11) NOT NULL DEFAULT 0,
  `last_login` timestamp NOT NULL DEFAULT '1979-12-31 23:00:00',
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'all',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_user` DISABLE KEYS */;
INSERT INTO `core_admin_user` (`id_user`, `access_code`, `last_name`, `first_name`, `email`, `status`, `password`, `locale`, `level_user`, `reset_password`, `accessibility_mode`, `password_max_valid_date`, `account_max_valid_date`, `nb_alerts_sent`, `last_login`, `workgroup_key`) VALUES
	(1, 'admin', 'Admin', 'admin', 'admin@lutece.fr', 0, 'PBKDF2WITHHMACSHA512:40000:6d50268735088106a7c44f6c771ad0c4:55ab62976ec4a288b8fcee8c63f5dcb8d7a7e7478916670e84a38f1116e80bae90325d31ffa7481ad137f83f03d3d86fdcfcbb9a4d897883374ee2b94d7a10e9f519e8620f19e1a604cf8a99c306e3c773b2b3115f56d3ce5e77506de6474813a09206e7fef520512e58bafe103257197394759ae012d6be52c787453a9c2070', 'fr', 0, 0, 0, NULL, 1677084136720, 0, '2022-02-22 16:42:16', 'all'),
	(5, 'adminpack', 'PACK', 'User', 'useradmin@anymail.com', 0, 'PBKDF2WITHHMACSHA512:40000:9d655481370c0bdd487ff85e2c3c1cbc:c4fe352ef4ea0ad2b08b915cdeedec3d47e3582b943c4b5e6bc6c9fabca3820f9ab548ee3ed533b94a761e9e2dbe49069d894d96212d3b8fbc26957543f8bbb72710b2276e533ba79f2f265a2345475ba2c221de9ce7d7e6bed4c520cd92f2b93a91662164928f52bde8af70b5d22978e8056129e88aa2a64a05da8f28a60c79', 'fr', 1, 0, 0, NULL, 1676972803980, 0, '2022-02-21 09:46:43', 'all');
/*!40000 ALTER TABLE `core_admin_user` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_user_anonymize_field`;
CREATE TABLE IF NOT EXISTS `core_admin_user_anonymize_field` (
  `field_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `anonymize` smallint(6) NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `core_admin_user_anonymize_field` (`field_name`, `anonymize`) VALUES
	('access_code', 1),
	('last_name', 1),
	('first_name', 1),
	('email', 1);
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_user_field`;
CREATE TABLE IF NOT EXISTS `core_admin_user_field` (
  `id_user_field` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_attribute` int(11) DEFAULT NULL,
  `id_field` int(11) DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `user_field_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user_field`),
  KEY `core_admin_user_field_idx_file` (`id_file`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_user_field` DISABLE KEYS */;
INSERT INTO `core_admin_user_field` (`id_user_field`, `id_user`, `id_attribute`, `id_field`, `id_file`, `user_field_value`) VALUES
	(6, 5, 1, 5, NULL, 'technical_admin_forms'),
	(5, 5, 1, 4, NULL, 'forms_response_manager'),
	(4, 5, 1, 3, NULL, 'forms_admin');
/*!40000 ALTER TABLE `core_admin_user_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_user_preferences`;
CREATE TABLE IF NOT EXISTS `core_admin_user_preferences` (
  `id_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_admin_user_preferences` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_preferences` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_workgroup`;
CREATE TABLE IF NOT EXISTS `core_admin_workgroup` (
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `workgroup_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_admin_workgroup_user`;
CREATE TABLE IF NOT EXISTS `core_admin_workgroup_user` (
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`workgroup_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_admin_workgroup_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup_user` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_attribute`;
CREATE TABLE IF NOT EXISTS `core_attribute` (
  `id_attribute` int(11) NOT NULL AUTO_INCREMENT,
  `type_class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_mandatory` smallint(6) DEFAULT 0,
  `is_shown_in_search` smallint(6) DEFAULT 0,
  `is_shown_in_result_list` smallint(6) DEFAULT 0,
  `is_field_in_line` smallint(6) DEFAULT 0,
  `attribute_position` int(11) DEFAULT 0,
  `plugin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anonymize` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_attribute` DISABLE KEYS */;
INSERT INTO `core_attribute` (`id_attribute`, `type_class_name`, `title`, `help_message`, `is_mandatory`, `is_shown_in_search`, `is_shown_in_result_list`, `is_field_in_line`, `attribute_position`, `plugin_name`, `anonymize`) VALUES
	(1, 'fr.paris.lutece.portal.business.user.attribute.AttributeComboBox', 'Profil', '', 0, 0, 0, 0, 0, 'profiles', NULL);
/*!40000 ALTER TABLE `core_attribute` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_attribute_field`;
CREATE TABLE IF NOT EXISTS `core_attribute_field` (
  `id_field` int(11) NOT NULL AUTO_INCREMENT,
  `id_attribute` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_DEFAULT_value` smallint(6) DEFAULT 0,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `max_size_enter` int(11) DEFAULT NULL,
  `is_multiple` smallint(6) DEFAULT 0,
  `field_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_attribute_field` DISABLE KEYS */;
INSERT INTO `core_attribute_field` (`id_field`, `id_attribute`, `title`, `DEFAULT_value`, `is_DEFAULT_value`, `height`, `width`, `max_size_enter`, `is_multiple`, `field_position`) VALUES
	(1, 1, NULL, NULL, 0, 0, 0, 0, 1, 1),
	(3, 1, 'forms_admin', 'Admin manager for Forms - create, update and delete forms', 0, 0, 0, 0, 0, 2),
	(4, 1, 'forms_response_manager', 'User that manage responses made through forms', 0, 0, 0, 0, 0, 3),
	(5, 1, 'technical_admin_forms', 'Admin technical manager that can configure all necessary features to admin forms', 0, 0, 0, 0, 0, 4);
/*!40000 ALTER TABLE `core_attribute_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_connections_log`;
CREATE TABLE IF NOT EXISTS `core_connections_log` (
  `access_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `login_status` int(11) DEFAULT NULL,
  KEY `index_connections_log` (`ip_address`,`date_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_connections_log` DISABLE KEYS */;
INSERT INTO `core_connections_log` (`access_code`, `ip_address`, `date_login`, `login_status`) VALUES
	('laurent.hohl@gmail.com', '0:0:0:0:0:0:0:1', '2022-02-17 08:06:09', 0);
/*!40000 ALTER TABLE `core_connections_log` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_dashboard`;
CREATE TABLE IF NOT EXISTS `core_dashboard` (
  `dashboard_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dashboard_column` int(11) NOT NULL,
  `dashboard_order` int(11) NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_dashboard` DISABLE KEYS */;
INSERT INTO `core_dashboard` (`dashboard_name`, `dashboard_column`, `dashboard_order`) VALUES
	('CORE_SYSTEM', 1, 2),
	('CORE_USERS', 1, 1),
	('CORE_USER', 4, 1),
	('CORE_PAGES', 2, 2),
	('FORMS', 2, 1),
	('WORKFLOW', 3, 1);
/*!40000 ALTER TABLE `core_dashboard` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_datastore`;
CREATE TABLE IF NOT EXISTS `core_datastore` (
  `entity_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`entity_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_datastore` DISABLE KEYS */;
INSERT INTO `core_datastore` (`entity_key`, `entity_value`) VALUES
	('core.advanced_parameters.password_duration', '120'),
	('core.advanced_parameters.default_user_level', '0'),
	('core.advanced_parameters.default_user_notification', '1'),
	('core.advanced_parameters.default_user_language', 'fr'),
	('core.advanced_parameters.default_user_status', '0'),
	('core.advanced_parameters.email_pattern', '^[\\w_.\\-!\\#\\$\\%\\&\'\\*\\+\\/\\=\\?\\^\\`\\}\\{\\|\\~]+@[\\w_.\\-]+\\.[\\w]+$'),
	('core.advanced_parameters.email_pattern_verify_by', ''),
	('core.advanced_parameters.force_change_password_reinit', 'false'),
	('core.advanced_parameters.password_minimum_length', '8'),
	('core.advanced_parameters.password_format_upper_lower_case', 'false'),
	('core.advanced_parameters.password_format_numero', 'false'),
	('core.advanced_parameters.password_format_special_characters', 'false'),
	('core.advanced_parameters.password_history_size', ''),
	('core.advanced_parameters.maximum_number_password_change', ''),
	('core.advanced_parameters.tsw_size_password_change', ''),
	('core.advanced_parameters.use_advanced_security_parameters', ''),
	('core.advanced_parameters.account_life_time', '12'),
	('core.advanced_parameters.time_before_alert_account', '30'),
	('core.advanced_parameters.nb_alert_account', '2'),
	('core.advanced_parameters.time_between_alerts_account', '10'),
	('core.advanced_parameters.access_failures_max', '3'),
	('core.advanced_parameters.access_failures_interval', '10'),
	('core.advanced_parameters.expired_alert_mail_sender', 'lutece@nowhere.com'),
	('core.advanced_parameters.expired_alert_mail_subject', 'Votre compte a expiré'),
	('core.advanced_parameters.first_alert_mail_sender', 'lutece@nowhere.com'),
	('core.advanced_parameters.first_alert_mail_subject', 'Votre compte va bientôt expirer'),
	('core.advanced_parameters.other_alert_mail_sender', 'lutece@nowhere.com'),
	('core.advanced_parameters.other_alert_mail_subject', 'Votre compte va bientôt expirer'),
	('core.advanced_parameters.account_reactivated_mail_sender', 'lutece@nowhere.com'),
	('core.advanced_parameters.account_reactivated_mail_subject', 'Votre compte a bien été réactivé'),
	('core.advanced_parameters.access_failures_captcha', '1'),
	('core.advanced_parameters.notify_user_password_expired', ''),
	('core.advanced_parameters.password_expired_mail_sender', 'lutece@nowhere.com'),
	('core.advanced_parameters.password_expired_mail_subject', 'Votre mot de passe a expiré'),
	('core.advanced_parameters.reset_token_validity', '60'),
	('core.advanced_parameters.lock_reset_token_to_session', 'false'),
	('core.backOffice.defaultEditor', 'tinymce'),
	('core.frontOffice.defaultEditor', 'markitupbbcode'),
	('core_banned_domain_names', 'yopmail.com'),
	('portal.site.site_property.name', 'FORMS By LUTECE'),
	('portal.site.site_property.meta.author', '<author>'),
	('portal.site.site_property.meta.copyright', '<copyright>'),
	('portal.site.site_property.meta.description', '<description>'),
	('portal.site.site_property.meta.keywords', '<keywords>'),
	('portal.site.site_property.email', 'webmaster@mydomain.com'),
	('portal.site.site_property.noreply_email', 'no-reply@mydomain.com'),
	('portal.site.site_property.home_url', 'jsp/site/Portal.jsp'),
	('portal.site.site_property.admin_home_url', 'jsp/admin/AdminMenu.jsp'),
	('portal.site.site_property.popup_credits.textblock', '&lt;credits text&gt;'),
	('portal.site.site_property.popup_legal_info.copyright.textblock', '&lt;copyright text&gt;'),
	('portal.site.site_property.popup_legal_info.privacy.textblock', '&lt;privacy text&gt;'),
	('portal.site.site_property.logo_url', 'images/logo-pack-light.min.svg'),
	('portal.site.site_property.locale.default', 'fr'),
	('portal.site.site_property.avatar_default', 'images/admin/skin/unknown.png'),
	('portal.site.site_property.back_images', '\'images/admin/skin/bg_login1.svg\' , \'images/admin/skin/bg_login2.svg\' , \'images/admin/skin/bg_login3.svg\' , \'images/admin/skin/bg_login4.svg\''),
	('portal.site.site_property.portlet.title.maxlength', '75'),
	('themecitelibre.site_property.footer.cookieLink', '#cookiecitelibrepack'),
	('themecitelibre.site_property.footer.cookieLabel', 'Cookies management'),
	('themecitelibre.site_property.footer.about', 'Lutece is made for cities, by cities, upon open source principals.'),
	('captcha.defaultProvider', 'JCaptcha'),
	('core.crypto.key', '0edadd4933ca32122952069a6c714a92e0897228bb5e89bb8db16cad7b61a09e'),
	('themecitelibre.site_property.bannerMessage.Type', 'info'),
	('themecitelibre.site_property.bannerMessage.Title', ''),
	('core.plugins.status.themecitelibre.installed', 'true'),
	('themecitelibre.site_property.bannerMessage.Position', 'bottom-right'),
	('themecitelibre.site_property.bannerMessage.htmlblock', ''),
	('themecitelibre.site_property.bannerMessage.CloseButton.checkbox', '1'),
	('themecitelibre.site_property.bannerMessage.Duration', '5000'),
	('adminavatar.site_property.avatarserver.Url', ''),
	('core.cache.status.EntryTypeServiceManagerCache.enabled', '1'),
	('limitconnectedusers.site_property.limit_message.textblock', '<div class=\'alert alert-danger\'>Le nombre maximal d\'utilisateur connecté simultanément a été atteint</div>'),
	('limitconnectedusers.site_property.limit_notification_mailing_list.textblock', ''),
	('limitconnectedusers.site_property.limit_notification_message.textblock', 'Le nombre maximal d\'utilisateur connecté simultanément a été atteint'),
	('limitconnectedusers.site_property.limit_notification_sender_name', 'LUTECE'),
	('limitconnectedusers.site_property.limit_notification_subject.textblock', 'Le nombre maximal d\'utilisateur connecté simultanément a été atteint'),
	('mylutece.security.public_url.mylutece.url.login.page', 'jsp/site/Portal.jsp?page=mylutece&action=login'),
	('mylutece.security.public_url.mylutece.url.doLogin', 'jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),
	('mylutece.security.public_url.mylutece.url.doLogout', 'jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),
	('mylutece.security.public_url.mylutece.url.createAccount.page', 'jsp/site/Portal.jsp?page=mylutece&action=createAccount'),
	('mylutece.security.public_url.mylutece.url.modifyAccount.page', 'jsp/site/Portal.jsp?page=mylutece&action=modifyAccount'),
	('mylutece.security.public_url.mylutece.url.lostPassword.page', 'jsp/site/Portal.jsp?page=mylutece&action=lostPassword'),
	('mylutece.security.public_url.mylutece.url.lostLogin.page', 'jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),
	('mylutece.security.public_url.mylutece.url.doActionsAll', 'jsp/site/plugins/mylutece/Do*'),
	('mylutece-database_banned_domain_names', 'yopmail.com'),
	('mylutece.security.public_url.mylutece-database.url.login.page', 'jsp/site/Portal.jsp?page=mylutece&action=login'),
	('mylutece.security.public_url.mylutece-database.url.doLogin', 'jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),
	('mylutece.security.public_url.mylutece-database.url.doLogout', 'jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),
	('mylutece.security.public_url.mylutece-database.url.createAccount.page', 'jsp/site/Portal.jsp?page=mylutecedatabase&action=createAccount'),
	('mylutece.security.public_url.mylutece-database.url.lostPassword.page', 'jsp/site/Portal.jsp?page=mylutecedatabase&action=lostPassword'),
	('mylutece.security.public_url.mylutece-database.url.lostLogin.page', 'jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),
	('mylutece.security.public_url.mylutece-database.url.reinitPassword.page', 'jsp/site/Portal.jsp?page=mylutecedatabase&action=reinitPassword'),
	('mylutece.security.public_url.mylutece-database.url.doActionsAll', 'jsp/site/plugins/mylutece/modules/database/Do*'),
	('seo.rewrite.config.lastUpdate', 'Dernière mise à jour du fichier de configuration : 17 févr. 2022 à 11:23:24 Nombre d\'url : 8 Resultat : OK'),
	('seo.config.uptodate', 'true'),
	('seo.generator.option.addPath', 'false'),
	('seo.generator.option.addHtmlSuffix', 'true'),
	('seo.replaceUrl.enabled', 'false'),
	('seo.generator.daemon.enabled', 'false'),
	('seo.canonicalUrls.enabled', 'false'),
	('seo.sitmap.daemon.enabled', 'true'),
	('seo.sitemap.update.log', 'Dernière génération : 22 févr. 2022 à 17:32:50 Nombre d\'url : 5 Resultat : OK'),
	('core.cache.status.PortalMenuService.enabled', '0'),
	('core.cache.status.PortletCacheService.enabled', '0'),
	('core.cache.status.StaticFilesCachingFilter.timeToLiveSeconds', '604800'),
	('core.cache.status.MyPortalWidgetContentService.enabled', '1'),
	('core.cache.status.PageCachingFilter.enabled', '0'),
	('core.cache.status.MailAttachmentCacheService.timeToLiveSeconds', '7200'),
	('core.cache.status.MailAttachmentCacheService.overflowToDisk', 'true'),
	('core.cache.status.MailAttachmentCacheService.maxElementsInMemory', '10'),
	('core.cache.status.MailAttachmentCacheService.enabled', '1'),
	('core.cache.status.BaseUserPreferencesCacheService.enabled', '0'),
	('core.cache.status.MailAttachmentCacheService.diskPersistent', 'true'),
	('core.cache.status.StaticFilesCachingFilter.enabled', '0'),
	('core.cache.status.LinksIncludeCacheService.enabled', '0'),
	('core.cache.status.MyPortalWidgetService.enabled', '1'),
	('core.cache.status.LuteceUserCacheService.maxElementsInMemory', '1000'),
	('core.cache.status.LuteceUserCacheService.enabled', '1'),
	('core.cache.status.pathCacheService.enabled', '0'),
	('core.cache.status.BaseUserPreferencesCacheService.maxElementsInMemory', '1000'),
	('core.cache.status.SiteMapService.enabled', '1'),
	('core.cache.status.PageCacheService.enabled', '0'),
	('forms.display.form.columnTitle', 'true'),
	('forms.display.form.csv.separator', ';'),
	('core.plugins.status.core_extensions.installed', 'true'),
	('core.plugins.status.lucene.installed', 'true'),
	('core.daemon.indexer.interval', '300'),
	('core.daemon.indexer.onStartUp', 'true'),
	('core.daemon.mailSender.interval', '86400'),
	('core.daemon.mailSender.onStartUp', 'true'),
	('core.daemon.anonymizationDaemon.interval', '86400'),
	('core.daemon.anonymizationDaemon.onStartUp', 'false'),
	('core.daemon.accountLifeTimeDaemon.interval', '86400'),
	('core.daemon.accountLifeTimeDaemon.onStartUp', 'true'),
	('core.daemon.threadLauncherDaemon.interval', '86400'),
	('core.daemon.threadLauncherDaemon.onStartUp', 'true'),
	('core.daemon.archiveIndexer.interval', '360'),
	('core.daemon.archiveIndexer.onStartUp', 'true'),
	('core.daemon.fullIndexingDaemon.interval', '86400'),
	('core.daemon.fullIndexingDaemon.onStartUp', 'true'),
	('core.daemon.incrementalIndexingDaemon.interval', '3000'),
	('core.daemon.incrementalIndexingDaemon.onStartUp', 'true'),
	('core.daemon.temporaryfilesDaemon.interval', '86400'),
	('core.daemon.temporaryfilesDaemon.onStartUp', 'false'),
	('core.cache.status.JasperService.enabled', '0'),
	('core.daemon.jasperPurgeImage.interval', '10'),
	('core.daemon.jasperPurgeImage.onStartUp', 'false'),
	('matomo.site_property.site.id', '0'),
	('matomo.site_property.server.http.url', ''),
	('matomo.site_property.server.https.url', ''),
	('matomo.site_property.widget.auth.token', ''),
	('core.daemon.databaseAnonymizationDaemon.interval', '86400'),
	('core.daemon.databaseAnonymizationDaemon.onStartUp', 'true'),
	('core.daemon.databaseAccountLifeTimeDaemon.interval', '86400'),
	('core.daemon.databaseAccountLifeTimeDaemon.onStartUp', 'true'),
	('core.daemon.seoFriendlyUrlGenerator.interval', '3600'),
	('core.daemon.seoFriendlyUrlGenerator.onStartUp', 'true'),
	('core.daemon.seoSitemapGenerator.interval', '3600'),
	('core.daemon.seoSitemapGenerator.onStartUp', 'true'),
	('core.daemon.alert.interval', '43200'),
	('core.daemon.alert.onStartUp', 'true'),
	('core.daemon.alertCleaner.interval', '43200'),
	('core.daemon.alertCleaner.onStartUp', 'true'),
	('core.daemon.automaticActionDaemon.interval', '14400'),
	('core.daemon.automaticActionDaemon.onStartUp', 'true'),
	('core.daemon.archiveDaemon.interval', '86400'),
	('core.daemon.archiveDaemon.onStartUp', 'false'),
	('core.daemon.chooseStateActionDaemon.interval', '10'),
	('core.daemon.chooseStateActionDaemon.onStartUp', 'false'),
	('core.daemon.changeStateDaemon.interval', '10'),
	('core.daemon.changeStateDaemon.onStartUp', 'false'),
	('core.templates.currentCommonsInclude', 'Boostrap5Tabler'),
	('core.startup.time', '22 févr. 2022 à 17:32:48'),
	('core.cache.status.DatastoreCacheService.enabled', '0'),
	('core.cache.status.XMLTransformerCacheService(XSLT).enabled', '1'),
	('themecitelibre.site_property.banner.image', 'images/header-software-app.png'),
	('themecitelibre.site_property.footer.links', '[{"Our wiki","https://lutece.paris.fr/support/wiki/home.html"},{"Read our Terms & Conditions","https://lutece.paris.fr/support/wiki/home.html"},]'),
	('themecitelibre.site_property.robotIndex.checkbox', '1'),
	('core.plugins.status.archive.installed', 'true'),
	('core.plugins.status.archive.pool', 'portal'),
	('core.plugins.status.archive-client.installed', 'true'),
	('core.plugins.status.asynchronous-upload.installed', 'true'),
	('core.plugins.status.asynchronous-upload.pool', 'portal'),
	('core.plugins.status.avatar.installed', 'true'),
	('core.plugins.status.blobstore.installed', 'true'),
	('core.plugins.status.blobstore.pool', 'portal'),
	('core.plugins.status.blobstoreclient.installed', 'true'),
	('core.plugins.status.captcha.installed', 'true'),
	('core.plugins.status.contact.installed', 'true'),
	('core.plugins.status.contact.pool', 'portal'),
	('core.plugins.status.filegenerator.installed', 'true'),
	('core.plugins.status.filegenerator.pool', 'portal'),
	('core.plugins.status.forms.installed', 'true'),
	('core.plugins.status.forms.pool', 'portal'),
	('core.plugins.status.forms-breadcrumbaccordion.installed', 'true'),
	('core.plugins.status.forms-breadcrumbaccordion.pool', 'portal'),
	('core.plugins.status.forms-documentproducer.installed', 'true'),
	('core.plugins.status.forms-documentproducer.pool', 'portal'),
	('core.plugins.status.forms-template.installed', 'true'),
	('core.plugins.status.forms-template.pool', 'portal'),
	('core.plugins.status.forms-unittree.installed', 'true'),
	('core.plugins.status.forms-unittree.pool', 'portal'),
	('core.plugins.status.forms-userassignment.installed', 'true'),
	('core.plugins.status.forms-userassignment.pool', 'portal'),
	('core.plugins.status.genericattributes.installed', 'true'),
	('core.plugins.status.genericattributes.pool', 'portal'),
	('core.plugins.status.genericattributes-address.installed', 'false'),
	('core.plugins.status.adminavatar.installed', 'true'),
	('core.plugins.status.genericattributes-openstreetmap.installed', 'true'),
	('core.plugins.status.html.installed', 'true'),
	('core.plugins.status.htmlpage.installed', 'true'),
	('core.plugins.status.htmlpage.pool', 'portal'),
	('core.plugins.status.jasper.installed', 'false'),
	('core.plugins.status.jasper.pool', 'portal'),
	('core.plugins.status.jcaptcha.installed', 'false'),
	('core.plugins.status.mermaidjs.installed', 'true'),
	('core.plugins.status.mermaidjs.pool', 'portal'),
	('core.plugins.status.mylutece.installed', 'true'),
	('core.plugins.status.mylutece.pool', 'portal'),
	('core.plugins.status.mylutece-database.installed', 'true'),
	('core.plugins.status.mylutece-database.pool', 'portal'),
	('core.plugins.status.poll.installed', 'true'),
	('core.plugins.status.poll.pool', 'portal'),
	('core.plugins.status.profiles.installed', 'true'),
	('core.plugins.status.profiles.pool', 'portal'),
	('core.plugins.status.referencelist.installed', 'true'),
	('core.plugins.status.referencelist.pool', 'portal'),
	('core.plugins.status.regularexpression.installed', 'true'),
	('core.plugins.status.regularexpression.pool', 'portal'),
	('core.plugins.status.rest.installed', 'true'),
	('core.plugins.status.seo.installed', 'true'),
	('core.plugins.status.seo.pool', 'portal'),
	('core.plugins.status.systeminfo.installed', 'true'),
	('core.plugins.status.theme_citelibre.installed', 'true'),
	('core.plugins.status.unittree.installed', 'true'),
	('core.plugins.status.unittree.pool', 'portal'),
	('core.plugins.status.unittreeuserassignment.installed', 'true'),
	('core.plugins.status.unittreeuserassignment.pool', 'portal'),
	('core.plugins.status.userassignment.installed', 'true'),
	('core.plugins.status.userassignment.pool', 'portal'),
	('core.plugins.status.workflow.installed', 'true'),
	('core.plugins.status.workflow.pool', 'portal'),
	('core.plugins.status.workflow-alertforms.installed', 'true'),
	('core.plugins.status.workflow-alertforms.pool', 'portal'),
	('core.plugins.status.workflow-forms.installed', 'true'),
	('core.plugins.status.workflow-forms.pool', 'portal'),
	('core.plugins.status.workflow-formsautomaticassignment.installed', 'true'),
	('core.plugins.status.workflow-formsautomaticassignment.pool', 'portal'),
	('core.plugins.status.workflow-formsjasper.installed', 'false'),
	('core.plugins.status.workflow-formsjasper.pool', 'portal'),
	('core.plugins.status.workflow-formspdf.installed', 'true'),
	('core.plugins.status.workflow-formspdf.pool', 'portal'),
	('core.plugins.status.workflow-rest.installed', 'true'),
	('core.plugins.status.workflow-unittree.installed', 'true'),
	('core.plugins.status.workflow-unittree.pool', 'portal'),
	('core.plugins.status.workflow-userassignment.installed', 'true'),
	('core.plugins.status.workflow-userassignment.pool', 'portal'),
	('core.cache.status.PageCachingFilter(CAUTION:NEVERUSEWITHUSERDYNAMICDATA).enabled', '0'),
	('core.cache.status.SEOFriendlyUrlCacheService.enabled', '0'),
	('core.cache.status.asynchronousupload.asynchronousUploadCacheService.enabled', '0');
/*!40000 ALTER TABLE `core_datastore` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_feature_group`;
CREATE TABLE IF NOT EXISTS `core_feature_group` (
  `id_feature_group` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `feature_group_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_group_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_group_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_feature_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_feature_group` DISABLE KEYS */;
INSERT INTO `core_feature_group` (`id_feature_group`, `feature_group_description`, `feature_group_label`, `feature_group_order`) VALUES
	('CONTENT', 'portal.features.group.content.description', 'portal.features.group.content.label', 1),
	('APPLICATIONS', 'portal.features.group.applications.description', 'portal.features.group.applications.label', 3),
	('SYSTEM', 'portal.features.group.system.description', 'portal.features.group.system.label', 7),
	('SITE', 'portal.features.group.site.description', 'portal.features.group.site.label', 2),
	('STYLE', 'portal.features.group.charter.description', 'portal.features.group.charter.label', 6),
	('USERS', 'portal.features.group.users.description', 'portal.features.group.users.label', 4),
	('MANAGERS', 'portal.features.group.managers.description', 'portal.features.group.managers.label', 5);
/*!40000 ALTER TABLE `core_feature_group` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_file`;
CREATE TABLE IF NOT EXISTS `core_file` (
  `id_file` int(11) NOT NULL AUTO_INCREMENT,
  `title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_physical_file` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_file` DISABLE KEYS */;
INSERT INTO `core_file` (`id_file`, `title`, `id_physical_file`, `file_size`, `mime_type`, `date_creation`) VALUES
	(125, 'export_users_csv.xml', 125, 2523, 'application/xml', '2005-10-10 08:10:10'),
	(126, 'export_users_xml.xml', 126, 259, 'application/xml', '2005-10-10 08:10:10'),
	(127, 'export_users_csv.xml', 127, 1861, 'application/xml', NULL),
	(128, 'export_users_xml.xml', 128, 259, 'application/xml', NULL),
	(129, 'users.csv', 129, 12597, 'text/csv', '2022-02-21 15:36:05'),
	(130, 'Flex_et__Calcul.ods', 130, 18373, 'application/vnd.oasis.opendocument.spreadsheet', '2022-02-21 15:36:05');
/*!40000 ALTER TABLE `core_file` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_id_generator`;
CREATE TABLE IF NOT EXISTS `core_id_generator` (
  `class_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `current_value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`class_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_id_generator` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_id_generator` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_indexer_action`;
CREATE TABLE IF NOT EXISTS `core_indexer_action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `id_document` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_task` int(11) NOT NULL DEFAULT 0,
  `indexer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_portlet` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_indexer_action` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_level_right`;
CREATE TABLE IF NOT EXISTS `core_level_right` (
  `id_level` smallint(6) NOT NULL DEFAULT 0,
  `name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_level_right` DISABLE KEYS */;
INSERT INTO `core_level_right` (`id_level`, `name`) VALUES
	(0, 'Level 0 - Technical administrator'),
	(1, 'Level 1 - Fonctionnal administrator'),
	(2, 'Level 2 - Site Manager - Webmaster'),
	(3, 'Level 3 - Contributor');
/*!40000 ALTER TABLE `core_level_right` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_mail_item`;
CREATE TABLE IF NOT EXISTS `core_mail_item` (
  `id_mail_queue` int(11) NOT NULL DEFAULT 0,
  `mail_item` mediumblob DEFAULT NULL,
  PRIMARY KEY (`id_mail_queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_mail_item` DISABLE KEYS */;
INSERT INTO `core_mail_item` (`id_mail_queue`, `mail_item`) VALUES
	(1, _binary 0xaced00057372002c66722e70617269732e6c75746563652e706f7274616c2e736572766963652e6d61696c2e4d61696c4974656d000000000000000102000d5a000d5f624372656174654576656e745a00135f62556e69717565526563697069656e74546f4900085f6e466f726d61744c00155f6c69737446696c6573417474616368656d656e747400104c6a6176612f7574696c2f4c6973743b4c00145f6c69737455726c73417474616368656d656e7471007e00014c00135f73747243616c656e6461724d6573736167657400124c6a6176612f6c616e672f537472696e673b4c000b5f7374724d65737361676571007e00024c00115f737472526563697069656e747342636371007e00024c00105f737472526563697069656e7473436371007e00024c00105f737472526563697069656e7473546f71007e00024c000f5f73747253656e646572456d61696c71007e00024c000e5f73747253656e6465724e616d6571007e00024c000b5f7374725375626a65637471007e000278700000000000007070707401e33c7374726f6e673e4d6573736167652070726f76656e616e74206465203a203c2f7374726f6e673e3c62722f3e0d0a266e6273703b266e6273703b3c7374726f6e673e4e6f6d3c2f7374726f6e673e203a266e6273703b436cc3a96d656e6365203c62722f3e0d0a266e6273703b266e6273703b3c7374726f6e673e5072c3a96e6f6d3c2f7374726f6e673e203a266e6273703b484f484c203c62722f3e0d0a266e6273703b266e6273703b3c7374726f6e673e416472657373653c2f7374726f6e673e203a266e6273703b352052756520447563203c62722f3e0d0a266e6273703b266e6273703b3c7374726f6e673e452d6d61696c3c2f7374726f6e673e203a266e6273703b636c656d656e63652e686f686c40676d61696c2e636f6d20203c62722f3e3c62722f3e0d0a3c7374726f6e673e44617465203a3c2f7374726f6e673e266e6273703b31382f30322f323032323c62722f3e0d0a3c7374726f6e673e44657374696e617461697265203a203c2f7374726f6e673e266e6273703b436f6e746163742032203c62722f3e3c62722f3e0d0a3c68722f3e0d0a3c7374726f6e673e4d657373616765203a203c2f7374726f6e673e3c62722f3e3c62722f3e0d0a617a65617a65617a65617a65617a652061657a617a6520617a652065617a7070740026616472657373655f656d61696c5f64755f636f6e746163745f3240646f6d61696e652e636f6d740017636c656d656e63652e686f686c40676d61696c2e636f6d740009436cc3a96d656e63657400056172617a72),
	(2, _binary 0xaced00057372002c66722e70617269732e6c75746563652e706f7274616c2e736572766963652e6d61696c2e4d61696c4974656d000000000000000102000d5a000d5f624372656174654576656e745a00135f62556e69717565526563697069656e74546f4900085f6e466f726d61744c00155f6c69737446696c6573417474616368656d656e747400104c6a6176612f7574696c2f4c6973743b4c00145f6c69737455726c73417474616368656d656e7471007e00014c00135f73747243616c656e6461724d6573736167657400124c6a6176612f6c616e672f537472696e673b4c000b5f7374724d65737361676571007e00024c00115f737472526563697069656e747342636371007e00024c00105f737472526563697069656e7473436371007e00024c00105f737472526563697069656e7473546f71007e00024c000f5f73747253656e646572456d61696c71007e00024c000e5f73747253656e6465724e616d6571007e00024c000b5f7374725375626a65637471007e000278700000000000007070707401d43c7374726f6e673e4d6573736167652070726f76656e616e74206465203a203c2f7374726f6e673e3c62722f3e0d0a266e6273703b266e6273703b3c7374726f6e673e4e6f6d3c2f7374726f6e673e203a266e6273703b436cc3a96d656e6365203c62722f3e0d0a266e6273703b266e6273703b3c7374726f6e673e5072c3a96e6f6d3c2f7374726f6e673e203a266e6273703b484f484c203c62722f3e0d0a266e6273703b266e6273703b3c7374726f6e673e416472657373653c2f7374726f6e673e203a266e6273703b352052756520447563203c62722f3e0d0a266e6273703b266e6273703b3c7374726f6e673e452d6d61696c3c2f7374726f6e673e203a266e6273703b636c656d656e63652e686f686c40676d61696c2e636f6d20203c62722f3e3c62722f3e0d0a3c7374726f6e673e44617465203a3c2f7374726f6e673e266e6273703b31382f30322f323032323c62722f3e0d0a3c7374726f6e673e44657374696e617461697265203a203c2f7374726f6e673e266e6273703b436f6e746163742032203c62722f3e3c62722f3e0d0a3c68722f3e0d0a3c7374726f6e673e4d657373616765203a203c2f7374726f6e673e3c62722f3e3c62722f3e0d0a6461207a64617a2064617a64617a647070740026616472657373655f656d61696c5f64755f636f6e746163745f3240646f6d61696e652e636f6d740017636c656d656e63652e686f686c40676d61696c2e636f6d740009436cc3a96d656e63657400056172617a72);
/*!40000 ALTER TABLE `core_mail_item` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_mail_queue`;
CREATE TABLE IF NOT EXISTS `core_mail_queue` (
  `id_mail_queue` int(11) NOT NULL AUTO_INCREMENT,
  `is_locked` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id_mail_queue`),
  KEY `is_locked_core_mail_queue` (`is_locked`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_mail_queue` DISABLE KEYS */;
INSERT INTO `core_mail_queue` (`id_mail_queue`, `is_locked`) VALUES
	(1, 0),
	(2, 0);
/*!40000 ALTER TABLE `core_mail_queue` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_mode`;
CREATE TABLE IF NOT EXISTS `core_mode` (
  `id_mode` int(11) NOT NULL DEFAULT 0,
  `description_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `output_xsl_method` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_version` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_media_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_encoding` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_indent` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_omit_xml_dec` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_standalone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_mode` DISABLE KEYS */;
INSERT INTO `core_mode` (`id_mode`, `description_mode`, `path`, `output_xsl_method`, `output_xsl_version`, `output_xsl_media_type`, `output_xsl_encoding`, `output_xsl_indent`, `output_xsl_omit_xml_dec`, `output_xsl_standalone`) VALUES
	(0, 'Normal', 'normal/', 'xml', '1.0', 'text/xml', 'UTF-8', 'yes', 'yes', NULL),
	(1, 'Administration', 'admin/', 'xml', '1.0', 'text/xml', 'UTF-8', 'yes', 'yes', NULL),
	(2, 'Wap', 'wml/', 'xml', '1.0', 'text/xml', 'UTF-8', 'yes', 'yes', NULL);
/*!40000 ALTER TABLE `core_mode` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_page`;
CREATE TABLE IF NOT EXISTS `core_page` (
  `id_page` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT 0,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` smallint(6) DEFAULT NULL,
  `page_order` int(11) DEFAULT 0,
  `id_template` int(11) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_theme` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `node_status` smallint(6) NOT NULL DEFAULT 1,
  `image_content` mediumblob DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NULL',
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_authorization_node` int(11) DEFAULT NULL,
  `display_date_update` smallint(6) NOT NULL DEFAULT 0,
  `is_manual_date_update` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_page`),
  KEY `index_page` (`id_template`,`id_parent`),
  KEY `index_childpage` (`id_parent`,`page_order`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_page` DISABLE KEYS */;
INSERT INTO `core_page` (`id_page`, `id_parent`, `name`, `description`, `date_update`, `status`, `page_order`, `id_template`, `date_creation`, `role`, `code_theme`, `node_status`, `image_content`, `mime_type`, `meta_keywords`, `meta_description`, `id_authorization_node`, `display_date_update`, `is_manual_date_update`) VALUES
	(1, 0, 'Home', 'Home Page', '2014-06-08 15:20:44', 1, 1, 4, '2003-09-08 22:38:01', 'none', 'default', 0, _binary '', 'application/octet-stream', NULL, NULL, 1, 0, 0),
	(2, 1, 'INFO', 'Page d\'information', '2022-02-17 13:49:38', 0, 1, 4, '2014-06-08 16:23:42', 'none', 'default', 1, NULL, 'application/octet-stream', NULL, NULL, 1, 0, 0);
/*!40000 ALTER TABLE `core_page` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_page_template`;
CREATE TABLE IF NOT EXISTS `core_page_template` (
  `id_template` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_template`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_page_template` DISABLE KEYS */;
INSERT INTO `core_page_template` (`id_template`, `description`, `file_name`, `picture`) VALUES
	(1, 'One column', 'skin/site/page_template1.html', 'page_template1.gif'),
	(2, 'Two columns', 'skin/site/page_template2.html', 'page_template2.gif'),
	(3, 'Three columns', 'skin/site/page_template3.html', 'page_template3.gif'),
	(4, '1 + 2 columns', 'skin/site/page_template4.html', 'page_template4.gif'),
	(5, 'Two equal columns', 'skin/site/page_template5.html', 'page_template5.gif'),
	(6, 'Three unequal columns', 'skin/site/page_template6.html', 'page_template6.gif');
/*!40000 ALTER TABLE `core_page_template` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_physical_file`;
CREATE TABLE IF NOT EXISTS `core_physical_file` (
  `id_physical_file` int(11) NOT NULL AUTO_INCREMENT,
  `file_value` mediumblob DEFAULT NULL,
  PRIMARY KEY (`id_physical_file`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_physical_file` DISABLE KEYS */;
INSERT INTO `core_physical_file` (`id_physical_file`, `file_value`) VALUES
	(125, _binary 0x3c3f786d6c2076657273696f6e3d22312e30223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a093c78736c3a6f7574707574206d6574686f643d2274657874222f3e0d0a090d0a093c78736c3a74656d706c617465206d617463683d227573657273223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d227573657222202f3e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d2275736572223e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226163636573735f636f646522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226c6173745f6e616d6522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2266697273745f6e616d6522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d22656d61696c22202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2273746174757322202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226c6f63616c6522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226c6576656c22202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226d7573745f6368616e67655f70617373776f726422202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226163636573736962696c6974795f6d6f646522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2270617373776f72645f6d61785f76616c69645f6461746522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226163636f756e745f6d61785f76616c69645f6461746522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d22646174655f6c6173745f6c6f67696e22202f3e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d22726f6c657322202f3e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d2272696768747322202f3e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d22776f726b67726f75707322202f3e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d226174747269627574657322202f3e0d0a09093c78736c3a746578743e262331303b3c2f78736c3a746578743e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d22726f6c6573223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d22726f6c6522202f3e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d22726f6c65223e0d0a09093c78736c3a746578743e3b22726f6c653a3c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2263757272656e74282922202f3e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d22726967687473223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d22726967687422202f3e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d227269676874223e0d0a09093c78736c3a746578743e3b2272696768743a3c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2263757272656e74282922202f3e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d22776f726b67726f757073223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d22776f726b67726f757022202f3e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d22776f726b67726f7570223e0d0a09093c78736c3a746578743e3b22776f726b67726f75703a3c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2263757272656e74282922202f3e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d2261747472696275746573223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d2261747472696275746522202f3e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d22617474726962757465223e0d0a09093c78736c3a746578743e3b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226174747269627574652d696422202f3e0d0a09093c78736c3a746578743e3a3c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226174747269627574652d6669656c642d696422202f3e0d0a09093c78736c3a746578743e3a3c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226174747269627574652d76616c756522202f3e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a3c2f78736c3a7374796c6573686565743e),
	(126, _binary 0x3c3f786d6c2076657273696f6e3d22312e3022203f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a093c78736c3a74656d706c617465206d617463683d222f207c20402a207c206e6f64652829223e0d0a09093c78736c3a636f70793e0d0a0909093c78736c3a6170706c792d74656d706c617465732073656c6563743d22402a207c206e6f6465282922202f3e0d0a09093c2f78736c3a636f70793e0d0a093c2f78736c3a74656d706c6174653e0d0a3c2f78736c3a7374796c6573686565743e),
	(127, _binary 0x3c3f786d6c2076657273696f6e3d22312e30223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a093c78736c3a6f7574707574206d6574686f643d2274657874222f3e0d0a090d0a093c78736c3a74656d706c617465206d617463683d227573657273223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d227573657222202f3e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d2275736572223e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226163636573735f636f646522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226c6173745f6e616d6522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2266697273745f6e616d6522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d22656d61696c22202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2273746174757322202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2270617373776f72645f6d61785f76616c69645f6461746522202f3e0d0a09093c78736c3a746578743e223b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226163636f756e745f6d61785f76616c69645f6461746522202f3e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d22726f6c657322202f3e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d2267726f75707322202f3e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d226174747269627574657322202f3e0d0a09093c78736c3a746578743e262331303b3c2f78736c3a746578743e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d22726f6c6573223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d22726f6c6522202f3e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d22726f6c65223e0d0a09093c78736c3a746578743e3b22726f6c653a3c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2263757272656e74282922202f3e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d2267726f757073223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d2267726f757022202f3e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d2267726f7570223e0d0a09093c78736c3a746578743e3b2267726f75703a3c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d2263757272656e74282922202f3e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d2261747472696275746573223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d2261747472696275746522202f3e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a093c78736c3a74656d706c617465206d617463683d22617474726962757465223e0d0a09093c78736c3a746578743e3b223c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226174747269627574652d696422202f3e0d0a09093c78736c3a746578743e3a3c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226174747269627574652d6669656c642d696422202f3e0d0a09093c78736c3a746578743e3a3c2f78736c3a746578743e0d0a09093c78736c3a76616c75652d6f662073656c6563743d226174747269627574652d76616c756522202f3e0d0a09093c78736c3a746578743e223c2f78736c3a746578743e0d0a093c2f78736c3a74656d706c6174653e0d0a090d0a3c2f78736c3a7374796c6573686565743e),
	(128, _binary 0x3c3f786d6c2076657273696f6e3d22312e3022203f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a093c78736c3a74656d706c617465206d617463683d222f207c20402a207c206e6f64652829223e0d0a09093c78736c3a636f70793e0d0a0909093c78736c3a6170706c792d74656d706c617465732073656c6563743d22402a207c206e6f6465282922202f3e0d0a09093c2f78736c3a636f70793e0d0a093c2f78736c3a74656d706c6174653e0d0a3c2f78736c3a7374796c6573686565743e),
	(129, _binary 0x2261646d696e34223b2241646d696e223b2261646d696e223b2261646d696e34406c75746563652e6672223b2230223b226672223b2230223b2266616c7365223b2266616c7365223b22223b2231322f372f323220383a323320414d223b2231322f372f323120383a323320414d223b22726f6c653a666f726d735f6d756c746976696577223b22726f6c653a61737369676e5f67726f757073223b22726f6c653a657874656e645f616374696f6e5f627574746f6e5f6d616e61676572223b22726f6c653a6e6577736c65747465725f6d616e61676572223b22726f6c653a70726f66696c65735f76696577735f6d616e61676572223b22726f6c653a726f6c655f6461656d6f6e5f6d61696c5f726563697069656e74223b22726f6c653a6d796c75746563655f6d616e61676572223b22726f6c653a766965775f7370616365735f616c6c223b22726f6c653a657874656e645f6d616e61676572223b22726f6c653a657874656e645f6f70656e67726170685f6d616e61676572223b22726f6c653a6d616e6167655f737061636573223b22726f6c653a776f726b666c6f775f6d616e61676572223b22726f6c653a616c6c5f736974655f6d616e61676572223b22726f6c653a636f6e74656e745f7075626c6973686572223b22726f6c653a666f726d735f6d616e61676572223b22726f6c653a61737369676e5f726f6c6573223b22726f6c653a636f6e74656e745f76616c696461746f72223b22726f6c653a70726f66696c65735f6d616e61676572223b22726f6c653a7468656d655f6d616e61676572223b22726f6c653a6d79706f7274616c5f6d616e61676572223b22726f6c653a73757065725f61646d696e223b22726f6c653a636f6e74656e745f636f6e7472696275746f72223b22726f6c653a4352454154455f5245464552454e43455f494d504f5254223b22726f6c653a6d796c75746563655f64617461626173655f6d616e61676572223b2272696768743a434f52455f4c494e4b5f534552564943455f4d414e4147454d454e54223b2272696768743a434f52455f54454d504c415445535f4155544f5f494e434c554445535f4d414e4147454d454e54223b2272696768743a434f4e544143545f4d414e4147454d454e54223b2272696768743a53454f5f4d414e4147454d454e54223b2272696768743a53595354454d494e464f5f4d414e4147454d454e54223b2272696768743a434f52455f4c4f47535f56495355414c49534154494f4e223b2272696768743a434f52455f50524f504552544945535f4d414e4147454d454e54223b2272696768743a434f52455f4c4556454c5f52494748545f4d414e4147454d454e54223b2272696768743a434f52455f504147455f54454d504c4154455f4d414e4147454d454e54223b2272696768743a434f52455f5354594c4553484545545f4d414e4147454d454e54223b2272696768743a455854454e445f53544154495354494353223b2272696768743a434f52455f454449544f52535f4d414e4147454d454e54223b2272696768743a5345415243485f53544154535f4d414e4147454d454e54223b2272696768743a50524f46494c45535f4d414e4147454d454e54223b2272696768743a434f52455f4d41494c494e474c495354535f4d414e4147454d454e54223b2272696768743a434f52455f504c5547494e535f4d414e4147454d454e54223b2272696768743a544147434c4f55445f4d414e4147454d454e54223b2272696768743a4e4557534c45545445525f4d414e4147454d454e54223b2272696768743a48544d4c504147455f4d414e4147454d454e54223b2272696768743a434f52455f41444d494e5f53495445223b2272696768743a434f52455f5354594c45535f4d414e4147454d454e54223b2272696768743a5245464552454e43454c4953545f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f5749444745545f4d414e4147454d454e54223b2272696768743a4d414e4147455f414354494f4e5f425554544f4e53223b2272696768743a444f43554d454e545f52554c45535f4d414e4147454d454e54223b2272696768743a4e4557534c45545445525f54454d504c4154455f4d414e4147454d454e54223b2272696768743a5448454d455f4d414e4147454d454e54223b2272696768743a44415441424153455f4d414e4147454d454e545f5553455253223b2272696768743a454e5452595f545950455f4d414e4147454d454e54223b2272696768743a434f52455f58534c5f4558504f52545f4d414e4147454d454e54223b2272696768743a434f52455f574f524b47524f5550535f4d414e4147454d454e54223b2272696768743a434f52455f41444d494e44415348424f4152445f4d414e4147454d454e54223b2272696768743a444f43554d454e545f4d414e4147454d454e54223b2272696768743a434f52455f55534552535f4d414e4147454d454e54223b2272696768743a4c4942524152595f4d414e4147454d454e54223b2272696768743a50524f46494c45535f56494557535f4d414e4147454d454e54223b2272696768743a434f52455f524f4c45535f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f494e4445584154494f4e223b2272696768743a4d594c55544543455f4d414e4147454d454e54223b2272696768743a434f52455f52494748545f4d414e4147454d454e54223b2272696768743a44415441424153455f47524f5550535f4d414e4147454d454e54223b2272696768743a4d414e4147455f4f50454e47524150485f534f4349414c485542223b2272696768743a4d594c55544543455f4d414e4147455f41555448454e5449434154494f4e5f46494c544552223b2272696768743a434f52455f44415348424f4152445f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f5253535f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f4d414e4147454d454e54223b2272696768743a434f52455f46454154555245535f4d414e4147454d454e54223b2272696768743a434f52455f4441454d4f4e535f4d414e4147454d454e54223b2272696768743a434f52455f43414348455f4d414e4147454d454e54223b2272696768743a444f43554d454e545f54595045535f4d414e4147454d454e54223b2272696768743a574f524b464c4f575f4d414e4147454d454e54223b2272696768743a455854454e445f564f54455f54595045535f4d414e4147454d454e54223b2272696768743a434f52455f524241435f4d414e4147454d454e54223b2272696768743a444f43554d454e545f43415445474f52595f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f44454641554c545f504147455f4255494c444552223b2272696768743a5245534f555243455f455854454e4445525f4d414e4147454d454e54220a226c757465636534223b224c7574656365223b226c7574656365223b226c757465636534406c75746563652e6672223b2230223b226672223b2231223b2266616c7365223b2266616c7365223b22223b22223b22223b22726f6c653a61737369676e5f67726f757073223b22726f6c653a657874656e645f616374696f6e5f627574746f6e5f6d616e61676572223b22726f6c653a6e6577736c65747465725f6d616e61676572223b22726f6c653a766965775f7370616365735f616c6c223b22726f6c653a657874656e645f6d616e61676572223b22726f6c653a657874656e645f6f70656e67726170685f6d616e61676572223b22726f6c653a6d616e6167655f737061636573223b22726f6c653a776f726b666c6f775f6d616e61676572223b22726f6c653a616c6c5f736974655f6d616e61676572223b22726f6c653a636f6e74656e745f7075626c6973686572223b22726f6c653a666f726d735f6d616e61676572223b22726f6c653a61737369676e5f726f6c6573223b22726f6c653a636f6e74656e745f76616c696461746f72223b22726f6c653a6d79706f7274616c5f6d616e61676572223b22726f6c653a73757065725f61646d696e223b22726f6c653a636f6e74656e745f636f6e7472696275746f72223b2272696768743a434f52455f574f524b47524f5550535f4d414e4147454d454e54223b2272696768743a444f43554d454e545f4d414e4147454d454e54223b2272696768743a434f52455f4c494e4b5f534552564943455f4d414e4147454d454e54223b2272696768743a434f52455f55534552535f4d414e4147454d454e54223b2272696768743a434f4e544143545f4d414e4147454d454e54223b2272696768743a434f52455f524f4c45535f4d414e4147454d454e54223b2272696768743a434f52455f50524f504552544945535f4d414e4147454d454e54223b2272696768743a434f52455f504147455f54454d504c4154455f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f494e4445584154494f4e223b2272696768743a455854454e445f53544154495354494353223b2272696768743a4d414e4147455f4f50454e47524150485f534f4349414c485542223b2272696768743a5253535f46454544535f4d414e4147454d454e54223b2272696768743a544147434c4f55445f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f4d414e4147454d454e54223b2272696768743a5253535f4d414e4147454d454e54223b2272696768743a4e4557534c45545445525f4d414e4147454d454e54223b2272696768743a48544d4c504147455f4d414e4147454d454e54223b2272696768743a434f52455f41444d494e5f53495445223b2272696768743a4d59504f5254414c5f5749444745545f4d414e4147454d454e54223b2272696768743a4d414e4147455f414354494f4e5f425554544f4e53223b2272696768743a574f524b464c4f575f4d414e4147454d454e54223b2272696768743a444f43554d454e545f52554c45535f4d414e4147454d454e54223b2272696768743a455854454e445f564f54455f54595045535f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f44454641554c545f504147455f4255494c444552223b2272696768743a5245534f555243455f455854454e4445525f4d414e4147454d454e54220a22726564616334223b227265646163223b227265646163223b22726564616334406c75746563652e6672223b2230223b226672223b2232223b2266616c7365223b2266616c7365223b22223b22223b22223b22726f6c653a61737369676e5f67726f757073223b22726f6c653a61737369676e5f726f6c6573223b22726f6c653a766965775f73706163655f776f726b223b22726f6c653a636f6e74656e745f636f6e7472696275746f72223b2272696768743a444f43554d454e545f4d414e4147454d454e54223b2272696768743a48544d4c504147455f4d414e4147454d454e54220a2276616c696434223b2276616c6964223b2276616c6964223b2276616c696434406c75746563652e6672223b2230223b226672223b2233223b2266616c7365223b2266616c7365223b22223b22223b22223b22726f6c653a636f6e74656e745f76616c696461746f72223b22726f6c653a766965775f73706163655f76616c69646174696f6e223b2272696768743a444f43554d454e545f4d414e4147454d454e54220a2261646d696e33223b2241646d696e223b2261646d696e223b2261646d696e32406c75746563652e6672223b2230223b226672223b2230223b2266616c7365223b2266616c7365223b22223b2231322f372f323220383a323320414d223b2231322f372f323120383a323320414d223b22726f6c653a666f726d735f6d756c746976696577223b22726f6c653a61737369676e5f67726f757073223b22726f6c653a657874656e645f616374696f6e5f627574746f6e5f6d616e61676572223b22726f6c653a6e6577736c65747465725f6d616e61676572223b22726f6c653a70726f66696c65735f76696577735f6d616e61676572223b22726f6c653a726f6c655f6461656d6f6e5f6d61696c5f726563697069656e74223b22726f6c653a6d796c75746563655f6d616e61676572223b22726f6c653a766965775f7370616365735f616c6c223b22726f6c653a657874656e645f6d616e61676572223b22726f6c653a657874656e645f6f70656e67726170685f6d616e61676572223b22726f6c653a6d616e6167655f737061636573223b22726f6c653a776f726b666c6f775f6d616e61676572223b22726f6c653a616c6c5f736974655f6d616e61676572223b22726f6c653a636f6e74656e745f7075626c6973686572223b22726f6c653a666f726d735f6d616e61676572223b22726f6c653a61737369676e5f726f6c6573223b22726f6c653a636f6e74656e745f76616c696461746f72223b22726f6c653a70726f66696c65735f6d616e61676572223b22726f6c653a7468656d655f6d616e61676572223b22726f6c653a6d79706f7274616c5f6d616e61676572223b22726f6c653a73757065725f61646d696e223b22726f6c653a636f6e74656e745f636f6e7472696275746f72223b22726f6c653a4352454154455f5245464552454e43455f494d504f5254223b22726f6c653a6d796c75746563655f64617461626173655f6d616e61676572223b2272696768743a434f52455f4c494e4b5f534552564943455f4d414e4147454d454e54223b2272696768743a434f52455f54454d504c415445535f4155544f5f494e434c554445535f4d414e4147454d454e54223b2272696768743a434f4e544143545f4d414e4147454d454e54223b2272696768743a53454f5f4d414e4147454d454e54223b2272696768743a53595354454d494e464f5f4d414e4147454d454e54223b2272696768743a434f52455f4c4f47535f56495355414c49534154494f4e223b2272696768743a434f52455f50524f504552544945535f4d414e4147454d454e54223b2272696768743a434f52455f4c4556454c5f52494748545f4d414e4147454d454e54223b2272696768743a434f52455f504147455f54454d504c4154455f4d414e4147454d454e54223b2272696768743a434f52455f5354594c4553484545545f4d414e4147454d454e54223b2272696768743a455854454e445f53544154495354494353223b2272696768743a434f52455f454449544f52535f4d414e4147454d454e54223b2272696768743a5345415243485f53544154535f4d414e4147454d454e54223b2272696768743a50524f46494c45535f4d414e4147454d454e54223b2272696768743a434f52455f4d41494c494e474c495354535f4d414e4147454d454e54223b2272696768743a434f52455f504c5547494e535f4d414e4147454d454e54223b2272696768743a544147434c4f55445f4d414e4147454d454e54223b2272696768743a4e4557534c45545445525f4d414e4147454d454e54223b2272696768743a48544d4c504147455f4d414e4147454d454e54223b2272696768743a434f52455f41444d494e5f53495445223b2272696768743a434f52455f5354594c45535f4d414e4147454d454e54223b2272696768743a5245464552454e43454c4953545f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f5749444745545f4d414e4147454d454e54223b2272696768743a4d414e4147455f414354494f4e5f425554544f4e53223b2272696768743a444f43554d454e545f52554c45535f4d414e4147454d454e54223b2272696768743a4e4557534c45545445525f54454d504c4154455f4d414e4147454d454e54223b2272696768743a5448454d455f4d414e4147454d454e54223b2272696768743a44415441424153455f4d414e4147454d454e545f5553455253223b2272696768743a454e5452595f545950455f4d414e4147454d454e54223b2272696768743a434f52455f58534c5f4558504f52545f4d414e4147454d454e54223b2272696768743a434f52455f574f524b47524f5550535f4d414e4147454d454e54223b2272696768743a434f52455f41444d494e44415348424f4152445f4d414e4147454d454e54223b2272696768743a444f43554d454e545f4d414e4147454d454e54223b2272696768743a434f52455f55534552535f4d414e4147454d454e54223b2272696768743a4c4942524152595f4d414e4147454d454e54223b2272696768743a50524f46494c45535f56494557535f4d414e4147454d454e54223b2272696768743a434f52455f524f4c45535f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f494e4445584154494f4e223b2272696768743a4d594c55544543455f4d414e4147454d454e54223b2272696768743a434f52455f52494748545f4d414e4147454d454e54223b2272696768743a44415441424153455f47524f5550535f4d414e4147454d454e54223b2272696768743a4d414e4147455f4f50454e47524150485f534f4349414c485542223b2272696768743a4d594c55544543455f4d414e4147455f41555448454e5449434154494f4e5f46494c544552223b2272696768743a434f52455f44415348424f4152445f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f5253535f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f4d414e4147454d454e54223b2272696768743a434f52455f46454154555245535f4d414e4147454d454e54223b2272696768743a434f52455f4441454d4f4e535f4d414e4147454d454e54223b2272696768743a434f52455f43414348455f4d414e4147454d454e54223b2272696768743a444f43554d454e545f54595045535f4d414e4147454d454e54223b2272696768743a574f524b464c4f575f4d414e4147454d454e54223b2272696768743a455854454e445f564f54455f54595045535f4d414e4147454d454e54223b2272696768743a434f52455f524241435f4d414e4147454d454e54223b2272696768743a444f43554d454e545f43415445474f52595f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f44454641554c545f504147455f4255494c444552223b2272696768743a5245534f555243455f455854454e4445525f4d414e4147454d454e54220a226c757465636533223b224c7574656365223b226c7574656365223b226c757465636533406c75746563652e6672223b2230223b226672223b2231223b2266616c7365223b2266616c7365223b22223b22223b22223b22726f6c653a61737369676e5f67726f757073223b22726f6c653a657874656e645f616374696f6e5f627574746f6e5f6d616e61676572223b22726f6c653a6e6577736c65747465725f6d616e61676572223b22726f6c653a766965775f7370616365735f616c6c223b22726f6c653a657874656e645f6d616e61676572223b22726f6c653a657874656e645f6f70656e67726170685f6d616e61676572223b22726f6c653a6d616e6167655f737061636573223b22726f6c653a776f726b666c6f775f6d616e61676572223b22726f6c653a616c6c5f736974655f6d616e61676572223b22726f6c653a636f6e74656e745f7075626c6973686572223b22726f6c653a666f726d735f6d616e61676572223b22726f6c653a61737369676e5f726f6c6573223b22726f6c653a636f6e74656e745f76616c696461746f72223b22726f6c653a6d79706f7274616c5f6d616e61676572223b22726f6c653a73757065725f61646d696e223b22726f6c653a636f6e74656e745f636f6e7472696275746f72223b2272696768743a434f52455f574f524b47524f5550535f4d414e4147454d454e54223b2272696768743a444f43554d454e545f4d414e4147454d454e54223b2272696768743a434f52455f4c494e4b5f534552564943455f4d414e4147454d454e54223b2272696768743a434f52455f55534552535f4d414e4147454d454e54223b2272696768743a434f4e544143545f4d414e4147454d454e54223b2272696768743a434f52455f524f4c45535f4d414e4147454d454e54223b2272696768743a434f52455f50524f504552544945535f4d414e4147454d454e54223b2272696768743a434f52455f504147455f54454d504c4154455f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f494e4445584154494f4e223b2272696768743a455854454e445f53544154495354494353223b2272696768743a4d414e4147455f4f50454e47524150485f534f4349414c485542223b2272696768743a5253535f46454544535f4d414e4147454d454e54223b2272696768743a544147434c4f55445f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f4d414e4147454d454e54223b2272696768743a5253535f4d414e4147454d454e54223b2272696768743a4e4557534c45545445525f4d414e4147454d454e54223b2272696768743a48544d4c504147455f4d414e4147454d454e54223b2272696768743a434f52455f41444d494e5f53495445223b2272696768743a4d59504f5254414c5f5749444745545f4d414e4147454d454e54223b2272696768743a4d414e4147455f414354494f4e5f425554544f4e53223b2272696768743a574f524b464c4f575f4d414e4147454d454e54223b2272696768743a444f43554d454e545f52554c45535f4d414e4147454d454e54223b2272696768743a455854454e445f564f54455f54595045535f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f44454641554c545f504147455f4255494c444552223b2272696768743a5245534f555243455f455854454e4445525f4d414e4147454d454e54220a22726564616333223b227265646163223b227265646163223b22726564616333406c75746563652e6672223b2230223b226672223b2232223b2266616c7365223b2266616c7365223b22223b22223b22223b22726f6c653a61737369676e5f67726f757073223b22726f6c653a61737369676e5f726f6c6573223b22726f6c653a766965775f73706163655f776f726b223b22726f6c653a636f6e74656e745f636f6e7472696275746f72223b2272696768743a444f43554d454e545f4d414e4147454d454e54223b2272696768743a48544d4c504147455f4d414e4147454d454e54220a2276616c696433223b2276616c6964223b2276616c6964223b2276616c696433406c75746563652e6672223b2230223b226672223b2233223b2266616c7365223b2266616c7365223b22223b22223b22223b22726f6c653a636f6e74656e745f76616c696461746f72223b22726f6c653a766965775f73706163655f76616c69646174696f6e223b2272696768743a444f43554d454e545f4d414e4147454d454e54220a2261646d696e32223b2241646d696e223b2261646d696e223b2261646d696e32406c75746563652e6672223b2230223b226672223b2230223b2266616c7365223b2266616c7365223b22223b2231322f372f323220383a323320414d223b2231322f372f323120383a323320414d223b22726f6c653a666f726d735f6d756c746976696577223b22726f6c653a61737369676e5f67726f757073223b22726f6c653a657874656e645f616374696f6e5f627574746f6e5f6d616e61676572223b22726f6c653a6e6577736c65747465725f6d616e61676572223b22726f6c653a70726f66696c65735f76696577735f6d616e61676572223b22726f6c653a726f6c655f6461656d6f6e5f6d61696c5f726563697069656e74223b22726f6c653a6d796c75746563655f6d616e61676572223b22726f6c653a766965775f7370616365735f616c6c223b22726f6c653a657874656e645f6d616e61676572223b22726f6c653a657874656e645f6f70656e67726170685f6d616e61676572223b22726f6c653a6d616e6167655f737061636573223b22726f6c653a776f726b666c6f775f6d616e61676572223b22726f6c653a616c6c5f736974655f6d616e61676572223b22726f6c653a636f6e74656e745f7075626c6973686572223b22726f6c653a666f726d735f6d616e61676572223b22726f6c653a61737369676e5f726f6c6573223b22726f6c653a636f6e74656e745f76616c696461746f72223b22726f6c653a70726f66696c65735f6d616e61676572223b22726f6c653a7468656d655f6d616e61676572223b22726f6c653a6d79706f7274616c5f6d616e61676572223b22726f6c653a73757065725f61646d696e223b22726f6c653a636f6e74656e745f636f6e7472696275746f72223b22726f6c653a4352454154455f5245464552454e43455f494d504f5254223b22726f6c653a6d796c75746563655f64617461626173655f6d616e61676572223b2272696768743a434f52455f4c494e4b5f534552564943455f4d414e4147454d454e54223b2272696768743a434f52455f54454d504c415445535f4155544f5f494e434c554445535f4d414e4147454d454e54223b2272696768743a434f4e544143545f4d414e4147454d454e54223b2272696768743a53454f5f4d414e4147454d454e54223b2272696768743a53595354454d494e464f5f4d414e4147454d454e54223b2272696768743a434f52455f4c4f47535f56495355414c49534154494f4e223b2272696768743a434f52455f50524f504552544945535f4d414e4147454d454e54223b2272696768743a434f52455f4c4556454c5f52494748545f4d414e4147454d454e54223b2272696768743a434f52455f504147455f54454d504c4154455f4d414e4147454d454e54223b2272696768743a434f52455f5354594c4553484545545f4d414e4147454d454e54223b2272696768743a455854454e445f53544154495354494353223b2272696768743a434f52455f454449544f52535f4d414e4147454d454e54223b2272696768743a5345415243485f53544154535f4d414e4147454d454e54223b2272696768743a50524f46494c45535f4d414e4147454d454e54223b2272696768743a434f52455f4d41494c494e474c495354535f4d414e4147454d454e54223b2272696768743a434f52455f504c5547494e535f4d414e4147454d454e54223b2272696768743a544147434c4f55445f4d414e4147454d454e54223b2272696768743a4e4557534c45545445525f4d414e4147454d454e54223b2272696768743a48544d4c504147455f4d414e4147454d454e54223b2272696768743a434f52455f41444d494e5f53495445223b2272696768743a434f52455f5354594c45535f4d414e4147454d454e54223b2272696768743a5245464552454e43454c4953545f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f5749444745545f4d414e4147454d454e54223b2272696768743a4d414e4147455f414354494f4e5f425554544f4e53223b2272696768743a444f43554d454e545f52554c45535f4d414e4147454d454e54223b2272696768743a4e4557534c45545445525f54454d504c4154455f4d414e4147454d454e54223b2272696768743a5448454d455f4d414e4147454d454e54223b2272696768743a44415441424153455f4d414e4147454d454e545f5553455253223b2272696768743a454e5452595f545950455f4d414e4147454d454e54223b2272696768743a434f52455f58534c5f4558504f52545f4d414e4147454d454e54223b2272696768743a434f52455f574f524b47524f5550535f4d414e4147454d454e54223b2272696768743a434f52455f41444d494e44415348424f4152445f4d414e4147454d454e54223b2272696768743a444f43554d454e545f4d414e4147454d454e54223b2272696768743a434f52455f55534552535f4d414e4147454d454e54223b2272696768743a4c4942524152595f4d414e4147454d454e54223b2272696768743a50524f46494c45535f56494557535f4d414e4147454d454e54223b2272696768743a434f52455f524f4c45535f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f494e4445584154494f4e223b2272696768743a4d594c55544543455f4d414e4147454d454e54223b2272696768743a434f52455f52494748545f4d414e4147454d454e54223b2272696768743a44415441424153455f47524f5550535f4d414e4147454d454e54223b2272696768743a4d414e4147455f4f50454e47524150485f534f4349414c485542223b2272696768743a4d594c55544543455f4d414e4147455f41555448454e5449434154494f4e5f46494c544552223b2272696768743a434f52455f44415348424f4152445f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f5253535f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f4d414e4147454d454e54223b2272696768743a434f52455f46454154555245535f4d414e4147454d454e54223b2272696768743a434f52455f4441454d4f4e535f4d414e4147454d454e54223b2272696768743a434f52455f43414348455f4d414e4147454d454e54223b2272696768743a444f43554d454e545f54595045535f4d414e4147454d454e54223b2272696768743a574f524b464c4f575f4d414e4147454d454e54223b2272696768743a455854454e445f564f54455f54595045535f4d414e4147454d454e54223b2272696768743a434f52455f524241435f4d414e4147454d454e54223b2272696768743a444f43554d454e545f43415445474f52595f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f44454641554c545f504147455f4255494c444552223b2272696768743a5245534f555243455f455854454e4445525f4d414e4147454d454e54220a226c757465636532223b224c7574656365223b226c7574656365223b226c757465636532406c75746563652e6672223b2230223b226672223b2231223b2266616c7365223b2266616c7365223b22223b22223b22223b22726f6c653a61737369676e5f67726f757073223b22726f6c653a657874656e645f616374696f6e5f627574746f6e5f6d616e61676572223b22726f6c653a6e6577736c65747465725f6d616e61676572223b22726f6c653a766965775f7370616365735f616c6c223b22726f6c653a657874656e645f6d616e61676572223b22726f6c653a657874656e645f6f70656e67726170685f6d616e61676572223b22726f6c653a6d616e6167655f737061636573223b22726f6c653a776f726b666c6f775f6d616e61676572223b22726f6c653a616c6c5f736974655f6d616e61676572223b22726f6c653a636f6e74656e745f7075626c6973686572223b22726f6c653a666f726d735f6d616e61676572223b22726f6c653a61737369676e5f726f6c6573223b22726f6c653a636f6e74656e745f76616c696461746f72223b22726f6c653a6d79706f7274616c5f6d616e61676572223b22726f6c653a73757065725f61646d696e223b22726f6c653a636f6e74656e745f636f6e7472696275746f72223b2272696768743a434f52455f574f524b47524f5550535f4d414e4147454d454e54223b2272696768743a444f43554d454e545f4d414e4147454d454e54223b2272696768743a434f52455f4c494e4b5f534552564943455f4d414e4147454d454e54223b2272696768743a434f52455f55534552535f4d414e4147454d454e54223b2272696768743a434f4e544143545f4d414e4147454d454e54223b2272696768743a434f52455f524f4c45535f4d414e4147454d454e54223b2272696768743a434f52455f50524f504552544945535f4d414e4147454d454e54223b2272696768743a434f52455f504147455f54454d504c4154455f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f494e4445584154494f4e223b2272696768743a455854454e445f53544154495354494353223b2272696768743a4d414e4147455f4f50454e47524150485f534f4349414c485542223b2272696768743a5253535f46454544535f4d414e4147454d454e54223b2272696768743a544147434c4f55445f4d414e4147454d454e54223b2272696768743a434f52455f5345415243485f4d414e4147454d454e54223b2272696768743a5253535f4d414e4147454d454e54223b2272696768743a4e4557534c45545445525f4d414e4147454d454e54223b2272696768743a48544d4c504147455f4d414e4147454d454e54223b2272696768743a434f52455f41444d494e5f53495445223b2272696768743a4d59504f5254414c5f5749444745545f4d414e4147454d454e54223b2272696768743a4d414e4147455f414354494f4e5f425554544f4e53223b2272696768743a574f524b464c4f575f4d414e4147454d454e54223b2272696768743a444f43554d454e545f52554c45535f4d414e4147454d454e54223b2272696768743a455854454e445f564f54455f54595045535f4d414e4147454d454e54223b2272696768743a4d59504f5254414c5f44454641554c545f504147455f4255494c444552223b2272696768743a5245534f555243455f455854454e4445525f4d414e4147454d454e54220a22726564616332223b227265646163223b227265646163223b22726564616332406c75746563652e6672223b2230223b226672223b2232223b2266616c7365223b2266616c7365223b22223b22223b22223b22726f6c653a61737369676e5f67726f757073223b22726f6c653a61737369676e5f726f6c6573223b22726f6c653a766965775f73706163655f776f726b223b22726f6c653a636f6e74656e745f636f6e7472696275746f72223b2272696768743a444f43554d454e545f4d414e4147454d454e54223b2272696768743a48544d4c504147455f4d414e4147454d454e54220a2276616c696432223b2276616c6964223b2276616c6964223b2276616c696432406c75746563652e6672223b2230223b226672223b2233223b2266616c7365223b2266616c7365223b22223b22223b22223b22726f6c653a636f6e74656e745f76616c696461746f72223b22726f6c653a766965775f73706163655f76616c69646174696f6e223b2272696768743a444f43554d454e545f4d414e4147454d454e54220a),
	(130, _binary 0x504b03041400000800005d6a8853856c398a2e0000002e000000080000006d696d65747970656170706c69636174696f6e2f766e642e6f617369732e6f70656e646f63756d656e742e7370726561647368656574504b03041400000800005d6a8853ac685c63471f0000471f0000180000005468756d626e61696c732f7468756d626e61696c2e706e6789504e470d0a1a0a0000000d49484452000000b8000000ff080300000075b0ec2100000066504c54450505050b0b0b1414141b1b1b2323232b2b2b3333333b3b3b4343434c4c4c5353535a5a5a6363636b6b6b7373737a7a7a8282828b8b8b9292929b9b9ba3a3a3acacacb3b3b3bbbbbbc4c4c4cbcbcbd3d3d3dbdbdbe3e3e3ebebebf3f3f3fefefe000000ffffff692e2b5500001e9c4944415478daed5d8962dab0b2058c17edb2366bd7ffffe51b99a44d931608e5beb6f7468120903d3e1ecb332359473ab47f341dbe80ff69e07e739bdf3376b379fd5e60fc4b46165f5a63e1f3078bb1b5ec2bc88efd5b782a70410e4434109ec24afcb9f5ec9eb07ac99fe2145bdcdaf7a2fa3dfbe6d7979fbf97ac036e69c05345f3796d65589e5b55f231373a8f71253b70bacc19cee28c4695264477e022876911659e97322edc8c934e0339192863cb94167c463d3b2f632152f53c52bbc2156e8ab421a8ca6923fcc9c0cbb1346327a570071e8e164ba81eb82d8a2fee943af0d608b627b9349327d582664b3a66d8a4e583053cb2c0b937c03699329e73875c76d1005cd2366e4d9fa3656e7ebac6d3c94ceaa2f170d4caf70a045ae38b56e5021c63ad046abe4caecd1c809faa06e0e9a0d4b698ba03676dd6f502fca5ba00708deb39aa29b7651a8fe6c9c04b3e916579a92a3399007838d1f31ace74ae17e06e24289de99801f8b290c19d2aa06a6d2153077eeac0473a242ade5415390f2c8f33cac709895acd529f6b0ee166cfb9a6924aae8031e6fd74722eadc4bdaaf6e3f56c851cbc60a3045f4bda0b337c697d3bcef74cdfa8ffd4faed1efb77384208b0714d7fa71d17e2cb017d01ff02fe5ce0691ca729dfb5b72edff336dedc3c8db6d2696d0a4c2258959e7d26f078cc25b708e62c09c54b5b996b1b53b508de0d18332e0b5eaaa2c69d685dd9d684639b3f23b07b81ad6db5ccf613514235e963372e6adb25a3d1d8390de1e41983b346513c57e30742795ba4d5feb8611ad8768aa70d5b226c8f2e4e2c2eabc66e0c229e7c2fad67b69ecb19fc603d79a216628e700e7cf683dba6b99fc4ba0357129beef2ddc9109044e7993d59e36edb9a9d461586a697b090a38628b18d13eabeee14da6946a89033caa7b44169193770f913808b07b4c8455f5c3e9cbc6ef3f8cd3d96414d54d076f61ba5e04f19cdc7f8548d1fede68af47aea1a671c9ba33b6dc410bef53a3944b81a4e7b1547373846f4315d80f7b0f7b8a96f2e1f34bed965f7f6bbc68b522375a3190ad68bf2d24cf6949f093c5348d1331ec200753c31a30dd4f106757c77e5b965a8ff5532dd9488cc2a2b52e6cdb0bd8ecbba86dab39c70d544ccbc7eabe30de235c37cf370c704d934dc3cff1973d8db110f27a82a7fcc8e97dfd0480bf1cf01fff29c5fc0bf807f01ff02fe05fc0bf817f02fe0ff73c08d10c24454ff39e0785e571b8eff207068675500cec7d1c553a0a4373bcfd3b2b41342db799cd2a2b78375d35f07fc703cb2700c0723c7a6cf63c9ce8bb931002edab836c456c611e3e2efd3786f671dfd4148059fa86d3361b8c9a50dae0da65112c6d94ff3f69702cf67ce6519cddcbb20ec514d3b7036abc1d5616ad3a9fe6dc06d5765562d6b5da36ea9f78354a5c5d254ea1d691efeb9b699bfeee6fc598a0339dbbfdcaad89f262d95fdbbd301a96b69e1ea69e9fc3c5188a983bcde1d159e777197e789925bfb5f01eeadb149fb3b64db7c037805512edfd3c198dcef03c733e701ab56cbcbab9b52f8c87d9804402dadd4d61f93a093b9013c1d1897f1d4fa1e979d60b752e1552ebf758115e4da69f87de084e75cb1f21366f9ec2750459dd082d3306f66444b1cdac0428f6ad27213f831e612874ad01425b613408c673cae6cc6152da3a54a1f3306a39cfc1380e3619e3dd604e9637127568ddd8626713ae636d976dece1b9ed41ed5dc067e9866128774d084b56548d1841535b432d2dcb999c91242ccb95fd3f00c8df7cdb122d8aa6a065219df860ac02120186d1b36ba6874896aeed038808aa774307aabd3d93be624eec045732300cfd314963d247d06707c01ee474cd2392e1aaacad8ab0a0087aa82aa3d44d9437ba8e393ba05bc578ebdaa6c826d63d91df6d881d705811a46dc4efdded5cb01e7df055eeae55fbf6ff657ab2609badf5a25ef2322ea65b445cae58639dc074fc0c679bfb7fbed5d745ef47e88be73b9dcf32037e5ff841de7338a4fb2e3852ca4de6bc747722d8d883c2be1e169a2c8b89003d8b72b89b9fcb4343f4f14b7f92b56f923c0eb701ecffe73c00ba560abca94dbba235a294989d0f511e0e06be0e89ab7887af325132a9b0479b7811f0304055ab1eef3d40a4767c1f3ebc0a36f24378173097d9c5bd3cdad5bbaa6d65f17418391b6c4680bbabb2d1f1baa1a5a8d77005f30ae7cf627c049513cf96d1cfd8daa52246b4e7330b13bf066404351c887aa8aa35ba3095aed66f7b7a90f44d37769dc86d047388ee0ade1324da64dd3ad3a5e0309d893ed15785c552b1ed7478067cbf4bae13ec47417ed219b567d1bf861b526717e01beb85354f832c6f1d7c0adc8c41b834ccb4b69b1a26485b0697904388aa002a39754b4aaa5ac3aa3849211b7ad0a87e49d6b2b5c1dcaa4ad32277943e346f6f8de16b8aea2a816a4aa5549ff48554972ede1826d5a08e3435300accbfb9c39a4f2df3087d4bf4bda7ccf07a2fdd3d2f43449812a7f98c595c4672a9e95f8f969a2c44cc497cbff43c0a590e2d5dee7d5b7ec6e00af1a2c9095bdb828b0091bc8326041cd03e630487391074e134c15c82b192467771b783d48ad734afb5871022d6e126f0067989dcd24fb383d4cc9e2cfeaa891d09e7d5ee3e5a4cebacbeb6d3775725d1e76df315c057e349b6f6c263b903819e1eb8daa92e4dccaa5159ea0615eed5953b52e3e3e5055b6c9819bdfcbdd185a64e42d86eb1ac78476aa488f113d9108cbe506f06d612d61d481db5940ab6b4e9c52b920ff79e06cf2bbbc7dbc6d6c66966f315c079e76ffb9fb7cf04161aae375e03aa4a3b6f5bcf9a2a23f79dd66f09ed448693e0b3caf9531edd331faa81a92206fa86f305caf2ac379d05cb44ee4689b682b12d781dbf3c0c238a03239350c32cfc39c1b2e7959f2678157348cc19c07eea6b20c5352e7616d4e7ec3f0bfdd5bfb17019ff9b53411fea4c4f870d7562fafeb69c6fc40c3b5444c785a9aeed826bebeae27a6e23f5fc70ba44f03af7b5ffc65ffefd9c780d7d79ec98b987227f07a18c7c9ffd81f7913b81e215ca16c85ddb1404531aa1f059e296e9588de2b6b285505e4d5bb809763c72a39da3b1dcb7417f0c463f3b5425bb98426c2d60a7e1478c91035f8b6425c051231c8bb7ae41f343ecd95a1dc3b280c39517f4f55e92c956defc3a90cced8a2ede1aa52fb39f3bd8fc061dbe5b53b351ea08e33be072bd19eb77c17f0d8724da857cb22b65c237e1c38e94256d32b7ac490e5db9d1a674204f0f97b4fdcf74b7e1578203673ed5009117be289b58f57956d0919796653a2c6a1de61e3efb32a1a52f4e1fde3c9abc00dec529d29c5b7a8432bd6d6478147ad4d8b0604a52e11b2e1bfd6e5b3742d31979e96e6e789e2261d267a2d8d883e2d0dcf133521fabf15d67ebf816bfd4de06f04e4ff28f0feccbd704b5fac95fe710014d8344a4d85366015378197de4bc933652f3d033fda52479aa6b41869dbb63d01f806cecd6cfb2304802d99cb52c40c3e607f9c820364d0667554e126f0084dc446d3d6689f4b832bd4ac50cd88fd694c61189ce9b6b2c60b7f4a5501bdb0ba3f4268105f30cb62c1aba97eefd859039c17f5426cebaa6e5695c85b12adac5d072ce409e42983f6b944e04ae0c421f6125e48fba1f3fa21e0800c301b5083174db9051a2459925e6570609694464a08dc6b156f02174dfbfe64a3cf09511af2d01a731bd40fa828222e9eb5c4aa738635f6fbc00bca7edd1f21007a5c88e35bd636e55e41b5c152eb0459eda356e906f0ea59a575e3858142f916a6828b0dba8a3e6584d1734059ba56f94f2acb03831004173ab52465b70156da58944c79951794109be95e62fb59dcaa2a8ef31e545961f6476146372f0dc87c09ea0d1c054a3c1c6d4dff4d2eff3fd158f63ffd717a5ebb9baa70e0ff6412fc4e8e8476f773fffd9b47a13f2bc7f66e6e6da83f917a497701f7ab70ac85d5c37d629af76b6cb1370fb5aee0233a0ce7e00eb59d085ef59202146e7e4d721f9264dee2acca621daa51a559d8d3c22d59cd9a419e87bdfb6d0af17873703bfa752bb36a5ae5be559ef69b5d7c0a38983dec5a2285059c5c58799a1bcb3448bb6927726f2842c31c6565b80f2ef00a7e3c7215f17e993c7fdb2810cecf70cfbb483ccfaa9da35a3793704599179c2c988a3445381354505195e4cd40436e4abc3f766ed9635f3e017c77340d5c0db596f0b26e8de455a05d962002f7a7ba258f9cad81d0046e45cac5437b146d9daa6fd9fa26d6e88e060c0ce7a0066a219fe01cc512781f96c63bb33cd3c628c7e0d4d6462a342717f0fdda76f544bbd8f409e0115c97ebff7dd9e02aaebaa1c01addc0db3b03d7b5f7a8e70a18e2065727f2d80b796ac8ed6e5fbfad2a34e6b947280d5a280dd5b17a41539ea195eb0a6ad0086c99f55e0a574263911492f3020d69632f8304d8e7eab8e43d5a505c360dfe7de55c3726acc88cc52a7877186be9fea46c8c874a3d1346829b1299a68f4a90a2f7c8305f38576d912c7ba644344c36cf186c5f56082db969e0ea20e2da98e64136b7a9f5819bf3c7b43e91e6811edef301e0213d0fb8fdff04fe77a47f17f8bccccbaf5ff3b5c2cfbe9e270b441dc4d7c3ab2fe0ff09e086818be17718b12cc20de0853326d33d6763c5ef03c7c4da84550b5bcd5b0bbd346dd15717730bae4048b0a5da9913e87c9b6a60ec164fadb8084dbeeaba4b8726480a11e244179acfc5ee3e43a367500db0b5192b3bc9a54efa1cfb5c4cbc8fd8c741cee29c4ef54cb6ee0eeb1d54831d789dc4ecec2cfb13087f92e7958da29cc52cf9ba9e627fc6519f423598398f58e1999d7238c8cab91bda8a3bdfe1ecda68274d27b9471577903b285fe3100f6ca10d9f4ae748908657c69a1de1b561c4d5b05f87a7913b34a55135b1ccc5587f2a10839e6a9f07f314f868f16570eba26f6abc07aaa77c08ce97f3648209eb52e7ce91f043550bfc96c67d9f67d069680f54a94ecb22c35cfab74a1684f3585b9867d1b621eb717f6e771ee50de0e73ef5e4d8d679894cc5a93714663cafbd0b8ecf4b6888b7b11f4e4dc3949f6f0eab08943fc91c2691267baf39bc4e35a0efa906e943765d6878fb53ba14a4f73ba60f5483f4e107bef0f4fdf7f4ede3fd96dce4cf923be8872c7df323dddff4dd862f451fc81df4e3f17ed8f527077849d342be5cfe9f01de9f64d50780e76f7cabdd89e7df00de474e740c2f4252bd077885a87c099f070e8ec251ae0296ddae78c83e0e1cec3e95246bb637be99c4e51ee0fbd8094197659fee6fc1151b4d6e022f0c375a1a16be91d2fb1cd2c34f96db2a4ce4cd29b2f7bb24b075f769fc7c9e0a476500a747691db6743ea79bc07926fd28d83237c1d6cb2ae4a3c0a3747a5b5b105299a98fc65438dda5f14ea779e548088839ea7899d2f21af00da969030de11afa4743f5ba52af1576fea907c7abdad6d93941bcf0536e02279cf957e0933865c619bf05bca6848a115a046658734d4bcd1f059e935e2b76183ea42a5bcfc67bac4a9f5a2045888b7b55155b6ab6567b875581d2b05ddebeee1f8f5b9504513854ec2df409b38b4b9fb6e3ff0ab9e38cdea5e5ed97f38c9e964ecf1335cee820eab5c47c7d562acbd34455e1ea57bfca1f022ed7cb23d7dd34ade136b9a335e3dab63f39ad468145819d3a8fd13ec275cbb2b4fe54a8ed8f82aad6f52d866bc0eb412a0de1fafde48eb69d6838cbce911010b3e7613d39c4b5a78f681c1d939a591f7879964304791430b43bc91dde373691d32bb923dc2077d459d095b43394cf2e9eeddc1646f5ba5ce93cff2570cdcf11eb0c8d677f6e649d5d382f69fc86e1bac6416b3bb9a3bb122c1116e83a706615b9acc2d1261707bd34a41861f21751e635e079aee7b498be62c836811b19b7386ce43b86eb1a7f2577ec5d0b77903b967138115487140a56db04aa827388e41172871ba7c3c2441c4a88439d2dd67d16341ac67607b9e3300c837e65a56ca249c46fdd9c8ad665803de0c29e5d230386ba5af2fc797207a421a571306e6c6c40d57779ee3b86ff3673d8d7fef9f51ff7578b3ff5373f4f94dca009b12c0bfae57b98af162f57bfbd7b9fee1673f37d9e96afee893f05bcc75c0f02afed8725af7e07786df7c97a3bf0fd87d927d2fdc05d9f6f82f23b2674b90d9c32943742cd27805fc81d2b47f413e48e4bcc522bf2f2fd58d58780d7ad29d75bdf9fd2f8342d852f692777d0e175d5b67baaca6aac6edbfa8caa92496739e0fa09e0479f4b63178e4434e7d7b6ea3d7308d9e654b3fa09c043ef5eaa770ca9785b55b89481f3177207babfaac835c48203ce4fa82a8b0f4529cb3f635594d2aa933b4cfea455714a9b96747a825501d03a3667ea6780ff7b76fc3a4762c27f2d47e23a2b85daa73149e2935929ff33b14a7734ba3a77b983fc8fe55b691edaf97d81cfdb54837d814e97d3eb4850f5de1b15dbe95c655f7cefb781b3a9b6a098d92735ac59b9fdd9c74b377c3c072b1c89abcc71bd09dc5390c112f24bef98c8ddf5a4faed210a470d6fccf3289ac8cfd0383808d91725ec4333b142ce820380f7ee7fa8e82e8438ab22ff30f9de478d0768c43088ed681f2acfd6b9124512519d6ad0368d3385a3b0c6bc7e1670dafa405b38306fcaa255cf96b87eb0355cc81d490865192b37ab0a6f1e4e78a78190dc9680345bc93ec8b8b08663277758d1b5229f01bc0b8d7b2c06c0578b430a351bda1d1f9f294ffdd4d2eaad0e3781efb540ece119c9750934c55c02097d922c3e5ad27c5fd334f127903baa18b9ec6b898a5e3790c4d631b16aa82e7be9ea23e67d10412d8cdfd2b8a3b3026c93e833bb5822974a2589f0debd70c54d740e73d0e0d5d5ef6bbce452be71ca6b7f38592f9341be3604768e77fd1999ec032b0584d497ff7dfb72e18697fa4d5679597bb7fc57b97c1643fcf58b9a773fbdfc0b3f667f59fce615e60ff2df6ffaf1db2fa4311d0f8cf16b2f7ef958107afdfef2e30fd9379bff58fca10c5e6742dfedfbee603f7c79b7c9b76f778ead5596de7b19ebf7ca9776eb9ede5551a4fcdd55a2becb7eafb97701a7023b07ed2356574ea282736e9d2b1028dd0add973b602cac9c264799537384c22a0493a2af66f9e388fd0dac47c89e329bfb9e8bc02112a69a60ac1a46fbc2bd884391840638cdd31a08d31509e4c75d099f1bb10ff61a4ca0a75e5862735d6d43a52f1349738d2bf89cce918865f146c83515b0ce3e50cffd0b47822fe48dfbeff61a9cc1e6978043691308cfc1a3045eb22cc175fe1fd84115505a7c6ea4f44268905d38128e4fdfacc59de48ece5ae86325abc51be4494296eee40ef0f7b6ece48ec5424cb4b115bc3db2c4bfe148bcb54cb00f0047c6ba16570cf94457e9963d82986d5fa8003c3d5fadad59a34c2ac8ef1c09fd42f9ff9cc6cbe21608a6b0a399596156ea1000c7ab16a06fe2ba178570035bbe496338444dc861d559297e0f3bc2db5063956aee2b751ae185436d34dc70ad2638575ca8eea4bdcce0e2c2a1a88368c532ade6b4933bf62742ee73753cfb7e83952db7e223687fab1092d6b0c7a579eb774d5f2eba4f91e57b405b7a210479a1f98f834e7cda979cef9d09508a4044f539e5da278dd827d9ea416c02a1793f5cf525e6d8d7a77ee7511e2177f8e77992ff5772c7df91be80ffbf0317ff68fa38a7e70fe9ef9cd3d3f7393dbf1ea53c06bcfe3f0117f33c3ba4ee30f633add781e7699e715f00e366b8c9d1ef03c71c9c1c8666a08c59f6911f7dd202a78b34b12a11f2dad6ad741aec394efa3af0be004606e0119aaf7a2ba29f27f8fccd5ad58250d50408606c9fde5b3c836a70e14848b48d15d3be84423a5984d3516442dd299eca0881cade841f6eb4f213b461d63894c11115cf3b87c19edd7965938d8325444a39f8b90b790ab9e3c24ac1233ae77458cbbcd87353389d5ec81d8b84c8b3abda7f5cc1e983c67567a5c4039a79a3a7aa262548232b04fb766a6ef46856175d3f71e50e41926c989dfbc4abc740f60530b00014f2b4d1a1cf3a725a7dbe057c5f00a31c83f161c4a2a462c6b42f801186c8711be6d24736b46287df9fc261bd2c225f397191b59d8eae08838814a239f8ad455c7b63a0058cb1b97173f6278c107c6f8417e94a8f802b6768ed9356744e7783ba4ffb4d6440d67f82dc81d4b23ec98ea7c59cfdbde690e772e58f6d578bfb9f973abf64af6e97e7725396952e7f94f451b2b09ddc81affc8dcbd5e2cb5f5f96e392b9badd708724fc22ebc3afef61e1af01937f067867087d9edc51a029984a4d97e711b9fc6c019cfb805f3a4dcb6b57e9be324faeb781d703c40dfeb3c00585363b635eca4e45a32bf51b641f19e929791f3101f2b6d9ecb614b254e0701bf865624cbaf4893439ede40e6b6e913bbcec06bb2f8011ba3944b58f5075fa118dfb3eed9617ace59d60904aef71ba6be58ec379fc2cb9a3d242fbd458dd9dd65dff7d3d23fc581d374bb8c8bb2c8011fb0a55f2d703017f20779437e48ee90e7287e46a4eadcf72d17ba15a21fb7420eb43c05305a87c5dd285d2916bc170cf39790770caf97772873ca5dbe48e9cc265ae947d8c8deba36d74bbb6fec515e0d8689693c735081163326c5bf2e2c4edaa0257c8d81843733bb9c3c5666bb949eee8330475a0dd92f4a7a97b27d643c0abdbbbc342dbacf1202ed87c91f7293bfeaf903b46fc2e21f4e60bf8d6a7a5d3f3448d333ef0722db1ad3c2dcdcf13255cf9ea9ef833c02bd46cf48a3150dda2be099ca9a6b1debb0f48f0b0bf130c9a2d0fb87c8379c9b4afe504cd57512301798021983b801f5d8875f3ba379570980a2ab780ab33ddc6fd690aa75a94e0cf8aaeca3cb0ca5859b679955241933822686433252714a78af21dc00f7c5d2b9fd61eb4103749b9c6ebc0d3b252b9ec8b474e14c1f94a06b19144da3c5055d6294064c5f7678de08e37b4ee1854bc43e342e9fab25a57969a8012ae03478a2336c71edc8cc20eb50cb969455642dde781ebc9b6c0f6e5b21420f004a73718ae6bdca754bf913b509eca0d720767f3594c005c27caedb99a7e102bac90f6b3c0138e9809bd1d83f634ce925933bcc57015789f4ec82ad5fa5891be6eb87be95cb872735a09019c6cc467823a0b757f9857f7a9443fa971b9901cd0623ca97ca165438b6bce348bcd7fa539fc671bcbe7ab53520dd3f3e6b63a3d6f9eacf3f80fcf93f5aff7ab6c6edbca2781ef8fb1f3658127c8facd858781f75649bdaca5d0e7822a5bb90f783962da27a5ae2f2d927b805764700f2afa35238694cd6af228f0d457ee40a6b7b757b9b28cec92ef025e8fb1d6c69669dc07a27d2077e4f293e029b5d571df5b5d91fbde29c0f2a3c06bc5bd1b080081d44ca0e9cee27d1abfcc3e415af7e1eb749cdf517f95fd99323d6b78ed1d307ee93317c4fd7ea9dfbb56f2ee455fcff9d602187d4dd3bea985831782db9d1adf357621779438bdf67f5d800b419c6eab10cd70968d8488567156ed4802a37cac2d0e82613e7bcf585073549c57b532f3e3d0a65b4b8e1468a3afbdfd5d514a974708f7d4f10502ea577247e53f5495c89a70100595d5e190f3aadb526d15f624a45a173904db2686e6b248ee4a04bddbc23ddfea6568934454dd041ed74917b462ef83e49226a4d07d55a5f5658f4ace2dd68f56c5cb7d681392326489439fb7369115b94e22114cca9c1af511e2d0ad2a62a22850f87d68535d5f1696bbbae4480cb1d5587af727a87bcffe7ed32da3885dcb106b6619b55e795a7a446756e5d4c6536ff4d03ed847fb15ac4c22814464f7097779bd58caff841d9fd8b534e1fdff71448c2db02d3a0c741e0f0b3b9fd0890e27cafa17c6ce94e1e340c9f148d871e98513811f8ff8bb283ab0a7a519b1038bd712b51f7fe3263e94e6f8b4d487a87e3eac2df56f72f97f225649a1df00e9759ee80fe48edac91deeb7c81d9af7752855ddd6dc761fd92eb2d622dc777bfb3a87bf377701bf903b22de767247e9e48eee3e5e5c88400dbb0bb9433ecc91d8d6820ace46b12c2f36dea19c4d685ba1d614b74fc1131c0f972ed64ddad88addf6774bf6170ea8f68e750a9106e9e40ebace6d2777acefc81d7cfb1d7247c599801f6679955b9fd0c3d342bbd52b0422abad2f9e9d7098030ae0a9dab60494c5262cddb4cf38bc2c0afe338e84d7ade0eeed7772c7629822ea1db9c3f055af8f02079470fe05205acdfa231f38a6918b47a0f175127dbe73ab1b7713f8a37e8140f2260984316b710bc40bbf00ce9b4829f611c72fe48e1872f1f83bb9a33fa959d3e32b77947e3171f7a0b53344783f66a48d6d0854a250cba024070dfe0dd7dc574ce38dfba59a3e87bef4a2bd78c1f7c037366bda129268af2a7269504d62af2efd12c3f1f84eee50ed718d5b445976bde7c1c4a6fb8cb4156f442841fbcd69590f412b15346adec9489e095eb9d0648598ab0908c77e0a1c228cce72aa97bbb17472c79b9bb3bd7ceddff25f660e7fcf8e83e74cbf7e75cf79c9bda46f5fde6ef521f7f6976f9f73bc7aa8f8e1181f647d7bf19ddcc1e8af5f8cbdcdbdfdf2c356ef733f4878f3b9e7cf987c9040df46223fd9f1c3b6f40f8cadc5f7933bd6df24773c317902563487577207123846c2f47e0bbf903b702777ac8d715ac6b517562cf043e48e67a657724758c07fe517724758f285dcb17572076a52777247e8e48e14422777a89d23b17d92dcf1d47a52fa7a9e481b680b4a72217708bb40ebb0d5d9986de74870694ccdaa933b5669c03dbf2e8051ff9cc657a93bb963b5c2cb0db5b3e5861b3567e448a6a60fabeb03e3d8c632db767287792577ec0191fd63c09b8ffbe0cd7d96c41772c796632e3bb923b417720704b3c9e5de4dd60bc373c81dcf4cff2cb9a3feabc0db17f02fe05fc07f91fe0f419f4f3987ad4df00000000049454e44ae426082504b03041400080808005d6a88530000000000000000000000000c00000073657474696e67732e786d6cb557db52e240107ddfafa0f2aec1288a29c0425c5756572d82eee56d923464cac9746a2e04f6eb7742c072435285409e207339a773e64c77a773358f5963064252e45debe4b86935800718523eed5a2fe3dba3b675d5fbd2c1c98406e08618e818b83a92a09459221b663b976e3eddb5b4e02e1249a5cb490cd255818b09f0f536f7e36a7749968fcc19e56f5d2b522a716d3b4dd3e3f4f418c5d43eb9bcbcb497b3eba501f2099d6e4b95affe488588ef44d9863c982599d36c9ed9f9b3d55805f9411ac7eaad7558bf7eafb322c87f8ea88238d3a6b11ace42eb5a86d29d5148df55b3caf6fdbfe7954aea33e80b20634cacf5a45a2466927265f59a1d7b13e453c00f3051f520ffa4a18acaa09d66bbedec0d7f07741a9586eeb45aad76397ec9607620db1f613ea00551c6109f394b6fc115997b4a98f5239814e296110a13f9c56eaa0ce5cdcaf15e44048405701f9101e1566f429884dd281e908423202172b6a801becf18a6cf461bf51dfd01e101b02a1625f48e242f494814dc0a8cc71027ccfc3f3cc750de83e07d49097fd63c507a69941a14fb1afb10de2257b206f0a1f43849c638225281a88120071e8144a633817e95dde313e762c72c5484ff7d58f83b22bd08408d895fa9fe3e16cac3efcfa9345923880472fab7fa56efcee445e6d291295c9b74fa56c39b64f8df04ad29f247545047d06406af79c17fe20386b2324bece1ff4c9501322cde2d867c9a39f3fcd4715ae7fb987f2857b5b286e897891ac4a37928d6b1657db3ec6d5cfea495e9e9c05bc43e32e941b1961fc8267f40e02b61ba0eaf3c989e34af2a3f30dcd022afe9a7fb9ca2a7fd90cea8ac4c913b2730e33e1df311a677a6aa1bbb1f5e9c8d3728cfc23b360c5ae180b040d753c6570e37a6d4c5bedb2712cecfae292762b18dd1fb49c2162f12c40d51e4f0910e4cc7470213eb00e34480cc841e1bf072335614bccab6d8def8d6b1abbe027bff00504b0708c9993a37c6020000470e0000504b03041400080808005d6a88530000000000000000000000000b000000636f6e74656e742e786d6ced5dfd72dbb811ffbf4f81f15d3a8e2fa4f8a1efc6e9f492cbfd93746e9abb4e6732991b9a8464def1ab20e98fbe485fa1f9ffdec02fd65d82a4289a9449919265199e248e8805b0c0eefeb0bb8088d77fbd711d72455968fbdef9892a2b27847aa66fd9def2fce4979fdf4bd393bfbef9d36b7fb1b04d3ab77c3376a91749a6ef45f09b406d2f9cf3d2f393987973df08ed70ee192e0de79139f703ea65b5e645ea79d2177f1246b74ee3ea0971b176446fa2a6959176adae71d1bce784b858db62c675d3ca480b935aacbef09b56be091d69e1c3acbb8111d9252e6e1cdbfbfdfce4328a82f960707d7d2d5febb2cf960375369b0d92d29c6133a70b62e624549639a00ec5cec2812aab838cd6a591d1943fa42db2e4c5ee05658da7c6888c7b520d180d8104868b8ad9aca1629d35fdba5a36d6aeab65cd349b97066bac6709f1baaae8567355d1ad625dd7882e6be43b1d7c84c2e49f8f1f567ac5dca67d21edda5499cc0e1a0f935317ebfbbe9fb38a15b8b127ec6a8a321cf0cf05eaeb8de4d7cc8e282b909b1bc94dc331f319f7ddaa49033a75001412bd4295cf8d082722aca9a00d78714e1c5ab54dffebe3874fe625758d15b1fd30b1647b616478ab99612884da918e068c063e8bf2895934075f909696f37619b94e3d74606946ba649655490aece80380113062e9caa6d7dfac61eb667d980d12a2229e6eaca02a03a4c94d12c4bd027fb6ccd7a7851f7b1687013e19f426a0ccc622c349aacdd75a286ab0e36fd164baa6155a58037a9b3a99f5e743aa6cc6f72537046500a5f78379a1f6fabac1dc9b66cda1a2fbd6a2dc62c9e8cd30d4a32ad9fefc8f019649b86cc2c290f6547017b49337996fc0b1201ce40f16e023480bc3a492454d277cf39a637cfe98f0cfc8f7f9c9df986d80ae01fc6604aeeddc66cf079b2b7fb061b54964433e195e58d1cc9f8dc00fff52a2e30f4fc85ad3482f2da907b30858135edb61b84611d89109687c650063a8ba0fb0f68efe66fc33decc5681a6094bb76144dd2e3c7db0bdf886249311d91e253f6e98b012656ffc0dea94247d6ec4910feb9e6d4a493bb9f624ffae8dc6f4d5bcb394f9045460197762d73bc96a161f4a0118038e898664e1cf2f18357e972e28d80534885d672da6e4d7b6854bf0509395611025fc17d8d9c49bb62fde54459767a376cce9fb626ea2c863b51d6fc3bd091550aca550477be36d2c2be376bc8df7c5db5491d556bcb13a4365fe7589317852e48a17e1c34b6a2f2f61a95247f2043bdfcc701c52c90f22db351ca9583b62316dc3778d11ef9def85e1842d188f8cea09cf1eba1075512605c6924abcc64ff0df4f58f6eb68f1eb7b1adb0efc57537e554be32c8c9107c5961d068e719b4e6dda3e3aef10f24aae6f41db0e93a28b36cc57cf7a7be6b5dd31cfe3dc34dc95ee0fe2efd8f71a11493fc16a9788173a3629c41d3058ee36bab6275514a6d5b0147db9257467d94b3b825235e1ab8295bc6b18ae891e214c55058faaba2f26d372f426dfbcc8594e3ee69fcabc6ec03a5ab7f053c7c94a028361be2af920652ed9c2889da88c8550e9beed226f92e1d84b4f0afd9861926b61df648d4310468d3c1996d927daf6353382c484d14df67c093f67b52c9b5193973811cbdbf279de4232bc25a6a494fb05c806b6e6e54a1a5e32dbfb5d8a7c6961affae765573810886fb27a177e042e5526c1bcf4b7388cecc56d0a40b9e708f3662c81e9cbd2eab09a10f0f4220343d0247ae005eb8d21bd6bb025a8834317c09f82c857655e68c5abbe93a6d6bb85a5c767e727df28c9cf49513a7e1c39e09b96469f14e17329ba647ebcbce42ab03e7df789a2dba0449338a86b310ab0933c0cedffc043554de19c3fcb3a616e4a9af4115e1a16663aee750e31256509076bec65cd5da7c07fe13bd61a43d8b704c1bee1651c140b13654f4b33560ae5bcd58ce05edb38d82407e6d09b556056ea3b2fafe93d2fafef3f27493868eee2d03a9f5a98bd30fbbd99bdf6e866af3daad957f7be4bb3af8b56fb337bcb3696be07d671e148115b975b5e164131ab90696f7081a181cf2cdc3f51e40984a624f41ddb22252b381a3c41770f73fccf1c50841fb16f40a94b31093f42d8bdb0fbe3b5fbbaf4ad702404a008406904281556d923a45410ec1d54529216b052b7f322dc0961fdc2fa8fddfa27c2fa45525218fff334fea930fec7347eea59c2f4451a61cf69845927a3cf6c108f4d17cbf9718c870141a418449021c0e6d9808daaec066dca87e304d808b079866023829a0ac8e976bcb2dec1d146870f3a4f0171223f107023e0e658e0a6dbb14e0137c2c111882310a70de21cf989d2a7002aae6d59f8a52e012a4f1054448a660d4e767f9e54c089f0518e174e848f52012add0eab76ccfb569aa5d060a1c16d34b8dbb9c8ce717dc5da776538314d74a8e51278340728c46a26b0e031b0a0db29c9ce5820d633a1c39d7578f787fdc476bb481c1d35ae88c4d11aa2ecea24e1f61eb2385b2cce160b4878c4571cede8b89f385c7cc050231c1011d83c6260a33dcaeb14452e4e98bb702ef6eb5cecfe058a22d12614b48382eefe60965050e1307576981ee50572c261120e9330f79d99fba0f6029ab4e0c2b76e57971e058c1a56784969f4e635bf4d00af948a1d6e2b218d50e9b28b064c238479a75e08aa78b552205eb8ea70617b96e41817d4094b34783104a34b689e49f406afbbc38b98aaa8ae6dc7320d6685e9ad061977789d1abf01897f768d1bdb8d5dc9b2170b0a508508a3c8a0f2fc5681fa21650d26ffa68d71ad4daf5e206ac64f11fcf04e8ac20d51cc456b636e71f4be19870510c3c220706e258b868883dc80f3ab300a5ca4f79954f49adc11945ef6c0d197e36d152c376f53cbda4c2f5de0a4a1c4f1985ae727fa0e7add459bc31db439da419be307675c55f08cc1761d33ffbaa257bcb6a6c420b457e6191e55718c6f86c96e4dcbd76d7c5b112c98cb13925d3f575106ed6349f0e66723b1268b1287dfbe75f7d5648647a847821b322760a49c30b3d615470d79542b795c38be11ad97e0f4a2d353c53627cfb946c2569c359d50dc2ceb6d462f0090d3893cd594172fbbcfa596030d221780e6f989bf989fe3749c69ca40455fa2e9646bca509e369aed84721be637d9d1b4b002e406f2142ce68730c02bef60758c0c2fead7502a64fb597eab7e913ecbefb52fcd653b5466f2b8916c13ca0337a508820327b32458a7894ec0d170c31eec49ab99f3f7ea9733bdf97c8fd5a1dc0cb912ca03b7a51aedac107c635d1857d57e78649aba8791699df5f43df8fcd21218d98d211df2e4e9dbf0a657f9eec9151c7d0982a8ddc161d41dbf10b8fa36f6d95ea4da799544b0ee75e85ab5d2544ba912a5f5a12aeb7a2398e6a4bbd2a17aee9a2d229cb417ee2a56bf4fbf7c3cfd2c7f3f9ecbefc65f5e1e82f77e4c56f1a2bbd866354ecbf7e32f83cff2b76fbf55ab5dc5d5e58765d129a0ecf0a32893291eebab1c4ba1f64a1175a8b8c311bd3dba11bdeb3aa2d974a84f1e61407866ac1e2c260016931ab0a81f92da7c1810daca8ab2d5388e0236beeb21beac96e05019b48874549dab61f6d30cf0f55e16533180c71ec068bb48644f66d65f24a256272ddbd8ac3ad0935cc55079412c9e5aa5eb99a3ef880665d15abaf0b845347c30c13edcc0fd7a5b5b06c587ab8a35f1cd8105c5ddd9918e5bc78f3374de6542b92b6f7bd8c8681136ab1ab8c2aa2602e7a7143883bcb68eca6a445715c40cb78e611a86cb47328e775dc6a1351f87d6d33836c7c6aa8e88a08be8f8a0a3e36a5087d0ac7a7ba866256ab80c3d3b7685dbb8c790a197e8557b94e855ed7e3ee3c81545c4d0bb8c90b543803a11b03f390764bb807dfb707c3291a79366f17842baff9dec83dd673fb074c1148383a948173ca974c1b443983d869fd94c53a76d76718763793cd969e6a0c3900e74a7bdcb900e2f8930439c988924c24127116a3778cfb4365bbc1a583bff69b6c6237d0f4b7cdfdbd3fbdd99166eeed6bc95d4a0fb8168ed9136bf9ff0bebdc87c6c95ad68acd493033e44dfd337104011ed765f8a398ad96b9e29527bcdcd00102cf26947bcd8c79e7d0f30d1f397240e17304466a727a56b935d99e8b232ae0903cb6e2ba7dd7186451b41e4a48d4486e5296558405ec79661e932240d873452f499326e9362d1763ca6774f784c9bd32d1a7efb49abfbfa9348b71c74ba456b95b0c8732d6d322e3b4db808fef7c4ff213baf5bf156f77586ee01669616d16ad322e704108d48e474a87ca7e19f1ede7772c80212e98807424cfede3e918fd8633ea230efdb1d6511e98803f79af69c8ed046cdbef50174079688d0a70ddfa530ddf58b1474fc46887e20df08690a4d9a5e39a491aa9d0d5b9db5697cd4a68793365af7ed9ff5574e9d628297d89ee9c4e425b14d9b9c120d70564dfebe24670426043c1f64bfe7ef6c01288d9f0a28ed3213a477f92a489bbcc268c7dfcde93290766f7c98c8a39d7e3be7c98d6473ae47c7efe7e807f7fd9cc648dd028fd591de6c3d47c243c2e3ec6d9aa7843a2ec06ebafbce3159e7388cafd924238c4f29c17531b8d92a027dfa88fcd6a70bd2cb61802aab393dd5ce60b65f0e70d16be1d32872b35d21a0db1debea96acd7ad24f778d704f31dd222355ee767f947c067097fb5790baa34526bce7196468e84078176a577cb9e964e1911297b90faa71cff10aca14853d429f8a23898be5f20f064a0efa71b7c4d6c0fd8a70e1b80df19d7b0c6fad8349a96b60ca71b0e61fb01a85ab3700e09c5000e3a1bb5ed4b65f5bdbc6bb82b0ebcb35ddb8b939b28f0d5f6c60a484372f7d5b9fbea828b1e26e7b778909f664da1911eb62dd47c05dfb053b3ddf42b7b98fe49e7e9ff6467d709943689e017f1eebe2e8dc85ebc22c08141f0da0d7b6153f2ef18244509bf6888c68c4b076b044e1c92804676c4890cf8c3964862e1520885ce7db9cacf6fe7a1bbe0ded2f8460297e20a8400937be5db8cb0bbaf11fc356d26931f3c624450e7224669c61e25d05a2a889c2e0c298a2191820d5cbe221eca28f06368364c04cceefe70282b2909cad6bc34f0572ecbbc1162de7db528338458b7718b7c10114a8b197608980853ec8018e0d72bb426172477e95b899fc96fe321567c5f9ef02c3149bccde7ee7f0c0c112c19ff9394526eddb107961a7393454270501d2a84b68dd09c38bafb83435e2e18341a146310f80c2f9f88588287252b344cbef471f30291acec09c494c50f297a4694e3276f232c35f20aed96ddb3cb5742a2ed259ac02038b2911d3878b3562620032f2227619d18038361214680208dd80e399e7285c066ee690480a9e7bb17f03f1437acb1beebd27a71f39681d4e36be91a8fd87be562fe0c8dbabb63fa368757d3a7093a26c89a08dc8a13793fbf69ed6e593f38d4252a39258be20908f23299e5f5e99d277b7877ffc594f14b3248f7eec8399147f854e299e473824178cb348a10c64a185a49186aad30d426c280785c08636b61e842189b84b1de3ed0151b9f8d95a33d1258be63b2347455194e46e359fdf037b135ecc2569f3d169facb59b3599f49add2b5a79f22832eeb1d4ed1a496deb3b31bb9feeacceaa6a9a36505b9caf529bbe4547ede5253a6d76b91be678b7cbf06e12aab68fc3b9d5e2033b1d0c5bdcfea84ee55933f10161dff3d4730eb9e3eea23a3ad3e436270b270d77b291f08054ec61b09f8e26fd42ef61803df664156fb4c69aa94cd7aed8ce1ef24bb8b34f966fc698f29078663a7af37f504b07089f65a29a3c100000d7ec0000504b03041400080808005d6a88530000000000000000000000000a0000007374796c65732e786d6ced5d6d6fdb3812fe7ebfc270718b163859b29417db9bb8d8bbddee2dd006c5b67bf7b160244ae6ae240a141527fd78bf677fd5fd921b52efaf91e5f75c9da089c8e168e699e1cc500ad99bb78f9e3b7ac02c24d4bf1d4f27da78847d935ac4776ec7bf7d7ea7ccc66f977fb9a1b64d4cbcb0a81979d8e74ac89f5c1c8e60b01f2ee2cedb71c4fc05452109173ef270b8e0e68206d84f072d8ad40b79abb84532eb3b5c12174773fcc8fb0e16b4a5b1e8beff9d257171b4c5d0baef60410b981687dbb4efe0c7d0556caa98d40b102715291e5de2ff713b5e711e2c5475bd5e4fd6c68432479dcee77355f666029b195d1031575259a68a5d2c6e16aad3c9544d693dcc515ff9046d51243ff2ee31eb0d0de2a866d580e11048405de197fd1815c794fcebc1e9ed5d0f4e0bcce60ab1de7e2689cbae6258fd5dc5b08a633dc4572df69da91fa053fef3e17dee57cceb7b2f415b82ca6424e8ad664c5d1c4f29cd441503e2c92ec5d535ed428daf0bd4eb4ef235231cb302b9d9496e22d7cc10a75e13684037558142c10fc2e5536a26946ee57ca9321c50c63341ecfec10ed0d1b3a9bae29edb3e55456f4aea30cb6a2405710c15a62d4c1ae581e0f5ab522cebc67fae4aa262fcea1c30d55441934d0180370fb6ccc9d2814d23df8aa75d0c067e0c3023a20bb972d8a2c4a1e8312e1dc032c921050ea5c04ab09bceb64ca54636942a5ea8101f9c8c068bc2e8d2cc0f43833799e2f3afaae853445681b899dca7904cf5f132cd9c3685ac6923132b1636dd70791347bcac79145f0b216fc73f3082c0132018a5041e719fd276b57bf07b02b1572237fa84fcb081cd7728a0e1f715bab8713c2ab116f48a837d800c665eb8266158a208083721363d20104c38d633a2fd887f47ff8abac52ad0f411e929e4d8db46a6f7c48f1e47120c4e7c3cfab903b00ae5cee453db9c24698fabad540f0bdb2872931a2ce59c482ae7b76262d71da7e40162c8612858290138b9901d0ab7b80ba8810b0d148b841cf9a28633ae029e43263cbb3e4c8ad9e26c365db8c87722e4402ff665830973993390eeb74fe32a0b054228f2abae2169523e29c9d755da93304c3bfe7157672b92b88b1fbb1967442b52659d75fd72272dd400fdf226ae739272a7648f189d3b6d5c211a25571ef165d871609c451cc2438817f2460d3c331e1c0257d36da6fa34bf11b08e38d82ab94c8a6b97fa8ee09f7202c32e17d9dde465da176293fa561b03b5264b0ff12003a6342cf24dc4b1427d8542a8b45d5102d8c80d71aec28a462cec27ec296a6b1cc618691bc40ae22157095c881c553f6a10bcdd5da7fa452e7a6812c89204029052f6ddfafd46710a164eddd0d9e9f2c55ec8cdd417abcb4277cc39eb91a9fa01416564a47d50c29ad8ca0787c48198007e869f9d4f66c418ac769f9ab1b86c9bbc551df52e00f49e00388c46815c75a7a217dd61d4ec1db9024fde3d75535e7904466cbcfcef7ffecc4657062c1b3afa23a441dcf9a8a591f381ba900884774a05eab2886c90b22d64843665d49ee86b5de86b7b417f5bd00680236ffcba97179c10706f2a02c7507828c8b2ad6f9178890f933ac2afdf7ce7f0ef6f339f4241e026302a15af53b73683fecd770780b60938cd45a4ac085dca6ec7af6c5b834f55e46f6e9e3be8f66e6e1cdfcd8f9020b705ed3442f40180db93ef1a3bf1dd8b6fbe3b00b4b30bd1e7ebe617bddcdc120bde166b5d0e70658ffa7c5551506db688859efa113e6194d9a765119cabd14bb3ab019ad5c5555ad6fd028251a127128bc226cbb73010fa0ed7edfa78ba0d947836d4cff60b72eb531410793e40e4bd3c3a6a597d234f09bc810f89b4a9a19d8a7a839e8ced1f9f21cbe49de13350e68d96472767d30ea53b428b31a4583e700aebe1ad3b779d866817ff68c37197d56e77c175c4e70e4508fae272bc82f6e830eea76e352a75eb00a35c1ecc598fb8021b82cba93aebd92eb2a4ab6de7ac57bb70d618bdd45f0a57498f4d5c57117ff9854c8e594e53693f99d0b243a7bffa383d397ccf2aac6f85bd7e9ad82b1b39980c826d2a0e7d1adb52eac97b4130e2d8e7cf4c8a7e21ecb908761547b01eccdc3ecca6fd983d1b5885eb14cbfecc047d9f351ad73bac023678d1adbeb4983bec512fc0bf83b87b38f8cf32240f36cd0ec2f2814dd31ab15b30e88ad9439e909e54ccbede65ccbede59ccbe7e366677970bb3b32b85cf6bfd377b51a5f011168d5b617faaa5f081735eed89c1ce4af121af914e2aaccf7619d6673b0bebb3ad4bf1f94b2ac5cfeeaf2e00feff9352fc882961b069ceb0143fd58c31602930e43dfe49e58cf92e73c67c673963de9e33e271757bfc186f60caf64bb56f1bcb9bea1bc0188d37592bc8959b2d7ceae36c86094a13fc2ee9bba79c53af7d4b59e16587263fb5bd5cd97e48206dd80ed9b6a3ac69635f4e996cd44b68876ef04bc7b76df34bfbb3cd7eedfbd4eaca24b7aa50e49bd19e31f53f3112a73874983ae90910cb8e7450ca6eb281d152e384e42b30d02f025e68134c849b30af68c73526ce8a0b1771ad8df5faa26b5fb28c6b9110c2dc9352a2184d07e99ee23658f7e96c03dd93f621daebdddaeb47d25edfa3f69f419aad1c5a6de77d47391ec45b0ad51d3641ef7b64fe21aa1edf52f297bbb66d9ab91591437d089cf7aec25939a8667d1cbab33ec195324b9cb4a14dae61c68d42ea126bf46aa689af5e31d7909f9a11b53d1af11da5dcdf0dd8ed7a2510f4d18b704855e60ea6e613c8111fb7b247c5c49cc3782383157882fb4919714a233da685644d2c71f2088a386da168136a28849fa0ae88c27dcdf09f29b506f14ec41a32c74d53cef17ee5cfd555433cdde754bcc3116785b2e340a02481af0f28f3f9c141f93b3ab89708387a02629a8d59779f80fc1b317f68255905e5a414fb8931ca0e1f11d23fe97a16125b7eb68264b3dafa07d3044d8fb364d8bb5a1d2b869860e08221016d882f24481cc817369d1e396c2d4b8d04b6612b8d2d60dba0be3d2a6c46276cc6a161b3e4a7ae885a396628b914759f87383195b42315cac10a6843235ed2fb43e04dc70d440d0708111642b320899f5ddd8ec5e33ce247d9a2409cfc063947f1a805ac5da6f0fbdcde2b58a4e66fad4a6d362c2ee047190bf1c0739558539f4ef4abc4fa1e620e74b9d8860eaddcc862f24a6bfc34eb767c3dd1e6f141496abb48892c471093d3a041c6b23c6acd503d0cacf733f07958afb880d62717f37c015dc85001b2e2c350b5c9e5341dd490d535f195a153a0201e205573949aa667e049a789d70ebcdae8e7d510ab14716026e2f2555632821188d09491fcb45271542443a401476d32bb6871c97a576ca54b6332bb6ab454d65314442a90d888c3aceb1f7143134126e1546447edaf5d71b87843e023ce3a0d47c901b7e188deff8e4d68f88a1955e4ab8cf004e7fe4b8bdc6a6bd24e3a3c14662cb2549e340a4e5daf898ab3a221d7c7c82c6f4419b608929fe10ae3987af9f6eddb1bb5da98b404153b54d016c8956ba8f4b038b56cabecee1f852ec945eeeecb697abf425b4d84945509f44e11d41a8ecf41fb6b72926c07b27a0dd9f88a6147bc7413026d0a76dca02e5fc7bf71c2dd22697cfda60648e98ea526e9bd1529c486c71429713c6db16cbd83454246148705982a9a3e55a6baa2cdc64b4d53e5b7a6255208c2e5df46a9c0a085a62de4772674931b95e53b9e6fa588abc501f255f7723e2f0e88db8ee28b429f4fe2facba5fde51d8e880bbfb6af9273f284365f3037fab151f1e367c0ded42cbd880e0559cb0ab90e99fe0221539b738cdafcbf062cff07504b0708bd20b91bbc0a000075600000504b03041400080808005d6a8853000000000000000000000000080000006d6574612e786d6c8d923f6f833010c5f77e0ae47685e34f1a251690a5ea14a94b2b758b1c73a16e8d8d6c13f2f11b4c886894a1a3dffdeedebb93f3cda991c1118d155a1524896212a0e2ba12aa2ec8c7fb6bb8229bf221d78783e0482bcdbb06950b1b742c38b72a4bc752413aa3a8665658aa5883963a4e758b6a6aa1739a7aa3513949a17e0af2e55c4b01fabe8ffa2cd2a68664bd5e83af4e68c5af5cdb19e9a98a034a1c1c2c245102133b24fc6fa8819d47d25a5f8d067c0cededd2385ec0f89ee8da5495bcb7c099cde09c9039161e05f68f24b8ac3f3b784acae9ba438c32f761ae87b68e39619de081d71ddb4b0cb9ee942b484a4691a394939664d945d5fb6fe46ed2630297d1352a34cc69536ec5dee09bf77ec1232ca3387a8ed2a7ad50dd69f7b95aee968b60c6ec5aa3879190c3cda01cfe6c00f77e4bf90b504b0708360cc5c1380100006b020000504b03041400080808005d6a88530000000000000000000000000c0000006d616e69666573742e726466cd93cd6e83301084ef3c8565ced8402f05057228cab96a9fc0358658052ff29a12debe8e935651a4aaea9fd4e3ae4633df8eb49bed611cc88bb2a8c15434632925ca4868b5e92b3abb2eb9a5db3adad8b62b1f9a1df16a83a59f2aba776e2a395f96852d370c6ccfb3a228789af33c4fbc22c1d53871480cc6b48e08091e8d4269f5e47c1a39cee20966575174eba09079f7203d8bdd3aa9a0b20a61b652bd87b6209181408d094cca8474831cba4e4bc53396f35139c1a1ede2c760bdd383a23c60f02b8ecfd8de880ca6e55ee0bdb0ee5c83df7c95687aee637a75d3c5f1df2394609c32ee4feabb3b79ffe7fe2ecfff19e2afb476446c40cea367fa90e7b4f21f5547af504b0708b4f768d20501000083030000504b03041400000800005d6a88530000000000000000000000001a000000436f6e66696775726174696f6e73322f746f6f6c70616e656c2f504b03041400000800005d6a88530000000000000000000000001a000000436f6e66696775726174696f6e73322f7374617475736261722f504b03041400000800005d6a88530000000000000000000000001c000000436f6e66696775726174696f6e73322f70726f67726573736261722f504b03041400000800005d6a885300000000000000000000000018000000436f6e66696775726174696f6e73322f746f6f6c6261722f504b03041400000800005d6a88530000000000000000000000001a000000436f6e66696775726174696f6e73322f706f7075706d656e752f504b03041400000800005d6a885300000000000000000000000018000000436f6e66696775726174696f6e73322f666c6f617465722f504b03041400000800005d6a885300000000000000000000000018000000436f6e66696775726174696f6e73322f6d656e756261722f504b03041400080808005d6a8853000000000000000000000000150000004d4554412d494e462f6d616e69666573742e786d6cad934d6ec3201085f73985c5b632b45955284e16917a82f4001406070906c44f94dcbed88a135755a458ca8e6186efbd1960b33b3bdb9c2026e3b1231ff49d3480d22b837d47be0f5fed27d96d571b27d06848994f8ba69ec3740b3b5222722f92491c8583c4b3e43e002a2f8b03ccfc6f3d1f956ed1ccc09a5cd1d6c379e2c69e4f20ed0b2a916bf55508ce01a21952c272afb591c067845169bb6aee2d6863a1ade5f17237a08bb56d10f9d811f6d0d77d08a08c68f32540474408d6c8d1103ba1a2e30ce8bc759a4204a1d2112013b6c4cae158dc0f0a6313cbd39206ec1f58314ef4c086fc22950439d7eb4eb44eed0139d741b221bd082c3de6a1ff577353be5878bd5d0759bc1e7adda351e9275e50ad7a5bacb1f7a84d5fe288486bf6e44b4d058776693154ce0983f886fdfbf1db5f504b0708ee4c86ee330100002c040000504b010214001400000800005d6a8853856c398a2e0000002e0000000800000000000000000000000000000000006d696d6574797065504b010214001400000800005d6a8853ac685c63471f0000471f00001800000000000000000000000000540000005468756d626e61696c732f7468756d626e61696c2e706e67504b010214001400080808005d6a8853c9993a37c6020000470e00000c00000000000000000000000000d11f000073657474696e67732e786d6c504b010214001400080808005d6a88539f65a29a3c100000d7ec00000b00000000000000000000000000d1220000636f6e74656e742e786d6c504b010214001400080808005d6a8853bd20b91bbc0a0000756000000a00000000000000000000000000463300007374796c65732e786d6c504b010214001400080808005d6a8853360cc5c1380100006b02000008000000000000000000000000003a3e00006d6574612e786d6c504b010214001400080808005d6a8853b4f768d205010000830300000c00000000000000000000000000a83f00006d616e69666573742e726466504b010214001400000800005d6a88530000000000000000000000001a00000000000000000000000000e7400000436f6e66696775726174696f6e73322f746f6f6c70616e656c2f504b010214001400000800005d6a88530000000000000000000000001a000000000000000000000000001f410000436f6e66696775726174696f6e73322f7374617475736261722f504b010214001400000800005d6a88530000000000000000000000001c0000000000000000000000000057410000436f6e66696775726174696f6e73322f70726f67726573736261722f504b010214001400000800005d6a8853000000000000000000000000180000000000000000000000000091410000436f6e66696775726174696f6e73322f746f6f6c6261722f504b010214001400000800005d6a88530000000000000000000000001a00000000000000000000000000c7410000436f6e66696775726174696f6e73322f706f7075706d656e752f504b010214001400000800005d6a88530000000000000000000000001800000000000000000000000000ff410000436f6e66696775726174696f6e73322f666c6f617465722f504b010214001400000800005d6a8853000000000000000000000000180000000000000000000000000035420000436f6e66696775726174696f6e73322f6d656e756261722f504b010214001400080808005d6a8853ee4c86ee330100002c04000015000000000000000000000000006b4200004d4554412d494e462f6d616e69666573742e786d6c504b0506000000000f000f00ce030000e14300000000);
/*!40000 ALTER TABLE `core_physical_file` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_portal_component`;
CREATE TABLE IF NOT EXISTS `core_portal_component` (
  `id_portal_component` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portal_component`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_portal_component` DISABLE KEYS */;
INSERT INTO `core_portal_component` (`id_portal_component`, `name`) VALUES
	(0, 'Porlet'),
	(1, 'Article'),
	(2, 'Article List Portlet'),
	(3, 'Menu Init'),
	(4, 'Main Menu'),
	(5, 'Breadcrum'),
	(6, 'Site Map'),
	(7, 'Tree View'),
	(8, 'Site Map (Admin mode)');
/*!40000 ALTER TABLE `core_portal_component` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_portlet`;
CREATE TABLE IF NOT EXISTS `core_portlet` (
  `id_portlet` int(11) NOT NULL AUTO_INCREMENT,
  `id_portlet_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL,
  `name` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` smallint(6) NOT NULL DEFAULT 0,
  `portlet_order` int(11) DEFAULT NULL,
  `column_no` int(11) DEFAULT NULL,
  `id_style` int(11) DEFAULT NULL,
  `accept_alias` smallint(6) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `display_portlet_title` int(11) NOT NULL DEFAULT 0,
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_display_flags` int(11) NOT NULL DEFAULT 15,
  PRIMARY KEY (`id_portlet`),
  KEY `index_portlet` (`id_page`,`id_portlet_type`,`id_style`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_portlet` DISABLE KEYS */;
INSERT INTO `core_portlet` (`id_portlet`, `id_portlet_type`, `id_page`, `name`, `date_update`, `status`, `portlet_order`, `column_no`, `id_style`, `accept_alias`, `date_creation`, `display_portlet_title`, `role`, `device_display_flags`) VALUES
	(6, 'HTML_UNTRANSFORMED_PORTLET', 1, 'Intro', '2022-02-17 08:44:43', 0, 1, 1, 0, 0, '2022-02-17 08:36:30', 0, 'none', 4369),
	(7, 'HTML_UNTRANSFORMED_PORTLET', 2, 'Quoi de neuf ?', '2022-02-17 15:18:11', 0, 1, 1, 0, 0, '2022-02-17 15:18:11', 0, 'none', 4369),
	(4, 'HTML_UNTRANSFORMED_PORTLET', 1, 'Lutece', '2019-06-03 08:23:25', 0, 2, 1, 100, 0, '2019-05-31 09:55:16', 1, 'none', 4369),
	(5, 'HTML_UNTRANSFORMED_PORTLET', 1, 'Autres informations', '2019-05-31 14:51:33', 0, 3, 1, 100, 0, '2019-05-31 13:01:47', 1, 'none', 4369);
/*!40000 ALTER TABLE `core_portlet` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_portlet_alias`;
CREATE TABLE IF NOT EXISTS `core_portlet_alias` (
  `id_portlet` int(11) NOT NULL DEFAULT 0,
  `id_alias` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_portlet`,`id_alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_portlet_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_portlet_alias` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_portlet_type`;
CREATE TABLE IF NOT EXISTS `core_portlet_type` (
  `id_portlet_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_creation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_update` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plugin_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_docreate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_specific` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_specific_form` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_domodify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_specific` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_specific_form` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portlet_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_portlet_type` DISABLE KEYS */;
INSERT INTO `core_portlet_type` (`id_portlet_type`, `name`, `url_creation`, `url_update`, `home_class`, `plugin_name`, `url_docreate`, `create_script`, `create_specific`, `create_specific_form`, `url_domodify`, `modify_script`, `modify_specific`, `modify_specific_form`) VALUES
	('ALIAS_PORTLET', 'portal.site.portletAlias.name', 'plugins/alias/CreatePortletAlias.jsp', 'plugins/alias/ModifyPortletAlias.jsp', 'fr.paris.lutece.portal.business.portlet.AliasPortletHome', 'alias', 'plugins/alias/DoCreatePortletAlias.jsp', '/admin/portlet/script_create_portlet.html', '/admin/portlet/alias/create_portlet_alias.html', '', 'plugins/alias/DoModifyPortletAlias.jsp', '/admin/portlet/script_modify_portlet.html', '/admin/portlet/alias/modify_portlet_alias.html', ''),
	('HTML_PORTLET', 'html.portlet.name', 'plugins/html/CreatePortletHtml.jsp', 'plugins/html/ModifyPortletHtml.jsp', 'fr.paris.lutece.plugins.html.business.portlet.HtmlPortletHome', 'html', 'plugins/html/DoCreatePortletHtml.jsp', '/admin/portlet/script_create_portlet.html', '/admin/plugins/html/portlet_html.html', '', 'plugins/html/DoModifyPortletHtml.jsp', '/admin/portlet/script_modify_portlet.html', '/admin/plugins/html/portlet_html.html', ''),
	('HTML_UNTRANSFORMED_PORTLET', 'html.portlet.untransformed.name', 'plugins/html/CreatePortletHtml.jsp', 'plugins/html/ModifyPortletHtml.jsp', 'fr.paris.lutece.plugins.html.business.portlet.UntransformedHtmlPortletHome', 'html', 'plugins/html/DoCreatePortletHtml.jsp', '/admin/portlet/script_create_portlet.html', '/admin/plugins/html/portlet_html.html', '', 'plugins/html/DoModifyPortletHtml.jsp', '/admin/portlet/script_modify_portlet.html', '/admin/plugins/html/portlet_html.html', ''),
	('MYLUTECE_PORTLET', 'mylutece.portlet.name', 'plugins/mylutece/CreatePortletMyLutece.jsp', 'plugins/mylutece/ModifyPortletMyLutece.jsp', 'fr.paris.lutece.plugins.mylutece.business.portlet.MyLutecePortletHome', 'mylutece', 'plugins/mylutece/DoCreatePortletMyLutece.jsp', '/admin/portlet/script_create_portlet.html', '', '', 'plugins/mylutece/DoModifyPortletMyLutece.jsp', '/admin/portlet/script_modify_portlet.html', '', '');
/*!40000 ALTER TABLE `core_portlet_type` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_role`;
CREATE TABLE IF NOT EXISTS `core_role` (
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_role` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_search_parameter`;
CREATE TABLE IF NOT EXISTS `core_search_parameter` (
  `parameter_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parameter_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`parameter_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_search_parameter` DISABLE KEYS */;
INSERT INTO `core_search_parameter` (`parameter_key`, `parameter_value`) VALUES
	('type_filter', 'none'),
	('default_operator', 'OR'),
	('help_message', 'Message d aide pour la recherche'),
	('date_filter', '0'),
	('tag_filter', '0'),
	('taglist', NULL);
/*!40000 ALTER TABLE `core_search_parameter` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_style`;
CREATE TABLE IF NOT EXISTS `core_style` (
  `id_style` int(11) NOT NULL DEFAULT 0,
  `description_style` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_portlet_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_portal_component` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_style`),
  KEY `index_style` (`id_portlet_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_style` DISABLE KEYS */;
INSERT INTO `core_style` (`id_style`, `description_style`, `id_portlet_type`, `id_portal_component`) VALUES
	(3, 'Menu Init', '', 3),
	(5, 'Chemin Page', '', 5),
	(4, 'Main Menu', '', 4),
	(6, 'Site Map', '', 6),
	(7, 'Tree View', '', 7),
	(8, 'Site Map (Admin mode)', NULL, 8),
	(100, 'Défaut', 'HTML_PORTLET', 0),
	(101, 'Fond coloré', 'HTML_PORTLET', 0),
	(200, 'Défaut', 'MYLUTECE_PORTLET', 0);
/*!40000 ALTER TABLE `core_style` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_stylesheet`;
CREATE TABLE IF NOT EXISTS `core_stylesheet` (
  `id_stylesheet` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` mediumblob DEFAULT NULL,
  PRIMARY KEY (`id_stylesheet`)
) ENGINE=MyISAM AUTO_INCREMENT=311 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_stylesheet` DISABLE KEYS */;
INSERT INTO `core_stylesheet` (`id_stylesheet`, `description`, `file_name`, `source`) VALUES
	(253, 'Child Pages - Tree View', 'menu_tree.xsl', _binary 0x3c3f786d6c2076657273696f6e3d22312e30223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a0d0a3c78736c3a706172616d206e616d653d22736974652d70617468222073656c6563743d22736974652d7061746822202f3e0d0a0d0a3c78736c3a74656d706c617465206d617463683d226d656e752d6c697374223e0d0a093c78736c3a7661726961626c65206e616d653d226d656e752d6c697374222073656c6563743d226d656e7522202f3e0d0a0d0a093c73637269707420747970653d22746578742f6a617661736372697074223e0d0a09092428646f63756d656e74292e72656164792866756e6374696f6e28297b0d0a090909242822237472656522292e7472656576696577287b0d0a09090909616e696d617465643a202266617374222c0d0a09090909636f6c6c61707365643a2066616c73652c0d0a09090909756e697175653a20747275652c0d0a09090909706572736973743a2022636f6f6b6965220d0a0909097d293b0d0a09090d0a09097d293b0d0a093c2f7363726970743e202020200d0a090d0a093c212d2d204d656e752054726565202d2d3e2020202020200d0a093c78736c3a696620746573743d226e6f7428737472696e67286d656e75293d272729223e0d0a09202020203c78736c3a746578742064697361626c652d6f75747075742d6573636170696e673d22796573223e0909202020200d0a2020202020202020202020203c64697620636c6173733d227472656534223e09090d0a0909093c68323e26233136303b3c2f68323e0d0a0909093c756c2069643d22747265652220636c6173733d227472656534223e0d0a202020202020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d226d656e7522202f3e20202020202020200d0a0909093c2f756c3e090d0a0909093c2f6469763e0d0a09092009203c6272202f3e0d0a09093c2f78736c3a746578743e200d0a093c2f78736c3a69663e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c78736c3a74656d706c617465206d617463683d226d656e75223e0d0a202020203c78736c3a7661726961626c65206e616d653d22696e646578223e0d0a20202020093c78736c3a6e756d626572206c6576656c3d2273696e676c65222076616c75653d22706f736974696f6e282922202f3e0d0a202020203c2f78736c3a7661726961626c653e0d0a09093c6c693e0d0a202020203c212d2d3c78736c3a696620746573743d2224696e64657820266c743b2037223e2d2d3e20202020202020200d0a202020202020202020203c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207461726765743d225f746f7022203e0d0a2020202020202020202020202020203c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a20202020202020202020203c2f613e092020200d0a09092020203c6272202f3e0d0a09092020203c78736c3a76616c75652d6f662073656c6563743d22706167652d6465736372697074696f6e22202f3e0d0a09092020203c212d2d3c78736c3a76616c75652d6f662073656c6563743d22706167652d6465736372697074696f6e22202f3e3c6272202f3e2d2d3e09092020200909090d0a0909093c78736c3a6170706c792d74656d706c617465732073656c6563743d227375626c6576656c2d6d656e752d6c69737422202f3e200d0a0909090d0a09093c2f6c693e20090d0a202020203c212d2d3c2f78736c3a69663e2d2d3e0d0a09090d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c78736c3a74656d706c617465206d617463683d227375626c6576656c2d6d656e752d6c69737422203e200d0a090d0a093c78736c3a6170706c792d74656d706c617465732073656c6563743d227375626c6576656c2d6d656e7522202f3e200920202020090d0a0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c78736c3a74656d706c617465206d617463683d227375626c6576656c2d6d656e75223e0d0a2020203c78736c3a7661726961626c65206e616d653d22696e6465785f736f75735f6d656e75223e0d0a2020202020202020203c78736c3a6e756d626572206c6576656c3d2273696e676c65222076616c75653d22706f736974696f6e282922202f3e0d0a2020203c2f78736c3a7661726961626c653e0d0a0909203c756c203e0d0a0909093c6c693e0d0a3c212d2d093c7370616e3e202d2d3e0d0a090909093c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207461726765743d225f746f70223e0d0a09090909093c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a090909093c2f613e0d0a0909093c2f6c693e0909090d0a09093c2f756c3e0d0a093c212d2d3c2f7370616e3e092d2d3e0d0a09090d0a2020200d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c2f78736c3a7374796c6573686565743e0d0a),
	(215, 'Chemin page', 'page_path.xsl', _binary 0x3c3f786d6c2076657273696f6e3d22312e30223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a0d0a3c78736c3a706172616d206e616d653d22736974652d70617468222073656c6563743d22736974652d7061746822202f3e0d0a0d0a3c78736c3a74656d706c617465206d617463683d2270616765223e0d0a093c78736c3a696620746573743d22706f736974696f6e28293d31223e0d0a09093c6c6920636c6173733d2262726561646372756d622d6974656d223e0d0a0909093c6120687265663d222e22207461726765743d225f746f70223e4163637565696c3c2f613e0d0a09093c2f6c693e090d0a093c2f78736c3a69663e0d0a093c78736c3a696620746573743d22706f736974696f6e2829213d6c61737428292d31223e0d0a09093c6c6920636c6173733d2262726561646372756d622d6974656d223e0d0a0909093c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207461726765743d225f746f70223e3c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e3c2f613e0d0a09093c2f6c693e090d0a093c2f78736c3a69663e0d0a093c78736c3a696620746573743d22706f736974696f6e28293d6c61737428292d31223e0d0a09093c6c6920636c6173733d2262726561646372756d622d6974656d206163746976652220617269612d63757272656e743d2270616765223e0d0a0909093c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a09093c2f6c693e0d0a093c2f78736c3a69663e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c78736c3a74656d706c617465206d617463683d22706167655f6c696e6b223e0d0a093c78736c3a696620746573743d22706f736974696f6e28293d31223e0d0a09093c6c6920636c6173733d2262726561646372756d622d6974656d223e0d0a0909093c6120687265663d222e22207461726765743d225f746f70223e4163637565696c3c2f613e0d0a09093c2f6c693e090d0a093c2f78736c3a69663e0d0a093c78736c3a696620746573743d22706f736974696f6e2829213d6c61737428292d31223e0d0a09093c6c6920636c6173733d2262726561646372756d622d6974656d223e0d0a0909093c6120687265663d227b24736974652d706174687d3f7b706167652d75726c7d22207461726765743d225f746f70223e3c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e3c2f613e0d0a09093c2f6c693e090d0a093c2f78736c3a69663e0d0a093c78736c3a696620746573743d22706f736974696f6e28293d6c61737428292d31223e0d0a09093c6c6920636c6173733d2262726561646372756d622d6974656d206163746976652220617269612d63757272656e743d2270616765223e0d0a0909093c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a09093c2f6c693e0d0a093c2f78736c3a69663e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c2f78736c3a7374796c6573686565743e),
	(213, 'Menu principal', 'menu_main.xsl', _binary 0x3c3f786d6c2076657273696f6e3d22312e30223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e30220d0a09786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a0d0a093c78736c3a706172616d206e616d653d22736974652d70617468222073656c6563743d22736974652d7061746822202f3e0d0a093c78736c3a706172616d206e616d653d2263757272656e742d706167652d6964222073656c6563743d2263757272656e742d706167652d696422202f3e0d0a0d0a093c78736c3a74656d706c617465206d617463683d226d656e752d6c697374223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d226d656e7522202f3e0d0a093c2f78736c3a74656d706c6174653e0d0a0d0a093c78736c3a74656d706c617465206d617463683d226d656e75223e0d0a09093c6c693e0d0a0909093c78736c3a63686f6f73653e0d0a090909093c78736c3a7768656e20746573743d22636f756e74287375626c6576656c2d6d656e752d6c6973742f2a29202667743b2030223e0d0a09090909093c78736c3a617474726962757465206e616d653d22636c617373223e6e61762d6974656d2064726f70646f776e3c2f78736c3a6174747269627574653e0d0a09090909093c6120636c6173733d226e61762d6c696e6b2064726f70646f776e2d746f67676c652220617269612d6c6162656c3d227b706167652d6e616d657d222069643d226e61766261724d61696e4d656e754c696e6b7b706167652d69647d22207469746c653d227b706167652d6e616d657d2220687265663d22232220726f6c653d22627574746f6e2220646174612d746f67676c653d2264726f70646f776e2220617269612d686173706f7075703d22747275652220617269612d657870616e6465643d2266616c7365223e0d0a0909090909093c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a09090909093c2f613e200d0a09090909093c78736c3a6170706c792d74656d706c617465732073656c6563743d227375626c6576656c2d6d656e752d6c69737422202f3e0d0a090909093c2f78736c3a7768656e3e090d0a090909093c78736c3a6f74686572776973653e0d0a09090909093c78736c3a617474726962757465206e616d653d22636c617373223e0d0a0909090909093c78736c3a63686f6f73653e0d0a090909090909093c78736c3a7768656e20746573743d22706167652d69643d63757272656e742d706167652d6964223e6e61762d6974656d206163746976653c2f78736c3a7768656e3e0d0a090909090909093c78736c3a6f74686572776973653e6e61762d6974656d3c2f78736c3a6f74686572776973653e0d0a0909090909093c2f78736c3a63686f6f73653e0d0a09090909093c2f78736c3a6174747269627574653e0d0a09090909093c6120636c6173733d226e61762d6c696e6b2220617269612d6c6162656c3d227b706167652d6e616d657d22207469746c653d227b706167652d6e616d657d2220687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207461726765743d225f746f70223e0d0a0909090909093c78736c3a617474726962757465206e616d653d227469746c65223e0d0a090909090909093c78736c3a63686f6f73653e0d0a09090909090909093c78736c3a7768656e20746573743d22706167652d69643d63757272656e742d706167652d6964223e3c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e202d205275627269717565204163746976653c2f78736c3a7768656e3e0d0a09090909090909093c78736c3a6f74686572776973653e0d0a0909090909090909093c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e200d0a09090909090909093c2f78736c3a6f74686572776973653e0d0a090909090909093c2f78736c3a63686f6f73653e0d0a0909090909093c2f78736c3a6174747269627574653e0d0a0909090909093c78736c3a617474726962757465206e616d653d22617269612d6c6162656c223e0d0a090909090909093c78736c3a63686f6f73653e0d0a09090909090909093c78736c3a7768656e20746573743d22706167652d69643d63757272656e742d706167652d6964223e3c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e202d205275627269717565204163746976653c2f78736c3a7768656e3e0d0a09090909090909093c78736c3a6f74686572776973653e3c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e3c2f78736c3a6f74686572776973653e0d0a090909090909093c2f78736c3a63686f6f73653e0d0a0909090909093c2f78736c3a6174747269627574653e0d0a0909090909093c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a09090909093c2f613e200d0a090909093c2f78736c3a6f74686572776973653e0d0a0909093c2f78736c3a63686f6f73653e090d0a09093c2f6c693e0d0a093c2f78736c3a74656d706c6174653e0d0a0d0a093c78736c3a74656d706c617465206d617463683d227375626c6576656c2d6d656e752d6c697374223e0d0a09093c64697620636c6173733d2264726f70646f776e2d6d656e752220617269612d6c6162656c6c656462793d226e61766261724d61696e4d656e754c696e6b7b2e2e2f706167652d69647d223e0d0a2020202020202020093c78736c3a6170706c792d74656d706c617465732073656c6563743d227375626c6576656c2d6d656e7522202f3e0d0a09093c2f6469763e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a202020203c78736c3a74656d706c617465206d617463683d227375626c6576656c2d6d656e75223e0d0a20202020202020203c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207469746c653d227b706167652d6e616d657d22207461726765743d225f746f70223e0d0a0909093c78736c3a617474726962757465206e616d653d22636c617373223e0d0a090909093c78736c3a63686f6f73653e0d0a09090909093c78736c3a7768656e20746573743d22706167652d69643d2e2e2f63757272656e742d706167652d6964223e64726f70646f776e2d6974656d206163746976653c2f78736c3a7768656e3e0d0a09090909093c78736c3a6f74686572776973653e64726f70646f776e2d6974656d3c2f78736c3a6f74686572776973653e0d0a090909093c2f78736c3a63686f6f73653e0d0a0909093c2f78736c3a6174747269627574653e0d0a0909093c78736c3a617474726962757465206e616d653d22617269612d6c6162656c223e0d0a090909093c78736c3a63686f6f73653e0d0a09090909093c78736c3a7768656e20746573743d22706167652d69643d2e2e2f63757272656e742d706167652d6964223e3c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e202d205275627269717565204163746976653c2f78736c3a7768656e3e0d0a09090909093c78736c3a6f74686572776973653e3c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e3c2f78736c3a6f74686572776973653e0d0a090909093c2f78736c3a63686f6f73653e0d0a0909093c2f78736c3a6174747269627574653e0d0a2020202020202020202020203c7370616e3e3c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e3c2f7370616e3e0d0a20202020202020203c2f613e0d0a202020203c2f78736c3a74656d706c6174653e2020200d0a3c2f78736c3a7374796c6573686565743e),
	(211, 'Menu Init', 'menu_init.xsl', _binary 0x3c3f786d6c2076657273696f6e3d22312e30223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a0d0a3c78736c3a706172616d206e616d653d22736974652d70617468222073656c6563743d22736974652d7061746822202f3e0d0a0d0a3c78736c3a74656d706c617465206d617463683d226d656e752d6c697374223e0d0a3c6272202f3e3c6272202f3e0d0a093c6469762069643d226d656e752d696e6974223e0d0a09093c6469762069643d226d656e752d696e69742d636f6e74656e74223e0d0a2020202020202020202020203c756c2069643d226d656e752d7665727469223e0d0a202020202020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d226d656e7522202f3e0d0a2020202020202020202020203c2f756c3e0d0a20202020202020203c2f6469763e0d0a20202020203c2f6469763e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c78736c3a74656d706c617465206d617463683d226d656e75223e0d0a202020203c78736c3a7661726961626c65206e616d653d22696e646578223e0d0a20202020093c78736c3a6e756d626572206c6576656c3d2273696e676c65222076616c75653d22706f736974696f6e282922202f3e0d0a202020203c2f78736c3a7661726961626c653e0d0a0d0a202020203c78736c3a696620746573743d2224696e646578202667743b2037223e0d0a20202020202020203c6c6920636c6173733d2266697273742d7665727469223e0d0a2020202020202020093c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207461726765743d225f746f70223e0d0a2020202020202020202009093c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a0920202020202020203c2f613e0d0a2020202009202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d227375626c6576656c2d6d656e752d6c69737422202f3e0d0a20202020202020203c2f6c693e0d0a2020203c2f78736c3a69663e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c78736c3a74656d706c617465206d617463683d227375626c6576656c2d6d656e752d6c69737422203e0d0a093c756c3e0d0a20202020093c6c6920636c6173733d226c6173742d7665727469223e0d0a090920093c78736c3a6170706c792d74656d706c617465732073656c6563743d227375626c6576656c2d6d656e7522202f3e0d0a2009202020203c2f6c693e0d0a202020203c2f756c3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c78736c3a74656d706c617465206d617463683d227375626c6576656c2d6d656e75223e0d0a2020203c78736c3a7661726961626c65206e616d653d22696e6465785f736f75735f6d656e75223e0d0a2020202020202020203c78736c3a6e756d626572206c6576656c3d2273696e676c65222076616c75653d22706f736974696f6e282922202f3e0d0a2020203c2f78736c3a7661726961626c653e0d0a0d0a2020203c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207461726765743d225f746f70223e0d0a09093c7370616e3e3c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e3c2f7370616e3e0d0a2020203c2f613e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c2f78736c3a7374796c6573686565743e0d0a),
	(217, 'Site Map', 'site_map.xsl', _binary 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d2249534f2d383835392d31223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a202020203c78736c3a706172616d206e616d653d22736974652d70617468222073656c6563743d22736974652d7061746822202f3e0d0a202020203c78736c3a74656d706c617465206d617463683d22706167655b706167652d6c6576656c3d305d223e0d0a20202020202020203c64697620636c6173733d22636f6e7461696e6572206d792d35206d61696e2d736974652d6d6170223e0d0a2020202020202020202020203c64697620636c6173733d22726f77223e0d0a202020202020202020202020202020203c64697620636c6173733d22636f6c223e0d0a202020202020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d226368696c642d70616765732d6c69737422202f3e0d0a202020202020202020202020202020203c2f6469763e0d0a2020202020202020202020203c2f6469763e0d0a20202020202020203c2f6469763e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a0d0a202020203c78736c3a74656d706c617465206d617463683d22706167655b706167652d6c6576656c3d315d223e0d0a20202020202020203c756c20636c6173733d226c6973742d756e7374796c656420736974652d6d61702d6c6576656c2d6f6e65223e0d0a2020202020202020202020203c6c693e0d0a202020202020202020202020202020203c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207461726765743d225f746f70223e0d0a20202020202020202020202020202020202020203c6920636c6173733d2266612066612d6d61702d6d61726b6572223e26233136303b3c2f693e203c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a202020202020202020202020202020203c2f613e0d0a202020202020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d22706167652d6465736372697074696f6e22202f3e0d0a202020202020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d22706167652d696d61676522202f3e0d0a202020202020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d226368696c642d70616765732d6c69737422202f3e0d0a2020202020202020202020203c2f6c693e0d0a20202020202020203c2f756c3e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a0d0a202020203c78736c3a74656d706c617465206d617463683d22706167655b706167652d6c6576656c3d325d223e0d0a20202020202020203c756c20636c6173733d226c6973742d756e7374796c656420736974652d6d61702d6c6576656c2d74776f223e0d0a2020202020202020202020203c6c693e0d0a202020202020202020202020202020203c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207461726765743d225f746f70223e0d0a20202020202020202020202020202020202020203c6920636c6173733d2266612066612d6d61702d6d61726b6572223e26233136303b3c2f693e20203c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a202020202020202020202020202020203c2f613e0d0a202020202020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d22706167652d6465736372697074696f6e22202f3e0d0a202020202020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d226368696c642d70616765732d6c69737422202f3e0d0a2020202020202020202020203c2f6c693e0d0a20202020202020203c2f756c3e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a0d0a202020203c78736c3a74656d706c617465206d617463683d22706167655b706167652d6c6576656c3e325d223e0d0a20202020202020203c756c20636c6173733d22736974652d6d61702d6c6576656c2d68696768657374223e0d0a2020202020202020202020203c6c693e0d0a202020202020202020202020202020203c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207461726765743d225f746f70223e0d0a20202020202020202020202020202020202020203c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a202020202020202020202020202020203c2f613e0d0a202020202020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d22706167652d6465736372697074696f6e22202f3e0d0a202020202020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d226368696c642d70616765732d6c69737422202f3e0d0a2020202020202020202020203c2f6c693e0d0a20202020202020203c2f756c3e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a0d0a202020203c78736c3a74656d706c617465206d617463683d22706167652d6465736372697074696f6e223e0d0a20202020202020203c703e3c78736c3a76616c75652d6f662073656c6563743d222e22202f3e3c2f703e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a0d0a202020203c78736c3a74656d706c617465206d617463683d226368696c642d70616765732d6c6973745b706167652d6c6576656c3d305d223e0d0a20202020202020203c78736c3a696620746573743d22636f756e742870616765293e30223e0d0a2020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d227061676522202f3e0d0a20202020202020203c2f78736c3a69663e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a0d0a202020203c78736c3a74656d706c617465206d617463683d226368696c642d70616765732d6c6973745b706167652d6c6576656c3d315d223e0d0a20202020202020203c78736c3a696620746573743d22636f756e742870616765293e30223e0d0a2020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d227061676522202f3e0d0a20202020202020203c2f78736c3a69663e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a0d0a202020203c78736c3a74656d706c617465206d617463683d226368696c642d70616765732d6c6973745b706167652d6c6576656c3d325d223e0d0a20202020202020203c78736c3a696620746573743d22636f756e742870616765293e30223e0d0a2020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d227061676522202f3e0d0a20202020202020203c2f78736c3a69663e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a202020203c78736c3a74656d706c617465206d617463683d226368696c642d70616765732d6c6973745b706167652d6c6576656c3e325d223e0d0a20202020202020203c78736c3a696620746573743d22636f756e742870616765293e30223e0d0a2020202020202020202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d227061676522202f3e0d0a20202020202020203c2f78736c3a69663e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a0d0a202020203c78736c3a74656d706c617465206d617463683d22706167652d696d616765223e0d0a20202020202020203c64697620636c6173733d226c6576656c2d6f6e652d696d616765223e0d0a2020202020202020202020203c64697620636c6173733d22706f6c61726f6964223e0d0a202020202020202020202020202020203c696d6720626f726465723d2230222077696474683d22383022206865696768743d22383022207372633d22696d616765732f6c6f63616c2f646174612f70616765732f7b2e7d2220616c743d2222202f3e0d0a2020202020202020202020203c2f6469763e0d0a20202020202020203c2f6469763e0d0a202020203c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c2f78736c3a7374796c6573686565743e0d0a),
	(279, 'Site Map (Admin mode)', 'admin_site_map_admin.xsl', _binary 0x3c3f786d6c2076657273696f6e3d22312e30223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a3c78736c3a706172616d206e616d653d22736974652d70617468222073656c6563743d22736974652d7061746822202f3e0d0a3c78736c3a7661726961626c65206e616d653d2263757272656e742d706167652d6964222073656c6563743d2263757272656e742d706167652d696422202f3e0d0a0d0a3c78736c3a74656d706c617465206d617463683d22706167655b706167652d6c6576656c3d305d223e200d0a093c6469762069643d22747265652220636c6173733d226a73747265652d64656661756c74223e0d0a09093c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207469746c653d227b706167652d6465736372697074696f6e7d22203e0d0a0909093c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a0909093c78736c3a696620746573743d226e6f7428737472696e6728706167652d726f6c65293d276e6f6e652729223e200d0a090909093c7374726f6e673e3c78736c3a746578742064697361626c652d6f75747075742d6573636170696e673d22796573223e2d20236931386e7b706f7274616c2e736974652e61646d696e5f706167652e74616241646d696e4d6170526f6c6552657365727665647d3c2f78736c3a746578743e0d0a090909093c78736c3a76616c75652d6f662073656c6563743d22706167652d726f6c6522202f3e3c2f7374726f6e673e0d0a0909093c2f78736c3a69663e2020202020202020202020200d0a09093c2f613e0d0a09093c756c3e0d0a0909093c78736c3a6170706c792d74656d706c617465732073656c6563743d226368696c642d70616765732d6c69737422202f3e0d0a09093c2f756c3e0d0a093c2f6469763e0d0a3c2f78736c3a74656d706c6174653e0d0a202020200d0a3c78736c3a74656d706c617465206d617463683d22706167655b706167652d6c6576656c3e305d22203e0d0a093c78736c3a7661726961626c65206e616d653d22696e646578222073656c6563743d22706167652d696422202f3e0d0a093c78736c3a7661726961626c65206e616d653d226465736372697074696f6e222073656c6563743d22706167652d6465736372697074696f6e22202f3e0d0a090d0a093c6c692069643d226e6f64652d7b24696e6465787d223e0d0a09093c6120687265663d227b24736974652d706174687d3f706167655f69643d7b706167652d69647d22207469746c653d227b246465736372697074696f6e7d223e0d0a09093c78736c3a76616c75652d6f662073656c6563743d22706167652d6e616d6522202f3e0d0a0909093c78736c3a696620746573743d226e6f7428737472696e6728706167652d726f6c65293d276e6f6e652729223e0d0a090909093c7374726f6e673e0d0a0909090920203c78736c3a746578742064697361626c652d6f75747075742d6573636170696e673d22796573223e236931386e7b706f7274616c2e736974652e61646d696e5f706167652e74616241646d696e4d6170526f6c6552657365727665647d3c2f78736c3a746578743e3c78736c3a76616c75652d6f662073656c6563743d22706167652d726f6c6522202f3e0d0a090909093c2f7374726f6e673e0d0a0909093c2f78736c3a69663e0d0a09093c2f613e0d0a09093c78736c3a63686f6f73653e0d0a0909093c78736c3a7768656e20746573743d22636f756e74286368696c642d70616765732d6c6973742f2a293e30223e0d0a090909093c756c3e0d0a090909092020203c78736c3a6170706c792d74656d706c617465732073656c6563743d226368696c642d70616765732d6c69737422202f3e0d0a090909093c2f756c3e0d0a0909093c2f78736c3a7768656e3e0d0a09092020203c78736c3a6f74686572776973653e0d0a090909093c78736c3a6170706c792d74656d706c617465732073656c6563743d226368696c642d70616765732d6c69737422202f3e0d0a09092020203c2f78736c3a6f74686572776973653e0d0a09093c2f78736c3a63686f6f73653e0d0a093c2f6c693e0d0a3c2f78736c3a74656d706c6174653e0d0a202020200d0a3c78736c3a74656d706c617465206d617463683d226368696c642d70616765732d6c697374223e0d0a093c78736c3a6170706c792d74656d706c617465732073656c6563743d227061676522202f3e0d0a3c2f78736c3a74656d706c6174653e0d0a202020200d0a3c2f78736c3a7374796c6573686565743e0d0a),
	(10, 'Rubrique HTML - Défaut', 'portlet_html.xsl', _binary 0x3c3f786d6c2076657273696f6e3d22312e30223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a3c78736c3a6f7574707574206d6574686f643d2268746d6c2220696e64656e743d22796573222f3e0d0a0d0a3c78736c3a74656d706c617465206d617463683d22706f72746c6574223e0d0a3c78736c3a7661726961626c65206e616d653d226465766963655f636c617373223e0d0a3c78736c3a63686f6f73653e0d0a093c78736c3a7768656e20746573743d22737472696e6728646973706c61792d6f6e2d736d616c6c2d646576696365293d273027223e68696464656e2d70686f6e653c2f78736c3a7768656e3e0d0a093c78736c3a7768656e20746573743d22737472696e6728646973706c61792d6f6e2d6e6f726d616c2d646576696365293d273027223e68696464656e2d7461626c65743c2f78736c3a7768656e3e0d0a093c78736c3a7768656e20746573743d22737472696e6728646973706c61792d6f6e2d6c617267652d646576696365293d273027223e68696464656e2d6465736b746f703c2f78736c3a7768656e3e0d0a093c78736c3a6f74686572776973653e3c2f78736c3a6f74686572776973653e0d0a3c2f78736c3a63686f6f73653e0d0a3c2f78736c3a7661726961626c653e0d0a0d0a093c64697620636c6173733d22706f72746c6574207b246465766963655f636c6173737d223e0d0a093c78736c3a63686f6f73653e0d0a093c78736c3a7768656e20746573743d226e6f7428737472696e6728646973706c61792d706f72746c65742d7469746c65293d27312729223e0d0a093c68333e3c78736c3a76616c75652d6f662064697361626c652d6f75747075742d6573636170696e673d22796573222073656c6563743d22706f72746c65742d6e616d6522202f3e3c2f68333e0d0a093c78736c3a6170706c792d74656d706c617465732073656c6563743d2268746d6c2d706f72746c657422202f3e0d0a093c2f78736c3a7768656e3e0d0a093c78736c3a6f74686572776973653e0d0a093c78736c3a6170706c792d74656d706c617465732073656c6563743d2268746d6c2d706f72746c657422202f3e0d0a093c2f78736c3a6f74686572776973653e0d0a3c2f78736c3a63686f6f73653e0d0a3c2f6469763e0d0a3c2f78736c3a74656d706c6174653e0d0a090d0a3c78736c3a74656d706c617465206d617463683d2268746d6c2d706f72746c6574223e0d0a093c78736c3a6170706c792d74656d706c617465732073656c6563743d2268746d6c2d706f72746c65742d636f6e74656e7422202f3e0d0a3c2f78736c3a74656d706c6174653e0d0a090d0a3c78736c3a74656d706c617465206d617463683d2268746d6c2d706f72746c65742d636f6e74656e74223e0d0a093c78736c3a76616c75652d6f662064697361626c652d6f75747075742d6573636170696e673d22796573222073656c6563743d222e22202f3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c2f78736c3a7374796c6573686565743e0d0a0d0a0d0a0d0a0d0a),
	(285, 'Rubrique HTML - Fond coloré', 'portlet_html_background.xsl', _binary 0x3c3f786d6c2076657273696f6e3d22312e30223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a0d0a3c78736c3a6f7574707574206d6574686f643d2268746d6c2220696e64656e743d22796573222f3e0d0a0d0a3c78736c3a74656d706c617465206d617463683d22706f72746c6574223e0d0a0d0a093c78736c3a7661726961626c65206e616d653d226465766963655f636c617373223e0d0a093c78736c3a63686f6f73653e0d0a09093c78736c3a7768656e20746573743d22737472696e6728646973706c61792d6f6e2d736d616c6c2d646576696365293d273027223e68696464656e2d70686f6e653c2f78736c3a7768656e3e0d0a09093c78736c3a7768656e20746573743d22737472696e6728646973706c61792d6f6e2d6e6f726d616c2d646576696365293d273027223e68696464656e2d7461626c65743c2f78736c3a7768656e3e0d0a09093c78736c3a7768656e20746573743d22737472696e6728646973706c61792d6f6e2d6c617267652d646576696365293d273027223e68696464656e2d6465736b746f703c2f78736c3a7768656e3e0d0a09093c78736c3a6f74686572776973653e3c2f78736c3a6f74686572776973653e0d0a093c2f78736c3a63686f6f73653e0d0a093c2f78736c3a7661726961626c653e0d0a090d0a093c64697620636c6173733d22706f72746c6574207b246465766963655f636c6173737d223e0d0a09093c64697620636c6173733d2277656c6c223e0d0a09093c78736c3a63686f6f73653e0d0a0909093c78736c3a7768656e20746573743d226e6f7428737472696e6728646973706c61792d706f72746c65742d7469746c65293d27312729223e0d0a090909093c68323e0d0a09090909093c78736c3a76616c75652d6f662064697361626c652d6f75747075742d6573636170696e673d22796573222073656c6563743d22706f72746c65742d6e616d6522202f3e0d0a090909093c2f68323e0d0a090909093c64697620636c6173733d22706f72746c65742d6261636b67726f756e642d636f6e74656e74202d6c75746563652d626f726465722d7261646975732d626f74746f6d223e0d0a09090909093c78736c3a6170706c792d74656d706c617465732073656c6563743d2268746d6c2d706f72746c657422202f3e0d0a090909093c2f6469763e0d0a0909093c2f78736c3a7768656e3e0d0a0909093c78736c3a6f74686572776973653e0d0a090909093c64697620636c6173733d22706f72746c65742d6261636b67726f756e642d636f6e74656e74202d6c75746563652d626f726465722d726164697573223e0d0a09090909093c78736c3a6170706c792d74656d706c617465732073656c6563743d2268746d6c2d706f72746c657422202f3e0d0a090909093c2f6469763e0d0a0909093c2f78736c3a6f74686572776973653e0d0a09093c2f78736c3a63686f6f73653e0d0a09093c2f6469763e0d0a202020203c2f6469763e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c78736c3a74656d706c617465206d617463683d2268746d6c2d706f72746c6574223e0d0a093c78736c3a6170706c792d74656d706c617465732073656c6563743d2268746d6c2d706f72746c65742d636f6e74656e7422202f3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c78736c3a74656d706c617465206d617463683d2268746d6c2d706f72746c65742d636f6e74656e74223e0d0a093c78736c3a76616c75652d6f662064697361626c652d6f75747075742d6573636170696e673d22796573222073656c6563743d222e22202f3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c2f78736c3a7374796c6573686565743e),
	(310, 'Rubrique MyLutece - Défaut', 'portlet_mylutece.xsl', _binary 0x3c3f786d6c2076657273696f6e3d22312e30223f3e0d0a3c78736c3a7374796c6573686565742076657273696f6e3d22312e302220786d6c6e733a78736c3d22687474703a2f2f7777772e77332e6f72672f313939392f58534c2f5472616e73666f726d223e0d0a0d0a3c78736c3a74656d706c617465206d617463683d22706f72746c6574223e0d0a0d0a093c78736c3a7661726961626c65206e616d653d226465766963655f636c617373223e0d0a093c78736c3a63686f6f73653e0d0a09093c78736c3a7768656e20746573743d22737472696e6728646973706c61792d6f6e2d736d616c6c2d646576696365293d273027223e68696464656e2d70686f6e653c2f78736c3a7768656e3e0d0a09093c78736c3a7768656e20746573743d22737472696e6728646973706c61792d6f6e2d6e6f726d616c2d646576696365293d273027223e68696464656e2d7461626c65743c2f78736c3a7768656e3e0d0a09093c78736c3a7768656e20746573743d22737472696e6728646973706c61792d6f6e2d6c617267652d646576696365293d273027223e68696464656e2d6465736b746f703c2f78736c3a7768656e3e0d0a09093c78736c3a6f74686572776973653e3c2f78736c3a6f74686572776973653e0d0a093c2f78736c3a63686f6f73653e0d0a093c2f78736c3a7661726961626c653e0d0a0d0a093c64697620636c6173733d22706f72746c6574207b246465766963655f636c6173737d223e0d0a09093c64697620636c6173733d2277656c6c223e0d0a0909093c78736c3a63686f6f73653e0d0a0920202020202020203c78736c3a7768656e20746573743d226e6f7428737472696e6728646973706c61792d706f72746c65742d7469746c65293d27312729223e0d0a090909093c68333e3c78736c3a76616c75652d6f662064697361626c652d6f75747075742d6573636170696e673d22796573222073656c6563743d22706f72746c65742d6e616d6522202f3e3c2f68333e0d0a090909093c78736c3a6170706c792d74656d706c617465732073656c6563743d226d796c75746563652d706f72746c657422202f3e0d0a0920202020202020203c2f78736c3a7768656e3e0d0a0920202020202020203c78736c3a6f74686572776973653e0d0a090909093c78736c3a6170706c792d74656d706c617465732073656c6563743d226d796c75746563652d706f72746c657422202f3e0d0a0920202020202020203c2f78736c3a6f74686572776973653e0d0a0909093c2f78736c3a63686f6f73653e0d0a0909093c64697620636c6173733d22636c656172666978223e26233136303b3c2f6469763e0d0a09093c2f6469763e0d0a093c2f6469763e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c78736c3a74656d706c617465206d617463683d226d796c75746563652d706f72746c6574223e0d0a093c78736c3a6170706c792d74656d706c617465732073656c6563743d22757365722d6e6f742d7369676e656422202f3e0d0a093c78736c3a6170706c792d74656d706c617465732073656c6563743d226c75746563652d7573657222202f3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c78736c3a74656d706c617465206d617463683d22757365722d6e6f742d7369676e6564223e0d0a093c666f726d20636c6173733d22666f726d2220616374696f6e3d226a73702f736974652f706c7567696e732f6d796c75746563652f446f4d794c75746563654c6f67696e2e6a737022206d6574686f643d22706f7374223e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d226c75746563652d757365722d61757468656e7469636174696f6e2d736572766963655b4064656c6567617465643d2774727565275d22202f3e0d0a09093c78736c3a6170706c792d74656d706c617465732073656c6563743d226c75746563652d757365722d61757468656e7469636174696f6e2d736572766963655b406c6f67696e70617373776f72642d72657175697265643d2774727565275d22202f3e0d0a09093c78736c3a696620746573743d22636f756e74286c75746563652d757365722d61757468656e7469636174696f6e2d736572766963655b406c6f67696e70617373776f72642d72657175697265643d2774727565275d29202667743b3d2031223e0d0a0909093c6c6162656c20666f723d22757365726e616d65223e436f646520642761636326233233323b73203a3c2f6c6162656c3e0d0a0909093c696e707574206e616d653d22757365726e616d652220636c6173733d22696e7075742d6e6f726d616c222069643d22757365726e616d6522206175746f636f6d706c6574653d226f66662220746162696e6465783d22312220747970653d2274657874222f3e3c6272202f3e0d0a0909093c6c6162656c20666f723d2270617373776f7264223e4d6f74206465207061737365203a3c2f6c6162656c3e0d0a0909093c696e707574206e616d653d2270617373776f72642220636c6173733d22696e7075742d6e6f726d616c222069643d2270617373776f726422206175746f636f6d706c6574653d226f66662220746162696e6465783d22322220747970653d2270617373776f726422202f3e0d0a0909093c627574746f6e20636c6173733d2262746e2062746e2d736d616c6c2220746162696e6465783d22332220747970653d227375626d6974223e3c6920636c6173733d2269636f6e2d75736572223e26233136303b3c2f693e26233136303b436f6e6e6578696f6e3c2f627574746f6e3e0d0a09093c2f78736c3a69663e0d0a093c2f666f726d3e0d0a093c78736c3a6170706c792d74656d706c617465732073656c6563743d226c75746563652d757365722d6e65772d6163636f756e742d75726c22202f3e0d0a093c78736c3a6170706c792d74656d706c617465732073656c6563743d226c75746563652d757365722d6c6f73742d70617373776f72642d75726c22202f3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c78736c3a74656d706c617465206d617463683d226c75746563652d757365722d61757468656e7469636174696f6e2d736572766963655b406c6f67696e70617373776f72642d72657175697265643d2774727565275d223e0d0a093c6c6162656c20636c6173733d22726164696f2220666f723d22617574685f70726f766964657222203e0d0a09093c696e70757420747970653d22726164696f22206e616d653d22617574685f70726f7669646572222076616c75653d227b6e616d657d2220636865636b65643d22636865636b656422202f3e0d0a09093c78736c3a76616c75652d6f662073656c6563743d22646973706c61792d6e616d6522202f3e0d0a093c2f6c6162656c3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c78736c3a74656d706c617465206d617463683d226c75746563652d757365722d61757468656e7469636174696f6e2d736572766963655b4064656c6567617465643d2774727565275d223e0d0a093c6120687265663d227b75726c7d3f617574685f70726f76696465723d7b6e616d657d223e0d0a09093c696d67207372633d227b69636f6e2d75726c7d2220616c743d227b646973706c61792d6e616d657d22207469746c653d227b646973706c61792d6e616d657d222f3e0d0a093c2f613e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c78736c3a74656d706c617465206d617463683d226c75746563652d75736572223e0d0a202020203c703e0d0a093c7374726f6e673e4269656e76656e756526233136303b0d0a09093c78736c3a76616c75652d6f662064697361626c652d6f75747075742d6573636170696e673d22796573222073656c6563743d226c75746563652d757365722d6e616d652d676976656e22202f3e26233136303b0d0a09093c78736c3a76616c75652d6f662064697361626c652d6f75747075742d6573636170696e673d22796573222073656c6563743d226c75746563652d757365722d6e616d652d66616d696c7922202f3e0d0a093c2f7374726f6e673e0d0a093c2f703e0d0a202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d226c75746563652d757365722d6c6f676f75742d75726c22202f3e0d0a202020203c78736c3a6170706c792d74656d706c617465732073656c6563743d226c75746563652d757365722d766965772d6163636f756e742d75726c22202f3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c78736c3a74656d706c617465206d617463683d226c75746563652d757365722d6c6f676f75742d75726c223e0d0a2020203c666f726d20636c6173733d22666f726d2d696e6c696e652070756c6c2d6c65667422206e616d653d226c6f676f75742220616374696f6e3d227b2e7d22206d6574686f643d22706f7374223e0d0a202020093c627574746f6e20747970653d227375626d69742220636c6173733d2262746e223e3c6920636c6173733d2269636f6e2d6f6666223e26233136303b3c2f693e26233136303b4426233233333b636f6e6e6578696f6e3c2f627574746f6e3e26233136303b0d0a2020203c2f666f726d3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c78736c3a74656d706c617465206d617463683d226c75746563652d757365722d6e65772d6163636f756e742d75726c223e0d0a093c666f726d20636c6173733d22666f726d2d696e6c696e652070756c6c2d6c65667422206e616d653d226c6f676f75742220616374696f6e3d227b2e7d22206d6574686f643d22706f7374223e0d0a09093c627574746f6e20747970653d227375626d69742220636c6173733d2262746e223e3c6920636c6173733d2269636f6e2d706c7573223e26233136303b3c2f693e26233136303b437226233233333b657220756e20636f6d7074653c2f627574746f6e3e26233136303b0d0a202020203c2f666f726d3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a0d0a3c78736c3a74656d706c617465206d617463683d226c75746563652d757365722d6c6f73742d70617373776f72642d75726c223e0d0a093c666f726d20636c6173733d22666f726d2d696e6c696e652070756c6c2d6c65667422206e616d653d226c6f676f75742220616374696f6e3d227b2e7d22206d6574686f643d22706f7374223e0d0a09202020093c627574746f6e20747970653d227375626d69742220636c6173733d2262746e223e3c6920636c6173733d2269636f6e2d6c6f636b223e26233136303b3c2f693e26233136303b4d6f742064652070617373652070657264753c2f627574746f6e3e26233136303b0d0a2020203c2f666f726d3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c78736c3a74656d706c617465206d617463683d226c75746563652d757365722d766965772d6163636f756e742d75726c223e0d0a093c666f726d20636c6173733d22666f726d2d696e6c696e652070756c6c2d6c65667422206e616d653d226c6f676f75742220616374696f6e3d227b2e7d22206d6574686f643d22706f7374223e0d0a09202020093c627574746f6e20747970653d227375626d69742220636c6173733d2262746e223e3c6920636c6173733d2269636f6e2d65646974223e26233136303b3c2f693e26233136303b566f6972206d6f6e20636f6d7074653c2f627574746f6e3e26233136303b0d0a093c2f666f726d3e0d0a3c2f78736c3a74656d706c6174653e0d0a0d0a3c2f78736c3a7374796c6573686565743e0d0a0d0a);
/*!40000 ALTER TABLE `core_stylesheet` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_style_mode_stylesheet`;
CREATE TABLE IF NOT EXISTS `core_style_mode_stylesheet` (
  `id_style` int(11) NOT NULL DEFAULT 0,
  `id_mode` int(11) NOT NULL DEFAULT 0,
  `id_stylesheet` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_style`,`id_mode`,`id_stylesheet`),
  KEY `index_style_mode_stylesheet` (`id_stylesheet`,`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_style_mode_stylesheet` DISABLE KEYS */;
INSERT INTO `core_style_mode_stylesheet` (`id_style`, `id_mode`, `id_stylesheet`) VALUES
	(3, 0, 211),
	(4, 0, 213),
	(5, 0, 215),
	(6, 0, 217),
	(7, 0, 253),
	(8, 1, 279),
	(100, 0, 10),
	(101, 0, 285),
	(200, 0, 310);
/*!40000 ALTER TABLE `core_style_mode_stylesheet` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_template`;
CREATE TABLE IF NOT EXISTS `core_template` (
  `template_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `template_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`template_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_template` DISABLE KEYS */;
INSERT INTO `core_template` (`template_name`, `template_value`) VALUES
	('core_first_alert_mail', 'Bonjour ${first_name} ! Votre compte utilisateur arrive à expiration. Pour prolonger sa validité, veuillez <a href="${url}">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera désactivé.'),
	('core_expiration_mail', 'Bonjour ${first_name} ! Votre compte a expiré. Vous ne pourrez plus vous connecter avec, et les données vous concernant ont été anonymisées'),
	('core_other_alert_mail', 'Bonjour ${first_name} ! Votre compte utilisateur arrive à expiration. Pour prolonger sa validité, veuillez <a href="${url}">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera désactivé.'),
	('core_account_reactivated_mail', 'Bonjour ${first_name} ! Votre compte utilisateur a bien été réactivé. Il est désormais valable jusqu\'au ${date_valid}.'),
	('core_password_expired', 'Bonjour ! Votre mot de passe a expiré. Lors de votre prochaine connexion, vous pourrez le changer.'),
	('mylutece_database_first_alert_mail', 'Bonjour ${first_name} ! Votre compte utilisateur arrive à expiration. Pour prolonger sa validité, veuillez <a href="${url}">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera désactivé.'),
	('mylutece_database_expiration_mail', 'Bonjour ${first_name} ! Votre compte a expiré. Vous ne pourrez plus vous connecter avec, et les données vous concernant ont été anonymisées'),
	('mylutece_database_other_alert_mail', 'Bonjour ${first_name} ! Votre compte utilisateur arrive à expiration. Pour prolonger sa validité, veuillez <a href="${url}">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera désactivé.'),
	('mylutece_database_account_reactivated_mail', 'Bonjour ${first_name} ! Votre compte utilisateur a bien été réactivé. Il est désormais valable jusqu\'au ${date_valid}.'),
	('mylutece_database_unblock_user', '${site_link!}<br />Bonjour ! Votre IP a été bloquée. Pour la débloquer, vous pouvez suivre le lien suivant : <a href="${url}">debloquer</a>.'),
	('mylutece_database_password_expired', 'Bonjour ! Votre mot de passe a éxpiré. Lors de votre prochaine connection, vous pourrez le changer.'),
	('mylutece_database_mailLostPassword', '<html><head><title>#i18n{mylutece.email_reinit.object}</title></head><body><p>#i18n{mylutece.email_reinit.content.text}<br /></p><p>#i18n{mylutece.email_reinit.content.newPassword} : ${new_password}<br /></p></body></html><p>#i18n{mylutece.email_reinit.content.reinitPassword}<a href="${reinit_url}">#i18n{mylutece.email_reinit.content.labelLink}</a></p>'),
	('mylutece_database_mailPasswordEncryptionChanged', '<html><head><title>Votre mot de passe a été réinitialisé</title></head><body><p>Pour des raisons de sécurité, votre mot de passe a été réinitialisé.<br />----------------------------------------------------------</p><p>Votre nouveau mot de passe est : ${new_password}<br />----------------------------------------------------------</p></body></html>');
/*!40000 ALTER TABLE `core_template` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_text_editor`;
CREATE TABLE IF NOT EXISTS `core_text_editor` (
  `editor_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `editor_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backOffice` smallint(6) NOT NULL,
  PRIMARY KEY (`editor_name`,`backOffice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_text_editor` DISABLE KEYS */;
INSERT INTO `core_text_editor` (`editor_name`, `editor_description`, `backOffice`) VALUES
	('tinymce', 'portal.admindashboard.editors.labelBackTinyMCE', 1),
	('', 'portal.admindashboard.editors.labelBackNoEditor', 1),
	('', 'portal.admindashboard.editors.labelFrontNoEditor', 0),
	('markitupbbcode', 'portal.admindashboard.editors.labelFrontMarkitupBBCode', 0);
/*!40000 ALTER TABLE `core_text_editor` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_user_password_history`;
CREATE TABLE IF NOT EXISTS `core_user_password_history` (
  `id_user` int(11) NOT NULL,
  `password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_user`,`date_password_change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_password_history` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_user_preferences`;
CREATE TABLE IF NOT EXISTS `core_user_preferences` (
  `id_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_user_preferences` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_preferences` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_user_right`;
CREATE TABLE IF NOT EXISTS `core_user_right` (
  `id_right` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_right`,`id_user`),
  KEY `index_user_right` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_user_right` DISABLE KEYS */;
INSERT INTO `core_user_right` (`id_right`, `id_user`) VALUES
	('BREADCRUMBACCORDION_MANAGEMENT', 1),
	('BREADCRUMBACCORDION_MANAGEMENT', 5),
	('CONFIG_DOCUMENT_PRODUCER_MANAGEMENT', 1),
	('CONTACT_MANAGEMENT', 1),
	('CONTACT_MANAGEMENT', 5),
	('CORE_ADMIN_SITE', 1),
	('CORE_ADMINDASHBOARD_MANAGEMENT', 1),
	('CORE_CACHE_MANAGEMENT', 1),
	('CORE_DAEMONS_MANAGEMENT', 1),
	('CORE_DASHBOARD_MANAGEMENT', 1),
	('CORE_EDITORS_MANAGEMENT', 1),
	('CORE_FEATURES_MANAGEMENT', 1),
	('CORE_LEVEL_RIGHT_MANAGEMENT', 1),
	('CORE_LINK_SERVICE_MANAGEMENT', 1),
	('CORE_LINK_SERVICE_MANAGEMENT', 5),
	('CORE_LOGS_VISUALISATION', 1),
	('CORE_LOGS_VISUALISATION', 5),
	('CORE_MAILINGLISTS_MANAGEMENT', 1),
	('CORE_MAILINGLISTS_MANAGEMENT', 5),
	('CORE_MODES_MANAGEMENT', 1),
	('CORE_PAGE_TEMPLATE_MANAGEMENT', 1),
	('CORE_PLUGINS_MANAGEMENT', 1),
	('CORE_PROPERTIES_MANAGEMENT', 1),
	('CORE_RBAC_MANAGEMENT', 1),
	('CORE_RIGHT_MANAGEMENT', 1),
	('CORE_ROLES_MANAGEMENT', 1),
	('CORE_ROLES_MANAGEMENT', 5),
	('CORE_SEARCH_INDEXATION', 1),
	('CORE_SEARCH_INDEXATION', 5),
	('CORE_SEARCH_MANAGEMENT', 1),
	('CORE_STYLES_MANAGEMENT', 1),
	('CORE_STYLESHEET_MANAGEMENT', 1),
	('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT', 1),
	('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT', 5),
	('CORE_USERS_MANAGEMENT', 1),
	('CORE_USERS_MANAGEMENT', 5),
	('CORE_WORKGROUPS_MANAGEMENT', 1),
	('CORE_WORKGROUPS_MANAGEMENT', 5),
	('CORE_XSL_EXPORT_MANAGEMENT', 1),
	('DATABASE_GROUPS_MANAGEMENT', 1),
	('DATABASE_MANAGEMENT_USERS', 1),
	('DATABASE_MANAGEMENT_USERS', 5),
	('ENTRY_TYPE_MANAGEMENT', 1),
	('ENTRY_TYPE_MANAGEMENT', 5),
	('FORMS_MANAGEMENT', 1),
	('FORMS_MANAGEMENT', 5),
	('FORMS_MULTIVIEW', 1),
	('FORMS_MULTIVIEW', 5),
	('HTMLPAGE_MANAGEMENT', 1),
	('MATOMO_MANAGEMENT', 1),
	('MYLUTECE_MANAGE_AUTHENTICATION_FILTER', 1),
	('MYLUTECE_MANAGE_EXTERNAL_APPLICATION', 1),
	('MYLUTECE_MANAGEMENT', 1),
	('POLL_MANAGEMENT', 1),
	('PROFILES_MANAGEMENT', 1),
	('PROFILES_VIEWS_MANAGEMENT', 1),
	('REFERENCELIST_MANAGEMENT', 1),
	('REFERENCELIST_MANAGEMENT', 5),
	('REGULAR_EXPRESSION_MANAGEMENT', 1),
	('REGULAR_EXPRESSION_MANAGEMENT', 5),
	('SEO_MANAGEMENT', 1),
	('SYSTEMINFO_MANAGEMENT', 1),
	('SYSTEMINFO_MANAGEMENT', 5),
	('UNITS_MANAGEMENT', 1),
	('UNITS_MANAGEMENT', 5),
	('VIEW_TEMP_FILES', 1),
	('VIEW_TEMP_FILES', 5),
	('WORKFLOW_MANAGEMENT', 1),
	('WORKFLOW_MANAGEMENT', 5);
/*!40000 ALTER TABLE `core_user_right` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_user_role`;
CREATE TABLE IF NOT EXISTS `core_user_role` (
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_user_role` DISABLE KEYS */;
INSERT INTO `core_user_role` (`role_key`, `id_user`) VALUES
	('all_site_manager', 1),
	('assign_groups', 1),
	('assign_groups', 5),
	('assign_roles', 1),
	('assign_roles', 5),
	('CREATE_REFERENCE_IMPORT', 1),
	('CREATE_REFERENCE_IMPORT', 5),
	('forms_manager', 1),
	('forms_manager', 5),
	('forms_multiview', 1),
	('forms_multiview', 5),
	('mylutece_database_manager', 1),
	('mylutece_database_manager', 5),
	('mylutece_manager', 1),
	('profiles_manager', 1),
	('profiles_views_manager', 1),
	('super_admin', 1),
	('unittree_management', 1),
	('unittree_management', 5),
	('workflow_manager', 1),
	('workflow_manager', 5);
/*!40000 ALTER TABLE `core_user_role` ENABLE KEYS */;

DROP TABLE IF EXISTS `core_xsl_export`;
CREATE TABLE IF NOT EXISTS `core_xsl_export` (
  `id_xsl_export` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `plugin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_xsl_export`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `core_xsl_export` DISABLE KEYS */;
INSERT INTO `core_xsl_export` (`id_xsl_export`, `title`, `description`, `extension`, `id_file`, `plugin`) VALUES
	(125, 'Core - Export users to a CSV file', 'Export back office users to a CSV file', 'csv', 125, 'core'),
	(126, 'Core - Export users to a XML file', 'Export back office users to a XML file', 'xml', 126, 'core'),
	(127, 'MyLutece Database - Export CSV des utilisateurs', 'Export des utilisateur MyLutece Database dans un fichier CSV', 'csv', 127, 'mylutece-database'),
	(128, 'MyLutece Database - Export XML des utilisateurs', 'Export des utilisateur MyLutece Database dans un fichier XML', 'xml', 128, 'mylutece-database');
/*!40000 ALTER TABLE `core_xsl_export` ENABLE KEYS */;

DROP TABLE IF EXISTS `filegen_temporary_file`;
CREATE TABLE IF NOT EXISTS `filegen_temporary_file` (
  `id_file` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT 0,
  `title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_physical_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `filegen_temporary_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `filegen_temporary_file` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_action`;
CREATE TABLE IF NOT EXISTS `forms_action` (
  `id_action` int(11) NOT NULL DEFAULT 0,
  `name_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_action` DISABLE KEYS */;
INSERT INTO `forms_action` (`id_action`, `name_key`, `description_key`, `action_url`, `icon_url`, `action_permission`, `form_state`) VALUES
	(1, 'forms.action.modify.name', 'forms.action.modify.description', 'jsp/admin/plugins/forms/ManageForms.jsp?view=modifyForm', 'cog', 'MODIFY', 0),
	(3, 'forms.action.params.name', 'forms.action.params.description', 'jsp/admin/plugins/forms/ManageSteps.jsp?view=manageSteps', 'step-forward', 'PARAM', 0),
	(2, 'forms.action.delete.name', 'forms.action.delete.description', 'jsp/admin/plugins/forms/ManageForms.jsp?view=confirmRemoveForm', 'trash', 'DELETE', 0),
	(4, 'forms.action.publish.name', 'forms.action.publish.description', 'jsp/admin/plugins/forms/ManageForms.jsp?view=modifyPublication', 'calendar', 'PUBLISH', 0),
	(5, 'forms.action.viewResponses.name', 'forms.action.viewResponses.description', 'jsp/admin/plugins/forms/MultiviewForms.jsp?current_selected_panel=forms', 'list-alt', 'VIEW_FORM_RESPONSE', 0),
	(6, 'forms.action.json.copy.name', 'forms.json.copy.description', 'jsp/admin/plugins/forms/ManageForms.jsp?action=duplicateForm', 'copy', 'MODIFY', 0),
	(7, 'forms.action.json.download.name', 'forms.json.download.description', 'jsp/admin/plugins/forms/ManageForms.jsp?action=doExportJson', 'download', 'MODIFY', 0),
	(100, 'module.forms.documentproducer.actions.extractpdf.name', 'module.forms.documentproducer.actions.extractpdf.description', 'jsp/admin/plugins/forms/modules/documentproducer/ManageConfigProducer.jsp?view=getManageConfigProducer', 'file-pdf-o', 'MODIFY', 0);
/*!40000 ALTER TABLE `forms_action` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_breadcrumbaccordion_config_item`;
CREATE TABLE IF NOT EXISTS `forms_breadcrumbaccordion_config_item` (
  `id_form` int(11) NOT NULL DEFAULT 0,
  `id_step` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_form`,`id_step`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_breadcrumbaccordion_config_item` DISABLE KEYS */;
INSERT INTO `forms_breadcrumbaccordion_config_item` (`id_form`, `id_step`, `position`) VALUES
	(1, 4, 4),
	(1, 3, 3),
	(1, 2, 2),
	(1, 1, 1);
/*!40000 ALTER TABLE `forms_breadcrumbaccordion_config_item` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_config_producer`;
CREATE TABLE IF NOT EXISTS `forms_config_producer` (
  `id_config` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_question_name_file` int(11) DEFAULT NULL,
  `id_form` int(11) DEFAULT NULL,
  `config_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_config_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extract_empty` int(11) DEFAULT 0,
  PRIMARY KEY (`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_config_producer` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_config_producer` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_config_question`;
CREATE TABLE IF NOT EXISTS `forms_config_question` (
  `id_config` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  PRIMARY KEY (`id_config`,`id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_config_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_config_question` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_control`;
CREATE TABLE IF NOT EXISTS `forms_control` (
  `id_control` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_message` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `validator_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `control_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_control_target` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_control`),
  KEY `index_fc_id_control_target` (`id_control_target`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_control` DISABLE KEYS */;
INSERT INTO `forms_control` (`id_control`, `value`, `error_message`, `validator_name`, `control_type`, `id_control_target`) VALUES
	(1, '125', NULL, 'forms.listValueValidator', 'conditional', 22);
/*!40000 ALTER TABLE `forms_control` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_control_question`;
CREATE TABLE IF NOT EXISTS `forms_control_question` (
  `id_control` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  PRIMARY KEY (`id_control`,`id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_control_question` DISABLE KEYS */;
INSERT INTO `forms_control_question` (`id_control`, `id_question`) VALUES
	(1, 14);
/*!40000 ALTER TABLE `forms_control_question` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_control_question_mapping`;
CREATE TABLE IF NOT EXISTS `forms_control_question_mapping` (
  `id_control` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_control`,`id_question`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_control_question_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_control_question_mapping` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_default_config`;
CREATE TABLE IF NOT EXISTS `forms_default_config` (
  `id_config` int(11) NOT NULL,
  `id_form` int(11) NOT NULL,
  `config_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_config`,`id_form`,`config_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_default_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_default_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_display`;
CREATE TABLE IF NOT EXISTS `forms_display` (
  `id_display` int(11) NOT NULL AUTO_INCREMENT,
  `id_form` int(11) DEFAULT 0,
  `id_step` int(11) DEFAULT 0,
  `id_composite` int(11) DEFAULT 0,
  `id_parent` int(11) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `composite_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `display_depth` int(11) DEFAULT 0,
  PRIMARY KEY (`id_display`),
  KEY `index_fd_id_form` (`id_form`),
  KEY `index_fd_id_step` (`id_step`),
  KEY `index_fd_id_composite` (`id_composite`),
  KEY `index_fd_id_parent` (`id_parent`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_display` DISABLE KEYS */;
INSERT INTO `forms_display` (`id_display`, `id_form`, `id_step`, `id_composite`, `id_parent`, `display_order`, `composite_type`, `display_depth`) VALUES
	(1, 1, 1, 1, 0, 1, 'group', 0),
	(2, 1, 1, 1, 1, 1, 'question', 1),
	(3, 1, 1, 2, 1, 2, 'question', 1),
	(4, 1, 2, 2, 0, 1, 'group', 0),
	(5, 1, 2, 3, 4, 1, 'question', 1),
	(12, 1, 2, 8, 4, 2, 'question', 1),
	(13, 1, 2, 9, 4, 3, 'question', 1),
	(14, 1, 2, 10, 4, 4, 'question', 1),
	(15, 1, 3, 5, 0, 1, 'group', 0),
	(16, 1, 3, 11, 15, 1, 'question', 1),
	(17, 1, 3, 12, 15, 2, 'question', 1),
	(18, 1, 3, 13, 0, 2, 'question', 0),
	(19, 1, 4, 14, 0, 1, 'question', 0),
	(20, 1, 2, 15, 0, 2, 'question', 0),
	(21, 1, 2, 16, 0, 3, 'question', 0),
	(22, 1, 4, 17, 0, 2, 'question', 0),
	(24, 1, 3, 19, 15, 3, 'question', 1);
/*!40000 ALTER TABLE `forms_display` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_export_config`;
CREATE TABLE IF NOT EXISTS `forms_export_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_form` int(11) DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_export_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_export_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_form`;
CREATE TABLE IF NOT EXISTS `forms_form` (
  `id_form` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT '1979-12-31 23:00:00',
  `availability_start_date` timestamp NULL DEFAULT NULL,
  `availability_end_date` timestamp NULL DEFAULT NULL,
  `max_number_response` int(11) DEFAULT 0,
  `workgroup` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_workflow` int(11) DEFAULT NULL,
  `authentification_needed` smallint(6) DEFAULT NULL,
  `one_response_by_user` smallint(6) DEFAULT 0,
  `breadcrumb_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_summary` smallint(6) NOT NULL DEFAULT 0,
  `return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `captcha_step_initial` smallint(6) DEFAULT 0,
  `captcha_step_final` smallint(6) DEFAULT 0,
  `captcha_recap` smallint(6) DEFAULT 0,
  `count_responses` smallint(6) DEFAULT 0,
  `label_final_button` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unavailable_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_logo` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_form`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_form` DISABLE KEYS */;
INSERT INTO `forms_form` (`id_form`, `title`, `description`, `creation_date`, `update_date`, `availability_start_date`, `availability_end_date`, `max_number_response`, `workgroup`, `id_workflow`, `authentification_needed`, `one_response_by_user`, `breadcrumb_name`, `display_summary`, `return_url`, `captcha_step_initial`, `captcha_step_final`, `captcha_recap`, `count_responses`, `label_final_button`, `unavailable_message`, `id_logo`) VALUES
	(1, 'Citizen\'s demand', '', '2022-02-18 15:57:09', '2022-02-21 15:39:39', '2022-02-17 11:00:00', '2022-03-31 10:00:00', 0, NULL, 0, 0, 1, 'forms-breadcrumbaccordion.breadcrumbAccordion', 1, 'jsp/site/Portal.jsp', 0, 0, 0, 0, '', '', 0);
/*!40000 ALTER TABLE `forms_form` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_global_action`;
CREATE TABLE IF NOT EXISTS `forms_global_action` (
  `id_action` int(11) NOT NULL DEFAULT 0,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_action`),
  KEY `index_fga_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_global_action` DISABLE KEYS */;
INSERT INTO `forms_global_action` (`id_action`, `code`, `name_key`, `description_key`, `action_url`, `icon_url`) VALUES
	(1, 'multiviewconfig', 'forms.action.multiviewConfig.labelKey', 'forms.action.multiviewConfig.descriptionKey', 'jsp/admin/plugins/forms/MultiviewForms.jsp?view=view_multiview_config', 'edit'),
	(2, 'multiviewExport', 'forms.action.multiviewExport.labelKey', 'forms.action.multiviewExport.descriptionKey', 'jsp/admin/plugins/forms/MultiviewForms.jsp', 'edit');
/*!40000 ALTER TABLE `forms_global_action` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_group`;
CREATE TABLE IF NOT EXISTS `forms_group` (
  `id_group` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `id_step` int(11) DEFAULT 0,
  `iteration_min` int(11) DEFAULT 1,
  `iteration_max` int(11) DEFAULT 1,
  `iteration_add_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `iteration_remove_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_group`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_group` DISABLE KEYS */;
INSERT INTO `forms_group` (`id_group`, `title`, `description`, `id_step`, `iteration_min`, `iteration_max`, `iteration_add_label`, `iteration_remove_label`) VALUES
	(1, 'Informations', '', 1, 1, 1, '', ''),
	(2, 'Etat Civil', '', 2, 1, 1, '', ''),
	(5, 'My demand', '', 3, 1, 3, 'Add a demand', 'Remove my demand');
/*!40000 ALTER TABLE `forms_group` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_indexer_action`;
CREATE TABLE IF NOT EXISTS `forms_indexer_action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `id_form_response` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_action`),
  KEY `idx_fia_id_form_response` (`id_form_response`),
  KEY `idx_fia_id_task` (`id_task`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_indexer_action` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_message`;
CREATE TABLE IF NOT EXISTS `forms_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_form` int(11) NOT NULL,
  `end_message_display` smallint(6) DEFAULT NULL,
  `end_message` varchar(3000) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_fm_id_form` (`id_form`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_message` DISABLE KEYS */;
INSERT INTO `forms_message` (`id`, `id_form`, `end_message_display`, `end_message`) VALUES
	(1, 1, 1, 'Authoritatively reinvent just in time schemas with proactive resources. Credibly drive vertical bandwidth and alternative initiatives. Monotonectally evolve front-end e-services without compelling outsourcing. Progressively deliver viral vortals for client-centric opportunities. Continually fashion multimedia based bandwidth after principle-centered expertise.<br /><br />Progressively synthesize cross-platform content with covalent initiatives. Completely provide access to resource sucking methods of empowerment with robust supply chains. Conveniently syndicate client-focused applications with adaptive.');
/*!40000 ALTER TABLE `forms_message` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_question`;
CREATE TABLE IF NOT EXISTS `forms_question` (
  `id_question` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_entry` int(11) DEFAULT 0,
  `id_step` int(11) DEFAULT 0,
  `is_visible_multiview_global` smallint(6) NOT NULL DEFAULT 0,
  `is_visible_multiview_form_selected` smallint(6) NOT NULL DEFAULT 0,
  `multiview_column_order` int(11) NOT NULL DEFAULT 0,
  `column_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_filterable_multiview_global` smallint(6) NOT NULL DEFAULT 0,
  `is_filterable_multiview_form_selected` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_question`),
  KEY `index_fq_code` (`code`),
  KEY `index_fq_id_entry` (`id_entry`),
  KEY `index_fq_id_step` (`id_step`),
  KEY `index_fg_id_step` (`id_step`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_question` DISABLE KEYS */;
INSERT INTO `forms_question` (`id_question`, `title`, `code`, `description`, `id_entry`, `id_step`, `is_visible_multiview_global`, `is_visible_multiview_form_selected`, `multiview_column_order`, `column_title`, `is_filterable_multiview_global`, `is_filterable_multiview_form_selected`) VALUES
	(1, 'commentaire', 'question_1', '<p>Distinctively foster equity invested initiatives without business e-commerce. Compellingly benchmark client-centered supply chains and business information. Compellingly re-engineer process-centric resources via team driven intellectual capital. Uniquely innovate team driven products and stand-alone communities. Assertively enable web-enabled web services for plug-and-play information.</p>\r\n<p>Dynamically negotiate competitive strategic theme areas before seamless initiatives. Objectively matrix exceptional innovation and highly efficient e-commerce. Continually aggregate process-centric architectures whereas web-enabled communities. Compellingly extend emerging ideas without market-driven customer service. Compellingly syndicate B2C products vis-a-vis high-payoff methods of empowerment.</p>\r\n<p>Synergistically mesh sustainable e-business vis-a-vis unique niches. Compellingly negotiate cutting-edge e-tailers via just in time opportunities. Interactively brand client-centered growth strategies before flexible results. Dramatically grow e-business infrastructures for extensible schemas. Continually orchestrate.</p>\r\n<div id="gtx-trans" style="position: absolute; left: -52px; top: -17px;">&nbsp;</div>', 1, 1, 0, 0, 0, 'commentaire', 0, 0),
	(2, 'Accepter les conditions !!!', 'question_2', NULL, 2, 1, 0, 0, 0, 'Accepter les conditions !!!', 0, 0),
	(3, 'Name', 'question_3', '', 3, 2, 0, 0, 0, 'Name', 0, 0),
	(8, 'Resume', 'question_8', '', 8, 2, 0, 0, 0, 'Resume', 0, 0),
	(9, 'Birth date', 'question_9', '', 9, 2, 0, 0, 0, 'Birth date', 0, 0),
	(10, 'Gender', 'question_10', '', 10, 2, 0, 0, 0, 'Gender', 0, 0),
	(11, 'Demand\'s type', 'question_11', '', 11, 3, 1, 0, 0, 'Type', 1, 0),
	(12, 'Add a file to your demand', 'question_12', '', 12, 3, 0, 0, 0, 'Add a file to your demand', 0, 0),
	(13, 'Add a location', 'question_13', '', 13, 3, 0, 0, 0, 'Add a location', 0, 0),
	(14, 'Anything else to add ?', 'question_14', '', 14, 4, 0, 0, 0, 'Anything else to add ?', 0, 0),
	(15, 'Email', 'question_15', '', 15, 2, 0, 0, 0, 'Email', 0, 0),
	(16, 'Add your phone', 'question_16', '', 16, 2, 0, 0, 0, 'Add your phone', 0, 0),
	(17, 'Someting to say', 'question_17', '', 17, 4, 0, 0, 0, 'Someting to say', 0, 0),
	(19, 'Number of people concerned', 'question_19', '', 19, 3, 0, 0, 0, 'Number of people concerned', 0, 0);
/*!40000 ALTER TABLE `forms_question` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_question_entry_response`;
CREATE TABLE IF NOT EXISTS `forms_question_entry_response` (
  `id_question_entry_response` int(11) NOT NULL AUTO_INCREMENT,
  `id_question_response` int(11) NOT NULL DEFAULT 0,
  `id_entry_response` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_question_entry_response`),
  KEY `idx_fqer_id_question_response` (`id_question_response`),
  KEY `idx_fqer_id_entry_response` (`id_entry_response`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_question_entry_response` DISABLE KEYS */;
INSERT INTO `forms_question_entry_response` (`id_question_entry_response`, `id_question_response`, `id_entry_response`) VALUES
	(1, 2, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5),
	(6, 6, 6),
	(7, 7, 7),
	(8, 8, 8),
	(9, 9, 9),
	(10, 11, 10),
	(11, 11, 11),
	(12, 11, 12),
	(13, 11, 13),
	(14, 11, 14),
	(15, 11, 15),
	(16, 12, 16),
	(17, 13, 17),
	(18, 15, 18),
	(19, 15, 19),
	(20, 16, 20),
	(21, 17, 21),
	(22, 18, 22),
	(23, 19, 23),
	(24, 20, 24),
	(25, 21, 25),
	(26, 22, 26),
	(27, 24, 27),
	(28, 24, 28),
	(29, 24, 29),
	(30, 24, 30),
	(31, 24, 31),
	(32, 24, 32),
	(33, 25, 33),
	(34, 27, 34),
	(35, 27, 35),
	(36, 28, 36),
	(37, 29, 37),
	(38, 30, 38),
	(39, 31, 39),
	(40, 32, 40),
	(41, 33, 41),
	(42, 34, 42),
	(43, 36, 43),
	(44, 36, 44),
	(45, 36, 45),
	(46, 36, 46),
	(47, 36, 47),
	(48, 36, 48),
	(49, 37, 49),
	(50, 39, 50),
	(51, 39, 51),
	(52, 40, 52),
	(53, 41, 53),
	(54, 42, 54),
	(55, 43, 55),
	(56, 44, 56),
	(57, 45, 57),
	(58, 46, 58),
	(59, 48, 59),
	(60, 48, 60),
	(61, 48, 61),
	(62, 48, 62),
	(63, 48, 63),
	(64, 48, 64),
	(65, 49, 65),
	(66, 51, 66),
	(67, 51, 67),
	(68, 52, 68),
	(69, 53, 69),
	(70, 54, 70),
	(71, 55, 71),
	(72, 57, 72),
	(73, 58, 73),
	(74, 59, 74),
	(75, 60, 75),
	(76, 60, 76),
	(77, 60, 77),
	(78, 60, 78),
	(79, 60, 79),
	(80, 60, 80),
	(81, 61, 81),
	(82, 62, 82),
	(83, 63, 83),
	(84, 63, 84),
	(85, 63, 85),
	(86, 63, 86),
	(87, 63, 87),
	(88, 63, 88),
	(89, 64, 89),
	(90, 65, 90),
	(91, 67, 91),
	(92, 67, 92),
	(93, 68, 93),
	(94, 69, 94),
	(95, 70, 95),
	(96, 71, 96),
	(97, 73, 97),
	(98, 74, 98),
	(99, 76, 99),
	(100, 76, 100),
	(101, 76, 101),
	(102, 76, 102),
	(103, 76, 103),
	(104, 76, 104),
	(105, 77, 105);
/*!40000 ALTER TABLE `forms_question_entry_response` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_question_response`;
CREATE TABLE IF NOT EXISTS `forms_question_response` (
  `id_question_response` int(11) NOT NULL AUTO_INCREMENT,
  `id_form_response` int(11) NOT NULL DEFAULT 0,
  `id_question` int(11) NOT NULL DEFAULT 0,
  `id_step` int(11) NOT NULL DEFAULT 0,
  `iteration_number` int(11) DEFAULT 0,
  PRIMARY KEY (`id_question_response`),
  KEY `idx_fqr_id_form_response` (`id_form_response`),
  KEY `idx_fqr_id_question` (`id_question`),
  KEY `idx_fqr_id_step` (`id_step`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_question_response` DISABLE KEYS */;
INSERT INTO `forms_question_response` (`id_question_response`, `id_form_response`, `id_question`, `id_step`, `iteration_number`) VALUES
	(1, 1, 1, 1, 0),
	(2, 1, 2, 1, 0),
	(3, 1, 3, 2, 0),
	(4, 1, 8, 2, 0),
	(5, 1, 9, 2, 0),
	(6, 1, 10, 2, 0),
	(7, 1, 15, 2, 0),
	(8, 1, 16, 2, 0),
	(9, 1, 11, 3, 0),
	(10, 1, 12, 3, 0),
	(11, 1, 13, 3, 0),
	(12, 1, 14, 4, 0),
	(13, 1, 17, 4, 0),
	(14, 2, 1, 1, 0),
	(15, 2, 2, 1, 0),
	(16, 2, 3, 2, 0),
	(17, 2, 8, 2, 0),
	(18, 2, 9, 2, 0),
	(19, 2, 10, 2, 0),
	(20, 2, 15, 2, 0),
	(21, 2, 16, 2, 0),
	(22, 2, 11, 3, 0),
	(23, 2, 12, 3, 0),
	(24, 2, 13, 3, 0),
	(25, 2, 14, 4, 0),
	(26, 3, 1, 1, 0),
	(27, 3, 2, 1, 0),
	(28, 3, 3, 2, 0),
	(29, 3, 8, 2, 0),
	(30, 3, 9, 2, 0),
	(31, 3, 10, 2, 0),
	(32, 3, 15, 2, 0),
	(33, 3, 16, 2, 0),
	(34, 3, 11, 3, 0),
	(35, 3, 12, 3, 0),
	(36, 3, 13, 3, 0),
	(37, 3, 14, 4, 0),
	(38, 4, 1, 1, 0),
	(39, 4, 2, 1, 0),
	(40, 4, 3, 2, 0),
	(41, 4, 8, 2, 0),
	(42, 4, 9, 2, 0),
	(43, 4, 10, 2, 0),
	(44, 4, 15, 2, 0),
	(45, 4, 16, 2, 0),
	(46, 4, 11, 3, 0),
	(47, 4, 12, 3, 0),
	(48, 4, 13, 3, 0),
	(49, 4, 14, 4, 0),
	(50, 5, 1, 1, 0),
	(51, 5, 2, 1, 0),
	(52, 5, 3, 2, 0),
	(53, 5, 8, 2, 0),
	(54, 5, 9, 2, 0),
	(55, 5, 10, 2, 0),
	(56, 5, 15, 2, 0),
	(57, 5, 16, 2, 0),
	(58, 5, 11, 3, 0),
	(59, 5, 12, 3, 0),
	(60, 5, 13, 3, 0),
	(61, 5, 11, 3, 1),
	(62, 5, 12, 3, 1),
	(63, 5, 13, 3, 1),
	(64, 5, 14, 4, 0),
	(65, 5, 17, 4, 0),
	(66, 6, 1, 1, 0),
	(67, 6, 2, 1, 0),
	(68, 6, 3, 2, 0),
	(69, 6, 8, 2, 0),
	(70, 6, 9, 2, 0),
	(71, 6, 10, 2, 0),
	(72, 6, 15, 2, 0),
	(73, 6, 16, 2, 0),
	(74, 6, 11, 3, 0),
	(75, 6, 12, 3, 0),
	(76, 6, 13, 3, 0),
	(77, 6, 14, 4, 0);
/*!40000 ALTER TABLE `forms_question_response` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_response`;
CREATE TABLE IF NOT EXISTS `forms_response` (
  `id_response` int(11) NOT NULL AUTO_INCREMENT,
  `id_form` int(11) NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT '1979-12-31 23:00:00',
  `from_save` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id_response`),
  KEY `idx_fr_id_form` (`id_form`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_response` DISABLE KEYS */;
INSERT INTO `forms_response` (`id_response`, `id_form`, `guid`, `creation_date`, `update_date`, `from_save`) VALUES
	(1, 1, NULL, '2022-02-21 10:52:59', '2022-02-21 10:52:59', 0),
	(2, 1, NULL, '2022-02-21 10:54:31', '2022-02-21 10:54:31', 0),
	(3, 1, NULL, '2022-02-21 10:56:39', '2022-02-21 10:56:39', 0),
	(4, 1, NULL, '2022-02-21 10:57:31', '2022-02-21 10:57:31', 0),
	(5, 1, NULL, '2022-02-21 15:36:05', '2022-02-21 15:36:05', 0),
	(6, 1, NULL, '2022-02-21 15:39:13', '2022-02-21 15:39:13', 0);
/*!40000 ALTER TABLE `forms_response` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_response_step`;
CREATE TABLE IF NOT EXISTS `forms_response_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_form_response` int(11) NOT NULL DEFAULT 0,
  `id_step` int(11) NOT NULL DEFAULT 0,
  `order_response` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_frs_id_form_response` (`id_form_response`),
  KEY `idx_frs_id_step` (`id_step`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_response_step` DISABLE KEYS */;
INSERT INTO `forms_response_step` (`id`, `id_form_response`, `id_step`, `order_response`) VALUES
	(1, 1, 1, 0),
	(2, 1, 2, 1),
	(3, 1, 3, 2),
	(4, 1, 4, 3),
	(5, 2, 1, 0),
	(6, 2, 2, 1),
	(7, 2, 3, 2),
	(8, 2, 4, 3),
	(9, 3, 1, 0),
	(10, 3, 2, 1),
	(11, 3, 3, 2),
	(12, 3, 4, 3),
	(13, 4, 1, 0),
	(14, 4, 2, 1),
	(15, 4, 3, 2),
	(16, 4, 4, 3),
	(17, 5, 1, 0),
	(18, 5, 2, 1),
	(19, 5, 3, 2),
	(20, 5, 4, 3),
	(21, 6, 1, 0),
	(22, 6, 2, 1),
	(23, 6, 3, 2),
	(24, 6, 4, 3);
/*!40000 ALTER TABLE `forms_response_step` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_step`;
CREATE TABLE IF NOT EXISTS `forms_step` (
  `id_step` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `id_form` int(11) NOT NULL DEFAULT 0,
  `is_initial` smallint(6) NOT NULL DEFAULT 0,
  `is_final` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_step`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_step` DISABLE KEYS */;
INSERT INTO `forms_step` (`id_step`, `title`, `description`, `id_form`, `is_initial`, `is_final`) VALUES
	(1, 'Introduction', '', 1, 1, 0),
	(2, 'Citizen\'s informations', '', 1, 0, 0),
	(3, 'Demand', '', 1, 0, 0),
	(4, 'Complementary informations', '', 1, 0, 1);
/*!40000 ALTER TABLE `forms_step` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_transition`;
CREATE TABLE IF NOT EXISTS `forms_transition` (
  `id_transition` int(11) NOT NULL AUTO_INCREMENT,
  `from_step` int(11) NOT NULL,
  `next_step` int(11) NOT NULL,
  `priority` int(11) DEFAULT 0,
  PRIMARY KEY (`id_transition`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_transition` DISABLE KEYS */;
INSERT INTO `forms_transition` (`id_transition`, `from_step`, `next_step`, `priority`) VALUES
	(1, 1, 2, 1),
	(2, 2, 3, 1),
	(3, 3, 4, 1);
/*!40000 ALTER TABLE `forms_transition` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_unittree_unit_selection_config`;
CREATE TABLE IF NOT EXISTS `forms_unittree_unit_selection_config` (
  `id_config` int(11) NOT NULL AUTO_INCREMENT,
  `id_form` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_unittree_unit_selection_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_unittree_unit_selection_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `forms_unittree_unit_selection_config_value`;
CREATE TABLE IF NOT EXISTS `forms_unittree_unit_selection_config_value` (
  `id_config_value` int(11) NOT NULL AUTO_INCREMENT,
  `id_config` int(11) NOT NULL DEFAULT 0,
  `id_step` int(11) NOT NULL DEFAULT 0,
  `id_question` int(11) NOT NULL DEFAULT 0,
  `response_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_unit` int(11) NOT NULL DEFAULT 0,
  `id_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_config_value`),
  KEY `index_unit_selection_conf_value` (`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `forms_unittree_unit_selection_config_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_unittree_unit_selection_config_value` ENABLE KEYS */;

DROP TABLE IF EXISTS `genatt_entry`;
CREATE TABLE IF NOT EXISTS `genatt_entry` (
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  `id_resource` int(11) NOT NULL DEFAULT 0,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_type` int(11) NOT NULL DEFAULT 0,
  `id_parent` int(11) DEFAULT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `mandatory` smallint(6) DEFAULT NULL,
  `fields_in_line` smallint(6) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `id_field_depend` int(11) DEFAULT NULL,
  `field_unique` smallint(6) DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos_conditional` int(11) DEFAULT 0,
  `error_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_only_display_back` smallint(6) DEFAULT 0,
  `is_indexed` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id_entry`),
  KEY `index_genatt_entry_resource` (`id_resource`),
  KEY `index_genatt_entry_parent` (`id_parent`),
  KEY `index_genatt_code` (`code`),
  KEY `fk_genatt_entry_type` (`id_type`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `genatt_entry` DISABLE KEYS */;
INSERT INTO `genatt_entry` (`id_entry`, `id_resource`, `resource_type`, `id_type`, `id_parent`, `title`, `code`, `help_message`, `comment`, `mandatory`, `fields_in_line`, `pos`, `id_field_depend`, `field_unique`, `css_class`, `pos_conditional`, `error_message`, `is_only_display_back`, `is_indexed`) VALUES
	(1, 1, 'FORMS_FORM', 103, NULL, NULL, 'question_1', NULL, '<p>Distinctively foster equity invested initiatives without business e-commerce. Compellingly benchmark client-centered supply chains and business information. Compellingly re-engineer process-centric resources via team driven intellectual capital. Uniquely innovate team driven products and stand-alone communities. Assertively enable web-enabled web services for plug-and-play information.</p>\r\n<p>Dynamically negotiate competitive strategic theme areas before seamless initiatives. Objectively matrix exceptional innovation and highly efficient e-commerce. Continually aggregate process-centric architectures whereas web-enabled communities. Compellingly extend emerging ideas without market-driven customer service. Compellingly syndicate B2C products vis-a-vis high-payoff methods of empowerment.</p>\r\n<p>Synergistically mesh sustainable e-business vis-a-vis unique niches. Compellingly negotiate cutting-edge e-tailers via just in time opportunities. Interactively brand client-centered growth strategies before flexible results. Dramatically grow e-business infrastructures for extensible schemas. Continually orchestrate.</p>\r\n<div id="gtx-trans" style="position: absolute; left: -52px; top: -17px;">&nbsp;</div>', 0, 0, 0, NULL, 0, '', 0, NULL, 0, 0),
	(2, 1, 'FORMS_FORM', 116, NULL, 'Accepter les conditions !!!', 'question_2', NULL, NULL, 0, 0, 0, NULL, 0, '', 0, NULL, 0, 0),
	(3, 1, 'FORMS_FORM', 106, NULL, 'Name', 'question_3', '', '', 0, 0, 0, NULL, 0, '', 0, '', 0, 1),
	(8, 1, 'FORMS_FORM', 107, NULL, 'Resume', 'question_8', '', '', 0, 0, 0, NULL, 0, '', 0, NULL, 0, 1),
	(9, 1, 'FORMS_FORM', 104, NULL, 'Birth date', 'question_9', '', '', 0, 0, 0, NULL, 0, '', 0, NULL, 0, 1),
	(10, 1, 'FORMS_FORM', 101, NULL, 'Gender', 'question_10', '', '', 0, 1, 0, NULL, 0, '', 0, NULL, 0, 0),
	(11, 1, 'FORMS_FORM', 105, NULL, 'Demand\'s type', 'question_11', '', '', 1, 0, 0, NULL, 0, '', 0, NULL, 0, 1),
	(12, 1, 'FORMS_FORM', 108, NULL, 'Add a file to your demand', 'question_12', '', '', 0, 0, 0, NULL, 0, '', 0, NULL, 0, 0),
	(13, 1, 'FORMS_FORM', 109, NULL, 'Add a location', 'question_13', '', '', 0, 0, 0, NULL, 0, ' ', 0, NULL, 0, 1),
	(14, 1, 'FORMS_FORM', 101, NULL, 'Anything else to add ?', 'question_14', '', '', 1, 1, 0, NULL, 0, '', 0, NULL, 0, 0),
	(15, 1, 'FORMS_FORM', 113, NULL, 'Email', 'question_15', '', '', 0, 0, 0, NULL, 0, '', 0, NULL, 0, 1),
	(16, 1, 'FORMS_FORM', 119, NULL, 'Add your phone', 'question_16', 'If you want to be contact by our services', '', 0, 0, 0, NULL, 0, '', 0, '', 0, 1),
	(17, 1, 'FORMS_FORM', 107, NULL, 'Someting to say', 'question_17', '', '', 0, 0, 0, NULL, 0, '', 0, NULL, 0, 1),
	(19, 1, 'FORMS_FORM', 120, NULL, 'Number of people concerned', 'question_19', '', '', 0, 0, 0, NULL, 0, 'w-25', 0, '', 0, 1);
/*!40000 ALTER TABLE `genatt_entry` ENABLE KEYS */;

DROP TABLE IF EXISTS `genatt_entry_type`;
CREATE TABLE IF NOT EXISTS `genatt_entry_type` (
  `id_type` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_group` smallint(6) DEFAULT NULL,
  `is_comment` int(11) DEFAULT NULL,
  `is_mylutece_user` smallint(6) DEFAULT NULL,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plugin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `inactive` int(11) DEFAULT 0,
  PRIMARY KEY (`id_type`),
  KEY `index_genatt_entry_type_plugin` (`plugin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `genatt_entry_type` DISABLE KEYS */;
INSERT INTO `genatt_entry_type` (`id_type`, `title`, `is_group`, `is_comment`, `is_mylutece_user`, `class_name`, `icon_name`, `plugin`, `display_order`, `inactive`) VALUES
	(101, 'Bouton radio', 0, 0, 0, 'forms.entryTypeRadioButton', 'dot-circle', 'forms', 5, 0),
	(102, 'Case à cocher', 0, 0, 0, 'forms.entryTypeCheckBox', 'check-square', 'forms', 6, 0),
	(103, 'Commentaire', 0, 1, 0, 'forms.entryTypeComment', 'comment', 'forms', 11, 0),
	(104, 'Date', 0, 0, 0, 'forms.entryTypeDate', 'calendar', 'forms', 4, 0),
	(105, 'Liste déroulante', 0, 0, 0, 'forms.entryTypeSelect', 'list-alt', 'forms', 7, 0),
	(106, 'Zone de texte court', 0, 0, 0, 'forms.entryTypeText', 'file-alt', 'forms', 2, 0),
	(107, 'Zone de texte long', 0, 0, 0, 'forms.entryTypeTextArea', 'sticky-note', 'forms', 3, 0),
	(108, 'Fichier', 0, 0, 0, 'forms.entryTypeFile', 'file', 'forms', 9, 0),
	(109, 'Géolocalisation', 0, 0, 0, 'forms.entryTypeGeolocation', 'map-marked-alt', 'forms', 16, 0),
	(110, 'Image', 0, 0, 0, 'forms.entryTypeImage', 'image', 'forms', 10, 1),
	(111, 'Utilisateur MyLutece', 0, 0, 1, 'forms.entryTypeMyLuteceUser', 'user', 'forms', 13, 1),
	(112, 'Numérotation', 0, 0, 0, 'forms.entryTypeNumbering', 'hashtag', 'forms', 8, 0),
	(113, 'Attribut de l\'utilisateur MyLutece', 0, 0, 0, 'forms.entryTypeMyLuteceUserattribute', 'user', 'forms', 14, 0),
	(114, 'Tableau', 0, 0, 0, 'forms.entryTypeArray', 'table', 'forms', 17, 1),
	(115, 'Regroupement', 1, 0, 0, 'forms.entryTypeGroup', 'indent', 'forms', 1, 0),
	(116, 'Conditions d\'utilisation', 0, 0, 0, 'forms.entryTypeTermsOfService', 'gavel', 'forms', 12, 0),
	(117, 'Lecture automatique fichier (OCR)', 0, 0, 0, 'forms.entryTypeAutomaticFileReading', 'file', 'forms', 18, 1),
	(118, 'Camera', 0, 0, 0, 'forms.entryTypeCamera', 'camera', 'forms', 15, 1),
	(119, 'Numéro de téléphone', 0, 0, 0, 'forms.entryTypeTelephoneNumber', 'phone-square', 'forms', 19, 0),
	(120, 'Nombre', 0, 0, 0, 'forms.entryTypeNumber', 'hashtag', 'forms', 5, 0);
/*!40000 ALTER TABLE `genatt_entry_type` ENABLE KEYS */;

DROP TABLE IF EXISTS `genatt_field`;
CREATE TABLE IF NOT EXISTS `genatt_field` (
  `id_field` int(11) NOT NULL AUTO_INCREMENT,
  `id_entry` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_value` smallint(6) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `value_type_date` date DEFAULT NULL,
  `no_display_title` smallint(6) DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_field`),
  KEY `index_genatt_field_entry` (`id_entry`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `genatt_field` DISABLE KEYS */;
INSERT INTO `genatt_field` (`id_field`, `id_entry`, `title`, `code`, `value`, `default_value`, `pos`, `value_type_date`, `no_display_title`, `comment`) VALUES
	(1, 1, NULL, 'used_in_correct_form_response', 'false', 0, 1, NULL, 0, NULL),
	(2, 1, NULL, 'used_in_complete_form_response', 'false', 0, 2, NULL, 0, NULL),
	(3, 1, NULL, 'exportable', 'false', 0, 3, NULL, 0, NULL),
	(4, 1, NULL, 'exportable_pdf', 'false', 0, 4, NULL, 0, NULL),
	(5, 1, NULL, 'anonymizable', 'false', 0, 5, NULL, 0, NULL),
	(6, 1, NULL, 'display_in_bo', 'false', 0, 6, NULL, 0, NULL),
	(7, 2, NULL, 'used_in_correct_form_response', 'false', 0, 7, NULL, 0, NULL),
	(8, 2, NULL, 'used_in_complete_form_response', 'false', 0, 8, NULL, 0, NULL),
	(9, 2, NULL, 'exportable', 'false', 0, 9, NULL, 0, NULL),
	(10, 2, NULL, 'exportable_pdf', 'false', 0, 10, NULL, 0, NULL),
	(11, 2, NULL, 'anonymizable', 'false', 0, 11, NULL, 0, NULL),
	(12, 2, NULL, 'link', 'voir les conditions ', 0, 12, NULL, 0, NULL),
	(13, 2, NULL, 'tos', '<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or "organic" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>', 0, 13, NULL, 0, NULL),
	(14, 2, NULL, 'agreement', 'false', 0, 14, NULL, 0, NULL),
	(15, 3, NULL, 'used_in_correct_form_response', 'false', 0, 15, NULL, 0, NULL),
	(16, 3, NULL, 'used_in_complete_form_response', 'false', 0, 16, NULL, 0, NULL),
	(17, 3, NULL, 'exportable', 'false', 0, 17, NULL, 0, NULL),
	(18, 3, NULL, 'exportable_pdf', 'false', 0, 18, NULL, 0, NULL),
	(19, 3, '', 'anonymizable', 'false', 0, 19, NULL, 0, NULL),
	(20, 3, NULL, 'text_config', '', 0, 20, NULL, 0, NULL),
	(21, 3, NULL, 'width', '0', 0, 21, NULL, 0, NULL),
	(22, 3, NULL, 'max_size', '-1', 0, 22, NULL, 0, NULL),
	(23, 3, NULL, 'placeholder', '', 0, 23, NULL, 0, NULL),
	(24, 3, NULL, 'confirm_field', 'false', 0, 24, NULL, 0, NULL),
	(66, 8, NULL, 'max_size', '-1', 0, 55, NULL, 0, NULL),
	(65, 8, NULL, 'text_config', '', 0, 54, NULL, 0, NULL),
	(64, 8, '', 'anonymizable', 'false', 0, 53, NULL, 0, NULL),
	(63, 8, NULL, 'exportable_pdf', 'false', 0, 52, NULL, 0, NULL),
	(62, 8, NULL, 'exportable', 'false', 0, 51, NULL, 0, NULL),
	(61, 8, NULL, 'used_in_complete_form_response', 'false', 0, 50, NULL, 0, NULL),
	(60, 8, NULL, 'used_in_correct_form_response', 'false', 0, 49, NULL, 0, NULL),
	(67, 8, NULL, 'width', '0', 0, 56, NULL, 0, NULL),
	(68, 8, NULL, 'height', '10', 0, 57, NULL, 0, NULL),
	(69, 8, NULL, 'richtext', 'true', 0, 58, NULL, 0, NULL),
	(70, 8, NULL, 'placeholder', '', 0, 59, NULL, 0, NULL),
	(71, 9, NULL, 'used_in_correct_form_response', 'false', 0, 60, NULL, 0, NULL),
	(72, 9, NULL, 'used_in_complete_form_response', 'false', 0, 61, NULL, 0, NULL),
	(73, 9, NULL, 'exportable', 'false', 0, 62, NULL, 0, NULL),
	(74, 9, NULL, 'exportable_pdf', 'false', 0, 63, NULL, 0, NULL),
	(75, 9, '', 'anonymizable', 'false', 0, 64, NULL, 0, NULL),
	(76, 9, NULL, 'placeholder', '', 0, 65, NULL, 0, NULL),
	(77, 9, NULL, 'default_date_value', NULL, 0, 66, NULL, 0, NULL),
	(78, 10, NULL, 'used_in_correct_form_response', 'false', 0, 67, NULL, 0, NULL),
	(79, 10, NULL, 'used_in_complete_form_response', 'false', 0, 68, NULL, 0, NULL),
	(80, 10, NULL, 'exportable', 'false', 0, 69, NULL, 0, NULL),
	(81, 10, NULL, 'exportable_pdf', 'false', 0, 70, NULL, 0, NULL),
	(82, 10, NULL, 'anonymizable', 'false', 0, 71, NULL, 0, NULL),
	(83, 10, '1', 'use_ref_list', 'true', 0, 72, NULL, 0, NULL),
	(84, 10, 'Woman', 'answer_choice', 'F', 0, 73, NULL, 0, NULL),
	(85, 10, 'Man', 'answer_choice', 'H', 0, 74, NULL, 0, NULL),
	(86, 10, 'Undefined', 'answer_choice', 'U', 0, 75, NULL, 0, NULL),
	(87, 11, NULL, 'used_in_correct_form_response', 'false', 0, 76, NULL, 0, NULL),
	(88, 11, NULL, 'used_in_complete_form_response', 'false', 0, 77, NULL, 0, NULL),
	(89, 11, NULL, 'exportable', 'false', 0, 78, NULL, 0, NULL),
	(90, 11, NULL, 'exportable_pdf', 'false', 0, 79, NULL, 0, NULL),
	(91, 11, NULL, 'anonymizable', 'false', 0, 80, NULL, 0, NULL),
	(92, 11, '2', 'use_ref_list', 'true', 0, 81, NULL, 0, NULL),
	(93, 11, 'Environment', 'answer_choice', 'env', 0, 82, NULL, 0, NULL),
	(94, 11, 'City shift', 'answer_choice', 'move', 0, 83, NULL, 0, NULL),
	(95, 11, 'City cleanliness', 'answer_choice', 'clean', 0, 84, NULL, 0, NULL),
	(96, 11, 'Healthcare', 'answer_choice', 'health', 0, 85, NULL, 0, NULL),
	(97, 12, NULL, 'used_in_correct_form_response', 'false', 0, 86, NULL, 0, NULL),
	(98, 12, NULL, 'used_in_complete_form_response', 'false', 0, 87, NULL, 0, NULL),
	(99, 12, NULL, 'exportable', 'false', 0, 88, NULL, 0, NULL),
	(100, 12, NULL, 'exportable_pdf', 'false', 0, 89, NULL, 0, NULL),
	(101, 12, '%v', 'anonymizable', 'true', 0, 90, NULL, 0, NULL),
	(102, 12, NULL, 'file_max_size', '250000000', 0, 91, NULL, 0, NULL),
	(103, 12, NULL, 'max_files', '3', 0, 92, NULL, 0, NULL),
	(104, 12, NULL, 'export_binary', 'false', 0, 93, NULL, 0, NULL),
	(105, 13, NULL, 'used_in_correct_form_response', 'false', 0, 94, NULL, 0, NULL),
	(106, 13, NULL, 'used_in_complete_form_response', 'false', 0, 95, NULL, 0, NULL),
	(107, 13, NULL, 'exportable', 'false', 0, 96, NULL, 0, NULL),
	(108, 13, NULL, 'exportable_pdf', 'false', 0, 97, NULL, 0, NULL),
	(109, 13, '', 'anonymizable', 'false', 0, 98, NULL, 0, NULL),
	(110, 13, NULL, 'provider', 'openstreetmap', 0, 99, NULL, 0, NULL),
	(111, 13, NULL, 'editMode', 'Address', 0, 100, NULL, 0, NULL),
	(112, 13, NULL, 'viewNumber', '1', 0, 101, NULL, 0, NULL),
	(113, 13, NULL, 'idAddress', 'idAddress', 0, 102, NULL, 0, NULL),
	(114, 13, NULL, 'address', 'address', 0, 103, NULL, 0, NULL),
	(115, 13, NULL, 'additionalAddress', 'additionalAddress', 0, 104, NULL, 0, NULL),
	(116, 13, NULL, 'X', 'X', 0, 105, NULL, 0, NULL),
	(117, 13, NULL, 'Y', 'Y', 0, 106, NULL, 0, NULL),
	(118, 13, NULL, 'geometry', 'geometry', 0, 107, NULL, 0, NULL),
	(119, 14, NULL, 'used_in_correct_form_response', 'false', 0, 108, NULL, 0, NULL),
	(120, 14, NULL, 'used_in_complete_form_response', 'false', 0, 109, NULL, 0, NULL),
	(121, 14, NULL, 'exportable', 'false', 0, 110, NULL, 0, NULL),
	(122, 14, NULL, 'exportable_pdf', 'false', 0, 111, NULL, 0, NULL),
	(123, 14, NULL, 'anonymizable', 'false', 0, 112, NULL, 0, NULL),
	(124, 14, '-1', 'use_ref_list', 'false', 0, 113, NULL, 0, NULL),
	(125, 14, 'Yes', 'answer_choice', 'y', 0, 114, NULL, 0, ''),
	(126, 14, 'No', 'answer_choice', 'no', 1, 115, NULL, 0, ''),
	(127, 15, NULL, 'used_in_correct_form_response', 'false', 0, 116, NULL, 0, NULL),
	(128, 15, NULL, 'used_in_complete_form_response', 'false', 0, 117, NULL, 0, NULL),
	(129, 15, NULL, 'exportable', 'false', 0, 118, NULL, 0, NULL),
	(130, 15, NULL, 'exportable_pdf', 'false', 0, 119, NULL, 0, NULL),
	(131, 15, '', 'anonymizable', 'false', 0, 120, NULL, 0, NULL),
	(132, 15, NULL, 'attribute_name', 'user.business-info.online.email', 0, 121, NULL, 0, NULL),
	(133, 16, NULL, 'used_in_correct_form_response', 'false', 0, 122, NULL, 0, NULL),
	(134, 16, NULL, 'used_in_complete_form_response', 'false', 0, 123, NULL, 0, NULL),
	(135, 16, NULL, 'exportable', 'false', 0, 124, NULL, 0, NULL),
	(136, 16, NULL, 'exportable_pdf', 'false', 0, 125, NULL, 0, NULL),
	(137, 16, '', 'anonymizable', 'false', 0, 126, NULL, 0, NULL),
	(138, 16, NULL, 'autocomplete', 'tel', 0, 127, NULL, 0, NULL),
	(139, 16, NULL, 'defaultRegion', 'FR', 0, 128, NULL, 0, NULL),
	(140, 16, NULL, 'placeholder', '06-06-06-06', 0, 129, NULL, 0, NULL),
	(141, 17, NULL, 'used_in_correct_form_response', 'false', 0, 130, NULL, 0, NULL),
	(142, 17, NULL, 'used_in_complete_form_response', 'false', 0, 131, NULL, 0, NULL),
	(143, 17, NULL, 'exportable', 'false', 0, 132, NULL, 0, NULL),
	(144, 17, NULL, 'exportable_pdf', 'false', 0, 133, NULL, 0, NULL),
	(145, 17, '', 'anonymizable', 'false', 0, 134, NULL, 0, NULL),
	(146, 17, NULL, 'text_config', '', 0, 135, NULL, 0, NULL),
	(147, 17, NULL, 'max_size', '-1', 0, 136, NULL, 0, NULL),
	(148, 17, NULL, 'width', '0', 0, 137, NULL, 0, NULL),
	(149, 17, NULL, 'height', '10', 0, 138, NULL, 0, NULL),
	(150, 17, NULL, 'richtext', 'false', 0, 139, NULL, 0, NULL),
	(151, 17, NULL, 'placeholder', '', 0, 140, NULL, 0, NULL),
	(160, 19, NULL, 'used_in_correct_form_response', 'false', 0, 141, NULL, 0, NULL),
	(161, 19, NULL, 'used_in_complete_form_response', 'false', 0, 142, NULL, 0, NULL),
	(162, 19, NULL, 'exportable', 'false', 0, 143, NULL, 0, NULL),
	(163, 19, NULL, 'exportable_pdf', 'false', 0, 144, NULL, 0, NULL),
	(164, 19, '', 'anonymizable', 'false', 0, 145, NULL, 0, NULL),
	(165, 19, NULL, 'text_config', '1', 0, 146, NULL, 0, NULL),
	(166, 19, NULL, 'min', '0', 0, 147, NULL, 0, NULL),
	(167, 19, NULL, 'max', '100', 0, 148, NULL, 0, NULL),
	(168, 19, NULL, 'suffix', 'nb', 0, 149, NULL, 0, NULL),
	(169, 19, NULL, 'placeholder', '', 0, 150, NULL, 0, NULL);
/*!40000 ALTER TABLE `genatt_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `genatt_referenceitem_field`;
CREATE TABLE IF NOT EXISTS `genatt_referenceitem_field` (
  `id_field` int(11) NOT NULL DEFAULT 0,
  `id_item` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `genatt_referenceitem_field` DISABLE KEYS */;
INSERT INTO `genatt_referenceitem_field` (`id_field`, `id_item`) VALUES
	(84, 1),
	(85, 2),
	(86, 3),
	(93, 4),
	(94, 6),
	(95, 7),
	(96, 8);
/*!40000 ALTER TABLE `genatt_referenceitem_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `genatt_response`;
CREATE TABLE IF NOT EXISTS `genatt_response` (
  `id_response` int(11) NOT NULL AUTO_INCREMENT,
  `response_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_entry` int(11) DEFAULT NULL,
  `iteration_number` int(11) DEFAULT -1,
  `id_field` int(11) DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT 1,
  PRIMARY KEY (`id_response`),
  KEY `index_genatt_response_entry` (`id_entry`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `genatt_response` DISABLE KEYS */;
INSERT INTO `genatt_response` (`id_response`, `response_value`, `id_entry`, `iteration_number`, `id_field`, `id_file`, `status`) VALUES
	(1, 'true', 2, 0, 14, NULL, 1),
	(2, '<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or "organic" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>', 2, 0, 13, NULL, 1),
	(3, 'Laurent HOHL', 3, 0, NULL, NULL, 1),
	(4, 'azdazda dazazd', 8, 0, NULL, NULL, 1),
	(5, '1645052400000', 9, 0, NULL, NULL, 1),
	(6, 'H', 10, 0, 85, NULL, 1),
	(7, 'laurent.hohl@gmail.com', 15, 0, NULL, NULL, 1),
	(8, '+33606060606', 16, 0, NULL, NULL, 1),
	(9, 'env', 11, 0, 93, NULL, 1),
	(10, '', 13, 0, 113, NULL, 1),
	(11, '227 rue de Bercy', 13, -1, 114, NULL, 1),
	(12, NULL, 13, 0, 115, NULL, 1),
	(13, '', 13, -1, 116, NULL, 1),
	(14, '', 13, -1, 117, NULL, 1),
	(15, '', 13, -1, 118, NULL, 1),
	(16, 'y', 14, 0, 125, NULL, 1),
	(17, 'azdazd', 17, 0, NULL, NULL, 1),
	(18, 'true', 2, 0, 14, NULL, 1),
	(19, '<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or "organic" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>', 2, 0, 13, NULL, 1),
	(20, 'Laurent HOHL', 3, 0, NULL, NULL, 1),
	(21, 'dazazdaz', 8, 0, NULL, NULL, 1),
	(22, '1643756400000', 9, 0, NULL, NULL, 1),
	(23, 'F', 10, 0, 84, NULL, 1),
	(24, 'laurent.hohl@gmail.com', 15, 0, NULL, NULL, 1),
	(25, '+33606060606', 16, 0, NULL, NULL, 1),
	(26, 'env', 11, 0, 93, NULL, 1),
	(27, '', 13, 0, 113, NULL, 1),
	(28, '', 13, -1, 114, NULL, 1),
	(29, NULL, 13, 0, 115, NULL, 1),
	(30, '', 13, -1, 116, NULL, 1),
	(31, '', 13, -1, 117, NULL, 1),
	(32, '', 13, -1, 118, NULL, 1),
	(33, 'no', 14, 0, 126, NULL, 1),
	(34, 'true', 2, 0, 14, NULL, 1),
	(35, '<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or "organic" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>', 2, 0, 13, NULL, 1),
	(36, 'Laurent HOHL', 3, 0, NULL, NULL, 1),
	(37, 'dzad ad', 8, 0, NULL, NULL, 1),
	(38, NULL, 9, 0, NULL, NULL, 1),
	(39, NULL, 10, 0, NULL, NULL, 1),
	(40, 'laurent.hohl@gmail.com', 15, 0, NULL, NULL, 1),
	(41, '', 16, 0, NULL, NULL, 1),
	(42, 'clean', 11, 0, 95, NULL, 1),
	(43, '', 13, 0, 113, NULL, 1),
	(44, '', 13, -1, 114, NULL, 1),
	(45, NULL, 13, 0, 115, NULL, 1),
	(46, '', 13, -1, 116, NULL, 1),
	(47, '', 13, -1, 117, NULL, 1),
	(48, '', 13, -1, 118, NULL, 1),
	(49, 'no', 14, 0, 126, NULL, 1),
	(50, 'true', 2, 0, 14, NULL, 1),
	(51, '<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or "organic" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>', 2, 0, 13, NULL, 1),
	(52, '', 3, 0, NULL, NULL, 1),
	(53, '', 8, 0, NULL, NULL, 1),
	(54, NULL, 9, 0, NULL, NULL, 1),
	(55, NULL, 10, 0, NULL, NULL, 1),
	(56, 'laurent.hohl@gmail.com', 15, 0, NULL, NULL, 1),
	(57, '', 16, 0, NULL, NULL, 1),
	(58, 'clean', 11, 0, 95, NULL, 1),
	(59, '', 13, 0, 113, NULL, 1),
	(60, '', 13, -1, 114, NULL, 1),
	(61, NULL, 13, 0, 115, NULL, 1),
	(62, '', 13, -1, 116, NULL, 1),
	(63, '', 13, -1, 117, NULL, 1),
	(64, '', 13, -1, 118, NULL, 1),
	(65, 'no', 14, 0, 126, NULL, 1),
	(66, 'true', 2, 0, 14, NULL, 1),
	(67, '<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or "organic" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>', 2, 0, 13, NULL, 1),
	(68, 'laurent.hohl@paris.fr', 3, 0, NULL, NULL, 1),
	(69, 'dH ZDAZDH AZUDHA ZDAZUH DAZUDHAZIU DH', 8, 0, NULL, NULL, 1),
	(70, '1645052400000', 9, 0, NULL, NULL, 1),
	(71, NULL, 10, 0, NULL, NULL, 1),
	(72, '+33688385653', 16, 0, NULL, NULL, 1),
	(73, 'clean', 11, 0, 95, NULL, 1),
	(74, NULL, 12, 0, NULL, 129, 1),
	(75, '', 13, 0, 113, NULL, 1),
	(76, 'Sookie, 2 bis, Rue Commines, Quartier des Enfants-Rouges, Paris 3e Arrondissement, Paris, Île-de-France, France métropolitaine, 75003, France', 13, -1, 114, NULL, 1),
	(77, NULL, 13, 0, 115, NULL, 1),
	(78, '2.365107536315918', 13, -1, 116, NULL, 1),
	(79, '48.861544805019086', 13, -1, 117, NULL, 1),
	(80, '', 13, -1, 118, NULL, 1),
	(81, 'env', 11, 1, 93, NULL, 1),
	(82, NULL, 12, 1, NULL, 130, 1),
	(83, '', 13, 1, 113, NULL, 1),
	(84, 'Sookie, 2 bis, Rue Commines, Quartier des Enfants-Rouges, Paris 3e Arrondissement, Paris, Île-de-France, France métropolitaine, 75003, France', 13, -1, 114, NULL, 1),
	(85, NULL, 13, 1, 115, NULL, 1),
	(86, '2.365107536315918', 13, -1, 116, NULL, 1),
	(87, '48.861544805019086', 13, -1, 117, NULL, 1),
	(88, '', 13, -1, 118, NULL, 1),
	(89, 'y', 14, 0, 125, NULL, 1),
	(90, 'TEST', 17, 0, NULL, NULL, 1),
	(91, 'true', 2, 0, 14, NULL, 1),
	(92, '<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or "organic" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>', 2, 0, 13, NULL, 1),
	(93, 'laurent.hohl@paris.fr', 3, 0, NULL, NULL, 1),
	(94, 'dzadza azdazd', 8, 0, NULL, NULL, 1),
	(95, '1645138800000', 9, 0, NULL, NULL, 1),
	(96, 'H', 10, 0, 85, NULL, 1),
	(97, '+33606060606', 16, 0, NULL, NULL, 1),
	(98, 'move', 11, 0, 94, NULL, 1),
	(99, '', 13, 0, 113, NULL, 1),
	(100, '', 13, -1, 114, NULL, 1),
	(101, NULL, 13, 0, 115, NULL, 1),
	(102, '', 13, -1, 116, NULL, 1),
	(103, '', 13, -1, 117, NULL, 1),
	(104, '', 13, -1, 118, NULL, 1),
	(105, 'no', 14, 0, 126, NULL, 1);
/*!40000 ALTER TABLE `genatt_response` ENABLE KEYS */;

DROP TABLE IF EXISTS `genatt_verify_by`;
CREATE TABLE IF NOT EXISTS `genatt_verify_by` (
  `id_field` int(11) NOT NULL DEFAULT 0,
  `id_expression` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_field`,`id_expression`),
  KEY `index_genatt_verify_by_field` (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `genatt_verify_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_verify_by` ENABLE KEYS */;

DROP TABLE IF EXISTS `htmlpage`;
CREATE TABLE IF NOT EXISTS `htmlpage` (
  `id_htmlpage` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `html_content` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id_htmlpage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `htmlpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `htmlpage` ENABLE KEYS */;

DROP TABLE IF EXISTS `html_portlet`;
CREATE TABLE IF NOT EXISTS `html_portlet` (
  `id_portlet` int(11) NOT NULL DEFAULT 0,
  `html` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portlet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `html_portlet` DISABLE KEYS */;
INSERT INTO `html_portlet` (`id_portlet`, `html`) VALUES
	(6, '\r\n    <!-- Features -->\r\n    <div id="features" class="tabs">\r\n        <div class="container">\r\n            <div class="row">\r\n                <div class="col-lg-12">\r\n                    <div class="above-heading">FEATURES</div>\r\n                    <h2 class="h2-heading">Forms </h2>\r\n                    <p class="p-heading">Add multi-step forms to retrieve info from your citizen\'s, associations...</p>\r\n                </div> \r\n            </div> \r\n            <div class="row">\r\n                <div class="col-lg-12">\r\n                   <!-- Tabs Links -->\r\n                    <ul class="nav nav-tabs" id="argoTabs" role="tablist">\r\n                        <li class="nav-item">\r\n                            <a class="nav-link active" id="nav-tab-1" data-bs-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">\r\n								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-forms" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">\r\n								  <path stroke="none" d="M0 0h24v24H0z" fill="none"/>\r\n								  <path d="M12 3a3 3 0 0 0 -3 3v12a3 3 0 0 0 3 3" />\r\n								  <path d="M6 3a3 3 0 0 1 3 3v12a3 3 0 0 1 -3 3" />\r\n								  <path d="M13 7h7a1 1 0 0 1 1 1v8a1 1 0 0 1 -1 1h-7" />\r\n								  <path d="M5 7h-1a1 1 0 0 0 -1 1v8a1 1 0 0 0 1 1h1" />\r\n								  <path d="M17 12h.01" />\r\n								  <path d="M13 12h.01" />\r\n								</svg> \r\n								Build forms\r\n							</a>\r\n                        </li>\r\n                        <li class="nav-item">\r\n                            <a class="nav-link" id="nav-tab-2" data-bs-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">\r\n								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-list-details" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">\r\n								  <path stroke="none" d="M0 0h24v24H0z" fill="none"/>\r\n								  <path d="M13 5h8" />\r\n								  <path d="M13 9h5" />\r\n								  <path d="M13 15h8" />\r\n								  <path d="M13 19h5" />\r\n								  <rect x="3" y="4" width="6" height="6" rx="1" />\r\n								  <rect x="3" y="14" width="6" height="6" rx="1" />\r\n								</svg>\r\n								Manage responses\r\n							</a>\r\n                        </li>\r\n                    </ul>\r\n                    <!-- end of tabs links -->\r\n                    <!-- Tabs Content -->\r\n                    <div class="tab-content" id="argoTabsContent">\r\n                        <!-- Tab -->\r\n                        <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="tab-1">\r\n                            <div class="row">\r\n                                <div class="col-lg-6">\r\n                                    <div class="image-container">\r\n                                        <img class="img-fluid" src="images/features-1.png" alt="alternative">\r\n                                    </div> <!-- end of image-container -->\r\n                                </div> <!-- end of col -->\r\n                                <div class="col-lg-6">\r\n                                    <div class="text-container">\r\n                                        <h3>List Building Is Easier Than Ever</h3>\r\n                                        <p>It\'s very easy to start using Tivo. You just need to fill out and submit the <a class="blue page-scroll" href="sign-up.html">Sign Up Form</a> and you will receive access to the app and all of its features in no more than 24h.</p>\r\n                                        <ul class="list-unstyled li-space-lg">\r\n                                            <li>\r\n                                                <i class="fas fa-square"></i> Create and embed on websites newsletter sign up forms\r\n                                            </li>\r\n                                            <li>\r\n                                                <i class="fas fa-square"></i> Manage forms and landing pages for your services\r\n                                            </li>\r\n                                            <li>\r\n                                                <i class="fas fa-square"></i> Add and remove subscribers using the control panel\r\n                                            </li>\r\n                                        </ul>\r\n                                        <p class="p-small">Demo user access-code is <strong>"adminpack"</strong> and the password is <strong>"packcitelibreadmin"</strong></p>\r\n                                        <a class="btn-solid-reg" target="_blank" title="[Nouvelle fenêtre] Accéder au back-office" href="jsp/admin/AdminLogin.jsp"><i class="fas fa-external-link-alt"></i> Connect to admin</a>\r\n                                    </div> <!-- end of text-container -->\r\n                                </div> <!-- end of col -->\r\n                            </div> <!-- end of row -->\r\n                        </div> <!-- end of tab-pane -->\r\n                        <!-- end of tab -->\r\n                        <!-- Tab -->\r\n                        <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="tab-2">\r\n                            <div class="row">\r\n                                <div class="col-lg-6">\r\n                                    <div class="image-container">\r\n                                        <img class="img-fluid" src="images/features-2.png" alt="alternative">\r\n                                    </div> <!-- end of image-container -->\r\n                                </div> <!-- end of col -->\r\n                                <div class="col-lg-6">\r\n                                    <div class="text-container">\r\n                                        <h3>Campaigns Monitoring Tools</h3>\r\n                                        <p>Campaigns monitoring is a feature we\'ve developed since the beginning because it\'s at the core of Tivo and basically to any marketing activity focused on results.</p>\r\n                                        <ul class="list-unstyled li-space-lg">\r\n                                            <li class="media">\r\n                                                <i class="fas fa-square"></i>\r\n                                                <div class="media-body">Easily plan campaigns and schedule their starting date</div>\r\n                                            </li>\r\n                                            <li class="media">\r\n                                                <i class="fas fa-square"></i>\r\n                                                <div class="media-body">Start campaigns and follow their evolution closely</div>\r\n                                            </li>\r\n                                            <li class="media">\r\n                                                <i class="fas fa-square"></i>\r\n                                                <div class="media-body">Evaluate campaign results and optimize future actions</div>\r\n                                            </li>\r\n                                        </ul>\r\n                                        <a class="btn-solid-reg popup-with-move-anim" href="#details-lightbox-2">LIGHTBOX</a>\r\n                                    </div> <!-- end of text-container -->\r\n                                </div> <!-- end of col -->\r\n                            </div> <!-- end of row -->\r\n                        </div> <!-- end of tab-pane -->\r\n                        <!-- end of tab -->\r\n                    <!-- end of tabs content -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n        </div> <!-- end of container -->\r\n    </div> <!-- end of tabs -->\r\n    <!-- end of features -->\r\n    '),
	(4, '<!-- end of customers -->\r\n<!-- Description -->\r\n    <div class="cards-1">\r\n        <div class="container">\r\n            <div class="row">\r\n                <div class="col-lg-12">\r\n                    <div class="above-heading">ALL PACK AVAILABLE</div>\r\n                    <!-- <h2 class="h2-heading">Marketing Automation Will Bring More Qualified Leads</h2> -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n            <div class="row">\r\n                <div class="col-lg-12">\r\n                    <!-- Card \r\n                    <div class="card">\r\n                        <div class="card-image">\r\n                            <img class="img-fluid" src="images/description-1.png" alt="alternative">\r\n                        </div>\r\n                        <div class="card-body">\r\n                            <h4 class="card-title">Forms</h4>\r\n                            <p>It\'s very easy to start creating a form.</p>\r\n                        </div>\r\n                    </div>\r\n-->\r\n                    <!-- end of card -->\r\n                    <!-- Card -->\r\n                    <div class="card">\r\n                        <div class="card-image">\r\n                            <img class="img-fluid" src="images/description-2.png" alt="alternative">\r\n                        </div>\r\n                        <div class="card-body">\r\n                            <h4 class="card-title">Appointment</h4>\r\n                            <p>Rule your service\'s appointments</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n  	<!-- Card -->\r\n                    <div class="card">\r\n                        <div class="card-image">\r\n                            <img class="img-fluid" src="images/description-4.png" alt="alternative">\r\n                        </div>\r\n                        <div class="card-body">\r\n                            <h4 class="card-title">In my street</h4>\r\n                            <p>Have citizen feedback on your city equipments</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                    <!-- Card -->\r\n                    <div class="card">\r\n                        <div class="card-image">\r\n                            <img class="img-fluid" src="images/description-3.png" alt="alternative">\r\n                        </div>\r\n                        <div class="card-body">\r\n                            <h4 class="card-title">Participative Budget</h4>\r\n                            <p>Elaborate with citizen</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n        </div> <!-- end of container -->\r\n    </div> <!-- end of cards-1 -->\r\n    <!-- end of description -->\r\n'),
	(5, '	<div class="slider-1">\r\n		<div class="container">\r\n			<div class="row">\r\n				<div class="col">\r\n					<!-- Image Slider -->\r\n					<div class="slider-container">\r\n						<div class="swiper-container image-slider">\r\n							<div class="swiper-wrapper">\r\n								<div class="swiper-slide">\r\n									<img class="img-fluid" src="images/customer-logo-1.png" alt="alternative">\r\n								</div>\r\n								<div class="swiper-slide">\r\n									<img class="img-fluid" src="images/customer-logo-2.png" alt="alternative">\r\n								</div>\r\n								<div class="swiper-slide">\r\n									<img class="img-fluid" src="images/customer-logo-3.png" alt="alternative">\r\n								</div>\r\n								<div class="swiper-slide">\r\n									<img class="img-fluid" src="images/customer-logo-4.png" alt="alternative">\r\n								</div>\r\n								\r\n							</div> <!-- end of swiper-wrapper -->\r\n						</div> <!-- end of swiper container -->\r\n					</div> <!-- end of slider-container -->\r\n					<!-- end of image slider -->\r\n				</div> <!-- end of col -->\r\n			</div> <!-- end of row -->\r\n		</div> <!-- end of container -->\r\n	</div> <!-- end of slider-1 -->'),
	(7, '<div class="cards-1">\r\n        <div class="container">\r\n            <div class="row">\r\n                <div class="col-lg-12">\r\n                    <div class="above-heading">ALL PACK AVAILABLE</div>\r\n                    <!-- <h2 class="h2-heading">Marketing Automation Will Bring More Qualified Leads</h2> -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n            <div class="row">\r\n                <div class="col-lg-12">\r\n                    <!-- Card \r\n                    <div class="card">\r\n                        <div class="card-image">\r\n                            <img class="img-fluid" src="images/description-1.png" alt="alternative">\r\n                        </div>\r\n                        <div class="card-body">\r\n                            <h4 class="card-title">Forms</h4>\r\n                            <p>It\'s very easy to start creating a form.</p>\r\n                        </div>\r\n                    </div>\r\n-->\r\n                    <!-- end of card -->\r\n                    <!-- Card -->\r\n                    <div class="card">\r\n                        <div class="card-image">\r\n                            <img class="img-fluid" src="images/description-2.png" alt="alternative">\r\n                        </div>\r\n                        <div class="card-body">\r\n                            <h4 class="card-title">Appointment</h4>\r\n                            <p>Rule your service\'s appointments</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n  	<!-- Card -->\r\n                    <div class="card">\r\n                        <div class="card-image">\r\n                            <img class="img-fluid" src="images/description-4.png" alt="alternative">\r\n                        </div>\r\n                        <div class="card-body">\r\n                            <h4 class="card-title">In my street</h4>\r\n                            <p>Have citizen feedback on your city equipments</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                    <!-- Card -->\r\n                    <div class="card">\r\n                        <div class="card-image">\r\n                            <img class="img-fluid" src="images/description-3.png" alt="alternative">\r\n                        </div>\r\n                        <div class="card-body">\r\n                            <h4 class="card-title">Participative Budget</h4>\r\n                            <p>Elaborate with citizen</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n        </div> <!-- end of container -->\r\n    </div> <!-- end of cards-1 -->\r\n    <!-- end of description -->');
/*!40000 ALTER TABLE `html_portlet` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_attribute`;
CREATE TABLE IF NOT EXISTS `mylutece_attribute` (
  `id_attribute` int(11) NOT NULL DEFAULT 0,
  `type_class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_mandatory` smallint(6) DEFAULT 0,
  `is_shown_in_search` smallint(6) DEFAULT 0,
  `attribute_position` int(11) DEFAULT 0,
  `plugin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anonymize` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_attribute_field`;
CREATE TABLE IF NOT EXISTS `mylutece_attribute_field` (
  `id_field` int(11) NOT NULL DEFAULT 0,
  `id_attribute` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_DEFAULT_value` smallint(6) DEFAULT 0,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `max_size_enter` int(11) DEFAULT NULL,
  `is_multiple` smallint(6) DEFAULT 0,
  `field_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_attribute_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_connections_log`;
CREATE TABLE IF NOT EXISTS `mylutece_connections_log` (
  `ip_address` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `login_status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_connections_log` DISABLE KEYS */;
INSERT INTO `mylutece_connections_log` (`ip_address`, `date_login`, `login_status`) VALUES
	('0:0:0:0:0:0:0:1', '2022-02-17 15:11:39', 0);
/*!40000 ALTER TABLE `mylutece_connections_log` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_database_group`;
CREATE TABLE IF NOT EXISTS `mylutece_database_group` (
  `group_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `group_description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`group_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_database_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_group` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_database_group_role`;
CREATE TABLE IF NOT EXISTS `mylutece_database_group_role` (
  `group_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_key`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_database_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_group_role` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_database_key`;
CREATE TABLE IF NOT EXISTS `mylutece_database_key` (
  `mylutece_database_user_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mylutece_database_user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mylutece_database_user_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_database_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_key` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_database_user`;
CREATE TABLE IF NOT EXISTS `mylutece_database_user` (
  `mylutece_database_user_id` int(11) NOT NULL,
  `login` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `name_given` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_family` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT 0,
  `reset_password` smallint(6) NOT NULL DEFAULT 0,
  `password_max_valid_date` timestamp NULL DEFAULT NULL,
  `account_max_valid_date` bigint(20) DEFAULT NULL,
  `nb_alerts_sent` int(11) NOT NULL DEFAULT 0,
  `last_login` timestamp NOT NULL DEFAULT '1979-12-31 23:00:00',
  PRIMARY KEY (`mylutece_database_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_database_user` DISABLE KEYS */;
INSERT INTO `mylutece_database_user` (`mylutece_database_user_id`, `login`, `password`, `name_given`, `name_family`, `email`, `is_active`, `reset_password`, `password_max_valid_date`, `account_max_valid_date`, `nb_alerts_sent`, `last_login`) VALUES
	(1, 'laurent.hohl@gmail.com', 'PBKDF2WITHHMACSHA512:40000:d812ffa87cb979a45099c919f6acd64a:2030e46e70e0b731ee180047daafac227159a5e9b5e33c1d5ddc310e6e410e72777147f8088f4ff5323303db89aa44f8be67fc64565cd06820f18e6e8a2af6699af97c7f7f68a8c2013f33f69bd4c1c2db77ec06136381ab3d62d017f46601c2b1e2e49dcf1816c12e9b31075a2cd7e3447d1a5a98ab7ab7eebe61f8eb321a78', 'Laurent', 'HOHLA', 'laurent.hohl@gmail.com', 1, 0, NULL, 1676652179713, 0, '2022-02-22 16:42:59');
/*!40000 ALTER TABLE `mylutece_database_user` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_database_user_group`;
CREATE TABLE IF NOT EXISTS `mylutece_database_user_group` (
  `mylutece_database_user_id` int(11) NOT NULL DEFAULT 0,
  `group_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mylutece_database_user_id`,`group_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_database_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_group` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_database_user_parameter`;
CREATE TABLE IF NOT EXISTS `mylutece_database_user_parameter` (
  `parameter_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parameter_value` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parameter_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_database_user_parameter` DISABLE KEYS */;
INSERT INTO `mylutece_database_user_parameter` (`parameter_key`, `parameter_value`) VALUES
	('account_creation_validation_email', 'false'),
	('auto_login_after_validation_email', 'false'),
	('enable_jcaptcha', 'false'),
	('force_change_password_reinit', ''),
	('password_minimum_length', '8'),
	('password_format_upper_lower_case', 'false'),
	('password_format_numero', 'false'),
	('password_format_special_characters', 'false'),
	('password_duration', ''),
	('password_history_size', ''),
	('maximum_number_password_change', ''),
	('tsw_size_password_change', ''),
	('use_advanced_security_parameters', 'false'),
	('account_life_time', '360'),
	('time_before_alert_account', '30'),
	('nb_alert_account', '2'),
	('time_between_alerts_account', '10'),
	('access_failures_max', '3'),
	('access_failures_interval', '10'),
	('expired_alert_mail_sender', 'LUTECE'),
	('expired_alert_mail_subject', 'Votre compte a expiré'),
	('first_alert_mail_sender', 'LUTECE'),
	('first_alert_mail_subject', 'Votre compte va bientot expirer'),
	('other_alert_mail_sender', 'LUTECE'),
	('other_alert_mail_subject', 'Votre compte va bientot expirer'),
	('account_reactivated_mail_sender', 'LUTECE'),
	('account_reactivated_mail_subject', 'Votre compte a bien été réactivé'),
	('access_failures_captcha', '1'),
	('unblock_user_mail_sender', 'LUTECE'),
	('unblock_user_mail_subject', 'Votre IP a été bloquée'),
	('enable_unblock_ip', 'false'),
	('notify_user_password_expired', ''),
	('password_expired_mail_sender', 'LUTECE'),
	('password_expired_mail_subject', 'Votre mot de passe a expiré'),
	('mail_lost_password_sender', 'LUTECE'),
	('mail_lost_password_subject', 'Votre mot de passe a été réinitialisé'),
	('mail_password_encryption_changed_sender', 'LUTECE'),
	('mail_password_encryption_changed_subject', 'Votre mot de passe a été réinitialisé');
/*!40000 ALTER TABLE `mylutece_database_user_parameter` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_database_user_password_history`;
CREATE TABLE IF NOT EXISTS `mylutece_database_user_password_history` (
  `mylutece_database_user_id` int(11) NOT NULL,
  `password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`mylutece_database_user_id`,`date_password_change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_database_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_password_history` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_database_user_role`;
CREATE TABLE IF NOT EXISTS `mylutece_database_user_role` (
  `mylutece_database_user_id` int(11) NOT NULL DEFAULT 0,
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mylutece_database_user_id`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_database_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_role` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_user_anonymize_field`;
CREATE TABLE IF NOT EXISTS `mylutece_user_anonymize_field` (
  `field_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `anonymize` smallint(6) NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `mylutece_user_anonymize_field` (`field_name`, `anonymize`) VALUES
	('login', 1),
	('name_given', 1),
	('name_family', 1),
	('email', 1);
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `mylutece_user_field`;
CREATE TABLE IF NOT EXISTS `mylutece_user_field` (
  `id_user_field` int(11) NOT NULL DEFAULT 0,
  `id_user` int(11) DEFAULT NULL,
  `id_attribute` int(11) DEFAULT NULL,
  `id_field` int(11) DEFAULT NULL,
  `user_field_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `mylutece_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_user_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `poll_form`;
CREATE TABLE IF NOT EXISTS `poll_form` (
  `id_poll_form` int(11) NOT NULL AUTO_INCREMENT,
  `id_form` int(11) NOT NULL DEFAULT 0,
  `is_visible` smallint(6) NOT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `btn_title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `btn_url` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `btn_is_visible` smallint(6) NOT NULL,
  PRIMARY KEY (`id_poll_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `poll_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_form` ENABLE KEYS */;

DROP TABLE IF EXISTS `poll_form_question`;
CREATE TABLE IF NOT EXISTS `poll_form_question` (
  `id_poll_form_question` int(11) NOT NULL AUTO_INCREMENT,
  `id_poll_form` int(11) NOT NULL DEFAULT 0,
  `id_form` int(11) NOT NULL DEFAULT 0,
  `id_question` int(11) NOT NULL DEFAULT 0,
  `chart_type` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `chart_is_toolbox` smallint(6) NOT NULL,
  `chart_is_checked` smallint(6) NOT NULL,
  PRIMARY KEY (`id_poll_form_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `poll_form_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_form_question` ENABLE KEYS */;

DROP TABLE IF EXISTS `profile_action`;
CREATE TABLE IF NOT EXISTS `profile_action` (
  `id_action` int(11) NOT NULL DEFAULT 0,
  `name_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `profile_action` DISABLE KEYS */;
INSERT INTO `profile_action` (`id_action`, `name_key`, `description_key`, `action_url`, `icon_url`, `action_permission`) VALUES
	(1, 'profiles.action.modify_profile.name', 'profiles.action.modify_profile.description', 'jsp/admin/plugins/profiles/ModifyProfile.jsp', 'edit', 'MODIFY_PROFILE'),
	(2, 'profiles.action.delete_profile.name', 'profiles.action.delete_profile.description', 'jsp/admin/plugins/profiles/RemoveProfile.jsp', 'trash', 'DELETE_DELETE'),
	(3, 'profiles.action.manage_users_assignment.name', 'profiles.action.manage_users_assignment.description', 'jsp/admin/plugins/profiles/AssignUsersProfile.jsp', 'user', 'MANAGE_USERS_ASSIGNMENT'),
	(4, 'profiles.action.manage_rights_assignment.name', 'profiles.action.manage_rights_assignment.description', 'jsp/admin/plugins/profiles/AssignRightsProfile.jsp', 'lock', 'MANAGE_RIGHTS_ASSIGNMENT'),
	(5, 'profiles.action.manage_roles_assignment.name', 'profiles.action.manage_roles_assignment.description', 'jsp/admin/plugins/profiles/AssignRolesProfile.jsp', 'th-list', 'MANAGE_ROLES_ASSIGNMENT'),
	(6, 'profiles.action.manage_workgroups_assignment.name', 'profiles.action.manage_workgroups_assignment.description', 'jsp/admin/plugins/profiles/AssignWorkgroupsProfile.jsp', 'group', 'MANAGE_WORKGROUPS_ASSIGNMENT'),
	(7, 'profiles.action.manage_view_assignment.name', 'profiles.action.manage_view_assignment.description', 'jsp/admin/plugins/profiles/AssignViewProfile.jsp', 'eye', 'MANAGE_VIEW_ASSIGNMENT');
/*!40000 ALTER TABLE `profile_action` ENABLE KEYS */;

DROP TABLE IF EXISTS `profile_profile`;
CREATE TABLE IF NOT EXISTS `profile_profile` (
  `profile_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `profile_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `profile_profile` DISABLE KEYS */;
INSERT INTO `profile_profile` (`profile_key`, `profile_description`) VALUES
	('forms_admin', 'Admin manager for Forms - create, update and delete forms'),
	('forms_response_manager', 'User that manage responses made through forms'),
	('technical_admin_forms', 'Admin technical manager that can configure all necessary features to admin forms');
/*!40000 ALTER TABLE `profile_profile` ENABLE KEYS */;

DROP TABLE IF EXISTS `profile_right`;
CREATE TABLE IF NOT EXISTS `profile_right` (
  `profile_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_right` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`id_right`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `profile_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_right` ENABLE KEYS */;

DROP TABLE IF EXISTS `profile_role`;
CREATE TABLE IF NOT EXISTS `profile_role` (
  `profile_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `profile_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_role` ENABLE KEYS */;

DROP TABLE IF EXISTS `profile_user`;
CREATE TABLE IF NOT EXISTS `profile_user` (
  `profile_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`profile_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `profile_user` DISABLE KEYS */;
INSERT INTO `profile_user` (`profile_key`, `id_user`) VALUES
	('forms_admin', 5),
	('forms_response_manager', 5),
	('technical_admin_forms', 5);
/*!40000 ALTER TABLE `profile_user` ENABLE KEYS */;

DROP TABLE IF EXISTS `profile_view`;
CREATE TABLE IF NOT EXISTS `profile_view` (
  `view_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `view_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`view_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `profile_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view` ENABLE KEYS */;

DROP TABLE IF EXISTS `profile_view_action`;
CREATE TABLE IF NOT EXISTS `profile_view_action` (
  `id_action` int(11) NOT NULL DEFAULT 0,
  `name_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `profile_view_action` DISABLE KEYS */;
INSERT INTO `profile_view_action` (`id_action`, `name_key`, `description_key`, `action_url`, `icon_url`, `action_permission`) VALUES
	(1, 'profiles.action.modify_view.name', 'profiles.action.modify_view.description', 'jsp/admin/plugins/profiles/ModifyView.jsp', 'edit', 'MODIFY_VIEW'),
	(2, 'profiles.action.delete_view.name', 'profiles.action.delete_view.description', 'jsp/admin/plugins/profiles/RemoveView.jsp', 'trash', 'DELETE_VIEW'),
	(3, 'profiles.action.manage_views_assignment.name', 'profiles.action.manage_views_assignment.description', 'jsp/admin/plugins/profiles/AssignProfilesView.jsp', 'user-tag', 'MANAGE_PROFILES_ASSIGNMENT'),
	(4, 'profiles.action.manage_dashboards.name', 'profiles.action.manage_dashboards.description', 'jsp/admin/plugins/profiles/ManageDashboards.jsp', 'wrench', 'MANAGE_DASHBOARDS');
/*!40000 ALTER TABLE `profile_view_action` ENABLE KEYS */;

DROP TABLE IF EXISTS `profile_view_dashboard`;
CREATE TABLE IF NOT EXISTS `profile_view_dashboard` (
  `view_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dashboard_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dashboard_column` int(11) NOT NULL,
  `dashboard_order` int(11) NOT NULL,
  PRIMARY KEY (`view_key`,`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `profile_view_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view_dashboard` ENABLE KEYS */;

DROP TABLE IF EXISTS `profile_view_profile`;
CREATE TABLE IF NOT EXISTS `profile_view_profile` (
  `view_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `profile_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`view_key`,`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `profile_view_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view_profile` ENABLE KEYS */;

DROP TABLE IF EXISTS `profile_workgroup`;
CREATE TABLE IF NOT EXISTS `profile_workgroup` (
  `profile_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `profile_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_workgroup` ENABLE KEYS */;

DROP TABLE IF EXISTS `referencelist_item`;
CREATE TABLE IF NOT EXISTS `referencelist_item` (
  `id_reference_item` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `code` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `idreference` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_reference_item`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `referencelist_item` DISABLE KEYS */;
INSERT INTO `referencelist_item` (`id_reference_item`, `name`, `code`, `idreference`) VALUES
	(1, 'Woman', 'F', 1),
	(2, 'Man', 'H', 1),
	(3, 'Undefined', 'U', 1),
	(4, 'Environment', 'env', 2),
	(6, 'City shift', 'move', 2),
	(7, 'City cleanliness', 'clean', 2),
	(8, 'Healthcare', 'health', 2);
/*!40000 ALTER TABLE `referencelist_item` ENABLE KEYS */;

DROP TABLE IF EXISTS `referencelist_reference`;
CREATE TABLE IF NOT EXISTS `referencelist_reference` (
  `id_reference` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_reference`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `referencelist_reference` DISABLE KEYS */;
INSERT INTO `referencelist_reference` (`id_reference`, `name`, `description`) VALUES
	(1, 'Gender', 'Gender list'),
	(2, 'Types of demands', 'Demand\'s type ');
/*!40000 ALTER TABLE `referencelist_reference` ENABLE KEYS */;

DROP TABLE IF EXISTS `referencelist_translation`;
CREATE TABLE IF NOT EXISTS `referencelist_translation` (
  `id_translation` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `id_reference_item` int(11) NOT NULL,
  PRIMARY KEY (`id_translation`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `referencelist_translation` DISABLE KEYS */;
INSERT INTO `referencelist_translation` (`id_translation`, `lang`, `name`, `id_reference_item`) VALUES
	(1, 'fr', 'Femme', 1),
	(2, 'fr', 'Homme', 2),
	(3, 'fr', 'Non défini', 3),
	(4, 'fr', 'Environnement', 4),
	(5, 'fr', 'Déplacements', 6),
	(6, 'fr', 'Propreté', 7),
	(7, 'fr', 'Santé', 8);
/*!40000 ALTER TABLE `referencelist_translation` ENABLE KEYS */;

DROP TABLE IF EXISTS `regularexpression_regular_expression`;
CREATE TABLE IF NOT EXISTS `regularexpression_regular_expression` (
  `id_expression` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regular_expression_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `valid_exemple` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `information_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_expression`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `regularexpression_regular_expression` DISABLE KEYS */;
INSERT INTO `regularexpression_regular_expression` (`id_expression`, `title`, `regular_expression_value`, `valid_exemple`, `information_message`, `error_message`) VALUES
	(1, 'Fichier JPG', 'image/jpeg', 'image/jpeg', 'Expression régulière pour les fichiers de type jpeg.', 'Le format du fichier n\'est pas valide. Veuillez choisir une image de type jpeg.'),
	(2, 'Email', '(^([a-zA-Z0-9]+(([\\.\\-\\_]?[a-zA-Z0-9]+)+)?)\\@(([a-zA-Z0-9]+[\\.\\-\\_])+[a-zA-Z]{2,4})$)|(^$)', 'admin@lutece.fr', 'Expression régulière pour les emails.', 'Le format de l\'email est incorrect.');
/*!40000 ALTER TABLE `regularexpression_regular_expression` ENABLE KEYS */;

DROP TABLE IF EXISTS `seo_friendly_url`;
CREATE TABLE IF NOT EXISTS `seo_friendly_url` (
  `id_url` int(11) NOT NULL DEFAULT 0,
  `friendly_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `technical_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modification` timestamp NOT NULL DEFAULT '2012-10-09 22:00:00',
  `is_canonical` int(11) NOT NULL DEFAULT 0,
  `is_sitemap` int(11) NOT NULL DEFAULT 0,
  `sitemap_lastmod` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `sitemap_changefreq` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `sitemap_priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `seo_friendly_url` DISABLE KEYS */;
INSERT INTO `seo_friendly_url` (`id_url`, `friendly_url`, `technical_url`, `date_creation`, `date_modification`, `is_canonical`, `is_sitemap`, `sitemap_lastmod`, `sitemap_changefreq`, `sitemap_priority`) VALUES
	(1, '/sitemap.html', '/jsp/site/Portal.jsp?page=map', '2022-02-15 14:55:06', '2012-10-09 22:00:00', 1, 1, '2012-10-10', 'monthly', '0.8'),
	(2, '/contacts.html', '/jsp/site/Portal.jsp?page=contact', '2022-02-15 14:55:06', '2012-10-09 22:00:00', 1, 1, '2012-10-10', 'monthly', '0.8'),
	(3, '/credits.html', '/jsp/site/PopupCredits.jsp', '2022-02-15 14:55:06', '2012-10-09 22:00:00', 1, 1, '2012-10-10', 'monthly', '0.8'),
	(4, '/home.html', '/jsp/site/Portal.jsp?page_id=1', '2022-02-15 15:26:31', '2012-10-09 22:00:00', 1, 1, '2014-06-08', 'weekly', '0.7'),
	(5, '/page-1.html', '/jsp/site/Portal.jsp?page_id=2', '2022-02-15 15:26:31', '2012-10-09 22:00:00', 1, 1, '2014-06-08', 'weekly', '0.7');
/*!40000 ALTER TABLE `seo_friendly_url` ENABLE KEYS */;

DROP TABLE IF EXISTS `seo_properties`;
CREATE TABLE IF NOT EXISTS `seo_properties` (
  `property_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`property_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `seo_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_properties` ENABLE KEYS */;

DROP TABLE IF EXISTS `seo_rule`;
CREATE TABLE IF NOT EXISTS `seo_rule` (
  `id_rule` int(11) NOT NULL DEFAULT 0,
  `rule_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rule_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_rule`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `seo_rule` DISABLE KEYS */;
INSERT INTO `seo_rule` (`id_rule`, `rule_from`, `rule_to`) VALUES
	(1, '/page/([0-9]+)', '/jsp/site/Portal.jsp?page_id=$1'),
	(2, '/app/([a-z]+)', '/jsp/site/Portal.jsp?page=$1'),
	(3, '/map', '/jsp/site/Portal.jsp?page=map');
/*!40000 ALTER TABLE `seo_rule` ENABLE KEYS */;

DROP TABLE IF EXISTS `task_alert`;
CREATE TABLE IF NOT EXISTS `task_alert` (
  `id_history` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL DEFAULT 0,
  `reference_date` timestamp NULL DEFAULT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT 1,
  `is_executed` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_history`,`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `task_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_alert` ENABLE KEYS */;

DROP TABLE IF EXISTS `task_alert_cf`;
CREATE TABLE IF NOT EXISTS `task_alert_cf` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `id_form` int(11) NOT NULL DEFAULT 0,
  `id_state_after_deadline` int(11) NOT NULL DEFAULT 0,
  `id_question_date` int(11) NOT NULL DEFAULT 0,
  `nb_days_to_date` int(11) NOT NULL DEFAULT 0,
  `id_retrieval_type` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `task_alert_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_alert_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `task_create_pdf_cf`;
CREATE TABLE IF NOT EXISTS `task_create_pdf_cf` (
  `id_task` int(11) NOT NULL,
  `id_form` int(11) DEFAULT NULL,
  `id_question_url_pdf` int(11) DEFAULT NULL,
  `id_config` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `task_create_pdf_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_create_pdf_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `template_control`;
CREATE TABLE IF NOT EXISTS `template_control` (
  `id_control` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_message` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `validator_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `control_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_control_target` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_control`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `template_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_control` ENABLE KEYS */;

DROP TABLE IF EXISTS `template_control_question`;
CREATE TABLE IF NOT EXISTS `template_control_question` (
  `id_control` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  PRIMARY KEY (`id_control`,`id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `template_control_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_control_question` ENABLE KEYS */;

DROP TABLE IF EXISTS `template_control_question_mapping`;
CREATE TABLE IF NOT EXISTS `template_control_question_mapping` (
  `id_control` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_control`,`id_question`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `template_control_question_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_control_question_mapping` ENABLE KEYS */;

DROP TABLE IF EXISTS `template_display`;
CREATE TABLE IF NOT EXISTS `template_display` (
  `id_display` int(11) NOT NULL AUTO_INCREMENT,
  `id_template` int(11) DEFAULT 0,
  `id_composite` int(11) DEFAULT 0,
  `id_parent` int(11) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `composite_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `display_depth` int(11) DEFAULT 0,
  PRIMARY KEY (`id_display`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `template_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_display` ENABLE KEYS */;

DROP TABLE IF EXISTS `template_entry`;
CREATE TABLE IF NOT EXISTS `template_entry` (
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NOT NULL DEFAULT 0,
  `title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `mandatory` smallint(6) DEFAULT NULL,
  `fields_in_line` smallint(6) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `field_unique` smallint(6) DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos_conditional` int(11) DEFAULT 0,
  `error_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_only_display_back` smallint(6) DEFAULT 0,
  `is_indexed` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `template_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_entry` ENABLE KEYS */;

DROP TABLE IF EXISTS `template_field`;
CREATE TABLE IF NOT EXISTS `template_field` (
  `id_field` int(11) NOT NULL AUTO_INCREMENT,
  `id_entry` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_value` smallint(6) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `value_type_date` date DEFAULT NULL,
  `no_display_title` smallint(6) DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `template_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `template_group`;
CREATE TABLE IF NOT EXISTS `template_group` (
  `id_group` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `id_template` int(11) DEFAULT 0,
  `iteration_min` int(11) DEFAULT 1,
  `iteration_max` int(11) DEFAULT 1,
  `iteration_add_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `iteration_remove_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `template_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_group` ENABLE KEYS */;

DROP TABLE IF EXISTS `template_question`;
CREATE TABLE IF NOT EXISTS `template_question` (
  `id_question` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_entry` int(11) DEFAULT 0,
  `id_template` int(11) DEFAULT 0,
  `is_visible_multiview_global` smallint(6) NOT NULL DEFAULT 0,
  `is_visible_multiview_form_selected` smallint(6) NOT NULL DEFAULT 0,
  `multiview_column_order` int(11) NOT NULL DEFAULT 0,
  `column_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_filterable_multiview_global` smallint(6) NOT NULL DEFAULT 0,
  `is_filterable_multiview_form_selected` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `template_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_question` ENABLE KEYS */;

DROP TABLE IF EXISTS `template_referenceitem_field`;
CREATE TABLE IF NOT EXISTS `template_referenceitem_field` (
  `id_field` int(11) NOT NULL DEFAULT 0,
  `id_item` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `template_referenceitem_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_referenceitem_field` ENABLE KEYS */;

DROP TABLE IF EXISTS `template_step`;
CREATE TABLE IF NOT EXISTS `template_step` (
  `id_template` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `template_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_step` ENABLE KEYS */;

DROP TABLE IF EXISTS `unittree_action`;
CREATE TABLE IF NOT EXISTS `unittree_action` (
  `id_action` int(11) NOT NULL DEFAULT 0,
  `name_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action_permission` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `unittree_action` DISABLE KEYS */;
INSERT INTO `unittree_action` (`id_action`, `name_key`, `description_key`, `action_url`, `icon_url`, `action_permission`, `action_type`) VALUES
	(1, 'unittree.unit.action.createUnit.name', 'unittree.unit.action.createUnit.description', 'jsp/admin/plugins/unittree/CreateUnit.jsp', 'plus', 'CREATE', 'unittree.unitAction'),
	(2, 'unittree.unit.action.modifyUnit.name', 'unittree.unit.action.modifyUnit.description', 'jsp/admin/plugins/unittree/ModifyUnit.jsp', 'edit', 'MODIFY', 'unittree.unitAction'),
	(3, 'unittree.unit.action.deleteUnit.name', 'unittree.unit.action.deleteUnit.description', 'jsp/admin/plugins/unittree/RemoveUnit.jsp', 'trash', 'DELETE', 'unittree.unitAction'),
	(5, 'unittree.user.action.moveUser.name', 'unittree.user.action.moveUser.description', 'jsp/admin/plugins/unittree/MoveUser.jsp', 'sort', 'MOVE_USER', 'unittree.unitUserAction'),
	(6, 'unittree.user.action.removeUser.name', 'unittree.user.action.removeUser.description', 'jsp/admin/plugins/unittree/RemoveUser.jsp', 'user-times', 'REMOVE_USER', 'unittree.unitUserAction'),
	(10, 'unittree.unit.action.moveSubTree.name', 'unittree.unit.action.moveSubTree.description', 'jsp/admin/plugins/unittree/MoveSubTree.jsp', 'sort', 'MOVE_SUB_TREE', 'unittree.unitAction');
/*!40000 ALTER TABLE `unittree_action` ENABLE KEYS */;

DROP TABLE IF EXISTS `unittree_unit`;
CREATE TABLE IF NOT EXISTS `unittree_unit` (
  `id_unit` int(11) NOT NULL DEFAULT 0,
  `id_parent` int(11) NOT NULL DEFAULT 0,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_unit`),
  KEY `index_unittree_unit_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `unittree_unit` DISABLE KEYS */;
INSERT INTO `unittree_unit` (`id_unit`, `id_parent`, `code`, `label`, `description`) VALUES
	(0, -1, 'ROOT', 'Racine', 'Racine des entités');
/*!40000 ALTER TABLE `unittree_unit` ENABLE KEYS */;

DROP TABLE IF EXISTS `unittree_unit_assignment`;
CREATE TABLE IF NOT EXISTS `unittree_unit_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_resource` int(11) NOT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_assignor_unit` int(11) NOT NULL DEFAULT 0,
  `id_assigned_unit` int(11) NOT NULL DEFAULT 0,
  `assignment_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `assignment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `index_unittree_unit_assignment_resource` (`id_resource`,`resource_type`),
  KEY `index_unittree_unit_assignment_id_assigned_unit` (`id_assigned_unit`,`assignment_date`),
  KEY `index_unittree_unit_assignment_id_assignor_unit` (`id_assignor_unit`,`assignment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `unittree_unit_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `unittree_unit_assignment` ENABLE KEYS */;

DROP TABLE IF EXISTS `unittree_unit_user`;
CREATE TABLE IF NOT EXISTS `unittree_unit_user` (
  `id_unit` int(11) NOT NULL DEFAULT 0,
  `id_user` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_unit`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `unittree_unit_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `unittree_unit_user` ENABLE KEYS */;

DROP TABLE IF EXISTS `userassignment_resource_user`;
CREATE TABLE IF NOT EXISTS `userassignment_resource_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_resource` int(11) NOT NULL DEFAULT 0,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `assignment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userassignment_resource_user_id_resource_fk` (`id_resource`),
  KEY `userassignment_resource_user_resource_type_fk` (`resource_type`),
  KEY `userassignment_resource_user_id_admin_fk` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `userassignment_resource_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `userassignment_resource_user` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_action`;
CREATE TABLE IF NOT EXISTS `workflow_action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_workflow` int(11) DEFAULT NULL,
  `id_state_before` int(11) DEFAULT NULL,
  `id_state_after` int(11) DEFAULT NULL,
  `id_icon` int(11) DEFAULT NULL,
  `is_automatic` smallint(6) DEFAULT 0,
  `is_mass_action` smallint(6) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `is_automatic_reflexive_action` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id_action`),
  KEY `action_id_workflow_fk` (`id_workflow`),
  KEY `action_id_state_before_fk` (`id_state_before`),
  KEY `action_id_state_after_fk` (`id_state_after`),
  KEY `action_id_icon_fk` (`id_icon`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_action` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_action_action`;
CREATE TABLE IF NOT EXISTS `workflow_action_action` (
  `id_action` int(11) NOT NULL DEFAULT 0,
  `id_linked_action` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_action`,`id_linked_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_action_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_action_action` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_assignment_history`;
CREATE TABLE IF NOT EXISTS `workflow_assignment_history` (
  `id_history` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL,
  `workgroup_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_history`,`id_task`,`workgroup_key`),
  KEY `assignment_id_history_fk` (`id_history`),
  KEY `assignment_id_task_fk` (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assignment_history` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_forms_auto_assignment`;
CREATE TABLE IF NOT EXISTS `workflow_forms_auto_assignment` (
  `id_task` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `workgroup_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_task`,`id_question`,`value`,`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_forms_auto_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_forms_auto_assignment` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_forms_auto_assignment_cf`;
CREATE TABLE IF NOT EXISTS `workflow_forms_auto_assignment_cf` (
  `id_task` int(11) NOT NULL,
  `id_form` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_notify` smallint(6) DEFAULT 0,
  `sender_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_view_form_response` smallint(6) NOT NULL DEFAULT 0,
  `label_link_view_form_response` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipients_cc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recipients_bcc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_forms_auto_assignment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_forms_auto_assignment_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_forms_auto_assignment_ef`;
CREATE TABLE IF NOT EXISTS `workflow_forms_auto_assignment_ef` (
  `id_task` int(11) NOT NULL,
  `position_form_question_file` int(11) NOT NULL,
  PRIMARY KEY (`id_task`,`position_form_question_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_forms_auto_assignment_ef` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_forms_auto_assignment_ef` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_icon`;
CREATE TABLE IF NOT EXISTS `workflow_icon` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_value` mediumblob DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_icon` DISABLE KEYS */;
INSERT INTO `workflow_icon` (`id_icon`, `name`, `mime_type`, `file_value`, `width`, `height`) VALUES
	(1, 'Valider', 'image/png', _binary 0x89504e470d0a1a0a0000000d4948445200000018000000180803000000d7a9cdca000001bc504c5445fffffffdfdfdfbfbfbfcfcfcf9f9f9f6f6f6f3f3f3d2d2d2fafafaebebebd8d8d8d3d3d3b2c7dbb3b3b3b1b1b197b3ce8faeca779dc0638eb67d7d7d4f7eaa4771984e4e4e0d14190c141b101010f8f8f8f5f5f5f4f4f4f1f1f1f0f0f0eeeeeeedededeaeaeae7e7e7e2e2e2e1e1e1d7e2ecdedededbdbdbd6d6d6d5d5d5d1d1d1cfcfcfc1d2e2cecececbcbcbcacacabacddfc5c5c5c3c3c3afc5cfadc3d8a9c0d6a4bdd5a3bcd4b4b5b5b2b2b2abababa9a9a9a8a8a890adc7a7a7a78cacc98babc9a3a3a39e9e9e9d9d9d9b9b9b7da1c29999997a9fc1789dbf769cbf9293937299bd8f90906690b7628db55f8bb45d8ab48080805987b25886b15785b05584b05483af7979797777777575754e7da97373734c79a36e6e6e49749c48739b47729a5b6874476c8d426a8f42698d5f5f5f4066895d5e5e3d62843c608156595b3c5f7e505a605656563556744f4f4f4b4f5233526e33516b32516d404c543a4d5e4848483c41433c3f412941583c3c3c313e49283d51263c51243a4f27394a2639492437492c353b2d30312132422630382c2c2c1c2d3d1b2b3a27272723282c2525252424241c1c1c131e281617170b12180b0c0b080c0e080908cb531b250000000174524e530040e6d866000000fb4944415478da6360c0029818b00346666ca25c6262161a8c58246c6c8d4b783930c50d13f945bbf9b0e81016149810ae8f29a155ca2fda6689c555651e02e291ba981aacb3758a3b7959e17c5626881ac602533ff15875b837d8929ab459c036fb9be5f55ac9c2357056abd63bb23130b0e79807f5e57223ac66760ee6a9f19263cc72f0ce9ce8c68964a774b9bb67a34f74114f587b9591144a0035080ab5f49b08a54c0a5446712b4b7abcafab817d546d0f1f1baa07e45b0342424592255235d1829cc9ae4e2426ae52d24901ddcf321569091912f97a2c18b1a6d255d821e9a288259ed99b274770b360893a0e257635561c69809181080000c74b2bf93b2091d60000000049454e44ae426082, 14, 14),
	(2, 'Refuser', 'image/png', _binary 0x89504e470d0a1a0a0000000d4948445200000018000000180803000000d7a9cdca00000243504c5445fffffffcfcfcfdfdfdfbfbfbc34c36fafafaf7f7f7e8e8e8f6f6f6f9f9f9f2f2f2e6e6e6be3b22ba3a22f1f1f1ecececebebebe0e0e0dfdfdfc7c7c7b4b4b43b1711e5e5e5e2e2e2e1e1e1d4d4d4cdcdcdcacacac9c9c9c5c5c5bebebeaeaeaea5a5a5a3a3a3a0a0a0cb7868717171c84e37c64d37c44d366d6d6dc03b22bf3b22bd3b225f5f5fbc3b22bb3b22ba3b22b93b24b739225c5c5cb23821575757545454962e1c4e1d144c1b133c18122d16112d1510f8f8f8f4f4f4f3f3f3eeeeeeededede9e9e9e7e7e7e3e3e3dcdcdcd7d7d7d6d6d6d3d3d3d0d0d0cfcfcfc6c6c6c1c1c1b9b9b9b8b8b8b6b6b6b5b5b5b0b0b0aaaaaaa7a7a7a4a4a4dd8d7d9f9f9f9d9d9d9a9a9a999999d17f709494949393938f8f8f8e8e8ed9705bd66f5bcd7261cc72618a8a8aca6d5bc16e5e848484838383ce6653d3634ed05f497e7e7e7a7a7ab06354787878767676c95641ce523a747474b45b4a7272726e6e6ec24d366c6c6c6a6a6ac2462fc24129636363ad4632be3f27bd3f28bd3d25c23b22b83e27bd3c24b63d26b93a22b43a23b63922b43922b03720ad3620a23a26a1352151515198311e96311e992f1d94301e922f1e912f1e922c1b8226188226173e3e3e50332e3b3836652419462f2a5c251b35302e57211942201939221e3b1f1a2626263c1d194e160d49160c242424331d18411710371a16351b162e1b182d1916201e1e2c19172e181531171230161137130c251a172618161d1a191f19181919192f0e0724120e280e0a22100d151515230f0c250e0a2c0b052109051d09061809060e569b6f0000000174524e530040e6d866000001734944415478da6360a02eb0139166638671981819e1123173e76bb0b341d8814b16c87141a5986686649a9b08723001d9be6b53aa374bf231812518a765e4ab59980a713030c82e8dab34dbe8c70dd1c23c9d45534b7d46b1389be0a67883498b54fca1128cc2eb597878586615ba6c496e98b2b74cd1136a14035784358bb6aeb1e8ae9c8ac93bb382a505604e641688b262d1d3372c2ae8db57a220c5cf0a772f2b7b9a250b2faf6aebb6a9e1c2fccc485ee4e4365a9cdec8cb6b6ca921698bec7726d90d91354d86fa7a6d56b1dc9c48123efb956b276c152dd5d56eb78e6647d891b450d9a07777aa9128d0d92d6be4e1aeca9b93d86cb6275bc15b6599ba9666e76a0f2e883f98e625d4f5ec285794629730b150abef58252206f5f9ec89fd07aa9464f859d9244ccd55bb56060941cc62945bbe5d27d4cb1168278790ce8a75ddf2e2504bb8dc450264d8c1aee4100ccb551276808615239f98b33dd4f56cecae6e4e3648d1c9046333b371b0e24b0700373150ebeaa3e2d40000000049454e44ae426082, 14, 14),
	(3, 'Commentaire', 'image/png', _binary 0x89504e470d0a1a0a0000000d4948445200000020000000200806000000737a7af40000000467414d410000d904dcb2da020000067849444154789cc5964d6c13e919c7fff365c7c4cd879d8f0d64edb80e34c28ba304a9212840d4224e143801074a94037bd86dc3a16aa54891b85184a05237d96aa52a3d80842a558a90e0c20a11407ce4404c886cc7de86754c242731ac89673cb6c733f33e3d9044d9acd776aa7efca5f734efbccfef79de79fef300ff6709956edcbf7f7ff7e9d3a74ff03ccfcbb29cd7342df79f00102bdd78ead4a9c1919191dfacaeaee2eddbb7c9783cfe4d241299999999090483c1d94824f26d3a9d7ebf5d00aecc73e1ead5abbf773a9d1f777575fdcaed767f6c1806044180244910840f05cce572482693cbf178fc9f4b4b4b51c69856ec6c228224495c2010088d8e8e7e590960c3ecec6c82d654281448370cca9b26657339ca66b394cbe5289fcf53a150a04a35313111d8c8b00c80e3dcb973bfdeb56b57fdb70b0b48c932e464126c6e0e92d3094e92408c8188c01883aeeb6517c771304d7387cbe56a0d854221be5c09789e474ed3109d9a82944c627e64047a3e0fb1ba1a2002c771db5a8c31ecdcb9b3766868e8f3c6c6c676bebfbfffc8f1e3c77f590a8288505d5707737c1c5a4b0b2c7d7d0063955c6151711c877038fc5d241259168f1e3d3a32343474f4c68d1b7f49241219599697c7c6c6c600e8ebc1ab2c16581a1ab03a30008769c2aaeb802080e3ca7dc3c5835b2c1684c3e198aeeb09f1d2a54b5763b198e7e2c58b9f757474e0fefdfba1e6e6e6b6f1f1f13f2d2c2ca419631045113fefea02e338f01fee10cc34ffed0a00c0ececec1c005920a2e5603098aaadad3db067cf1efbdebd7b1d8661d89a9b9bdb88a8aabfbfff176eb7bb5e5614643319e83c0fa4d3e02509102af6b10d0982005555313636762b168b3d1100e88cb185a74f9fbe4ea5529eb6b6b65dbdbdbd1fd5d4d4d8dfbd7b57b76fdf3e9fd3e9b43dbe7f1f862461fe8b2f509d4ea3c6ef07781edc5a592b5d9224219148d0b56bd7461545f9663d853c11c55ebd7af52a140ad99d4ee7de9e9e9ec6eeee6e573e9fb728b99c24be7f0ff7d75f63657e1e6dc3c3b055558118db761788a2886030981a1d1dfd3380e4e61aea0096161717679e3c79a2582c169fcfe7abf3783c92aa2848a82ad2990cd29f7c829ffa7cb08a15bbf8868808a228e2d9b367b1898989af0064b65e220390521425383939199365d9dbd0d0d0e4f178d0e870a0aeb3133ff3fb515d550522da56e0cd002f5fbe5cbc7dfbf6df00e48b19110158d175fdef77efdefd5296653c7ffe1c055d87c36e874514c1711c789e2f5beeadc1d7b5b97d4b3961ceeff74bbdbdbdf07abd989e9e46341a85aeeb30d75a5092a492596f5dac887995bcc8aeae2ebf2008f07abdb0d96c98999981aaaab05aad989a9ac2891327e072b960180668cd963707dc0a534ca50044bfdfbf6ffde0a6a6261c3a7408939393181c1c84c3e1402814c2c0c0000e1c3800c6d80f322c0652b16c365bebf4f4f4db542a4544448661906118a4280a5dbe7c994451a41d3b76d0912347e8d6ad5b4444649a26699a469aa6513e9fa7dcda2f5b555552559532990c1111ddbc793300a0ae2440676767ffd2d2124b2693df03304d938888eeddbb47bb77ef2600d4dada4a57ae5c21555549d775d2346d23f83a4026932145518888e8faf5ebcf00d49404387bf6ec6fb3d92c2d2f2f7f0f6033c49b376f687070900090cfe7a34c26438cb18dec5555ddd8af691a99a6498f1f3fd65a5a5afe00c002941848ce9f3fffe9c18307bb73b91cec763b00fca0bdeaeaea70f2e449f87c3ed4d6d6429224343737c36ab5823106c330208a220cc300630c8140c03873e6cc578944e2af004ace8f96870f1f4e9ba6b95101d3348baecde3daa3478fe8ce9d3b140e87299fcf532a9522455128954a51381ca6e1e1e159007bb0695efc311f70a8aa5a158fc7cb7eb68c3198a6099ee771f8f0e18d8e2022e8ba8e6c368bb9b939489204c3300200e6f1c1ec4aea2782201c6b6a6abafce2c58bd5724326638c4cd3245dd7c9300c22225a5d5da568344a0f1e3ca04824424444c78e1dfbddd6403fe60319d3341f2493c99542a1f06939dacdf66b9a26d2e9345ebf7e8d743a8d8e8e0eb4b4b4409665168d46e72a0520000680950b172efcc36eb7b7b3623ebaf92051e4ebebeb6bdc6e77437b7b7b436767674d5f5f1fac562b00607171f1bb783c3e5f29c0bade8742a13fe2836994bb371e4015805a9ee73f72b95c6eafd7ebf1f97c9e9e9e9eb6582c1601b0b2f5a5ed4f95e525009000d800d801d40368029006300b40fb6f0314d37ab7112ae880ffa9fe054d115d3c36c248200000000049454e44ae426082, 14, 14);
/*!40000 ALTER TABLE `workflow_icon` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_prerequisite`;
CREATE TABLE IF NOT EXISTS `workflow_prerequisite` (
  `id_prerequisite` int(11) NOT NULL AUTO_INCREMENT,
  `id_action` int(11) NOT NULL,
  `prerequisite_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_prerequisite_duration_cf`;
CREATE TABLE IF NOT EXISTS `workflow_prerequisite_duration_cf` (
  `id_prerequisite` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_resource_history`;
CREATE TABLE IF NOT EXISTS `workflow_resource_history` (
  `id_history` int(11) NOT NULL AUTO_INCREMENT,
  `id_resource` int(11) DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_workflow` int(11) DEFAULT NULL,
  `id_action` int(11) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_access_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_history`),
  KEY `history_id_workflow_fk` (`id_workflow`),
  KEY `history_id_action_fk` (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_resource_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_history` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_resource_user_history`;
CREATE TABLE IF NOT EXISTS `workflow_resource_user_history` (
  `id_history` int(11) NOT NULL,
  `user_access_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `realm` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_history`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_resource_user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_user_history` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_resource_workflow`;
CREATE TABLE IF NOT EXISTS `workflow_resource_workflow` (
  `id_resource` int(11) NOT NULL DEFAULT 0,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_state` int(11) DEFAULT NULL,
  `id_workflow` int(11) NOT NULL,
  `id_external_parent` int(11) DEFAULT NULL,
  `is_associated_workgroups` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id_resource`,`resource_type`,`id_workflow`),
  KEY `workflow_resource_workflow_id_resource_fk` (`id_resource`),
  KEY `workflow_resource_workflow_resource_type_fk` (`resource_type`),
  KEY `workflow_resource_workflow_id_workflow_fk` (`id_workflow`),
  KEY `fk_document_id_state` (`id_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_resource_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_workflow` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_resource_workgroup`;
CREATE TABLE IF NOT EXISTS `workflow_resource_workgroup` (
  `id_resource` int(11) NOT NULL DEFAULT 0,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_workflow` int(11) DEFAULT NULL,
  `workgroup_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `workflow_resource_workgroup_id_resource_fk` (`id_resource`),
  KEY `workflow_resource_workgroup_resource_type_fk` (`resource_type`),
  KEY `workflow_resource_workgroup_id_workflow_fk` (`id_workflow`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_resource_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_workgroup` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_state`;
CREATE TABLE IF NOT EXISTS `workflow_state` (
  `id_state` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_workflow` int(11) DEFAULT NULL,
  `is_initial_state` smallint(6) DEFAULT 0,
  `is_required_workgroup_assigned` smallint(6) DEFAULT 0,
  `id_icon` int(11) DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id_state`),
  KEY `fk_state_id_workflow` (`id_workflow`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_state` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_state_controller_form_response_value`;
CREATE TABLE IF NOT EXISTS `workflow_state_controller_form_response_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) NOT NULL DEFAULT 0,
  `id_form` int(11) NOT NULL DEFAULT 0,
  `id_step` int(11) NOT NULL DEFAULT 0,
  `id_question` int(11) NOT NULL DEFAULT 0,
  `response_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_state_controller_form_response_value` (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_state_controller_form_response_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_state_controller_form_response_value` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task`;
CREATE TABLE IF NOT EXISTS `workflow_task` (
  `id_task` int(11) NOT NULL AUTO_INCREMENT,
  `task_type_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_action` int(11) NOT NULL DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id_task`),
  KEY `task_id_action_fk` (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_archive_cf`;
CREATE TABLE IF NOT EXISTS `workflow_task_archive_cf` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `next_state` int(11) NOT NULL,
  `type_archival` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delay_archival` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_archive_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_archive_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_archive_resource`;
CREATE TABLE IF NOT EXISTS `workflow_task_archive_resource` (
  `id_resource` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL DEFAULT 0,
  `initial_date` timestamp NULL DEFAULT NULL,
  `archival_date` timestamp NULL DEFAULT NULL,
  `is_archived` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id_resource`,`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_archive_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_archive_resource` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_assignment_cf`;
CREATE TABLE IF NOT EXISTS `workflow_task_assignment_cf` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_multiple_owner` smallint(6) DEFAULT 0,
  `is_notify` smallint(6) DEFAULT 0,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_use_user_name` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_assignment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_assign_user_config`;
CREATE TABLE IF NOT EXISTS `workflow_task_assign_user_config` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `provider_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_assign_user_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_assign_user_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_assign_user_information`;
CREATE TABLE IF NOT EXISTS `workflow_task_assign_user_information` (
  `id_history` int(11) NOT NULL,
  `id_task` int(11) NOT NULL,
  `information_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `information_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_assign_user_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_assign_user_information` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_change_state_config`;
CREATE TABLE IF NOT EXISTS `workflow_task_change_state_config` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `id_next_state` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_change_state_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_state_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_change_state_information`;
CREATE TABLE IF NOT EXISTS `workflow_task_change_state_information` (
  `id_history` int(11) NOT NULL,
  `id_task` int(11) NOT NULL,
  `new_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_change_state_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_state_information` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_choose_state_config`;
CREATE TABLE IF NOT EXISTS `workflow_task_choose_state_config` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `controller_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_state_ok` int(11) NOT NULL,
  `id_state_ko` int(11) NOT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_choose_state_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_choose_state_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_choose_state_information`;
CREATE TABLE IF NOT EXISTS `workflow_task_choose_state_information` (
  `id_history` int(11) NOT NULL,
  `id_task` int(11) NOT NULL,
  `new_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_choose_state_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_choose_state_information` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_comment_config`;
CREATE TABLE IF NOT EXISTS `workflow_task_comment_config` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_mandatory` smallint(6) DEFAULT 0,
  `is_richtext` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_comment_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_comment_value`;
CREATE TABLE IF NOT EXISTS `workflow_task_comment_value` (
  `id_history` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL,
  `comment_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_history`,`id_task`),
  KEY `comment_value_id_history_fk` (`id_history`),
  KEY `comment_value_id_task_fk` (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_comment_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_value` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_complete_response`;
CREATE TABLE IF NOT EXISTS `workflow_task_complete_response` (
  `id_history` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL DEFAULT 0,
  `message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_complete` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_history`,`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_complete_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_complete_response` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_complete_response_cf`;
CREATE TABLE IF NOT EXISTS `workflow_task_complete_response_cf` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `id_state_after_edition` int(11) NOT NULL DEFAULT 0,
  `default_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_complete_response_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_complete_response_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_complete_response_history`;
CREATE TABLE IF NOT EXISTS `workflow_task_complete_response_history` (
  `id_history` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL DEFAULT 0,
  `id_question` int(11) NOT NULL DEFAULT 0,
  `iteration_number` int(11) NOT NULL DEFAULT 0,
  `new_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_history`,`id_task`,`id_question`,`iteration_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_complete_response_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_complete_response_history` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_complete_response_value`;
CREATE TABLE IF NOT EXISTS `workflow_task_complete_response_value` (
  `id_history` int(11) NOT NULL DEFAULT 0,
  `id_entry` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_history`,`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_complete_response_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_complete_response_value` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_editformresponse_config`;
CREATE TABLE IF NOT EXISTS `workflow_task_editformresponse_config` (
  `id_config` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) NOT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_editformresponse_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_editformresponse_config` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_editformresponse_config_value`;
CREATE TABLE IF NOT EXISTS `workflow_task_editformresponse_config_value` (
  `id_config_value` int(11) NOT NULL AUTO_INCREMENT,
  `id_config` int(11) NOT NULL DEFAULT 0,
  `id_form` int(11) NOT NULL DEFAULT 0,
  `id_step` int(11) NOT NULL DEFAULT 0,
  `id_question` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_config_value`),
  KEY `index_task_editformresponse_config_value` (`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_editformresponse_config_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_editformresponse_config_value` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_formsjasper_cf`;
CREATE TABLE IF NOT EXISTS `workflow_task_formsjasper_cf` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `id_report` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_forms` int(11) DEFAULT 0,
  `id_step` int(11) DEFAULT 0,
  `id_forms_field_generated_report` int(11) DEFAULT 0,
  `params_report` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_formsjasper_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_formsjasper_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_forms_editresponse_history`;
CREATE TABLE IF NOT EXISTS `workflow_task_forms_editresponse_history` (
  `id_history` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL DEFAULT 0,
  `id_question` int(11) NOT NULL DEFAULT 0,
  `iteration_number` int(11) NOT NULL DEFAULT 0,
  `previous_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_history`,`id_task`,`id_question`,`iteration_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_forms_editresponse_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_forms_editresponse_history` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_notification_cf`;
CREATE TABLE IF NOT EXISTS `workflow_task_notification_cf` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `id_mailing_list` int(11) DEFAULT NULL,
  `sender_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_notification_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notification_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_resubmit_response`;
CREATE TABLE IF NOT EXISTS `workflow_task_resubmit_response` (
  `id_history` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL DEFAULT 0,
  `message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_complete` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_history`,`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_resubmit_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_resubmit_response` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_resubmit_response_cf`;
CREATE TABLE IF NOT EXISTS `workflow_task_resubmit_response_cf` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `id_state_after_edition` int(11) NOT NULL DEFAULT 0,
  `default_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_resubmit_response_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_resubmit_response_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_resubmit_response_history`;
CREATE TABLE IF NOT EXISTS `workflow_task_resubmit_response_history` (
  `id_history` int(11) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL DEFAULT 0,
  `id_question` int(11) NOT NULL DEFAULT 0,
  `iteration_number` int(11) NOT NULL DEFAULT 0,
  `previous_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_history`,`id_task`,`id_question`,`iteration_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_resubmit_response_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_resubmit_response_history` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_resubmit_response_value`;
CREATE TABLE IF NOT EXISTS `workflow_task_resubmit_response_value` (
  `id_history` int(11) NOT NULL DEFAULT 0,
  `id_entry` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_history`,`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_resubmit_response_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_resubmit_response_value` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_unittree_information`;
CREATE TABLE IF NOT EXISTS `workflow_task_unittree_information` (
  `id_history` int(11) NOT NULL,
  `id_task` int(11) NOT NULL,
  `information_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `information_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_unittree_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_unittree_information` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_unittree_unit_assignment_cf`;
CREATE TABLE IF NOT EXISTS `workflow_task_unittree_unit_assignment_cf` (
  `id_task` int(11) NOT NULL,
  `assignment_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_selections` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_unittree_unit_assignment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_unittree_unit_assignment_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_unittree_unit_selection_parametrable_cf`;
CREATE TABLE IF NOT EXISTS `workflow_task_unittree_unit_selection_parametrable_cf` (
  `id_task` int(11) NOT NULL,
  `parametrable_config_handler` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_unittree_unit_selection_parametrable_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_unittree_unit_selection_parametrable_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_task_unittree_unit_selection_specific_unit_cf`;
CREATE TABLE IF NOT EXISTS `workflow_task_unittree_unit_selection_specific_unit_cf` (
  `id_task` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_task_unittree_unit_selection_specific_unit_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_unittree_unit_selection_specific_unit_cf` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_workflow`;
CREATE TABLE IF NOT EXISTS `workflow_workflow` (
  `id_workflow` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_enabled` smallint(6) DEFAULT 0,
  `workgroup_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_workflow`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_workflow` DISABLE KEYS */;
INSERT INTO `workflow_workflow` (`id_workflow`, `name`, `description`, `creation_date`, `is_enabled`, `workgroup_key`) VALUES
	(1, 'Demands', 'Treat citizen demand', '2022-02-21 09:36:48', 0, 'all');
/*!40000 ALTER TABLE `workflow_workflow` ENABLE KEYS */;

DROP TABLE IF EXISTS `workflow_workgroup_cf`;
CREATE TABLE IF NOT EXISTS `workflow_workgroup_cf` (
  `id_task` int(11) NOT NULL DEFAULT 0,
  `workgroup_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_mailing_list` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_task`,`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `workflow_workgroup_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_workgroup_cf` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
