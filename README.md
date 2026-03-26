🌍 [简体中文](README-zh-CN.md) | English

# 🌊 Marine Fishery Resource Management & Sustainable Utilization Platform

> B-end management systems & data-intensive scenarios

## Overview

This platform is a full-stack, database-driven web system designed for the complete lifecycle management of marine fishery resources, built around a unified loop of **monitoring → management → decision-making**. It serves four distinct user roles — general users, fishery practitioners, marine resource managers, and marine researchers — enforcing fine-grained, role-based access control across all operations.

Against the backdrop of global fishery stock depletion and irreversible marine ecosystem degradation, this platform leverages big data engineering to structure and visualize complex oceanographic and biological data, providing fishery workers, scientists, and policymakers with reliable, real-time digital decision support.

## Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | HTML5 + CSS3 + JavaScript |
| Backend | Python 3 + Django (MVC + ORM) |
| Database | MySQL + DBeaver |
| Environment | Windows 11 + VS Code |

## Core Features

- **🔐 Multi-role Authentication**: Four-tier user identity registration and authentication with layered permission control, ensuring data security and operational compliance
- **🌡️ Ocean Environment Monitoring**: Query water quality, temperature, and salinity by sea area with time-range filtering and full CRUD support
- **🐟 Fishery Resource Management**: Multi-dimensional querying of species type and population across sea zones; real-time data maintenance by marine researchers
- **📋 Fishery Policy Bulletin**: Managers publish fishing regulations platform-wide, ensuring information symmetry across all stakeholders
- **📝 Operational Suggestions**: A structured user feedback mechanism that routes suggestions through an approval workflow to inform policy iteration
- **⚓ Activity Application & Approval**: Practitioners submit fishing activity applications; managers review and approve online with full audit trails

## Database Design Highlights

- **17 relational tables** designed to Third Normal Form (3NF) from a complete E-R model
- User entity abstracted via inheritance to eliminate redundancy and maximize schema extensibility
- Primary key and unique indexes applied to high-frequency query fields; NOT NULL constraints enforce data integrity throughout
- Comprehensive foreign key relationships covering sea zones, observation stations, activity applications, policies, and suggestions

## System Architecture
```
Frontend (8 pages) ──HTTP Request──▶ Django Views (REST API)
                                              │
                                    Django ORM (Object-Relational Mapping)
                                              │
                                      MySQL Database (17 tables)
```

## Academic Context

This project represents a complete end-to-end implementation of database systems engineering — from requirements analysis and conceptual E-R design, through logical normalization and physical optimization, to full-stack system implementation — demonstrating applied mastery of relational database principles in a real-world environmental management scenario.
