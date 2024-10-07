---
external help file: ITGlueAPI-help.xml
Module Name: ITGlueAPI
online version: https://github.com/Celerium/ITGlue-PowerShellWrapper
schema: 2.0.0
title: Home
has_children: true
layout: default
nav_order: 1
---

<h1 align="center">
  <br>
  <a href="http://Celerium.org"><img src="https://raw.githubusercontent.com/Celerium/ITGlue-PowerShellWrapper/main/.github/images/Celerium_PoSHGallery_ITGlueAPI.png" alt="_CeleriumDemo" width="200"></a>
  <br>
  Celerium_ITGlueAPI
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

[![Blog][Website-shield]][Website-url]
[![GitHub_License][GitHub_License-shield]][GitHub_License-url]

---

## Buy me a coffee

Whether you use this project, have learned something from it, or just like it, please consider supporting it by buying me a coffee, so I can dedicate more time on open-source projects like this :)

<a href="https://www.buymeacoffee.com/Celerium" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg" alt="Buy Me A Coffee" style="width:150px;height:50px;"></a>

---

<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://celerium.org">
    <img src="https://raw.githubusercontent.com/Celerium/ITGlue-PowerShellWrapper/main/.github/images/Celerium_PoSHGitHub_ITGlueAPI.png" alt="Logo">
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

