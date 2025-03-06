#!/bin/sh

export $(sops decrypt secrets.env) && docker compose up -d
