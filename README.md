<h1 align="center">
  <br>
  <a href="https://ITGlue.com"><img src="https://github.com/Celerium/ITGlue-PowerShellWrapper/blob/master/.github/images/PoSHGallery_ITGlueAPI.png" alt="ITGlueAPI" width="200"></a>
  <br>
  ITGlueAPI
  <br>
</h1>

[![Az_Pipeline][Az_Pipeline-shield]][Az_Pipeline-url]
[![GitHub_Pages][GitHub_Pages-shield]][GitHub_Pages-url]

[![PoshGallery_Version][PoshGallery_Version-shield]][PoshGallery_Version-url]
[![PoshGallery_Platforms][PoshGallery_Platforms-shield]][PoshGallery_Platforms-url]
[![PoshGallery_Downloads][PoshGallery_Downloads-shield]][PoshGallery_Downloads-url]
[![codeSize][codeSize-shield]][codeSize-url]

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

[![GitHub_License][GitHub_License-shield]][GitHub_License-url]

---

## :warning: Version 3.0 Refactor &  Breaking Changes :warning:

The ITGlueAPI module is being updated to version 3.0, which has been extensively overhauled and may contain various breaking changes. Backwards compatibility was incorporated into as many of the previous commands and their associated parameters in the form of alias.

For example, one might access the /passwords/ API endpoint by running the following PowerShell command with the appropriate parameters:

- `Get-ITGluePasswords` is now an **alias** of the `Get-ITGluePassword` command
- `organization_id` is now an **alias** of the `OrganizationID` command

```posh
Get-ITGlueUsers `Alias`
is now
Get-ITGlueUser
```

```posh
Get-ITGluePasswords -organization_id 8675309 `Alias`
is now
Get-ITGluePassword -OrganizationID 8675309
```

---

<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://itglue.com">
    <img src="https://github.com/Celerium/ITGlue-PowerShellWrapper/blob/master/.github/images/PoSHGitHub_ITGlueAPI.png" alt="Logo">
  </a>

  <p align="center">
    <a href="https://www.powershellgallery.com/packages/ITGlueAPI" target="_blank">PowerShell Gallery</a>
    ·
    <a href="https://github.com/Celerium/ITGlue-PowerShellWrapper/issues/new/choose" target="_blank">Report Bug</a>
    ·
    <a href="https://github.com/Celerium/ITGlue-PowerShellWrapper/issues/new/choose" target="_blank">Request Feature</a>
  </p>
</div>

---

<!-- TABLE OF CONTENTS
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>
-->

## About The Project

