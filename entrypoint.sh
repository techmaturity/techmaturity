#!/bin/bash

export SECRET_KEY_BASE=`rake secret`

rake db:create
rake db:migrate
rake db:seed

rails s -b0.0.0.0
