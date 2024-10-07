---
title: Tracking CSV
parent: Home
nav_order: 2
---

# Tracking CSV

When updating the documentation for this project, the tracking CSV plays a huge part in organizing of the markdown documents. Any new functions or endpoints should be added to the tracking CSV when publishing an updated module or documentation version.

{: .warning }
I recommend downloading the CSV from the link provided rather then viewing the table below.

[Tracking CSV](https://github.com/Celerium/ITGlue-PowerShellWrapper/blob/main/docs/Endpoints.csv)

---

## CSV markdown table

| Category  | EndpointUri                                                  | Method | Function                   | Complete | Notes                                                 |
| --------- | ------------------------------------------------------------ | ------ | -------------------------- | -------- | ----------------------------------------------------- |
| BCDR      | /bcdr/agent                                                  | GET    | Get-ITGlueAgent             | YES      | Used for Endpoint Backup for PC agents (EB4PC) |
| BCDR      | /bcdr/device/{serialNumber}/asset/agent                      | GET    | Get-ITGlueAgent             | YES      |                                                       |
| BCDR      | /bcdr/device/{serialNumber}/alert                            | GET    | Get-ITGlueAlert             | YES      |                                                       |
| BCDR      | /bcdr/device/{serialNumber}/asset                            | GET    | Get-ITGlueAsset             | YES      |                                                       |
| BCDR      | /bcdr/                                                       | GET    | Get-ITGlueBCDR              | YES      | Special command that combines all BCDR endpoints      |
| BCDR      | /bcdr/device                                                 | GET    | Get-ITGlueDevice            | YES      |                                                       |
| BCDR      | /bcdr/device/{serialNumber}                                  | GET    | Get-ITGlueDevice            | YES      |                                                       |
| BCDR      | /bcdr/device/{serialNumber}/asset/share                      | GET    | Get-ITGlueShare             | YES      |                                                       |
| BCDR      | /bcdr/device/{serialNumber}/vm-restores                      | GET    | Get-ITGlueVMRestore         | Yes      | Cannot fully validate at this time                    |
| BCDR      | /bcdr/device/{serialNumber}/asset/{volumeName}               | GET    | Get-ITGlueVolume            | YES      |                                                       |
| Internal  |                                                              | POST   | Add-ITGlueAPIKey            | YES      |                                                       |
| Internal  |                                                              | POST   | Add-ITGlueBaseURI           | YES      |                                                       |
| Internal  |                                                              | PUT    | ConvertTo-ITGlueQueryString | YES      |                                                       |
| Internal  |                                                              | GET    | Export-ITGlueModuleSetting | YES      |                                                       |
| Internal  |                                                              | GET    | Get-ITGlueAPIKey            | YES      |                                                       |
| Internal  |                                                              | GET    | Get-ITGlueBaseURI           | YES      |                                                       |
| Internal  |                                                              | GET    | Get-ITGlueMetaData          | YES      |                                                       |
| Internal  |                                                              | GET    | Get-ITGlueModuleSetting    | YES      |                                                       |
| Internal  |                                                              | GET    | Import-ITGlueModuleSetting | YES      |                                                       |
| Internal  |                                                              | GET    | Invoke-ITGlueRequest        | YES      |                                                       |
| Internal  |                                                              | DELETE | Remove-ITGlueAPIKey         | YES      |                                                       |
| Internal  |                                                              | DELETE | Remove-ITGlueBaseURI        | YES      |                                                       |
| Internal  |                                                              | DELETE | Remove-ITGlueModuleSetting | YES      |                                                       |
| Internal  |                                                              | GET    | Test-ITGlueAPIKey           | YES      |                                                       |
| Reporting | /report/activity-log                                         | GET    | Get-ITGlueActivityLog       | YES      |                                                       |
| SaaS      | /sass/{sassCustomerId}/applications                          | GET    | Get-ITGlueApplication       | YES      |                                                       |
| SaaS      | /saas/{saasCustomerId}/{externalSubscriptionId}/bulkSeatChange | PUT    | Set-ITGlueBulkSeatChange    | YES      |                                                       |
| SaaS      | /sass/domains                                                | GET    | Get-ITGlueDomain            | YES      |                                                       |
| SaaS      | /sass/                                                       | GET    | Get-ITGlueSaaS              | YES      | Special command that combines all SaaS endpoints      |
| SaaS      | /sass/{sassCustomerId}/seats                                 | GET    | Get-ITGlueSeat              | YES      |                                                       |
