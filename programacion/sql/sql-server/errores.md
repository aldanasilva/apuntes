# Errores en SQL Server

## Error: You cannot deploy the model because the localhost deployment server is not running in multidimensional mode
**Solution:** You can change the Deployment mode from Multidimensional to Tabular. Just modify configuration file `msmdsrv.ini`  the under  "<Install Location>:\Program Files\Microsoft SQL Server\MSAS12.MSSQLSERVER\OLAP\Config" path. Change the value of DeploymentMode tab from 0 to 2. Restart SSAS service to apply the change.
 
Source: https://social.technet.microsoft.com/Forums/windows/en-US/92966ae7-5dd9-4be1-950d-0431636ed427/you-cannot-deploy-the-model-because-the-localhost-deployment-server-is-not-running-in?forum=sqlanalysisservices  
Source: https://social.msdn.microsoft.com/Forums/en-US/9c6cb24b-5625-47ab-8a84-543dd94c3c12/cannot-deploy-the-model-because-the-localhost-deployment-server-is-not-running-in-multidimensional?forum=sqldenanalysisservices

## Error: Errors in the high-level relational engine. A connection could not be made to the data source with the DataSourceID of '
**Solution:** The impersonation mode tells Anaylsis Server what credentials to use when connecting to the database specified in the datasource object. When you create the datasource using the Data Source Wizard, there's an "Impersonation Information" page where you can set this information. If the data source is used for processing (i.e. you  are training mining structures/models from that data source), you are not allowed to set the ImpersonationMode to "Use the credentials of the current user"  due to security considerations - you must either use the service account or use a specific username/password. You can change the impersonation mode by opening the data source in BI Dev Studio and selecting one of the allowed options above on the "Impersonation Information" tab.
 
Source: https://social.msdn.microsoft.com/Forums/sqlserver/en-US/0a1ce033-29fb-49a9-944a-ee2ea55e69a8/errors-in-the-highlevel-relational-engine-a-connection-could-not-be-made-to-the-data-source-with?forum=sqlanalysisservices

## Error: 





