# [Dev-Blog](https://despairdrivendevelopment.net/)

[![Despair](https://img.shields.io/website?label=Despair&url=http%3A%2F%2Fdespairdrivendevelopment.net)](https://despairdrivendevelopment.net)
[![Asana](https://img.shields.io/badge/Asana-Board-blue)](https://app.asana.com/0/1177513246019705/board)

> ## Despair Driven Development
> This is a developer-focused social platform that allows devs (be it veterans or newcomers) to share their experience, network and discuss on the software industry-related topics

<details>
<summary>Table of Contents</summary>

   * [<a href="https://despairdrivendevelopment.net/" rel="nofollow">Dev-Blog</a>](#dev-blog)
      * [Despair Driven Development](#despair-driven-development)
      * [Architecture](#architecture)
      * [Repositories](#repositories)
         * [<a href="https://github.com/PierreStephaneVoltaire/dev-blog">Landing Page</a>](#landing-page)
            * [Description](#description)
            * [<a href="http://devblog-landingpage-docs.s3-website.ca-central-1.amazonaws.com/" rel="nofollow">Docs</a>](#docs)
            * [Tech](#tech)
            * [Cloud Usage](#cloud-usage)
         * [<a href="https://github.com/PierreStephaneVoltaire/dev-blog-navbar">Navbar</a>](#navbar)
         * [Description](#description-1)
            * [Stack, Services &amp; Tools](#stack-services--tools)
         * [Features](#features)
         * [<a href="https://github.com/PierreStephaneVoltaire/dev-blog-post-api">Post API</a>](#post-api)
         * [Description](#description-2)
            * [Stack, Services &amp; Tools](#stack-services--tools-1)
         * [Features](#features-1)
         * [Template API](#template-api)
            * [Stack, Services &amp; Tools](#stack-services--tools-2)
         * [Features](#features-2)
         * [<a href="https://github.com/PierreStephaneVoltaire/dev-blog-userAuth">User Auth API</a>](#user-auth-api)
         * [Description](#description-3)
            * [Stack, Services &amp; Tools](#stack-services--tools-3)
         * [Features](#features-3)
         * [User Profile Api](#user-profile-api)
            * [Stack, Services &amp; Tools](#stack-services--tools-4)
         * [Features](#features-4)
         * [Search Function](#search-function)
            * [Stack, Services &amp; Tools](#stack-services--tools-5)
         * [Features](#features-5)

</details>

## Architecture 

<details>
<summary>Diagram</summary>

![Architecture](bin/devblog.png)

</details>

I'm currently using multiple service from the aws stack such as:
* Lambda for calls to the consul endpoint to know the location of other services
* Lightsail to host my servers :(It was a cheap way to get the project started and i can always upgrade later)
* RDS for user and post data persistence:
    * The data structure is mostly consistent
     * i wanted to avoid redundancy
     * it's easier for organizing and visualizing data
 * Dynamodb for read-only version of data
 * S3 for static site hosting and file storage
 * r53 and Cloudfont as DNS service and cdn 
 * Cognito for access control
 
 The Architecture is subject to change

## Repositories

### [Landing Page](https://github.com/PierreStephaneVoltaire/dev-blog)

[<img src="https://angular.io/assets/images/logos/angular/angular.svg" width="40">](https://angular.io)

> #### Description
> This is the main app the user will be interacting with too view posts and interact with various other features of the website.

#### [Docs](http://devblog-landingpage-docs.s3-website.ca-central-1.amazonaws.com/)

![GitHub repo size](https://img.shields.io/github/repo-size/PierreStephaneVoltaire/pvoltaire) ![CI](https://github.com/PierreStephaneVoltaire/dev-blog/workflows/CI/badge.svg) ![GitHub last commit](https://img.shields.io/github/last-commit/PierreStephaneVoltaire/pvoltaire) ![GitHub](https://img.shields.io/github/license/PierreStephaneVoltaire/pvoltaire) ![GitHub top language](https://img.shields.io/github/languages/top/PierreStephaneVoltaire/dev-blog)

<table>
<tr><th>#### Tech </th><th>#### Cloud Usage</th></tr>
<tr><td>

| Name | Purpose | 
|------|---------|
|Angular|Frontend|
|TypeScript|Language|
|Terraform|IaC|


</td><td>

| Name | Cloud | Purpose | 
|------|---------|-------|
|S3|AWS|Storage|
|CloudFront|AWS|CDN|
|Route53|AWS|DNS|

</td></tr> </table>

### [Navbar](https://github.com/PierreStephaneVoltaire/dev-blog-navbar)
![GitHub repo size](https://img.shields.io/github/repo-size/PierreStephaneVoltaire/dev-blog-navbar)
![GitHub last commit](https://img.shields.io/github/last-commit/PierreStephaneVoltaire/dev-blog-navbar)
![GitHub](https://img.shields.io/github/license/PierreStephaneVoltaire/dev-blog-navbar)
[![Sonarcloud Status](https://sonarcloud.io/api/project_badges/measure?project=com.lapots.breed.judge:judge-rule-engine&metric=alert_status)](https://sonarcloud.io/dashboard?id=PierreStephaneVoltaire_dev-blog-navbar)
![Sonar Tech Debt](https://img.shields.io/sonar/tech_debt/PierreStephaneVoltaire_dev-blog-navbar?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/blocker_violations/PierreStephaneVoltaire_dev-blog-navbar?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/critical_violations/PierreStephaneVoltaire_dev-blog-navbar?server=https%3A%2F%2Fsonarcloud.io)
![GitHub top language](https://img.shields.io/github/languages/top/PierreStephaneVoltaire/dev-blog-navbar)
### Description
This is the navbar
#### Stack, Services & Tools
* Vue
* Typescript
### Features
- [ ] forgot password ui
- [ ] Signin/signup ui
- [ ] Search ui
### [Post API](https://github.com/PierreStephaneVoltaire/dev-blog-post-api)
![GitHub repo size](https://img.shields.io/github/repo-size/PierreStephaneVoltaire/dev-blog-post-api)
![GitHub last commit](https://img.shields.io/github/last-commit/PierreStephaneVoltaire/dev-blog-post-api)
![GitHub](https://img.shields.io/github/license/PierreStephaneVoltaire/dev-blog-post-api)
[![Sonarcloud Status](https://sonarcloud.io/api/project_badges/measure?project=com.lapots.breed.judge:judge-rule-engine&metric=alert_status)](https://sonarcloud.io/dashboard?id=PierreStephaneVoltaire_dev-blog-post-api)
![Sonar Tech Debt](https://img.shields.io/sonar/tech_debt/PierreStephaneVoltaire_dev-blog-post-api?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/blocker_violations/PierreStephaneVoltaire_dev-blog-post-api?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/critical_violations/PierreStephaneVoltaire_dev-blog-post-api?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/major_violations/PierreStephaneVoltaire_dev-blog-post-api?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/minor_violations/PierreStephaneVoltaire_dev-blog-post-api?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/info_violations/PierreStephaneVoltaire_dev-blog-post-api?server=https%3A%2F%2Fsonarcloud.io)
![GitHub top language](https://img.shields.io/github/languages/top/PierreStephaneVoltaire/dev-blog-post-api)
![CI](https://github.com/PierreStephaneVoltaire/dev-blog-post-api/workflows/CI/badge.svg)
### Description
This Api provides basic crud operations related to posts
#### Stack, Services & Tools
* Nestjs
* Typescript
* Redis
* RDS(MySql)
* Swagger
* Consul
* Terraform
* R53
* AWS Api Gateway
* AWS Lightsail
### Features
- [X] post crud
### Template API
#### Stack, Services & Tools
* TBD
### Features
- [ ] Template crud
- [ ] Template publishing
- [ ] Template colaboration
- [ ] Template version control
### [User Auth API](https://github.com/PierreStephaneVoltaire/dev-blog-userAuth)
![GitHub repo size](https://img.shields.io/github/repo-size/PierreStephaneVoltaire/dev-blog-userAuth)
![GitHub last commit](https://img.shields.io/github/last-commit/PierreStephaneVoltaire/dev-blog-userAuth)
![GitHub](https://img.shields.io/github/license/PierreStephaneVoltaire/dev-blog-userAuth)
[![Sonarcloud Status](https://sonarcloud.io/api/project_badges/measure?project=com.lapots.breed.judge:judge-rule-engine&metric=alert_status)](https://sonarcloud.io/dashboard?id=PierreStephaneVoltaire_dev-blog-userAuth)
![Sonar Tech Debt](https://img.shields.io/sonar/tech_debt/PierreStephaneVoltaire_dev-blog-userAuth?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/blocker_violations/PierreStephaneVoltaire_dev-blog-userAuth?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/critical_violations/PierreStephaneVoltaire_dev-blog-userAuth?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/major_violations/PierreStephaneVoltaire_dev-blog-userAuth?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/minor_violations/PierreStephaneVoltaire_dev-blog-userAuth?server=https%3A%2F%2Fsonarcloud.io)
![Sonar Violations (long format)](https://img.shields.io/sonar/info_violations/PierreStephaneVoltaire_dev-blog-userAuth?server=https%3A%2F%2Fsonarcloud.io)
![GitHub top language](https://img.shields.io/github/languages/top/PierreStephaneVoltaire/dev-blog-userAuth)
### Description
This Api manages the congito userpool and allow the user to go through the authentication & Authorisation flow
#### Stack, Services & Tools
* C#
* Dotnet Core
* Swagger
* AWS Cognito
* AWS SES
* AWS Work mail

### Features
- [ ] User Signin/Signup/Logout flow
- [ ] forgot password
- [ ] Change password
- [ ] signin with social profiles
### User Profile Api
#### Stack, Services & Tools
* C#
* Dotnet Core
* Entity Framework Core
* RDS
* Swagger
### Features
- [ ] User Signin/Signup/Logout flow
- [ ] forgot password
- [ ] Change password
- [ ] signin with social profiles

### Search Function
#### Stack, Services & Tools
* AWS Lambda
* Java
* Elasticsearch
### Features
- [ ] Post Search
- [ ] user Search
- [ ] event Search
- [ ] Fuzzy Search