The [ITGlueAPI](https://www.ITGlue.com/) offers users the ability to extract data from ITGlue into a third-party reporting tools and aims to abstract away the details of interacting with ITGlue's API endpoints in such a way that is consistent with PowerShell nomenclature. This gives system administrators and PowerShell developers a convenient and familiar way of using ITGlue's API to create documentation scripts, automation, and integrations.

- :book: Project documentation can be found on [Github Pages](https://celerium.github.io/ITGlue-PowerShellWrapper/)
- :book: ITGlue's REST API documentation on their management portal [here](https://portal.ITGluebackup.com/integrations/api) *[ Requires a login ]*.

ITGlue features a REST API that makes use of common HTTP request methods. In order to maintain PowerShell best practices, only approved verbs are used.

- GET -> `Get-`
- PUT -> `Set-`

Additionally, PowerShell's `verb-noun` nomenclature is respected. Each noun is prefixed with `ITGlue` in an attempt to prevent naming problems.

For example, one might access the `/bcdr/device` endpoint by running the following PowerShell command with the appropriate parameters:

```posh
Get-ITGlueDevice -serialNumber 12345
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
Get-Help Get-ITGlueDevice
Get-Help Get-ITGlueDevice -Full
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Initial Setup

After install this module, you will need to configure both the *base URI* & *API access tokens* that are used to talk with the ITGlue API.

1. Run `Add-ITGlueBaseURI`
   - By default, ITGlue's `https://api.itglue.com` uri is used.
   - If you have your own API gateway or proxy, you may put in your own custom uri by specifying the `-BaseUri` parameter:
      - `Add-ITGlueBaseURI -BaseUri http://myapi.gateway.celerium.org`
      <br>

2. Run `Add-ITGlueAPIKey -Api_Key_Public 12345 -Api_Key_Secret 123456789`
   - It will prompt you to enter in your API access tokens if you do not specify them.
   - ITGlue API access tokens are generated via the ITGlue portal at *Admin > Integrations*
   <br>

3. [**optional**] Run `Export-ITGlueModuleSetting`
   - This will create a config file at `%UserProfile%\ITGlueAPI` that holds the *base uri* & *API access tokens* information.
   - Next time you run `Import-Module -Name ITGlueAPI`, this configuration file will automatically be loaded.
   - :warning: Exporting module settings encrypts your API access tokens in a format that can **only be unencrypted by the user principal** that encrypted the secret. It makes use of .NET DPAPI, which for Windows uses reversible encrypted tied to your user principal. This means that you **cannot copy** your configuration file to another computer or user account and expect it to work.
   - :warning: However in Linux\Unix operating systems the secret keys are more obfuscated than encrypted so it is recommend to use a more secure & cross-platform storage method.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

Calling an API resource is as simple as running `Get-ITGlue<resourceName>`

- The following is a table of supported functions and their corresponding API resources:
- Table entries with [ `-` ] indicate that the functionality is **NOT** supported by the ITGlue API at this time.

| Section   | API Resource       | Create | Read                          | Update                    | Delete |
| --------- | ------------------ | ------ | ----------------------------- | ------------------------- | ------ |
| Reporting | ActivityLog        | -      | `Get-ITGlueActivityLog`        | -                         | -      |
| BCDR      | Agent              | -      | `Get-ITGlueAgent`              | -                         | -      |
| BCDR      | Alert              | -      | `Get-ITGlueAlert`              | -                         | -      |
| BCDR      | Asset              | -      | `Get-ITGlueAsset`              | -                         | -      |
| BCDR      | **BCDR** *         | -      | `Get-ITGlueBCDR`               | -                         | -      |
| BCDR      | Device             | -      | `Get-ITGlueDevice`             | -                         | -      |
| BCDR      | Share              | -      | `Get-ITGlueShare`              | -                         | -      |
| BCDR      | VMRestore          | -      | `Get-ITGlueGet-ITGlueVMRestore` | -                         | -      |
| BCDR      | Volume             | -      | `Get-ITGlueVolume`             | -                         | -      |
| SaaS      | **SaaS** *         | -      | `Get-ITGlueSaaS`               | -                         | -      |
| SaaS      | Domains            | -      | `Get-ITGlueDomain`             | -                         | -      |
| SaaS      | Seats              | -      | `Get-ITGlueSeat`               | -                         | -      |
| SaaS      | Applications       | -      | `Get-ITGlueApplication`        | -                         | -      |
| SaaS      | BulkSeatChange     | -      | -                             | `Set-ITGlueBulkSeatChange` | -      |

- :warning: `Get-ITGlueBCDR` & `Get-ITGlueSaaS` are special functions.
- They are **NOT** endpoints in ITGlue's REST API and are a single set of commands the can run endpoints in their associate sections.
- I included them because they was made scripting easier and felt like a nice to have feature IMO

Each `Get-ITGlue*` function will respond with the raw data that ITGlue's API provides.

- :warning: Returned data is mostly structured the same but can vary between commands.
- pagination - Information about the number of pages of results are available and other metadata.
- items - The actual information requested (this is what most people care about)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Roadmap

- [ ] Add Changelog
- [x] Build more robust Pester & ScriptAnalyzer tests
- [x] Figure out how to do CI & PowerShell gallery automation
- [ ] Add example scripts & automation

See the [open issues](https://github.com/Celerium/ITGlue-PowerShellWrapper/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

See the [CONTRIBUTING](https://github.com/Celerium/ITGlue-PowerShellWrapper/blob/main/.github/CONTRIBUTING.md) guide for more information about contributing.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the MIT License. See [`LICENSE.txt`](https://github.com/Celerium/ITGlue-PowerShellWrapper/blob/main/LICENSE) for more information.

[![GitHub_License][GitHub_License-shield]][GitHub_License-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

<div align="left">

  <p align="left">
    ·
    <a href="https://celerium.org/#/contact" target="_blank">Website</a>
    ·
    <a href="https://celerium.org/#/contact" target="_blank">Email</a>
    ·
    <a href="https://www.reddit.com/user/CeleriumIO" target="_blank">Reddit</a>
    ·
  </p>
</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

Big thank you to the following people and services as they have provided me lots of helpful information as I continue this project!

- [GitHub Pages](https://pages.github.com)
- [Img Shields](https://shields.io)
- [Font Awesome](https://fontawesome.com)
- [Choose an Open Source License](https://choosealicense.com)
- [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[Az_Pipeline-shield]:               https://img.shields.io/azure-devops/build/AzCelerium/ITGlueAPI/4?style=for-the-badge&label=DevOps_Build
[Az_Pipeline-url]:                  https://dev.azure.com/AzCelerium/ITGlueAPI/_build?definitionId=4

[GitHub_Pages-shield]:              https://img.shields.io/github/actions/workflow/status/celerium/ITGlue-PowerShellWrapper/pages%2Fpages-build-deployment?style=for-the-badge&label=GitHub%20Pages
[GitHub_Pages-url]:                 https://github.com/Celerium/ITGlue-PowerShellWrapper/actions/workflows/pages/pages-build-deployment

[GitHub_License-shield]:            https://img.shields.io/github/license/celerium/ITGlue-PowerShellWrapper?style=for-the-badge
[GitHub_License-url]:               https://github.com/Celerium/ITGlue-PowerShellWrapper/blob/main/LICENSE

[PoshGallery_Version-shield]:       https://img.shields.io/powershellgallery/v/ITGlueapi?include_prereleases&style=for-the-badge
[PoshGallery_Version-url]:          https://www.powershellgallery.com/packages/ITGlueAPI

[PoshGallery_Platforms-shield]:     https://img.shields.io/powershellgallery/p/ITGlueapi?style=for-the-badge
[PoshGallery_Platforms-url]:        https://www.powershellgallery.com/packages/ITGlueAPI

[PoshGallery_Downloads-shield]:     https://img.shields.io/powershellgallery/dt/ITGlueAPI?style=for-the-badge
[PoshGallery_Downloads-url]:        https://www.powershellgallery.com/packages/ITGlueAPI

[website-shield]:                   https://img.shields.io/website?up_color=blue&url=https%3A%2F%2Fcelerium.org&style=for-the-badge&label=Blog
[website-url]:                      https://celerium.org

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
