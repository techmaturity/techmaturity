### Deploy Tech maturity by Ticketmaster on OpenShift

Two different templates are provided, `ephemeral` with no data persistence, and `persistent` with data persistence backed by PostgreSQL.

To instantiate the template, run the following.

1. Create a project in which to host your application.
	```
	oc new-project <project> --display-name="Tech maturity by Ticketmaster" --description="Tech maturity by Ticketmaster."
	```

2. Ephemeral deployment: instantiate the `ephemeral` template
	```
	oc process -f techmaturity-ephemeral.yml \
	-p APP_SA=techmaturity-sa \
	-p HOSTNAME=<application-name>-<project>.<default-domain-suffix> \
	-p APP_VERSION=2.0.0 | oc create -f-
	```

2. Persistent deployment: instantiate the `persistent` template
	```
	oc process -f techmaturity-persistent.yml \
	-p APP_SA=techmaturity-sa \
	-p APPLICATION_NAME=techmaturity \
	-p HOSTNAME=<application-name>-<project>.<default-domain-suffix> \
	-p APP_VERSION=2.0.0 \
	-p POSTGRESQL_ADMIN_PASSWORD=<db_admin_pass> | oc create -f-
	```

3. Add the Service Account to the anyuid Security Context
	```
	oc adm policy add-scc-to-user anyuid system:serviceaccount:<project>:<app_service_account>
	```

NOTE: These are the minimal parameters the templates accept. Check the template definition for aditional parameters.
