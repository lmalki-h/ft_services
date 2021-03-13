# ft_services - Kubernetes cluster

Ft_services is a system administrator project that uses Kubernetes and Docker to virtualise a cluster.

* [What's ft_services?](#what's-ft_services?)
* [How do I run this project?](#how-do-I-run-this-project?)
* [Project status](#project-status)

## What's ft_services?

In this project you virtualise a cluster containing:
- an FTPS server
- a LEMP stack (Linux, Nginx, MariaDB and PhpMyAdmin)
- a TIG stack (Telegraf, InfluxDB & Grafana) for monitoring
- and a reverse proxy server

This project was done using Minikube for practicality. 

This project asks for old and new practices. You can read the instruction [here](ft_services.subject.en.pdf)


## How do I run this project?

 **warning:**  this project was made to compile on a School 42 Linux VM with Minikube and Docker already installed.
```bash
git clone https://github.com/lmalki-h/ft_services
cd ft_services/
bash setup.sh
```

## Project status
This project was submitted and received a 100/100 grade.