The [ITGlueAPI](https://www.itglue.com/) offers the ability to read, create, and update much of the data within IT Glue's documentation platform. That includes organizations, contacts, configuration items, and more. This module serves to abstract away the details of interacting with IT Glue's API endpoints in such a way that is consistent with PowerShell nomenclature. This gives system administrators and PowerShell developers a convenient and familiar way of using IT Glue's API to create documentation scripts, automation, and integrations. Full documentation for IT Glue's RESTful API can be found [here](https://api.itglue.com/developer/).

- :book: Project documentation can be found on [Github Pages](https://celerium.github.io/ITGlue-PowerShellWrapper/)
- :book: ITGlue's REST API documentation on their management portal [here](https://api.itglue.com/developer/)

ITGlue features a REST API that makes use of common HTTP request methods. In order to maintain PowerShell best practices, only approved verbs are used.

- GET -> `Get-`
- POST -> `New`-
- PATCH -> `Set-`
- DELETE -> `Remove-`

Additionally, PowerShell's `verb-noun` nomenclature is respected. Each noun is prefixed with `ITGlue` in an attempt to prevent naming problems.

For example, one might access the /users/ API endpoint by running the following PowerShell command with the appropriate parameters:

```posh
Get-ITGlueUser
or
Get-ITGlueUser -ID 8675309
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Install

This module can be installed directly from the [PowerShell Gallery](https://www.powershellgallery.com/packages/ITGlueAPI) with the following command:

```posh
Install-Module -Name ITGlueAPI
```

- :information_source: This module supports PowerShell 5.0+ and *should* work in PowerShell Core.
- :information_source: If you are running an older version of PowerShell, or if PowerShellGet is unavailable, you can manually download the *main* branch and place the *ITGlueAPI* folder into the (default) `C:\Program Files\WindowsPowerShell\Modules` folder.

Project documentation can be found on [Github Pages](https://celerium.github.io/ITGlue-PowerShellWrapper/)

- A full list of functions can be retrieved by running `Get-Command -Module ITGlueAPI`.
- Help info and a list of parameters can be found by running `Get-Help <command name>`, such as:

```posh
Get-Help Get-ITGlueUser
Get-Help Get-ITGlueUser -Full
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Initial Setup

After installing this module, you will need to configure both the *base URI* & *API access token* that are used to talk with the ITGlue API.

1. Run `Add-ITGlueBaseURI`
   - By default, ITGlue's `https://api.itglue.com` URI is used.
   - If you have your own API gateway or proxy, you may put in your own custom URI by specifying the `-BaseUri` parameter:
      - `Add-ITGlueBaseURI -BaseUri http://myapi.gateway.example.org`
      <br>

2. Run `Add-ITGlueAPIKey -ApiKey 8675309`
   - It will prompt you to enter your API access token if you do not specify it.
   - ITGlue API access token are generated via the ITGlue portal at *Admin > Settings > API Keys*
   <br>

3. [**optional**] Run `Export-ITGlueModuleSetting`
   - This will create a config file at `%UserProfile%\ITGlueAPI` that holds the *base uri* & *API access token* information.
   - Next time you run `Import-Module -Name ITGlueAPI`, this configuration file will automatically be loaded.
   - :warning: Exporting module settings encrypts your API access token in a format that can **only be unencrypted by the user principal** that encrypted the secret. It makes use of .NET DPAPI, which for Windows uses reversible encrypted tied to your user principal. This means that you **cannot copy** your configuration file to another computer or user account and expect it to work.
   - :warning: However in Linux\Unix operating systems the secret keys are more obfuscated than encrypted so it is recommend to use a more secure & cross-platform storage method.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

Calling an API resource is as simple as running `Get-ITGlue<resourceName>`

- The following is a table of supported functions and their corresponding API resources:
- Table entries with [ `-` ] indicate that the functionality is **NOT** supported by the ITGlue API at this time.

| API Resource             | Create                              | Read                                | Update                              | Delete                               |
| ------------------------ | ----------------------------------- | ----------------------------------- | ----------------------------------- | ------------------------------------ |
| Attachments              | `New-ITGlueAttachment`              | -                                   | `Set-ITGlueAttachment`              | `Remove-ITGlueAttachment`            |
| Configuration Interfaces | `New-ITGlueConfigurationInterface`  | `Get-ITGlueConfigurationInterface`  | `Set-ITGlueConfigurationInterface`  | -                                    |
| Configuration Statuses   | `New-ITGlueConfigurationStatus`     | `Get-ITGlueConfigurationStatus`     | `Set-ITGlueConfigurationStatus`     | -                                    |
| Configuration Types      | `New-ITGlueConfigurationType`       | `Get-ITGlueConfigurationType`       | `Set-ITGlueConfigurationType`       | -                                    |
| Configurations           | `New-ITGlueConfiguration`           | `Get-ITGlueConfiguration`           | `Set-ITGlueConfiguration`           | `Remove-ITGlueConfiguration`         |
| Contact Types            | `New-ITGlueContactType`             | `Get-ITGlueContactType`             | `Set-ITGlueContactType`             | -                                    |
| Contacts                 | `New-ITGlueContact`                 | `Get-ITGlueContact`                 | `Set-ITGlueContact`                 | `Remove-ITGlueContact`               |
| Countries                | -                                   | `Get-ITGlueCountries`               | -                                   | -                                    |
| Documents                | -                                   | -                                   | `Set-ITGlueDocument`                | -                                    |
| Domains                  | -                                   | `Get-ITGlueDomains`                 | -                                   | -                                    |
| Expirations              | -                                   | `Get-ITGlueExpiration`              | -                                   | -                                    |
| Exports                  | `New-ITGlueExport`                  | `Get-ITGlueExport`                  | -                                   | `Remove-ITGlueExport`                |
| Flexible Asset Fields    | `New-ITGlueFlexibleAssetField`      | `Get-ITGlueFlexibleAssetField`      | `Set-ITGlueFlexibleAssetField`      | `Remove-ITGlueFlexibleAssetField`    |
| Flexible Asset Types     | `New-ITGlueFlexibleAssetType`       | `Get-ITGlueFlexibleAssetType`       | `Set-ITGlueFlexibleAssetType`       | -                                    |
| Flexible Assets          | `New-ITGlueFlexibleAsset`           | `Get-ITGlueFlexibleAsset`           | `Set-ITGlueFlexibleAsset`           | `Remove-ITGlueFlexibleAsset`         |
| Groups                   | -                                   | `Get-ITGlueGroups`                  | -                                   | -                                    |
| Locations                | `New-ITGlueLocation`                | `Get-ITGlueLocation`                | `Set-ITGlueLocation`                | `Remove-ITGlueLocation`              |
| Logs                     | -                                   | `Get-ITGlueLog`                     | -                                   | -                                    |
| Manufacturers            | `New-ITGlueManufacturer`            | `Get-ITGlueManufacturer`            | `Set-ITGlueManufacturer`            | -                                    |
| Models                   | `New-ITGlueModel`                   | `Get-ITGlueModel`                   | `Set-ITGlueModel`                   | -                                    |
| Operating Systems        | -                                   | `Get-ITGlueOperatingSystems`        | -                                   | -                                    |
| Organization Statuses    | `New-ITGlueOrganizationStatus`      | `Get-ITGlueOrganizationStatus`      | `Set-ITGlueOrganizationStatus`      | -                                    |
| Organization Types       | `New-ITGlueOrganizationType`        | `Get-ITGlueOrganizationType`        | `Set-ITGlueOrganizationType`        | -                                    |
| Organizations            | `New-ITGlueOrganization`            | `Get-ITGlueOrganization`            | `Set-ITGlueOrganization`            | `Remove-ITGlueOrganization`          |
| Password Categories      | `New-ITGluePasswordCategory`        | `Get-ITGluePasswordCategory`        | `Set-ITGluePasswordCategory`        | -                                    |
| Passwords                | `New-ITGluePassword`                | `Get-ITGluePassword`                | `Set-ITGluePassword`                | `Remove-ITGluePassword`              |
| Platforms                | -                                   | `Get-ITGluePlatform`                | -                                   | -                                    |
| Regions                  | -                                   | `Get-ITGlueRegion`                  | -                                   | -                                    |
| Related Items            | `New-ITGlueRelatedItem`             | -                                   | `Set-ITGlueRelatedItem`             | `Remove-ITGlueRelatedItem`           |
| User Metrics             | -                                   | `Get-ITGlueUserMetric`              | -                                   | -                                    |
| Users                    | -                                   | `Get-ITGlueUser`                    | `Set-ITGlueUser`                    | -                                    |

Each `Get-ITGlue*` function will respond with the raw data that ITGlue's API provides.

- :warning: Returned data is mostly structured the same but can vary between commands.
  - `data` - The actual information requested (this is what most people care about)
  - `links` - Links to specific aspects of the data
  - `meta` - Information about the number of pages of results are available and other metadata.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Contributing

Contributions are what makes the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

See the [CONTRIBUTING](https://github.com/Celerium/ITGlue-PowerShellWrapper/blob/master/.github/CONTRIBUTING.md) guide for more information about contributing.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the Apache-2.0 license. See [LICENSE](https://github.com/Celerium/ITGlue-PowerShellWrapper/blob/master/LICENSE) for more information.

[![GitHub_License][GitHub_License-shield]][GitHub_License-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[Az_Pipeline-shield]:               https://img.shields.io/azure-devops/build/AzCelerium/ITGlueAPI/10?style=for-the-badge&label=DevOps_Build
[Az_Pipeline-url]:                  https://dev.azure.com/AzCelerium/ITGlueAPI/_build?definitionId=10

[GitHub_Pages-shield]:              https://img.shields.io/github/actions/workflow/status/celerium/ITGlue-PowerShellWrapper/pages%2Fpages-build-deployment?style=for-the-badge&label=GitHub%20Pages
[GitHub_Pages-url]:                 https://github.com/Celerium/ITGlue-PowerShellWrapper/actions/workflows/pages/pages-build-deployment

[GitHub_License-shield]:            https://img.shields.io/github/license/celerium/ITGlue-PowerShellWrapper?style=for-the-badge
[GitHub_License-url]:               https://github.com/Celerium/ITGlue-PowerShellWrapper/blob/master/LICENSE

[PoshGallery_Version-shield]:       https://img.shields.io/powershellgallery/v/ITGlueapi?include_prereleases&style=for-the-badge
[PoshGallery_Version-url]:          https://www.powershellgallery.com/packages/ITGlueAPI

[PoshGallery_Platforms-shield]:     https://img.shields.io/powershellgallery/p/ITGlueapi?style=for-the-badge
[PoshGallery_Platforms-url]:        https://www.powershellgallery.com/packages/ITGlueAPI

[PoshGallery_Downloads-shield]:     https://img.shields.io/powershellgallery/dt/ITGlueAPI?style=for-the-badge
[PoshGallery_Downloads-url]:        https://www.powershellgallery.com/packages/ITGlueAPI

[codeSize-shield]:                  https://img.shields.io/github/repo-size/celerium/ITGlue-PowerShellWrapper?style=for-the-badge
[codeSize-url]:                     https://github.com/Celerium/ITGlue-PowerShellWrapper

[contributors-shield]:              https://img.shields.io/github/contributors/celerium/ITGlue-PowerShellWrapper?style=for-the-badge
[contributors-url]:                 https://github.com/Celerium/ITGlue-PowerShellWrapper/graphs/contributors

[forks-shield]:                     https://img.shields.io/github/forks/celerium/ITGlue-PowerShellWrapper?style=for-the-badge
[forks-url]:                        https://github.com/Celerium/ITGlue-PowerShellWrapper/network/members

[stars-shield]:                     https://img.shields.io/github/stars/celerium/ITGlue-PowerShellWrapper?style=for-the-badge
[stars-url]:                        https://github.com/Celerium/ITGlue-PowerShellWrapper/stargazers

[issues-shield]:                    https://img.shields.io/github/issues/Celerium/ITGlue-PowerShellWrapper?style=for-the-badge
[issues-url]:                       https://github.com/Celerium/ITGlue-PowerShellWrapper/issues
